Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PEQ1p-0000RA-1z
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 18:24:42 +0100
Received: by yxe42 with SMTP id 42so2400793yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 10:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QpPFYsZPA4loTjgYXJR6cSmbjaMNdgmjyoHGB6vo8jc=;
	b=vSJPtYrt/hS3dhciiJLvYAuZDIs1Ch7ZG4f1gHeQG6uirLdl2HiJAdPYmWJ8y02+2W
	9fBFC0HCU4YrBf+Oa6aYG3g+AZ0WfJxfCGquwzgmtx1ID/8D66Y/SDSkPj8MOhADAr2m
	yzk4sveBcOMeYCNjT+2ZkgdvDQpBykrOpQx/I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Q0NnhrJmPTKKD/lnxSA1WlJvk3xvzfBsuo0vH6qfYDuvcHCm8g6BDrDgf18uhBDZY/
	gtypWk9QrjRfOcQL+suGs09XsMn/5Ajxk3Z4PlqYDbL01kyVwaMS1LKqTSHXnuKD2uS5
	dUvHrWtSHax4lP9XesJvGIpEsqOBxYdGXdoac=
MIME-Version: 1.0
Received: by 10.42.157.199 with SMTP id e7mr994783icx.67.1288977827347; Fri,
	05 Nov 2010 10:23:47 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Fri, 5 Nov 2010 10:23:47 -0700 (PDT)
In-Reply-To: <AANLkTi=sxWjPYHhwVf+RX-n6caCp6Sh-ikYGieYs0Y_b@mail.gmail.com>
References: <1288958934-18209-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTi=sxWjPYHhwVf+RX-n6caCp6Sh-ikYGieYs0Y_b@mail.gmail.com>
Date: Fri, 5 Nov 2010 18:23:47 +0100
Message-ID: <AANLkTinNp5XTHUBSKhvOtAjTE=3C8Wiiwnrj9RUaUqyN@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Nov 2010 17:24:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/5 Khem Raj <raj.khem@gmail.com>:
> On Fri, Nov 5, 2010 at 5:08 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> configure.ac matches target_system against *os2* to detect if we're
>> configuring for an os2 system. Unfortunately this also matches if the
>> target_system is nios-linux (which is not an os2 system :-) )
>> This patch adds an additional case. The patch is added to the individual
>> recipes and also made upstream.
>>
>> Patch is tested by fully building 1.3.2 and by running
>> bitbake -c patch for the other recipes.
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> Hmmm good find. I am ok with general fix. but please consider other
> review comments before you commit
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

I won't have time to commit next 10 days or so. I'll be mostly afk.
If desired Martin (being the X maintainer iirc, can commit).
And feel free to change the patch or the commit message (or maybe move
to the alternative suggested upstream).

Frans
>
>> ---
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
>> +--- libX11-1.3.2.orig/configure.ac =A0 =A0 2010-11-05 10:30:33.82553698=
3 +0100
>> ++++ libX11-1.3.2/configure.ac =A02010-11-05 10:31:25.913899269 +0100
>> +@@ -202,6 +202,7 @@
>> + # arch specific things
>> + WCHAR32=3D"1"
>> + case $target_alias in
>> ++ =A0nios2*) os2=3D"false" ;;
>> + =A0 *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
>> + =A0 *) ;;
>> + esac
>> diff --git a/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch b/re=
cipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
>> new file mode 100644
>> index 0000000..5605a59
>> --- /dev/null
>> +++ b/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
>> @@ -0,0 +1,12 @@
>> +Index: libX11-1.3.2/configure.ac
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- libX11-1.3.2.orig/configure.ac =A0 =A0 2010-11-05 10:30:33.82553698=
3 +0100
>> ++++ libX11-1.3.2/configure.ac =A02010-11-05 10:31:25.913899269 +0100
>> +@@ -202,6 +202,7 @@
>> + # arch specific things
>> + WCHAR32=3D"1"
>> + case $target_alias in
>> ++ =A0nios2*) os2=3D"false" ;;
>> + =A0 *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
>> + =A0 *) ;;
>> + esac
>> diff --git a/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch b/re=
cipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
>> new file mode 100644
>> index 0000000..5605a59
>> --- /dev/null
>> +++ b/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
>> @@ -0,0 +1,12 @@
>> +Index: libX11-1.3.2/configure.ac
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- libX11-1.3.2.orig/configure.ac =A0 =A0 2010-11-05 10:30:33.82553698=
3 +0100
>> ++++ libX11-1.3.2/configure.ac =A02010-11-05 10:31:25.913899269 +0100
>> +@@ -202,6 +202,7 @@
>> + # arch specific things
>> + WCHAR32=3D"1"
>> + case $target_alias in
>> ++ =A0nios2*) os2=3D"false" ;;
>> + =A0 *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
>> + =A0 *) ;;
>> + esac
>> diff --git a/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch=
 b/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch
>> new file mode 100644
>> index 0000000..5605a59
>> --- /dev/null
>> +++ b/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch
>> @@ -0,0 +1,12 @@
>> +Index: libX11-1.3.2/configure.ac
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- libX11-1.3.2.orig/configure.ac =A0 =A0 2010-11-05 10:30:33.82553698=
3 +0100
>> ++++ libX11-1.3.2/configure.ac =A02010-11-05 10:31:25.913899269 +0100
>> +@@ -202,6 +202,7 @@
>> + # arch specific things
>> + WCHAR32=3D"1"
>> + case $target_alias in
>> ++ =A0nios2*) os2=3D"false" ;;
>> + =A0 *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
>> + =A0 *) ;;
>> + esac
>> diff --git a/recipes/xorg-lib/libx11_1.1.5.bb b/recipes/xorg-lib/libx11_=
1.1.5.bb
>> index e775585..b44dcc8 100644
>> --- a/recipes/xorg-lib/libx11_1.1.5.bb
>> +++ b/recipes/xorg-lib/libx11_1.1.5.bb
>> @@ -1,7 +1,8 @@
>> =A0require libx11.inc
>> =A0DEPENDS =3D "${COMMON_DEPENDS}"
>> -PR =3D "${INC_PR}.1"
>> +PR =3D "${INC_PR}.2"
>>
>> +SRC_URI +=3D " file://configure.ac-nios2.patch"
>> =A0SRC_URI[archive.md5sum] =3D "d1512d65dadd4f48c779d4749e7753a8"
>> =A0SRC_URI[archive.sha256sum] =3D "da9272900e41615e9c5dc25d84730b8966da6=
f5c8f4c40418dca2ad040fc8b82"
>>
>> diff --git a/recipes/xorg-lib/libx11_1.3.2.bb b/recipes/xorg-lib/libx11_=
1.3.2.bb
>> index b3d48ab..189d1ff 100644
>> --- a/recipes/xorg-lib/libx11_1.3.2.bb
>> +++ b/recipes/xorg-lib/libx11_1.3.2.bb
>> @@ -1,10 +1,11 @@
>> =A0require libx11.inc
>> -PR =3D "${INC_PR}.2"
>> +PR =3D "${INC_PR}.3"
>> =A0# gcc 4.5 ends up ICEing with thumb and -O1 with -fno-omit-framepoint=
er
>> =A0# therefore if we are in thumb mode then we use -Os instead of -O1 fo=
r
>> =A0# DEBUG_OPTIMIZATION
>>
>> =A0DEBUG_OPTIMIZATION_thumb_append =3D " -Os"
>> =A0SRC_URI +=3D " file://dolt-fix.patch"
>> +SRC_URI +=3D " file://configure.ac-nios2.patch"
>> =A0SRC_URI[archive.md5sum] =3D "001d780829f936e34851ef7cd37b4dfd"
>> =A0SRC_URI[archive.sha256sum] =3D "4def4d5c9fce85d690f1f29d675154594acde=
a3d3fe792d0cb513732c7b4bcb2"
>> diff --git a/recipes/xorg-lib/libx11_1.3.6.bb b/recipes/xorg-lib/libx11_=
1.3.6.bb
>> index 625f906..8d9f343 100644
>> --- a/recipes/xorg-lib/libx11_1.3.6.bb
>> +++ b/recipes/xorg-lib/libx11_1.3.6.bb
>> @@ -1,6 +1,7 @@
>> =A0require libx11.inc
>> -PR =3D "${INC_PR}.0"
>> +PR =3D "${INC_PR}.1"
>>
>> =A0SRC_URI +=3D " file://dolt-fix.patch"
>> +SRC_URI +=3D " file://configure.ac-nios2.patch"
>> =A0SRC_URI[archive.md5sum] =3D "8e0a8a466aa78f66e09fe06cb395319f"
>> =A0SRC_URI[archive.sha256sum] =3D "599826765c59a98b1e58b4f6c4ad50dca69ee=
b0e7bd78aea736ca815f45bea40"
>> diff --git a/recipes/xorg-lib/libx11_1.3.99.903.bb b/recipes/xorg-lib/li=
bx11_1.3.99.903.bb
>> index 65ff63c..5ea3291 100644
>> --- a/recipes/xorg-lib/libx11_1.3.99.903.bb
>> +++ b/recipes/xorg-lib/libx11_1.3.99.903.bb
>> @@ -2,7 +2,8 @@ require libx11.inc
>> =A0#--without-xcb is not an option anymore
>> =A0#http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=3D15e5eaf6289=
7b3179d1fbe457cb19f886f0449f8
>> =A0DEPENDS_virtclass-native =3D "libxcb-native ${COMMON_DEPENDS}"
>> -PR =3D "${INC_PR}.0"
>> +PR =3D "${INC_PR}.1"
>>
>> +SRC_URI +=3D " file://configure.ac-nios2.patch"
>> =A0SRC_URI[archive.md5sum] =3D "3e8ed7a91f70bb819b5dab9c124a7062"
>> =A0SRC_URI[archive.sha256sum] =3D "50205aad0646c0ab13aff8e8eaec7c5cddff4=
16d3a012f83c5661ad98e49736f"
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


