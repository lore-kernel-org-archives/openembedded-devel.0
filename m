Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PEMDF-0005uN-KQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 14:20:14 +0100
Received: by yxe42 with SMTP id 42so2192574yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=B3NWMbsYLNW+tISKidRVk+Gafg9Xz7nrvybv0Rk2V0w=;
	b=drfB+hixjD1qmIh9abNqYlFHXcMWVCaRIVuvnQFRu7pwNPxzmj6bgArWAfx//h7iRX
	XDOlQjVowY6VDw8E+J3VKwOQIIXTzEKjtYBI+pvqi/jcmGXR88HoJaQ/QOu/UVX2TvhF
	prCTwzs69ylsd23pGAapNTrYJ1Mky7pTLRNdE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=diGNTq1LNMJjbNHCQ/vdAfXP9KM3eYgGp2t9uOXm/jHmYVRXNP/f/Nz7eSs9JRDPOw
	uU4LHp0YbqvRW0x9zv7dvGxfuu53CjP9sDGxYZsUc87CVfh2WTtZ8JncDy7NSGlVKpOC
	R1K+cRsdOsac5uqHt9ZfqUzFZ5nVL7NQ4u2x8=
MIME-Version: 1.0
Received: by 10.42.157.199 with SMTP id e7mr709828icx.67.1288963159946; Fri,
	05 Nov 2010 06:19:19 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Fri, 5 Nov 2010 06:19:19 -0700 (PDT)
In-Reply-To: <1288961484.3826.7.camel@mattotaupa>
References: <1288958934-18209-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1288961484.3826.7.camel@mattotaupa>
Date: Fri, 5 Nov 2010 14:19:19 +0100
Message-ID: <AANLkTimzdQuJQ1Y5VpNJvF0Y1=1aFDzXL5g1u6LArpS3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
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
X-List-Received-Date: Fri, 05 Nov 2010 13:20:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/11/5 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Freitag, den 05.11.2010, 13:08 +0100 schrieb Frans Meulenbroeks:
>> configure.ac matches target_system against *os2* to detect if we're
>> configuring for an os2 system. Unfortunately this also matches if the
>> target_system is nios-linux (which is not an os2 system :-) )
>> This patch adds an additional case. The patch is added to the individual
>> recipes and also made upstream.
>
> Please add a link to this commit message and the patch headers pointing
> to the upstream commit, list message or ticket.
>
>> Patch is tested by fully building 1.3.2 and by running
>> bitbake -c patch for the other recipes.
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>>
>> a---
>> =A0.../xorg-lib/libx11-1.1.5/configure.ac-nios2.patch | =A0 12 +++++++++=
+++
>> =A0.../xorg-lib/libx11-1.3.2/configure.ac-nios2.patch | =A0 12 +++++++++=
+++
>> =A0.../xorg-lib/libx11-1.3.6/configure.ac-nios2.patch | =A0 12 +++++++++=
+++
>> =A0.../libx11-1.3.99.903/configure.ac-nios2.patch =A0 =A0 | =A0 12 +++++=
+++++++
>> =A0recipes/xorg-lib/libx11_1.1.5.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A03 ++-
>> =A0recipes/xorg-lib/libx11_1.3.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A03 ++-
>> =A0recipes/xorg-lib/libx11_1.3.6.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A03 ++-
>> =A0recipes/xorg-lib/libx11_1.3.99.903.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A03 ++-
>> =A08 files changed, 56 insertions(+), 4 deletions(-)
>> =A0create mode 100644 recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.p=
atch
>> =A0create mode 100644 recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.p=
atch
>> =A0create mode 100644 recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.p=
atch
>> =A0create mode 100644 recipes/xorg-lib/libx11-1.3.99.903/configure.ac-ni=
os2.patch
>>
>> diff --git a/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch b/re=
cipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
>> new file mode 100644
>> index 0000000..5605a59
>> --- /dev/null
>> +++ b/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
>> @@ -0,0 +1,12 @@
>> +Index: libX11-1.3.2/configure.ac
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- libX11-1.3.2.orig/configure.ac =A0 2010-11-05 10:30:33.825536983 +0=
100
>> ++++ libX11-1.3.2/configure.ac =A0 =A0 =A0 =A02010-11-05 10:31:25.913899=
269 +0100
>> +@@ -202,6 +202,7 @@
>> + # arch specific things
>> + WCHAR32=3D"1"
>> + case $target_alias in
>> ++ =A0nios2*) os2=3D"false" ;;
>> + =A0 *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
>> + =A0 *) ;;
>> + esac
>
> It looks like these three patches are exactly the same. Would one file
> in the version independent directory be enough?
>
> [=85]

They are exactly the same.
I discussed this with Martin Jansa on irc, and we felt it would be
best to submit the patch upstream.
Then if it is in the inc file, it needs to be taken out again when the
next version comes.
Hence it was put in the individual files.

BTW it looks like upstream might go for a slightly different patch.
I'll leave it to Martin to decide whether to go for that one or for
this one (he is on cc of the upstream correspondence).
I'll be afk next week so can't give followup on this.

Frans


