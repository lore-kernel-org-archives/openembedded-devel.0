Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OrnGp-0007IE-0u
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Sep 2010 09:34:42 +0200
Received: by iwn2 with SMTP id 2so2210981iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Sep 2010 00:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gv2YfDUCrVssqOC5cLnUN/ZuHJNQwmSfvn3XO76TYhs=;
	b=u8/Raj0OzmfudAL5w6gWk0SnCg444xuVkUz5GwJ/1KLMbURFIkZBkXtJCQTu+hTdB/
	5dKNDRlK+v9hFK5YITuibfrGsQeDG4FHhUTEtMyOI152UpULxL2GyQayQKARW/AMOXt7
	TkUboDSlEEl4VQjieykQSych67wVa5rMbS/Bs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QdzFKGcglpaczPQ5U1fX9mBqZ449Tgy4dIlr77Wj7RZ4etPoBYduheHm4d4LG4rDPr
	g7mA0FfVVkImVDQconmTuqFghUUuv4U4TMAQvofMuhkl93cjbs4vZ9ApliR9hUgp+7NS
	qPEO1dxK1206kWJUobDUNZUwybQOmuHUvQnB0=
MIME-Version: 1.0
Received: by 10.231.30.134 with SMTP id u6mr2326034ibc.121.1283585642838; Sat,
	04 Sep 2010 00:34:02 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 4 Sep 2010 00:34:02 -0700 (PDT)
In-Reply-To: <AANLkTinsM0Ge=aUr6Po_gSi7y58oem_AuCjCL_HYMY9v@mail.gmail.com>
References: <1283523286-30999-1-git-send-email-michael.lippautz@gmail.com>
	<1283523286-30999-3-git-send-email-michael.lippautz@gmail.com>
	<AANLkTinsM0Ge=aUr6Po_gSi7y58oem_AuCjCL_HYMY9v@mail.gmail.com>
Date: Sat, 4 Sep 2010 09:34:02 +0200
Message-ID: <AANLkTimAuUDUFJQDo5ute0JP3fnmaHeLsqmObbJYWFvD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Sat, 04 Sep 2010 07:34:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/3 Khem Raj <raj.khem@gmail.com>:
> On Fri, Sep 3, 2010 at 7:14 AM, Michael Lippautz
> <michael.lippautz@gmail.com> wrote:
>> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
>
> seems good.
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

This has been discussed in the u-boot mailing list and the patch made
it into 2009.11  [1].

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

[1] http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Dlib_arm/board.c;h=3De14=
8739152c0826130ab70f249c74aa010165d67;hb=3Da200a7c04d89853d2a1395b96d8ca5e3=
dd754551
>
>> ---
>> =A0.../u-boot-2009.08/dont-inline-weak-symbols.patch =A0| =A0 45 +++++++=
+++++++++++++
>> =A0recipes/u-boot/u-boot_2009.08.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A05 ++-
>> =A02 files changed, 49 insertions(+), 1 deletions(-)
>> =A0create mode 100644 recipes/u-boot/u-boot-2009.08/dont-inline-weak-sym=
bols.patch
>>
>> diff --git a/recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patc=
h b/recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch
>> new file mode 100644
>> index 0000000..5931ccf
>> --- /dev/null
>> +++ b/recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch
>> @@ -0,0 +1,45 @@
>> +Patch initially created by Ron Lee and archived in OE patchwork at
>> +http://patchwork.openembedded.org/patch/1534/.
>> +
>> +GCC 4.4 complains about this now.
>> +
>> +Signed-off-by: Ron Lee <ron@debian.org>
>> +---
>> + lib_arm/board.c | =A0 18 +++++++++---------
>> + 1 files changed, 9 insertions(+), 9 deletions(-)
>> +
>> +--- a/lib_arm/board.c
>> ++++ b/lib_arm/board.c
>> +@@ -124,23 +124,23 @@
>> + =A0* May be supplied by boards if desired
>> + =A0*/
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
>> +-void inline red_LED_off(void) =A0 =A0 =A0__attribute__((weak, alias("_=
_red_LED_off")));
>> ++void red_LED_off(void) =A0 =A0 =A0 =A0 =A0 =A0 __attribute__((weak, al=
ias("__red_LED_off")));
>> + void inline __green_LED_on(void) {}
>> +-void inline green_LED_on(void) __attribute__((weak, alias("__green_LED=
_on")));
>> ++void green_LED_on(void) __attribute__((weak, alias("__green_LED_on")))=
;
>> + void inline __green_LED_off(void) {}
>> +-void inline green_LED_off(void)__attribute__((weak, alias("__green_LED=
_off")));
>> ++void green_LED_off(void)__attribute__((weak, alias("__green_LED_off"))=
);
>> + void inline __yellow_LED_on(void) {}
>> +-void inline yellow_LED_on(void)__attribute__((weak, alias("__yellow_LE=
D_on")));
>> ++void yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on"))=
);
>> + void inline __yellow_LED_off(void) {}
>> +-void inline yellow_LED_off(void)__attribute__((weak, alias("__yellow_L=
ED_off")));
>> ++void yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off"=
)));
>> + void inline __blue_LED_on(void) {}
>> +-void inline blue_LED_on(void)__attribute__((weak, alias("__blue_LED_on=
")));
>> ++void blue_LED_on(void)__attribute__((weak, alias("__blue_LED_on")));
>> + void inline __blue_LED_off(void) {}
>> +-void inline blue_LED_off(void)__attribute__((weak, alias("__blue_LED_o=
ff")));
>> ++void blue_LED_off(void)__attribute__((weak, alias("__blue_LED_off")));
>> +
>> + /*********************************************************************=
***
>> + =A0* Init Utilities =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
>> diff --git a/recipes/u-boot/u-boot_2009.08.bb b/recipes/u-boot/u-boot_20=
09.08.bb
>> index 506a0cb..868e618 100644
>> --- a/recipes/u-boot/u-boot_2009.08.bb
>> +++ b/recipes/u-boot/u-boot_2009.08.bb
>> @@ -7,7 +7,10 @@ DEFAULT_PREFERENCE_at91sam9g45ek =3D "1"
>> =A0DEFAULT_PREFERENCE_igep0020 =3D "1"
>> =A0DEFAULT_PREFERENCE_babbage =A0=3D "1"
>>
>> -SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
>> +SRC_URI =3D "\
>> + =A0 =A0ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
>> + =A0 =A0file://dont-inline-weak-symbols.patch \
>> +"
>>
>> =A0SRC_URI_append_igep0020 =3D " \
>> =A0 =A0 =A0 =A0file://update-mach-types.patch \
>> --
>> 1.7.1
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


