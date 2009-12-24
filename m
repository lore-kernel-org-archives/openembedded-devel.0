Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NNrVb-0007Xd-Kk
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 18:29:58 +0100
Received: by iwn32 with SMTP id 32so5431577iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 09:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2AduhGOzuAoECd3k+91X+xt58qe1/n2PFPUdexMEEag=;
	b=h4yXg//WgvMlIN590menBB/ZGOEo6HjTdWmSzdkdiHyDtYsgft2lavmjuJ8GK/sceH
	lNb7IUkMYTt5i8HYjZ6z2QKIxpRkWiVcWW7bdz7FkuqqNNQDJ/b9M0d2H2+uaBj6xSgi
	ficBfzApjfzQR/zqCXf/k1UJnYF7ASjM74WlA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=V5hN7MZu4Bh3pQYjdAMJmNW29jJHPY4ivF3gs/XKXJVCWQ74zZKxc4VvSRmA2/1+bp
	mQhAI5UnTjCY2zyz0n+y35kMRAN5TodU/lm3Pfn/uyPGunk6I1HsgFgMbNrrqdN7/ALP
	Bobn+rzL7RFTy5REdXiE3fm7Lnv5J4YeeNYHY=
MIME-Version: 1.0
Received: by 10.231.10.23 with SMTP id n23mr1266803ibn.4.1261675681295; Thu, 
	24 Dec 2009 09:28:01 -0800 (PST)
In-Reply-To: <hgvcnd$9gv$1@ger.gmane.org>
References: <1261629237-15118-1-git-send-email-raj.khem@gmail.com>
	<hgvcnd$9gv$1@ger.gmane.org>
Date: Thu, 24 Dec 2009 09:28:01 -0800
Message-ID: <19c1b8a90912240928p40d3c391ybb4289c6a987a5a4@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] u-boot_git.bb: Change SRC_URI to a valid location for beagleboard.
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
X-List-Received-Date: Thu, 24 Dec 2009 17:29:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2009 at 1:36 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> NAK, uboot_git.bb should fetch from git.

It was intermediate solution measure because I could not track this
commit-id which is in SRCREV for beagle anywhere in git trees. If
anyone knows where this commit exist or where this got rebased to then
we can add that
secondly at present even for angstrom its fetching snapshot so
essentially its is not what a git recipe should do either.

Thx

-Khem

Thanks

-Khem

>
> On 24-12-09 05:33, Khem Raj wrote:
>> * The commit-id it is looking for is not there in upstream git
>> =C2=A0 repo therefore get the tar file from angstrom mirror.
>>
>> * On ARM gcc 4.4 does not allow weak inline, patch them.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 ++
>> =C2=A0recipes/u-boot/u-boot-git/weak_inline.patch | =C2=A0 51 ++++++++++=
+++++++++++++++++
>> =C2=A0recipes/u-boot/u-boot_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
>> =C2=A03 files changed, 57 insertions(+), 1 deletions(-)
>> =C2=A0create mode 100644 recipes/u-boot/u-boot-git/weak_inline.patch
>>
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> index 2d59a3a..f87af15 100644
>> --- a/conf/checksums.ini
>> +++ b/conf/checksums.ini
>> @@ -8754,6 +8754,10 @@ sha256=3D692901194603cc4fb4072d8f907487d867caef6b=
62161f50f0f44dbeb001066e
>> =C2=A0md5=3Ded8c4fa007a44d51b646865c35461ce8
>> =C2=A0sha256=3Df8ccac357f2c721e735ae16bbb02a420d2aaaed483f5d46043c5fe627=
ab4b260
>>
>> +[http://www.angstrom-distribution.org/unstable/sources/git_git.denx.de.=
u-boot-ti.git_1590f84007e2b50ad346a482fff89195cb04ff4e.tar.gz]
>> +md5=3D6ff9ee1f4d43997b6e533b3c2c2a739f
>> +sha256=3D6b3cfb0ae1f35e695da38561877bd185da5f8471f4377c0069f999114d9352=
1a
>> +
>> =C2=A0[http://downloads.sourceforge.net/gizmod/gizmod-2.3.tar.bz2]
>> =C2=A0md5=3Db7200b08149599c4c0f56d88f0c7f208
>> =C2=A0sha256=3D53af32530e58ba23cbb752f063364612bbea57b31de2ee35814973452=
c2f63f2
>> diff --git a/recipes/u-boot/u-boot-git/weak_inline.patch b/recipes/u-boo=
t/u-boot-git/weak_inline.patch
>> new file mode 100644
>> index 0000000..d0014ff
>> --- /dev/null
>> +++ b/recipes/u-boot/u-boot-git/weak_inline.patch
>> @@ -0,0 +1,51 @@
>> +From: Ron Lee <ron@debian.org>
>> +Date: Wed, 5 Aug 2009 18:14:01 +0000 (+0200)
>> +Subject: ARM Don't inline weak symbols
>> +X-Git-Url: http://git.denx.de/?p=3Du-boot%2Fu-boot-arm.git;a=3Dcommitdi=
ff_plain;h=3Df865fcbbb35851e75fee9c3a3fa8e0f71d9e6463
>> +
>> +ARM Don't inline weak symbols
>> +
>> +-----------------------------------------------------------------------=
-
>> +
>> +GCC 4.4 complains about this now.
>> +
>> +Signed-off-by: Ron Lee <ron@debian.org>
>> +---
>> +
>> +Index: git/lib_arm/board.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- git.orig/lib_arm/board.c 2009-10-20 04:08:52.000000000 -0700
>> ++++ git/lib_arm/board.c =C2=A0 =C2=A0 =C2=A02009-12-23 15:30:11.6874360=
24 -0800
>> +@@ -89,23 +89,23 @@ extern void rtl8019_get_enetaddr (uchar
>> + =C2=A0* May be supplied by boards if desired
>> + =C2=A0*/
>> + void inline __coloured_LED_init (void) {}
>> +-void inline coloured_LED_init (void) __attribute__((weak, alias("__col=
oured_LED_init")));
>> ++void coloured_LED_init (void) __attribute__((weak, alias("__coloured_L=
ED_init")));
>> + void inline __red_LED_on (void) {}
>> +-void inline red_LED_on (void) __attribute__((weak, alias("__red_LED_on=
")));
>> ++void red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
>> + void inline __red_LED_off(void) {}
>> +-void inline red_LED_off(void) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0__attribute__((weak, alias("__red_LED_off")));
>> ++void red_LED_off(void) __attribute__((weak, alias("__red_LED_off")));
>> + void inline __green_LED_on(void) {}
>> +-void inline green_LED_on(void) __attribute__((weak, alias("__green_LED=
_on")));
>> ++void green_LED_on(void) __attribute__((weak, alias("__green_LED_on")))=
;
>> + void inline __green_LED_off(void) {}
>> +-void inline green_LED_off(void)__attribute__((weak, alias("__green_LED=
_off")));
>> ++void green_LED_off(void) __attribute__((weak, alias("__green_LED_off")=
));
>> + void inline __yellow_LED_on(void) {}
>> +-void inline yellow_LED_on(void)__attribute__((weak, alias("__yellow_LE=
D_on")));
>> ++void yellow_LED_on(void) __attribute__((weak, alias("__yellow_LED_on")=
));
>> + void inline __yellow_LED_off(void) {}
>> +-void inline yellow_LED_off(void)__attribute__((weak, alias("__yellow_L=
ED_off")));
>> ++void yellow_LED_off(void) __attribute__((weak, alias("__yellow_LED_off=
")));
>> + void inline __blue_LED_on(void) {}
>> +-void inline blue_LED_on(void)__attribute__((weak, alias("__blue_LED_on=
")));
>> ++void blue_LED_on(void) __attribute__((weak, alias("__blue_LED_on")));
>> + void inline __blue_LED_off(void) {}
>> +-void inline blue_LED_off(void)__attribute__((weak, alias("__blue_LED_o=
ff")));
>> ++void blue_LED_off(void) __attribute__((weak, alias("__blue_LED_off")))=
;
>> +
>> + /*********************************************************************=
***
>> + =C2=A0* Init Utilities =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *
>> diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
>> index 5fcf7c5..9f0adb2 100644
>> --- a/recipes/u-boot/u-boot_git.bb
>> +++ b/recipes/u-boot/u-boot_git.bb
>> @@ -16,9 +16,10 @@ SRC_URI_append_afeb9260 =3D " file://AFEB9260-network=
-fix.patch;patch=3D1"
>> =C2=A0SRC_URI_append_afeb9260-180 =3D " file://AFEB9260-network-fix.patc=
h;patch=3D1"
>> =C2=A0SRC_URI_append_cm-t35 =3D "file://cm-t35/cm-t35.patch;patch=3D1"
>>
>> -SRC_URI_beagleboard =3D "git://git.denx.de/u-boot-ti.git;protocol=3Dgit=
 \
>> +SRC_URI_beagleboard =3D "http://www.angstrom-distribution.org/unstable/=
sources/git_git.denx.de.u-boot-ti.git_1590f84007e2b50ad346a482fff89195cb04f=
f4e.tar.gz \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fw=
_env.config \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ne=
w-pinmux.patch;patch=3D1 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://weak_inline.pat=
ch;patch=3D1 \
>> =C2=A0"
>> =C2=A0SRCREV_beagleboard =3D "1590f84007e2b50ad346a482fff89195cb04ff4e"
>> =C2=A0PV_beagleboard =3D "2009.08+${PR}+gitr${SRCREV}"
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLMzYtMkyGM64RGpERAgD4AJ9v/7BVXO6XVuYB5pgBfo1gbOSKFACghaXX
> jkkIE5R+Z1oMuafdiQpsZf0=3D
> =3DeYjJ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


