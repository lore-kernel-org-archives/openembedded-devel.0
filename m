Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14E7C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 14:08:45 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.20297.1753452516375441173
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 07:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jg5X7so2;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-719a4206caeso23713397b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753452515; x=1754057315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB6AEbIuuScycbQNr8TOJWXnOkpJX9zkGaT+QM3MhG4=;
        b=Jg5X7so2zkMArAzYG83U9v5Npr4kktV3vyziuEnErnoAVmgrsGyCjX3CE2obHIlqF0
         YwVoYQy47LGF3HGEKFUliUm7yl54aWWvvZFyPoNiLSZZD7IOHBg0nlyhYNTEoNSiupUZ
         CUmgqI9ZXi3S+S0hUVoBmpbiMvdajqB/HwLfL1/GqnXTI37T44ydn/8T3JDVTpawEAil
         LJ/80YM4WmUUmVlj6THuuJeI0AKmykYlGRH40FdJX5uoaFmTijQprXeM67kBWEg6dZLI
         e05yvf+zGTeqFrq79jgw9qexpLaAlfTFQRLEot0jvy0qILKEuvVdgb9dK3uLhkp1edVk
         U3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753452515; x=1754057315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB6AEbIuuScycbQNr8TOJWXnOkpJX9zkGaT+QM3MhG4=;
        b=IzJlqApXuHFr3eMSZ3lHk9LUQsGPYjK6HarvCFuoSrWPov34TwzQpKOWEo+bbcUucI
         NF7wW0g1WI4EagwPgZrZM2uHjY5Qj3nVR2RHKlNk+4wAoPfTcZo9NkhVzyKGVRC3z3HJ
         Xc9AO4mu7S4HRaSWdElVgwm2PYDoqMOzylHmUIyipTMomtwdq5q/bBt6TuBQkfbBT4lm
         ku1DcV7+ok3wlpOhOLWN/kqMzxTh9JUucJndYQa57ePvjzACkcsxvOcWwc2O3T72tK8j
         JeSzEg3I6RqbybyxApT3N01C9+//8n7bMamppq+b2OhvMggpW1I12Twf5RS4j8mO5AVH
         v/8g==
X-Gm-Message-State: AOJu0YxN/fRb6HoEexX8waF1PkH62SNEB86kG52lPXeoUOazvetPxKK2
	YYBVe3n8pf/1Oyqm8Y9rFEUxebg4jnvbMvEA4O6of4w9TD5BzLNBHEYP93PeZn7DbuYAK06Iz8f
	RoxLte+B/fwCY6Xh5M7PHIm+LKWmh/q/QpX5Jz8U=
X-Gm-Gg: ASbGncteDUkzKGNwHzcQTyz5siE0tTHx9oUUbSSfTYWxd3mZz5tikdgLEvLVyWdrqpj
	I+Dl4HPsGfO2GNRCmVG85h+FJ+3rtOpWBDqZbSA8Y5PP1a+WBkF3Jq5MRU2Es2tkPk8HafSxtWx
	gglaAR5692x/XtZCD6f9bEixClcHR9XIykBIRAq1/9M6LAiSYx1GuKEAkP+ert+j7XK2ehOieKx
	CzaH7PUMQn+0W23VnqWvKv4gM3wVk+xwrGTKMdj
X-Google-Smtp-Source: AGHT+IFV+LcRKmtj6uPk3QbbexV+MjiE6xF1wJHDKDoC8b+H90DlOZUC8BwQ6MRJ+962nPtQVnCBvEuFn86upHgB/Ms=
X-Received: by 2002:a05:690c:6389:b0:719:53fd:79aa with SMTP id
 00721157ae682-719e341e587mr24525737b3.22.1753452514997; Fri, 25 Jul 2025
 07:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250724074411.2903317-1-bo.sun.cn@windriver.com>
 <CAMKF1sq63BjGgAdbnD=KD3N7tvt3vzXTivTPobB4O=TO1MaNvw@mail.gmail.com> <e214e651-b3c3-473f-ac38-470929fd0bdf@windriver.com>
In-Reply-To: <e214e651-b3c3-473f-ac38-470929fd0bdf@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Jul 2025 07:08:08 -0700
X-Gm-Features: Ac12FXz-iac3604iMhSHlRI-aZREXHzDxxCoL9ncZePEvV82rbZ0_1s6-9GcYOc
Message-ID: <CAMKF1soMckyOUG96OeEs4e5LSkH6UPM0xjEeHatDEm+qzGpCHQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][walnascar][PATCH] thin-provisioning-tools: fix
 bindgen build error with clang on octeontx2
To: Bo Sun <Bo.Sun.CN@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 14:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118731

sounds good.

On Fri, Jul 25, 2025 at 1:52=E2=80=AFAM Bo Sun <Bo.Sun.CN@windriver.com> wr=
ote:
>
> On 7/24/25 23:55, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > while this fixes it for one recipe, we have to fix it as tune level in
> > oe-core so remove it globally if we are using clang compiler. so
> > perhaps adding it to clang.bbclass might be a good idea
>
> Yes, this fix does resolve the issue for this specific recipe. However,
> I think fixing it at the recipe level is still a reasonable solution.
>
> Looking at the bindgen code, BINDGEN_EXTRA_CLANG_ARGS is parsed and used
> directly by bindgen at runtime, not by BitBake:
>
> https://github.com/rust-lang/rust-bindgen/blob/de9627ffa4860c6ed56cd40470=
fc7a96afc09d44/bindgen/lib.rs#L300
>
> fn get_extra_clang_args(
>      parse_callbacks: &[Rc<dyn callbacks::ParseCallbacks>],
> ) -> Vec<String> {
>      // Add any extra arguments from the environment to the clang
> command line.
>      let Some(extra_clang_args) =3D get_target_dependent_env_var(
>          parse_callbacks,
>          "BINDGEN_EXTRA_CLANG_ARGS",
>      ) else {
>          return vec![];
>      };
>
> https://github.com/rust-lang/rust-bindgen/blob/de9627ffa4860c6ed56cd40470=
fc7a96afc09d44/bindgen/lib.rs#L337
>
>          // Add any extra arguments from the environment to the clang
> command line.
>          self.options.clang_args.extend(
>              get_extra_clang_args(&self.options.parse_callbacks)
>                  .into_iter()
>                  .map(String::into_boxed_str),
>          );
>
> Additionally, base on the build.rs for devicemapper-sys, I believe we
> can safely remove ${HOST_CC_ARCH} from this recipe.
>
> https://github.com/stratis-storage/devicemapper-rs/blob/master/devicemapp=
er-rs-sys/build.rs
>
> $ git diff
> diff --git
> a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/thin-provisioning-tools_1.1.0.bb
> b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/thin-provisioning-tools_1.1.0.bb
> index a60ca11244..e8173c9b14 100644
> ---
> a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/thin-provisioning-tools_1.1.0.bb
> +++
> b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/thin-provisioning-tools_1.1.0.bb
> @@ -23,7 +23,7 @@ inherit pkgconfig
>   DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
>
>   export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
> -export BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
> --target=3D${TARGET_SYS}"
> +export BINDGEN_EXTRA_CLANG_ARGS =3D "${TOOLCHAIN_OPTIONS}
> --target=3D${TARGET_SYS}"
>
>   require ${BPN}-crates.inc
>   require ${BPN}-git-crates.inc
>
> I propose submitting this patch to master in v2, from where it will be
> backported. Let me know if you agree or have an alternative suggestion.
>
>
> Thanks,
> Bo
>
> >
> > On Thu, Jul 24, 2025 at 4:44=E2=80=AFAM Bo Sun via lists.openembedded.o=
rg
> > <Bo.Sun.CN=3Dwindriver.com@lists.openembedded.org> wrote:
> >>
> >> Remove unsupported '-mcpu=3Docteontx2+crypto' from BINDGEN_EXTRA_CLANG=
_ARGS
> >> as clang does not recognize 'octeontx2' as a valid target CPU, causing
> >> bindgen to fail when generating Rust bindings.
> >>
> >> Since bindgen only parses headers using Clang, CPU-specific options
> >> like -mcpu are generally unnecessary.
> >>
> >> Fixes build failure:
> >> |   error: unsupported argument 'octeontx2+crypto' to option '-mcpu=3D=
'
> >> |   error: unknown target CPU 'octeontx2'
> >>
> >> Signed-off-by: Bo Sun <bo.sun.cn@windriver.com>
> >> ---
> >>   .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb | 5 +++=
+-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-p=
rovisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers=
/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tool=
s_1.1.0.bb
> >> index a60ca11244..4ed885f8b3 100644
> >> --- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisio=
ning-tools/thin-provisioning-tools_1.1.0.bb
> >> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisio=
ning-tools/thin-provisioning-tools_1.1.0.bb
> >> @@ -23,7 +23,10 @@ inherit pkgconfig
> >>   DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
> >>
> >>   export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
> >> -export BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIO=
NS} --target=3D${TARGET_SYS}"
> >> +# Remove octeontx2 specific CPU flags that may cause issues with bind=
gen
> >> +BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --t=
arget=3D${TARGET_SYS}"
> >> +BINDGEN_EXTRA_CLANG_ARGS:remove =3D "-mcpu=3Docteontx2+crypto"
> >> +export BINDGEN_EXTRA_CLANG_ARGS
> >>
> >>   require ${BPN}-crates.inc
> >>   require ${BPN}-git-crates.inc
> >> --
> >> 2.50.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#118723): https://lists.openembedded.org/g/openembe=
dded-devel/message/118723
> >> Mute This Topic: https://lists.openembedded.org/mt/114317423/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

