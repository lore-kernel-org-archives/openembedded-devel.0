Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RPL6u-0007CX-4e
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Nov 2011 22:27:36 +0100
Received: by qadb10 with SMTP id b10so555936qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Nov 2011 13:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=y7oq154gwPmg05XREhN5lfnbm7TVIx2tLx8EI/41VN4=;
	b=vQUXBbHu0I8QlUP2EVjr4pqOSZH9SWiro7QpCh2/W/Rr1H5NkRHJ6w3lUgQopbKepb
	YdaiY7w+jnkXEHlJBMfae1AKa9XJWZadhoHUo6Hezsv8JDlFw7iiUdMD/sLgCxj7qjXv
	5xQcc1C+y+253VPDgT75gRNgr18J2t1mNZAv4=
MIME-Version: 1.0
Received: by 10.229.251.73 with SMTP id mr9mr2546374qcb.264.1321132876360;
	Sat, 12 Nov 2011 13:21:16 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sat, 12 Nov 2011 13:21:16 -0800 (PST)
In-Reply-To: <1321093682.3557.14.camel@mattotaupa>
References: <4EBC2FEF.5020405@kernelconcepts.de> <j9hc2l$b8u$3@dough.gmane.org>
	<4EBC39EB.2060004@kernelconcepts.de>
	<CA+M6bXmuTYrJ=_ALera0NnhrQyqZD+nUH64kv2g1z9eQfsptqg@mail.gmail.com>
	<1321093682.3557.14.camel@mattotaupa>
Date: Sat, 12 Nov 2011 14:21:16 -0700
Message-ID: <CA+M6bX=QSUAf8yR4d2UdQx3nTJz5eftFqY-4oPBtJBeW8=z6nQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Clean up omap3.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Nov 2011 21:27:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 12, 2011 at 3:28 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Donnerstag, den 10.11.2011, 14:55 -0700 schrieb Tom Rini:
>> On Thu, Nov 10, 2011 at 1:54 PM, Florian Boor wrote:
>
>> > Am 10.11.2011 21:27, schrieb Koen Kooi:
>> >> Wrong. You can do the following in your machine.conf:
>> >>
>> >> require omap3.inc
>> >>
>> >> EXTRA_IMAGEDEPENDS = "whatever"
>> >
>> > this is a workaround for a bad misconception. EXTRA_IMAGEDEPENDS could have been
>> > appended everywhere and this intrusive override might break quite a lot.
>> >
>> >> In OE classic, no. In meta-ti the cleanup is already underway.
>> >
>> > I do not care bout meta-ti, its is broken in OE classic.
>> >
>> >
>> > Removing this hardcoded dependency would not break anything. Only the board
>> > maintainers who want to get it built automatically would have to add it.
>>
>> But, that's most of them today.
>
> Sorry Tom, could you try harder to explain the reason, please? How many
> boards are there in the upstream OE repository depending on this and
> would have to be changed? I think Florian could commit that with his
> clean up easily.

With respect to boards that use omap3.inc today, nearly all of them
use x-load as the between ROM and U-Boot program (I suspect
conf/machine/include/palmpre.inc is working around this issue by
setting a fake XLOAD_MACHINE).  So instead of having a few machines
say "now let me not build x-load" we have lots of machines saying "I
should build x-load too".

> On the other side developers opposing this clean up could at least offer
> to add a comment to the file with a proposed work around for people
> hitting this issue. Still there should be a good reason. Like all your
> internal TI projects depend on this for example.

Again, oe.dev isn't a really great place to do new work, oe-core+stuff
is, and as Koen said, in meta-ti this is being cleaned up (in part
because TI parts now don't use x-load as the middle step but a build
of U-Boot called SPL as the middle step).  Adding a comment to
omap3.inc with what Koen said about opting out would make sense, yes.

-- 
Tom


