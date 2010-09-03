Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ord2j-0003lu-4r
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 22:39:26 +0200
Received: by yxk30 with SMTP id 30so916229yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=c0M9mEkJx9A/pxAe2O90akK2MHkr9bdFf5bN+D9cmvM=;
	b=czm+Xr/Q1CaOhuEPL1CBp0/Lt/lGT3Ptonu3NpOivWXvBzFxr3SpgpOjeExBBAS84O
	iaIbI8SFogw9YhzD+HzTJa9FFNaWodu1qtUqMRRBgNkhxVl1R543j4ojPD2KfkFxTrYU
	9Fmg/0swTv1pDSjOVzrJ6HH8RrXt3UyuOzK2A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=JmJQ06OwCijgPNb53OOXl1v34soQ8pDlxQbnWAEf+TJV2CftaEZc10i7GvZ3m7ipBJ
	ZgqXdGUvzoXb4Jh9fxFk6YTeDBhqejDaDaX+JLlsOLj3GjMMORsjnptF0L+f7umXgYxY
	+78GYHfMQnH0JrdwuS/y+RbL/1hRiKsjxg3AM=
Received: by 10.231.168.21 with SMTP id s21mr1294413iby.123.1283539927438;
	Fri, 03 Sep 2010 11:52:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 3 Sep 2010 11:51:47 -0700 (PDT)
In-Reply-To: <1283523286-30999-3-git-send-email-michael.lippautz@gmail.com>
References: <1283523286-30999-1-git-send-email-michael.lippautz@gmail.com>
	<1283523286-30999-3-git-send-email-michael.lippautz@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Sep 2010 11:51:47 -0700
Message-ID: <AANLkTinsM0Ge=aUr6Po_gSi7y58oem_AuCjCL_HYMY9v@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] u-boot: Unbreak u-boot 2009.08 for gcc >= 4.4
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
X-List-Received-Date: Fri, 03 Sep 2010 20:39:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 3, 2010 at 7:14 AM, Michael Lippautz
<michael.lippautz@gmail.com> wrote:
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>

seems good.

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0.../u-boot-2009.08/dont-inline-weak-symbols.patch =A0| =A0 45 ++++++++=
++++++++++++
> =A0recipes/u-boot/u-boot_2009.08.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A05 ++-
> =A02 files changed, 49 insertions(+), 1 deletions(-)
> =A0create mode 100644 recipes/u-boot/u-boot-2009.08/dont-inline-weak-symb=
ols.patch
>
> diff --git a/recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch=
 b/recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch
> new file mode 100644
> index 0000000..5931ccf
> --- /dev/null
> +++ b/recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch
> @@ -0,0 +1,45 @@
> +Patch initially created by Ron Lee and archived in OE patchwork at
> +http://patchwork.openembedded.org/patch/1534/.
> +
> +GCC 4.4 complains about this now.
> +
> +Signed-off-by: Ron Lee <ron@debian.org>
> +---
> + lib_arm/board.c | =A0 18 +++++++++---------
> + 1 files changed, 9 insertions(+), 9 deletions(-)
> +
> +--- a/lib_arm/board.c
> ++++ b/lib_arm/board.c
> +@@ -124,23 +124,23 @@
> + =A0* May be supplied by boards if desired
> + =A0*/
> + void inline __coloured_LED_init (void) {}
> +-void inline coloured_LED_init (void) __attribute__((weak, alias("__colo=
ured_LED_init")));
> ++void coloured_LED_init (void) __attribute__((weak, alias("__coloured_LE=
D_init")));
> + void inline __red_LED_on (void) {}
> +-void inline red_LED_on (void) __attribute__((weak, alias("__red_LED_on"=
)));
> ++void red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
> + void inline __red_LED_off(void) {}
> +-void inline red_LED_off(void) =A0 =A0 =A0__attribute__((weak, alias("__=
red_LED_off")));
> ++void red_LED_off(void) =A0 =A0 =A0 =A0 =A0 =A0 __attribute__((weak, ali=
as("__red_LED_off")));
> + void inline __green_LED_on(void) {}
> +-void inline green_LED_on(void) __attribute__((weak, alias("__green_LED_=
on")));
> ++void green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
> + void inline __green_LED_off(void) {}
> +-void inline green_LED_off(void)__attribute__((weak, alias("__green_LED_=
off")));
> ++void green_LED_off(void)__attribute__((weak, alias("__green_LED_off")))=
;
> + void inline __yellow_LED_on(void) {}
> +-void inline yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED=
_on")));
> ++void yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on")))=
;
> + void inline __yellow_LED_off(void) {}
> +-void inline yellow_LED_off(void)__attribute__((weak, alias("__yellow_LE=
D_off")));
> ++void yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off")=
));
> + void inline __blue_LED_on(void) {}
> +-void inline blue_LED_on(void)__attribute__((weak, alias("__blue_LED_on"=
)));
> ++void blue_LED_on(void)__attribute__((weak, alias("__blue_LED_on")));
> + void inline __blue_LED_off(void) {}
> +-void inline blue_LED_off(void)__attribute__((weak, alias("__blue_LED_of=
f")));
> ++void blue_LED_off(void)__attribute__((weak, alias("__blue_LED_off")));
> +
> + /**********************************************************************=
**
> + =A0* Init Utilities =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> diff --git a/recipes/u-boot/u-boot_2009.08.bb b/recipes/u-boot/u-boot_200=
9.08.bb
> index 506a0cb..868e618 100644
> --- a/recipes/u-boot/u-boot_2009.08.bb
> +++ b/recipes/u-boot/u-boot_2009.08.bb
> @@ -7,7 +7,10 @@ DEFAULT_PREFERENCE_at91sam9g45ek =3D "1"
> =A0DEFAULT_PREFERENCE_igep0020 =3D "1"
> =A0DEFAULT_PREFERENCE_babbage =A0=3D "1"
>
> -SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
> +SRC_URI =3D "\
> + =A0 =A0ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
> + =A0 =A0file://dont-inline-weak-symbols.patch \
> +"
>
> =A0SRC_URI_append_igep0020 =3D " \
> =A0 =A0 =A0 =A0file://update-mach-types.patch \
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


