Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CABC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 21:46:13 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32131.1782855971713731302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 14:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lLjVCSxG;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664cb440f9eso2816363d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 14:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782855971; cv=none;
        d=google.com; s=arc-20260327;
        b=VoxLtPNtBBIeV2rroRSG5L+mbcIymEBCNiqugXrVKq1mRgk+V7rVBeUdMGX+c6O9ig
         3/L7zMdWSnKwD0APzJLB5SYnoW/orvYmISoqDhvg6+R/pjNo5rTS3f59FnJoSFzFQgLD
         DxvgPTbrCXLJQi8sNPYnKOeFePxwIvjgTd71+O6JHmzyCuhMJUNPEbmM5O08Cc+6hc+N
         CgPsgh9LUwaFxA6BZyeyNzP6yH+1P7q9vrnqH3fjhplQ7Gwyy2ePftOtPUhZMH+21faF
         Co2DV7fHtadDNVANEEHjgGRjds21GecVLP5wsG0zVcTvzpAchIwDji9g8jePwBIh+VUU
         ep6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jYXakFlD5MDq6isjbmn93aR7NwllGp1MI4S1rJTO50I=;
        fh=CWMBWm18NtNyGH4bER9eWZ1czwoqkocW1PIbr/jG/nQ=;
        b=Z4ZdMF8WSPIx8mNPFEaNfUTbn7s5rfEqunZHEuV5Vxz8yEZEWY1B00A3VZ9LUBF5Q4
         zsB1cfYLui/0ZGzpwBEl6InNiYFHq8J5u6jG3NGMxkB72iHI7JjebCM9HI7VdfU0grUo
         nt7tkpMJjPDUJyneLehPej1yZ1+m0N21XqGhFSgifw84mHRX9lI5/uV9qLuY7uFZnvsq
         P2nypSf2SqHs7MAtkShLY+M3djMmH8pjnjvg5aRezqNUitlRNmJJtc9VR+wnGAd1Inj1
         wuRggwmjNEAFbARrgrYGI2qkmNqZezqrLiQWYsCAJHXAAwuT06upBYWHTf86Ty//+whW
         7kSQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782855971; x=1783460771; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jYXakFlD5MDq6isjbmn93aR7NwllGp1MI4S1rJTO50I=;
        b=lLjVCSxGSbU1PnR5rZzBPV5Ci1ep5dO1Q+2yqyQFGcAYdQm2MT2W27dNEzMjCPwx0s
         NXL+F3u+7cUUVb0cAdRFnHzeWIPdPSXUsP7VLlQzrI6k/N06+eujzXbByWhKT1zm8Gt1
         ogI2ox1Bqm6HVuLkIOb3c2oyqqQ7qgGeNt8reAdY49666scwAYNJt7H77HugKkjkimHB
         mpaNsAVIitQIuRtCsO8tsMnfL9lLyfk9JQk9fycoRv3jU2/U/FotRQeGpshQ3gJVpAGI
         +4sT7XYIcyeBd5y80EjeBhoDBrR/8nkvJP6ZGTogEvjxC9AMw3P/BwTSn5svD8S1kpl1
         QqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782855971; x=1783460771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYXakFlD5MDq6isjbmn93aR7NwllGp1MI4S1rJTO50I=;
        b=tX5y4PPDBw9SD3DsB6L0PKb5O9jQ3Sji2A2CJMdLNSU0Y6PvGAEOJ6mGppy9fUWiC1
         P+Vs6ObAku7lAqlUerMIUDIVt1szox/r66fYiOChLV1uc4CQmE9ET0ouzIadBZMcI2XG
         NDNTJHDEPUJkKjWUmakYCr41gpSmKpEuTZ9eznOneVNTMwTLPWnM6NXo3gMrCt5d74Ll
         v9XHbzRbUvC+zaaAzyU1sf4u4Glv6K7Z/SUxGXsijCosNgMZA0wQSF75EMyjgdUb9XFf
         BQs6dGUeA++YxZnHZB+VVB4Yc9UL8/BQL82jJ0oZ36b8LiSDFe01AEP3EKuA6qYRTCfX
         VrKA==
X-Gm-Message-State: AOJu0Yw2chM2/C4zbB+wDnml8u/vvC7Kn9hED7XCEfKsupo5y7r81XZb
	LTBrpPdJIkSPSoDoLCmiqoDEh7GU8WQn4476Y7XoVBgG0yhq2F/1QTFRiS8xwIoXvHJpl2Lz0a+
	1WyIB3Nyrh91MqH+t49w3DNCsZDEaAVg=
X-Gm-Gg: AfdE7cly+sMItclfNEmG4S1Dcu7pREfK6AW9GfOKwAz0vLpYW0XheLy4oRncuEmS0EE
	WyyB7+7Qpa/9IZKGTMHNMrUgK68gCs2T40S6S8l/H3mynSLQ/f5BmEn3J/7tZdT7A7x27SK1PGO
	nbKUtdmPrHAUkSLfavZD7Jc+824mLPh0ihQNlhIeRWe5E4WSyS20r5lMn0SKUwoabVvfxm3Uk9+
	7O8vGMxlWzFx9QLKIHGekfsB4FCv8OMMEILSt9hSB8SI5hsNaS3VRaH8lWAu2xOhGIqgmrn1GKd
	UTSoUggPX6wWYo8reoDXO9f5yR7MW52AKkb03klfixwbAYjpQhhyxn2rT8wVwwNL3IWojZhXQlD
	NJXkNrnqiBRF+BTAowikxImbmlaoHAgBbgaB4RBMucvA9vkQnd809LHGoYseUBqgcPHc8GRs=
X-Received: by 2002:a05:690e:140a:b0:664:9666:10ee with SMTP id
 956f58d0204a3-664f96fcfa0mr5171048d50.19.1782855970609; Tue, 30 Jun 2026
 14:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260630205432.99639-2-tim.orling@konsulko.com>
In-Reply-To: <20260630205432.99639-2-tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Jun 2026 14:45:44 -0700
X-Gm-Features: AVVi8Cedj_PxXnLonXnwlKqlkzNlgPv7Ab9_Yk4ODAYWTT8FpZuqSmisUPHx8Jg
Message-ID: <CAMKF1spYryL0UX43vpHYX-GEBuDm15rr=rRcgq2aDw8y7FnbqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] valkey: upgrade 9.0.4 -> 9.1.0
To: ticotimo@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="000000000000d05f0d06557f8033"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 21:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127986

--000000000000d05f0d06557f8033
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 1:54=E2=80=AFPM Tim Orling via lists.openembedded.o=
rg
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

> * Refresh lua-update-Makefile-to-use-environment-build-setting.patch
>
> Valkey 9.1.0 GA - Released Tue May 19 2026
> ---------------------
>
> Upgrade urgency LOW: This is the first stable release of Valkey 9.1.
>
> * Security fixes
>   - (CVE-2026-23479) Use-After-Free in unblock client flow
>   - (CVE-2026-25243) Invalid Memory Access in RESTORE command
>   - (CVE-2026-23631) Use-after-free when full sync occurs during a
>     yielding Lua/function execution
>
> * New Features and enhanced behavior
>   - Add cluster bus network traffic usage metric in bytes by @hpatro
>     (#3396)
>   - Reduce latency spikes during rehashing via incremental page release
>     by @chzhoo (#3481)
>
> * Bug Fixes
>   - Fix(syncio): Set errno on EOF in syncRead and propagate to
>     conn->last by @abmathur-ie (#3580)
>   - Fix GEOSEARCH BYPOLYGON leak on invalid COUNT by @bandalgomsu (#3568)
>   - Handle NULL pointer in streamTrim listpack delta calculation by
>     @smkher (#3591)
>   - Fixes server crash when RDMA benchmark clients disconnect by
>     @quanyeyang (#3448)
>   - Fix the memory leak in valkey-benchmark by @nmvk (#3643)
>
> Release announcment:
>
> https://valkey.io/blog/valkey-9-1-delivers-improvements-in-security-perfo=
rmance-and-more/
>
> For full comparison of changes, see:
> https://github.com/valkey-io/valkey/compare/9.0.4...9.1.0
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  ...akefile-to-use-environment-build-setting.patch | 15 +++++++++------
>  .../valkey/{valkey_9.0.4.bb =3D> valkey_9.1.0.bb}   |  4 ++--
>  2 files changed, 11 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-extended/valkey/{valkey_9.0.4.bb =3D>
> valkey_9.1.0.bb} (95%)
>
> diff --git
> a/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-envir=
onment-build-setting.patch
> b/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-envir=
onment-build-setting.patch
> index b91684afd6..7e5a6bb570 100644
> ---
> a/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-envir=
onment-build-setting.patch
> +++
> b/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-envir=
onment-build-setting.patch
> @@ -19,6 +19,9 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  Updated to work with 8.1.x
>  Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> +Refreshed for 9.1.x
> +Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> +
>  Upstream-Status: Inappropriate [OE-specific]
>
>  ---
> @@ -28,10 +31,10 @@ Upstream-Status: Inappropriate [OE-specific]
>   3 files changed, 6 insertions(+), 12 deletions(-)
>
>  diff --git a/deps/Makefile b/deps/Makefile
> -index 72389def9..5d3ade528 100644
> +index 94d9385..5d49559 100644
>  --- a/deps/Makefile
>  +++ b/deps/Makefile
> -@@ -95,7 +95,6 @@ endif
> +@@ -102,7 +102,6 @@ endif
>   # lua's Makefile defines AR=3D"ar rcu", which is unusual, and makes it =
more
>   # challenging to cross-compile lua (and redis).  These defines make it
> easier
>   # to fit redis into cross-compilation environments, which typically set
> AR.
> @@ -40,7 +43,7 @@ index 72389def9..5d3ade528 100644
>
>   lua: .make-prerequisites
>  diff --git a/deps/lua/Makefile b/deps/lua/Makefile
> -index 209a13244..72f4b2bf2 100644
> +index 209a132..72f4b2b 100644
>  --- a/deps/lua/Makefile
>  +++ b/deps/lua/Makefile
>  @@ -33,7 +33,6 @@ INSTALL_DATA=3D $(INSTALL) -m 0644
> @@ -52,7 +55,7 @@ index 209a13244..72f4b2bf2 100644
>   # =3D=3D END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LI=
NE
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  diff --git a/deps/lua/src/Makefile b/deps/lua/src/Makefile
> -index f3bba2f81..1555ec028 100644
> +index d38b2d8..e6b3540 100644
>  --- a/deps/lua/src/Makefile
>  +++ b/deps/lua/src/Makefile
>  @@ -5,18 +5,14 @@
> @@ -78,5 +81,5 @@ index f3bba2f81..1555ec028 100644
>  +CFLAGS +=3D $(MYCFLAGS)
>  +LIBS +=3D -lm $(MYLIBS)
>
> - # =3D=3D END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LI=
NE
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> + # Pretty-printing setup
> + CC_COLOR=3D"\033[32m"
> diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
> b/meta-oe/recipes-extended/valkey/valkey_9.1.0.bb
> similarity index 95%
> rename from meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
> rename to meta-oe/recipes-extended/valkey/valkey_9.1.0.bb
> index 93e37a922a..8790854ff6 100644
> --- a/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
> +++ b/meta-oe/recipes-extended/valkey/valkey_9.1.0.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D08b9159809d809e8aaa340a8387e6=
93e"
>  DEPENDS =3D "readline lua ncurses"
>
> -SRC_URI =3D "git://
> github.com/valkey-io/valkey.git;branch=3D9.0;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/valkey-io/valkey.git;branch=3D9.0;protocol=3Dhttps;tag=
=3D$%7BPV%7D>
> \
> +SRC_URI =3D "git://
> github.com/valkey-io/valkey.git;branch=3D9.1;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/valkey-io/valkey.git;branch=3D9.1;protocol=3Dhttps;tag=
=3D$%7BPV%7D>
> \
>

while here, you can turn this into something like

SRC_URI =3D "git://
github.com/valkey-io/valkey.git;branch=3D${@oe.utils.trim_version(d.getVar(=
'PV'),
2)};protocol=3Dhttps;tag=3D${PV}"

so it does not need changing on every version bump


>             file://valkey.conf \
>             file://init-valkey-server \
>             file://valkey.service \
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://
> github.com/valkey-io/valkey.git;branch=3D9.0;protocol=3Dhttps;tag=3D$
>             file://0001-src-Do-not-reset-FINAL_LIBS.patch \
>             file://GNU_SOURCE-7.patch \
>             "
> -SRCREV =3D "1cbee84ba69b54c3510597965fc4320ce716a6f4"
> +SRCREV =3D "c9e8005e9d0ec817e26c7db318861cb821409249"
>
>  RPROVIDES:${PN} =3D "virtual-redis"
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127985):
> https://lists.openembedded.org/g/openembedded-devel/message/127985
> Mute This Topic: https://lists.openembedded.org/mt/120054088/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d05f0d06557f8033
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 30,=
 2026 at 1:54=E2=80=AFPM Tim Orling via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">* Refresh lua-upd=
ate-Makefile-to-use-environment-build-setting.patch<br>
<br>
Valkey 9.1.0 GA - Released Tue May 19 2026<br>
---------------------<br>
<br>
Upgrade urgency LOW: This is the first stable release of Valkey 9.1.<br>
<br>
* Security fixes<br>
=C2=A0 - (CVE-2026-23479) Use-After-Free in unblock client flow<br>
=C2=A0 - (CVE-2026-25243) Invalid Memory Access in RESTORE command<br>
=C2=A0 - (CVE-2026-23631) Use-after-free when full sync occurs during a<br>
=C2=A0 =C2=A0 yielding Lua/function execution<br>
<br>
* New Features and enhanced behavior<br>
=C2=A0 - Add cluster bus network traffic usage metric in bytes by @hpatro<b=
r>
=C2=A0 =C2=A0 (#3396)<br>
=C2=A0 - Reduce latency spikes during rehashing via incremental page releas=
e<br>
=C2=A0 =C2=A0 by @chzhoo (#3481)<br>
<br>
* Bug Fixes<br>
=C2=A0 - Fix(syncio): Set errno on EOF in syncRead and propagate to<br>
=C2=A0 =C2=A0 conn-&gt;last by @abmathur-ie (#3580)<br>
=C2=A0 - Fix GEOSEARCH BYPOLYGON leak on invalid COUNT by @bandalgomsu (#35=
68)<br>
=C2=A0 - Handle NULL pointer in streamTrim listpack delta calculation by<br=
>
=C2=A0 =C2=A0 @smkher (#3591)<br>
=C2=A0 - Fixes server crash when RDMA benchmark clients disconnect by<br>
=C2=A0 =C2=A0 @quanyeyang (#3448)<br>
=C2=A0 - Fix the memory leak in valkey-benchmark by @nmvk (#3643)<br>
<br>
Release announcment:<br>
<a href=3D"https://valkey.io/blog/valkey-9-1-delivers-improvements-in-secur=
ity-performance-and-more/" rel=3D"noreferrer" target=3D"_blank">https://val=
key.io/blog/valkey-9-1-delivers-improvements-in-security-performance-and-mo=
re/</a><br>
<br>
For full comparison of changes, see:<br>
<a href=3D"https://github.com/valkey-io/valkey/compare/9.0.4...9.1.0" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/valkey-io/valkey/compa=
re/9.0.4...9.1.0</a><br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...akefile-to-use-environment-build-setting.patch | 15 +++++++++-----=
-<br>
=C2=A0.../valkey/{<a href=3D"http://valkey_9.0.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">valkey_9.0.4.bb</a> =3D&gt; <a href=3D"http://valkey_9.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">valkey_9.1.0.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 4 ++--<br>
=C2=A02 files changed, 11 insertions(+), 8 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/valkey/{<a href=3D"http://valkey_9.0.=
4.bb" rel=3D"noreferrer" target=3D"_blank">valkey_9.0.4.bb</a> =3D&gt; <a h=
ref=3D"http://valkey_9.1.0.bb" rel=3D"noreferrer" target=3D"_blank">valkey_=
9.1.0.bb</a>} (95%)<br>
<br>
diff --git a/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-=
use-environment-build-setting.patch b/meta-oe/recipes-extended/valkey/valke=
y/lua-update-Makefile-to-use-environment-build-setting.patch<br>
index b91684afd6..7e5a6bb570 100644<br>
--- a/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-env=
ironment-build-setting.patch<br>
+++ b/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-env=
ironment-build-setting.patch<br>
@@ -19,6 +19,9 @@ Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anav=
i@konsulko.com" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
=C2=A0Updated to work with 8.1.x<br>
=C2=A0Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@wind=
river.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
<br>
+Refreshed for 9.1.x<br>
+Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" t=
arget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
+<br>
=C2=A0Upstream-Status: Inappropriate [OE-specific]<br>
<br>
=C2=A0---<br>
@@ -28,10 +31,10 @@ Upstream-Status: Inappropriate [OE-specific]<br>
=C2=A0 3 files changed, 6 insertions(+), 12 deletions(-)<br>
<br>
=C2=A0diff --git a/deps/Makefile b/deps/Makefile<br>
-index 72389def9..5d3ade528 100644<br>
+index 94d9385..5d49559 100644<br>
=C2=A0--- a/deps/Makefile<br>
=C2=A0+++ b/deps/Makefile<br>
-@@ -95,7 +95,6 @@ endif<br>
+@@ -102,7 +102,6 @@ endif<br>
=C2=A0 # lua&#39;s Makefile defines AR=3D&quot;ar rcu&quot;, which is unusu=
al, and makes it more<br>
=C2=A0 # challenging to cross-compile lua (and redis).=C2=A0 These defines =
make it easier<br>
=C2=A0 # to fit redis into cross-compilation environments, which typically =
set AR.<br>
@@ -40,7 +43,7 @@ index 72389def9..5d3ade528 100644<br>
<br>
=C2=A0 lua: .make-prerequisites<br>
=C2=A0diff --git a/deps/lua/Makefile b/deps/lua/Makefile<br>
-index 209a13244..72f4b2bf2 100644<br>
+index 209a132..72f4b2b 100644<br>
=C2=A0--- a/deps/lua/Makefile<br>
=C2=A0+++ b/deps/lua/Makefile<br>
=C2=A0@@ -33,7 +33,6 @@ INSTALL_DATA=3D $(INSTALL) -m 0644<br>
@@ -52,7 +55,7 @@ index 209a13244..72f4b2bf2 100644<br>
=C2=A0 # =3D=3D END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS=
 LINE =3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0diff --git a/deps/lua/src/Makefile b/deps/lua/src/Makefile<br>
-index f3bba2f81..1555ec028 100644<br>
+index d38b2d8..e6b3540 100644<br>
=C2=A0--- a/deps/lua/src/Makefile<br>
=C2=A0+++ b/deps/lua/src/Makefile<br>
=C2=A0@@ -5,18 +5,14 @@<br>
@@ -78,5 +81,5 @@ index f3bba2f81..1555ec028 100644<br>
=C2=A0+CFLAGS +=3D $(MYCFLAGS)<br>
=C2=A0+LIBS +=3D -lm $(MYLIBS)<br>
<br>
- # =3D=3D END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE=
 =3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- <br>
+ # Pretty-printing setup<br>
+ CC_COLOR=3D&quot;\033[32m&quot;<br>
diff --git a/meta-oe/recipes-extended/valkey/<a href=3D"http://valkey_9.0.4=
.bb" rel=3D"noreferrer" target=3D"_blank">valkey_9.0.4.bb</a> b/meta-oe/rec=
ipes-extended/valkey/<a href=3D"http://valkey_9.1.0.bb" rel=3D"noreferrer" =
target=3D"_blank">valkey_9.1.0.bb</a><br>
similarity index 95%<br>
rename from meta-oe/recipes-extended/valkey/<a href=3D"http://valkey_9.0.4.=
bb" rel=3D"noreferrer" target=3D"_blank">valkey_9.0.4.bb</a><br>
rename to meta-oe/recipes-extended/valkey/<a href=3D"http://valkey_9.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">valkey_9.1.0.bb</a><br>
index 93e37a922a..8790854ff6 100644<br>
--- a/meta-oe/recipes-extended/valkey/<a href=3D"http://valkey_9.0.4.bb" re=
l=3D"noreferrer" target=3D"_blank">valkey_9.0.4.bb</a><br>
+++ b/meta-oe/recipes-extended/valkey/<a href=3D"http://valkey_9.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">valkey_9.1.0.bb</a><br>
@@ -6,7 +6,7 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D08b9159809d809e8aaa34=
0a8387e693e&quot;<br>
=C2=A0DEPENDS =3D &quot;readline lua ncurses&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/valkey-io/valkey.git;=
branch=3D9.0;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=3D=
"_blank">github.com/valkey-io/valkey.git;branch=3D9.0;protocol=3Dhttps;tag=
=3D${PV}</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/valkey-io/valkey.git;=
branch=3D9.1;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=3D=
"_blank">github.com/valkey-io/valkey.git;branch=3D9.1;protocol=3Dhttps;tag=
=3D${PV}</a> \<br></blockquote><div><br></div><div>while here, you can turn=
 this into something like</div><div><br></div><div>SRC_URI =3D &quot;git://=
<a href=3D"http://github.com/valkey-io/valkey.git;branch=3D${@oe.utils.trim=
_version(d.getVar(&#39;PV&#39;)">github.com/valkey-io/valkey.git;branch=3D$=
{@oe.utils.trim_version(d.getVar(&#39;PV&#39;)</a>, 2)};protocol=3Dhttps;ta=
g=3D${PV}&quot;</div><div><br></div><div>so it does not need changing on ev=
ery version bump</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://valkey.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init-valkey-server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://valkey.service \<br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/valk=
ey-io/valkey.git;branch=3D9.0;protocol=3Dhttps;tag=3D$" rel=3D"noreferrer" =
target=3D"_blank">github.com/valkey-io/valkey.git;branch=3D9.0;protocol=3Dh=
ttps;tag=3D$</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-src-Do-not-reset-FINA=
L_LIBS.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://GNU_SOURCE-7.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;1cbee84ba69b54c3510597965fc4320ce716a6f4&quot;<br>
+SRCREV =3D &quot;c9e8005e9d0ec817e26c7db318861cb821409249&quot;<br>
<br>
=C2=A0RPROVIDES:${PN} =3D &quot;virtual-redis&quot;<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127985): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127985" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127985</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120054088/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120054088/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d05f0d06557f8033--

