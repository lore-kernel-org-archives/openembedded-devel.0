Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <j.michael.detwiler@gmail.com>) id 1PAv79-0006xR-Ed
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 03:47:45 +0200
Received: by iwn42 with SMTP id 42so221053iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 18:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QDjS9SMlrurJaBEvWOLZJ86/XDYKPNssU5x1MSaNtWc=;
	b=X3MOVWFi3xck6mGUEqqJjGOoxt0NbXyIRJ7nJW4c8KCW7Yy1Scwh+1PtMoaUCLb+s7
	qGtV2ffYvE3s71U91cwc/3TgCJF0u0kbmOVOiAosZn3/8MmJ2l4ApDQxRp2wUqz3Q4sY
	zNrEOyIjkqCLpjR9HkwrlC/Gpmwrdi09+CAt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NhC2u/l2XrHx8B2m3eqOC/KVeuw1WdKExC0CZroHF6fNFT2q574KvDtf4n6Lewypgy
	FfloJSGCsgH5XTtk5XUch5mjQe70V/DZWzubXwguFn2QuCtLEIJA/YvKoNvc91I3ag8a
	NofrG9vb8tyHWPx0RPF4URPWgy8tSbIRmixj4=
MIME-Version: 1.0
Received: by 10.231.183.136 with SMTP id cg8mr1443616ibb.114.1288144020613;
	Tue, 26 Oct 2010 18:47:00 -0700 (PDT)
Received: by 10.231.172.212 with HTTP; Tue, 26 Oct 2010 18:47:00 -0700 (PDT)
In-Reply-To: <4CC765F9.4090005@opendreambox.org>
References: <4CC6F440.10509@opendreambox.org>
	<4CC6F818.5010105@opendreambox.org> <4CC701D0.5070702@cbnco.com>
	<4CC765F9.4090005@opendreambox.org>
Date: Tue, 26 Oct 2010 21:47:00 -0400
Message-ID: <AANLkTinAmLJdGC=xLTtWxoVTUMye5r2TnhKbwF-8g158@mail.gmail.com>
From: Mike Detwiler <j.michael.detwiler@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: j.michael.detwiler@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Use of == in shell scripts
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
X-List-Received-Date: Wed, 27 Oct 2010 01:47:45 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2010 at 7:36 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 10/26/2010 06:29 PM, Michael Smith wrote:
>> Andreas Oberritter wrote:
>>> On 10/26/2010 05:31 PM, Andreas Oberritter wrote:
>>>> How about splitting it into 5 patches?
>>>>
>>>> - classes (7 files)
>>>> - contrib (4 files)
>>>> - recipes/*/*.bb (24 files)
>>>> - recipes/*/*.inc (14 files)
>>>> - other files in recipes except recipes/obsolete (11 files)
>>>
>>> Or how about those 37 patches?
>>>
>>> http://git.opendreambox.org/?p=3Dobi/openembedded.git;a=3Dshortlog;h=3D=
refs/heads/equality-operator
>>>
>>>
>>> Rationale:
>>> - bbclasses: 1 patch per file
>>> - contrib and recipes: 1 patch per directory
>>
>> For the series:
>>
>> Acked-By: Michael Smith <msmith@cbnco.com>
>>
>> Except this one:
>>
>> http://git.opendreambox.org/?p=3Dobi/openembedded.git;a=3Dcommitdiff;h=
=3Dad7b2c9ab0c305034c39d2efc5a52789965bb5c2
>>
>>
>> where some lines had =3D=3D twice, looks like your sed may not have caug=
ht it.
>
> Thanks for spotting! I've updated the patch series and added your ack.
>
>> BTW, some of the files have constructs like this:
>>
>> if [ "x$HAS_MADWIFI" =3D "x1" ]
>>
>> I think this "x" business is for old broken shells that can't handle an
>> empty quoted string as the first argument. Does anyone know the standard
>> well enough to say? I figure [ "" =3D "1" ] should be legal everywhere.
>> This is just a pet peeve/bike shed on my part.
>
> Autotools use constructs like that everywhere, so it's likely increasing
> portability while decreasing readability.
>
> A random forum post suggests that some versions of '[' have problems, if
> the first operand equals '!' or '(' [1].

And the less random Autoconf manual has this to say about the shell
builtin, test, and it's more common name '[':

"Similarly, Posix says that both =91test "string1" =3D "string2"=92 and
=91test "string1" !=3D "string2"=92 work for any pairs of strings, but in
practice this is not true for troublesome strings that look like
operators or parentheses, or that begin with =91-=92.

It is best to protect such strings with a leading =91X=92, e.g., =91test
"Xstring" !=3D X=92 rather than =91test -n "string"=92 or =91test !
"string"=92."[2]

See the discussion of 'test(string)' at the link below.

[2] http://www.gnu.org/software/autoconf/manual/autoconf.html#Limitations-o=
f-Builtins

>
> It's not easy to search for [ or test or x on google. ;-)
>
> Regards,
> Andreas
>
> [1]
> http://www.techtalkz.com/unix/78138-testing-equality-bash-scripts.html#po=
st329122


