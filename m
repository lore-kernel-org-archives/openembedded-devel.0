Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574E0FED9E8
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 16:58:52 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81127.1773766729515156581
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 09:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d4+q+NyV;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64c9ebd1369so5910529d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 09:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773766729; cv=none;
        d=google.com; s=arc-20240605;
        b=WWtzLygmJjtd4JbYz3yRSSgGhmeM6yL0jf2ndpaL0AIk6XkSPEhukj9Zy5wj2U/6qR
         11geSD05bXuDEJQ3EEAXxxOlcOvjlPFbzn1N0XuFrbPH0URpc1zTPF/hGOBNhuRWnhed
         oHxrwQRz86cFP0a8lyn+vt1SB2GBqhJnAkNrvF0S1gh3Rf2YSSltO5Il1+sh1zXhJlXv
         4sBZ0AI+lCC99S4Ps5sn44XCcIfk2rAbdVaLnHly1jWJVD4SAXAJRU2OKpUOqmpvObey
         QzKxhIOZypve9/FWllPYxxBgMxK99XetHGTIpj6XiIe+jCjEaKQMEUZFJDXWcKQ/YIa/
         9XOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5f0JvVwB0URooRAzMoSlAXGT7mVAr+CWDUBlcwhOoVM=;
        fh=pdeOg0eUEeSbuFfdgh6mXmfyvsNCruy81TzftImGxD4=;
        b=VRwvyZOga1grGYZKbyGeBYgM7kLrr5QD28GMgED6zbcBhUa2JczzxKwXu+b/m1OLvc
         s1Quf7lWMKFz30hwPL1sYe8LCQOfD7UfYJBX1rFOlcZRCBqDsLDWBCkB8k924at2933r
         H8exx6RPWqYcNYCmfRWACpLfSwtF8HEcUx/nUCp73mZjCmZ03M6SghCi9K9yuHBrsZ1c
         KaSNgxdFz9Sc6ju/hAMnmbfdt1hrjIccklgG+o9NE736rhdymuA9Hew0BUOrDG7ssprk
         ZD4yTLH21bZKwUzj9QGDslZOu9X7v3eeJxiKU9Aazp0n8VAWxiuYHCg+UBcpW4MwejLR
         wgVg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773766728; x=1774371528; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5f0JvVwB0URooRAzMoSlAXGT7mVAr+CWDUBlcwhOoVM=;
        b=d4+q+NyVkvG2fepgJOc3PAnfuEiWbUB5ImlRrpktl/cqb4Axrc5iw8FyajToQWw9OP
         Z+HVX7jICThyDZUE05P92jIMn4rBFaYAzAssJ0JgTFn2ET9RroiJmn8o+Gh0ohcp2Ae5
         rYGFRPGgFHMoLV4z4tLbY6/v22bFvDlYjDnyCwJBKJpXu/91a619rmdr/U/eIIvyo/Hu
         YAFMIyUafxxtWUICc+1/QNEJXjRu3q3Kc17lNB8u7DWCHe6NsxYgvMNiPbHvH64MooOR
         Ua7MrTdOuSpoksq6R05wY9ea4UXim21boYIgzmBx8ZLdIb5D52beGSRt5iHrzTpW/DL7
         nQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773766729; x=1774371529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5f0JvVwB0URooRAzMoSlAXGT7mVAr+CWDUBlcwhOoVM=;
        b=AE6GCYijrp2zIoUl2NTb9wejr4GSIKXE+qvu05NlzYYjbqBPaNl7Xov/xfxdt0sa6d
         XBP9LfmUmdG1vtQAdmA7+eQo8sERg2H10sQA1C5sdUeM9/bP3AlqXIJWiFW1bOWIkmj8
         xmHdiMKO+3i2OfM4YMQIWNgjJ0fCiHnaFlGIYVXbCHXSY8RMhSVa++DYuQH5pnrPsSNg
         mXT3Wdjw2M6qbYVS2DxgBe0n7CrDdFJskieDXO67myA2Kbqma8UbrizBEMbROE0R/0zQ
         4gN66/2VGL+OIplfwC6qOMNU9JAIEgvZSxDDt+zcbjXjfQZb8nkQ6uDby9OYoi4UWQF5
         ZIjg==
X-Gm-Message-State: AOJu0YwX4yaqU7UiG96dlZu/hpjflGfOjUGs5uwcSQiYJvRPrg6bqX7Q
	A37oY9a0ZnVpPiWbqGBO0NmJnz9pe+ucuA3KsyjJJqH797sZNByomPpyN6Z2WkhAVoYmRF63Vrq
	3ZcebAzsC8udzX1teZ6LbSMwEVe/YBbzYO63I
X-Gm-Gg: ATEYQzy9CeBndPolDyKjW+Spxq2kppQpvmmNGTP4Bnilrf1T7hOzLM+lC/4Fa0eATB5
	WFvDspxYon3OV/TYo6UyvtjwP02b+sSysn82lDwciz6Xrd+btBEUrLWWSUs418d7nMkgDkFBYE/
	j7Zl1g9Tcz5kLvzK5/KMoM0ZbhG4+r2TKFSmCLrL9EZl3FeVH/3VnZ0nr/bPAjlXZz8khoJTrkd
	rgDs2erNxJ9iRhIH8KpKNsWieiOLAVQQur9FPGSUKQgSaAOj/ceAbx2u5Px5cuq+QvFhN7ISgRd
	rglPOPsecL6Fifeo9jjyQ2hDpe1dy3oIuYNdZ4z316O0GkMQcDLMp/ub7lKcwRevgZL/ot/grPR
	7gaYnBbe9eb1pyJj5ZxG/W5AY
X-Received: by 2002:a05:690e:418b:b0:646:7062:22ad with SMTP id
 956f58d0204a3-64e915c9e74mr348994d50.46.1773766728365; Tue, 17 Mar 2026
 09:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260315133441.3034831-1-deeratho@cisco.com>
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2026 09:58:21 -0700
X-Gm-Features: AaiRm51dQ8uWwn-lCnTH5nhp7_aKA_cENz4MAIIwOCzt8qg7zm6lnByFyjJg7q0
Message-ID: <CAMKF1so1J8YHsCstkS1cYdDc0rTgK27abaE7BowvDdgADo-ipA@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][master][PATCH 0/24] Pull request (Cover
 letter only)
To: deeratho@cisco.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c239ef064d3b3f92"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 16:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125322

--000000000000c239ef064d3b3f92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please run

bitbake -c fetch universe --dry-run -k

With these changes and fix the fallouts.

On Sun, Mar 15, 2026 at 6:35=E2=80=AFAM Deepak Rathore via lists.openembedd=
ed.org
<deeratho=3Dcisco.com@lists.openembedded.org> wrote:

> From: Deepak Rathore <deeratho@cisco.com>
>
> This series extends a set of recipes to support native and nativesdk
> variants.
> These packages are needed as host or SDK artifacts in certain dependency
> chains
> (e.g., perf/tracing and networking toolchains), where dependency resoluti=
on
> fails when only the target variant exists.
>
> None of the changes alter target package behavior; they solely enable the
> required native/nativesdk build paths.
>
> Testing:
>   - Built each recipe as native/nativesdk on x86-64 with no errors.
>   - Verified existing target builds are unaffected.
>
> Deepak Rathore (24):
>   libburn: extend recipe for nativesdk builds
>   libisoburn: extend recipe for nativesdk builds
>   libisofs: extend recipe for nativesdk builds
>   iscsi-initiator-utils: extend recipe for native/nativesdk builds
>   open-isns: extend recipe for native builds
>   tcpdump: extend recipe for native/nativesdk builds
>   nodejs: extend recipe for nativesdk builds
>   libyang: extend recipe for native/nativesdk builds
>   libtracefs: extend recipe for native/nativesdk builds
>   trace-cmd: extend recipe for native/nativesdk builds
>   audit: extend recipe for native builds
>   cunit: extend recipe for nativesdk builds
>   python3-arrow: extend recipe for native/nativesdk builds
>   python3-fastnumbers: extend recipe for native/nativesdk builds
>   python3-future: extend recipe for nativesdk builds
>   python3-icu: extend recipe for native/nativesdk builds
>   python3-ipy: extend recipe for nativesdk builds
>   python3-jsonpatch: extend recipe for native/nativesdk builds
>   python3-natsort: extend recipe for native/nativesdk builds
>   python3-ordered-set: extend recipe for native/nativesdk builds
>   python3-sh: extend recipe for native/nativesdk builds
>   python3-tabulate: extend recipe for native/nativesdk builds
>   python3-types-python-dateutil: extend recipe for native/nativesdk build=
s
>   python3-websocket-client: extend recipe for native/nativesdk builds
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb           |
> 2 +-
>  meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb        |
> 2 +-
>  meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb          |
> 2 +-
>  .../iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
>  | 1 +
>  meta-networking/recipes-support/open-isns/open-isns_0.102.bb           |
> 1 +
>  meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb              |
> 1 +
>  meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb                      |
> 2 +-
>  meta-oe/recipes-extended/libyang/libyang_3.13.6.bb                     |
> 1 +
>  meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb                  |
> 1 +
>  meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb                    |
> 1 +
>  meta-oe/recipes-security/audit/audit_4.1.3.bb                          |
> 2 ++
>  meta-oe/recipes-test/cunit/cunit_2.1-3.bb                              |
> 2 +-
>  meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb             |
> 1 +
>  meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb       |
> 1 +
>  meta-python/recipes-devtools/python/python3-future_1.0.0.bb            |
> 2 +-
>  meta-python/recipes-devtools/python/python3-icu_2.16.1.bb              |
> 2 ++
>  meta-python/recipes-devtools/python/python3-ipy_1.01.bb                |
> 2 +-
>  meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb          |
> 1 +
>  meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb           |
> 1 +
>  .../recipes-devtools/python/python3-ordered-set_4.1.0.bb               |
> 2 +-
>  meta-python/recipes-devtools/python/python3-sh_2.2.2.bb                |
> 1 +
>  meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb          |
> 1 +
>  .../python/python3-types-python-dateutil_2.9.0.20241003.bb             |
> 1 +
>  .../recipes-devtools/python/python3-websocket-client_1.7.0.bb          |
> 1 +
>  24 files changed, 26 insertions(+), 8 deletions(-)
>
> --
> 2.35.6
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125219):
> https://lists.openembedded.org/g/openembedded-devel/message/125219
> Mute This Topic: https://lists.openembedded.org/mt/118327819/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c239ef064d3b3f92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please=C2=A0run=C2=A0<div><br></div><div>bitbake -c fetch =
universe --dry-run -k<br></div><div><br></div><div>With these changes and f=
ix the fallouts.</div></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 15, 2026 at 6:35=E2=
=80=AFAM Deepak Rathore via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;deeratho=3D<a href=3D"mailto:cisco.com@lists.open=
embedded.org">cisco.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">From: Deepak Rathore &lt;<a h=
ref=3D"mailto:deeratho@cisco.com" target=3D"_blank">deeratho@cisco.com</a>&=
gt;<br>
<br>
This series extends a set of recipes to support native and nativesdk varian=
ts.<br>
These packages are needed as host or SDK artifacts in certain dependency ch=
ains<br>
(e.g., perf/tracing and networking toolchains), where dependency resolution=
<br>
fails when only the target variant exists.<br>
<br>
None of the changes alter target package behavior; they solely enable the<b=
r>
required native/nativesdk build paths.<br>
<br>
Testing:<br>
=C2=A0 - Built each recipe as native/nativesdk on x86-64 with no errors.<br=
>
=C2=A0 - Verified existing target builds are unaffected.<br>
<br>
Deepak Rathore (24):<br>
=C2=A0 libburn: extend recipe for nativesdk builds<br>
=C2=A0 libisoburn: extend recipe for nativesdk builds<br>
=C2=A0 libisofs: extend recipe for nativesdk builds<br>
=C2=A0 iscsi-initiator-utils: extend recipe for native/nativesdk builds<br>
=C2=A0 open-isns: extend recipe for native builds<br>
=C2=A0 tcpdump: extend recipe for native/nativesdk builds<br>
=C2=A0 nodejs: extend recipe for nativesdk builds<br>
=C2=A0 libyang: extend recipe for native/nativesdk builds<br>
=C2=A0 libtracefs: extend recipe for native/nativesdk builds<br>
=C2=A0 trace-cmd: extend recipe for native/nativesdk builds<br>
=C2=A0 audit: extend recipe for native builds<br>
=C2=A0 cunit: extend recipe for nativesdk builds<br>
=C2=A0 python3-arrow: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-fastnumbers: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-future: extend recipe for nativesdk builds<br>
=C2=A0 python3-icu: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-ipy: extend recipe for nativesdk builds<br>
=C2=A0 python3-jsonpatch: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-natsort: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-ordered-set: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-sh: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-tabulate: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-types-python-dateutil: extend recipe for native/nativesdk bu=
ilds<br>
=C2=A0 python3-websocket-client: extend recipe for native/nativesdk builds<=
br>
<br>
Signed-off-by: Deepak Rathore &lt;<a href=3D"mailto:deeratho@cisco.com" tar=
get=3D"_blank">deeratho@cisco.com</a>&gt;<br>
---<br>
=C2=A0meta-filesystems/recipes-filesystems/burnia/<a href=3D"http://libburn=
_1.5.6.bb" rel=3D"noreferrer" target=3D"_blank">libburn_1.5.6.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-filesystems/recipes-filesystems/burnia/<a href=3D"http://libisob=
urn_1.5.6.bb" rel=3D"noreferrer" target=3D"_blank">libisoburn_1.5.6.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-filesystems/recipes-filesystems/burnia/<a href=3D"http://libisof=
s_1.5.6.bb" rel=3D"noreferrer" target=3D"_blank">libisofs_1.5.6.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../iscsi-initiator-utils/<a href=3D"http://iscsi-initiator-utils_2.1=
.11.bb" rel=3D"noreferrer" target=3D"_blank">iscsi-initiator-utils_2.1.11.b=
b</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-networking/recipes-support/open-isns/<a href=3D"http://open-isns=
_0.102.bb" rel=3D"noreferrer" target=3D"_blank">open-isns_0.102.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-networking/recipes-support/tcpdump/<a href=3D"http://tcpdump_4.9=
9.6.bb" rel=3D"noreferrer" target=3D"_blank">tcpdump_4.99.6.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.22.0.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_22.22.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_3.13.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">libyang_3.13.6.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs_1.8.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.3.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-oe/recipes-kernel/trace-cmd/<a href=3D"http://trace-cmd_3.1.5.bb=
" rel=3D"noreferrer" target=3D"_blank">trace-cmd_3.1.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-oe/recipes-security/audit/<a href=3D"http://audit_4.1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">audit_4.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
+<br>
=C2=A0meta-oe/recipes-test/cunit/<a href=3D"http://cunit_2.1-3.bb" rel=3D"n=
oreferrer" target=3D"_blank">cunit_2.1-3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-arrow_1=
.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-arrow_1.4.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-fastnum=
bers_5.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastnumbers_5.1=
.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-future_=
1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-future_1.0.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-icu_2.1=
6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-icu_2.16.1.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-ipy_1.0=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipy_1.01.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
ch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.33.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-natsort=
_8.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-natsort_8.4.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-ordered-set_4.1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ordered-set_4.1.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-sh_2.2.=
2.bb" rel=3D"noreferrer" target=3D"_blank">python3-sh_2.2.2.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-tabulat=
e_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-tabulate_0.9.0.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0.../python/<a href=3D"http://python3-types-python-dateutil_2.9.0.2024=
1003.bb" rel=3D"noreferrer" target=3D"_blank">python3-types-python-dateutil=
_2.9.0.20241003.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +=
<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-websocket-clien=
t_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-websocket-client_1=
.7.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A024 files changed, 26 insertions(+), 8 deletions(-)<br>
<br>
-- <br>
2.35.6<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125219): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125219" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125219</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118327819/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118327819/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c239ef064d3b3f92--

