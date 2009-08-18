Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MdISp-0006LI-Fp
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 08:46:40 +0200
Received: by qyk35 with SMTP id 35so2585703qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 23:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qhmVzUndzT/Xl+wbpKZYbj5aXOYoXA1RU01bswm8M3Q=;
	b=TdXyr+iAfJbxWX/doIln1yvTvyJp8F/5QL4XZ+CERJ7TLCJTD47rEAQikkapQsrBsj
	cEUQQR7+a1S5sRJucXXTunF/Dm+0Bqy8KGfXY/TLfQTDnwhP4L3tdcvzroLBJFdhJagp
	zJDU9d/cSlmFxZFNPoUpS/t5TwuJOuZHsKxiY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wr9OCYrQCEWQWAJbenj5dAjgKO4cEZL36aJGz5RCn4fdllCZKMYKZKI2GCHINaEUoe
	T+OEMVYdoKxPTlSs72zBRtMHZoTcjKCzghnb5AJv6Bp58yNbIcVRWlHAYPQqRCtalNUQ
	pogV4e6seiJ/Krll5r+lFOG9ynyetbkpXSsi4=
MIME-Version: 1.0
Received: by 10.229.39.69 with SMTP id f5mr2239280qce.107.1250576971141; Mon, 
	17 Aug 2009 23:29:31 -0700 (PDT)
In-Reply-To: <20090817234049.GH2227@smtp.west.cox.net>
References: <20090814215138.GB31011@gmail.com>
	<20090815022703.GH14883@smtp.west.cox.net>
	<19c1b8a90908151021s67bbdd9fh52a07dce6d51ace8@mail.gmail.com>
	<20090817234049.GH2227@smtp.west.cox.net>
Date: Mon, 17 Aug 2009 23:29:31 -0700
Message-ID: <19c1b8a90908172329p55250179od552cd94fa4cbff5@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Tue, 18 Aug 2009 06:46:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2009 at 4:40 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Sat, Aug 15, 2009 at 10:21:31AM -0700, Khem Raj wrote:
>> On Fri, Aug 14, 2009 at 7:27 PM, Tom Rini<trini@embeddedalley.com> wrote=
:
>> > On Fri, Aug 14, 2009 at 02:51:38PM -0700, Khem Raj wrote:
>> >
>> >> Hi
>> >>
>> >> I would like to add minimal-eglibc and micro-eglibc distros on same
>> >> lines as -uclibc one's
>> >>
>> >> Any objections ?
>> >
>> > minimal-uclibc and micro-uclibc should go away and just pickup from LI=
BC
>> > being passed in / set.
>>
>> Ideally yes but there are other things like libintl libiconv etc which
>> needs special handling
>> for uclibc. So having uclibc counterparts is good.
>
> I don't follow. =C2=A0LIBC, and the associated inc file set the preferred
> providers correctly. =C2=A0Or are you talking about sharing the same TMPD=
IR
> for > 1 distro ?

If u dont set LIBC then by default glibc is picked. Now it will pick
eglibc instead
not many users override LIBC in there local.conf this way eglibc will
get more tested

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


