Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PEMSi-00074N-Bn
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 14:36:13 +0100
Received: by iwn42 with SMTP id 42so2874065iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ox05aJo3MjZrPaqSVwoF2oW6HmeyfSi+6vqbMDFX4wM=;
	b=I8fRrYWna74bpYIWyo1JM6G+ALwNviSAcuGyA+0u+oYMfeafXBbQnKRQKJQkjlQKpS
	ALby9+IKmVxTBSIEGg6E8xhuHM0ecUOEYD1xCoB0NF8s3A5UoDSkMArLvrVlqatioDGJ
	8h3kqnOGKWxGvP0sisdaEtXXkugeSlPqVALxs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ahjkA7JNh+Hlz6ZgVxFnmIiuNYmLx/0i3S0Gk2WBeRsEJ0xiclcRey3NJtAtCc6wNt
	Lvd3oLqBbd1JG+1JIj4XL4cXNd2T4pbnmy/A8grXZuToGa+UocoojpweuKZ76U8+8Mms
	e/wYaYxF4syNnT/KYS3TdC0d1Vy2eJ1A4vzQ8=
MIME-Version: 1.0
Received: by 10.231.191.6 with SMTP id dk6mr1634488ibb.51.1288964120495; Fri,
	05 Nov 2010 06:35:20 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Fri, 5 Nov 2010 06:35:20 -0700 (PDT)
In-Reply-To: <1288963608.3826.15.camel@mattotaupa>
References: <1288958934-18209-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1288961484.3826.7.camel@mattotaupa>
	<AANLkTimzdQuJQ1Y5VpNJvF0Y1=1aFDzXL5g1u6LArpS3@mail.gmail.com>
	<1288963608.3826.15.camel@mattotaupa>
Date: Fri, 5 Nov 2010 14:35:20 +0100
Message-ID: <AANLkTimz7SusU5f0DVm1bmN7BiVuAd=DTY2YWBDy78YV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libX11: patch configure.ac so a nios2 system is not seen as an os2 system.
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
X-List-Received-Date: Fri, 05 Nov 2010 13:36:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/11/5 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Freitag, den 05.11.2010, 14:19 +0100 schrieb Frans Meulenbroeks:
>> 2010/11/5 Paul Menzel <paulepanter@users.sourceforge.net>:
>> > Am Freitag, den 05.11.2010, 13:08 +0100 schrieb Frans Meulenbroeks:
>> >> configure.ac matches target_system against *os2* to detect if we're
>> >> configuring for an os2 system. Unfortunately this also matches if the
>> >> target_system is nios-linux (which is not an os2 system :-) )
>> >> This patch adds an additional case. The patch is added to the individ=
ual
>> >> recipes and also made upstream.
>> >
>> > Please add a link to this commit message and the patch headers pointin=
g
>> > to the upstream commit, list message or ticket.
>> >
>> >> Patch is tested by fully building 1.3.2 and by running
>> >> bitbake -c patch for the other recipes.
>> >>
>> >> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> >>
>> >> a---
>> >> =A0.../xorg-lib/libx11-1.1.5/configure.ac-nios2.patch | =A0 12 ++++++=
++++++
>> >> =A0.../xorg-lib/libx11-1.3.2/configure.ac-nios2.patch | =A0 12 ++++++=
++++++
>> >> =A0.../xorg-lib/libx11-1.3.6/configure.ac-nios2.patch | =A0 12 ++++++=
++++++
>> >> =A0.../libx11-1.3.99.903/configure.ac-nios2.patch =A0 =A0 | =A0 12 ++=
++++++++++
>> >> =A0recipes/xorg-lib/libx11_1.1.5.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A03 ++-
>> >> =A0recipes/xorg-lib/libx11_1.3.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A03 ++-
>> >> =A0recipes/xorg-lib/libx11_1.3.6.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A03 ++-
>> >> =A0recipes/xorg-lib/libx11_1.3.99.903.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A03 ++-
>> >> =A08 files changed, 56 insertions(+), 4 deletions(-)
>> >> =A0create mode 100644 recipes/xorg-lib/libx11-1.1.5/configure.ac-nios=
2.patch
>> >> =A0create mode 100644 recipes/xorg-lib/libx11-1.3.2/configure.ac-nios=
2.patch
>> >> =A0create mode 100644 recipes/xorg-lib/libx11-1.3.6/configure.ac-nios=
2.patch
>> >> =A0create mode 100644 recipes/xorg-lib/libx11-1.3.99.903/configure.ac=
-nios2.patch
>> >>
>> >> diff --git a/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch b=
/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
>> >> new file mode 100644
>> >> index 0000000..5605a59
>> >> --- /dev/null
>> >> +++ b/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
>> >> @@ -0,0 +1,12 @@
>> >> +Index: libX11-1.3.2/configure.ac
>> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> +--- libX11-1.3.2.orig/configure.ac =A0 2010-11-05 10:30:33.825536983=
 +0100
>> >> ++++ libX11-1.3.2/configure.ac =A0 =A0 =A0 =A02010-11-05 10:31:25.913=
899269 +0100
>> >> +@@ -202,6 +202,7 @@
>> >> + # arch specific things
>> >> + WCHAR32=3D"1"
>> >> + case $target_alias in
>> >> ++ =A0nios2*) os2=3D"false" ;;
>> >> + =A0 *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
>> >> + =A0 *) ;;
>> >> + esac
>> >
>> > It looks like these three patches are exactly the same. Would one file
>> > in the version independent directory be enough?
>> >
>> > [=85]
>>
>> They are exactly the same.
>> I discussed this with Martin Jansa on irc, and we felt it would be
>> best to submit the patch upstream.
>
> I agree.
>
>> Then if it is in the inc file, it needs to be taken out again when the
>> next version comes.
>
> Sorry, I did not make myself clear. My point was if you could put
> `configure.ac-nios2.patch` into `libX11/` or `files`.

Yes.
files is not too nice, libX11 is probably better
>
>> Hence it was put in the individual files.
>>
>> BTW it looks like upstream might go for a slightly different patch.
>> I'll leave it to Martin to decide whether to go for that one or for
>> this one (he is on cc of the upstream correspondence).
>
> Again, could you provide a link to that discussion.

http://lists.freedesktop.org/archives/xorg/2010-November/051731.html

>
>> I'll be afk next week so can't give followup on this.
>
> Understood. Thank you for your fast reply.
>
You thanks for your review work!
It is not often said, but it is definitely appreciated.

Frans
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


