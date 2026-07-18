Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E611C4451B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 15:29:52 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7935.1784388583616139843
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jul 2026 08:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gZ9zkJm1;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81ee6b2da98so27975097b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 08:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784388583; cv=none;
        d=google.com; s=arc-20260327;
        b=A/lq4uyPLqsDOLDSwBLLbWcZjpdMHXFJTrxcbLUuxbDHs0chlP9nqO2L4na5zU5Qoe
         hWQwA6obUapR9Tpmgba9xN6ykAnrr3IS2bRYtg7gi+XiEG6xFBGKkHKtTDFBZYXQ/Eny
         kwpgypNXK5mNxDtLdls0UUnXG32qqtFpgRI95ljM8Min/Hrx691wgfKBHb4XnZEIPk3h
         Km0qT5ioZj12C5MXngJaIiCZcyQ+xypjKIdHidWMRFJwUtbWP1XxeaeW+bJPI3jzfXuB
         wWkLvcWyzo6TfG6YDMc0iybkoMLW30pad617hXV7bOT2CKdNix2ZHdFTApxMsBNJvsTI
         fwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WsrAkDVqOprqqnMZiTr+3+gmHv90K71TPBo3jx/xEQY=;
        fh=8keRl2qkbBaB+fIMFJvlKJ0uiBueEFIWGp/Rf5nhwrw=;
        b=SYtgxMYBSbdh81pMhc0oY6uUk1zt2foGdQf1wQ9bsl/MpUWVbZaSdB2RcVwrIYz1HR
         /I+Jm/30z4nqR8jQVOuTx8A903uy1foI4BEDPm4NISbPUNlQzct2F91X5eSai5l3cWS/
         Ab8gGSep/dliejLW1dqwMkF3RuoCVLoF4EXRwpPH/1QGQUUSOfMvEYyimXiRfG5MgAHx
         O+DiQvEw7I4qs+rJeLfTse08M1mQyMCHNttrstT8vHfygfhK15MBHrjpcSJm0GBY7U80
         LRT7LrGKt38danH1tF7rMtd2xR0SAK6IV7S0YhjOB5kDzlUA5frOeMVIVugmWXulE4Wo
         2JcQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784388583; x=1784993383; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsrAkDVqOprqqnMZiTr+3+gmHv90K71TPBo3jx/xEQY=;
        b=gZ9zkJm1XkuBGqwzfFI1vxgs4zGV3okSAC8QPM/22WNP57/PG6t0afNp3ybdVVTX2Y
         T7AtiXhqsk/DXSNPktXbMfxa2A7MKzDP8a/XeGUnizVqGRiADdGCSXcXG0uaQ+37yHAg
         n+eXdA0BUrNSVQRWZgJeypMlgGT6bhlAaL7B0ElfC9dQ9mO7G1RxFqze6HuBVAHuhUH4
         DmBJ0Hf4qHnkUC/N9VkXjJGUGckr+I16InXJDBr+681s3eXmQEq74HEQFflc7EsIIW4e
         AfGCwav99o7zp4qdfPKLr3Gl5xqnJJmkgsJiV4c1+azl0BN53//GQ2fQom976B0LhVdz
         rkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784388583; x=1784993383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsrAkDVqOprqqnMZiTr+3+gmHv90K71TPBo3jx/xEQY=;
        b=izWuVSBl7P26taCEtWIcGoPfLqtU+TVqmbPrqugnj2Pyxfgjk1hPelsIg6HId+e7lB
         z/DwYtLrT9LIvx5iFRFk0oXMCnpu1+apxTMvinFOP3G4fichwEBtoc1t0r2glBwseJJI
         n8dAT1ZJcrERND3gUTTJDB53iPHdE9n3qjC5d9dpX9W8aFnNy2kCAQHHRFW2jbjfx4gR
         m1usQxKsXHjPEWK8BbX0iVuLcsOXn9UILGe+NT4QDS+C9PkbXF32RdU0PtrO79Q9Ngnq
         C6Cc7rhCooSLOdawKPIMpKc0gdI6RQ0nSFJfE/MTD1FhMeWZiSLlfcz7TiUTxAuew5/m
         vRgg==
X-Gm-Message-State: AOJu0Ywtv4Hy0P7RiPnYKswffwFiU/m98jw2cCOIET6Y/kA4ETt6NorT
	JbO0MGgM/J18ZCiAm/wWjfUtofA1HCE5ajxWpWXzttozbdrMPEetfVrwo2i/SjWL5KSXx0aScSz
	qkTJqds0HsjCYftrOh/BbolkKS1+ZlHx+escL
X-Gm-Gg: AfdE7cl9FcX4YglU90fPpLD4Tjb2fg9VIGB6Etsc+pGwc6HHvTct6C73PcOTYjzFPEK
	AqzDGFA0oX+3fb1GBHylujHSdorozOyCui//bADBF+jNcK4/nLyZfeKDJtw4dXU6GOMPBkP8Otc
	xC/q/J2cyrAOjEwWoYPgcPUDzFyV06NNRaRmF267iO1dL1ga+tTdX2KY6iqfpqwDTIQg4xHCEJc
	n2jdy07Kk0sk1w0tl+k6vR8dqaK+rd/jMajLrKqP6wdEYk7VdtJ52lmkMkkW/ApRtM14yNzfx4n
	fIRl+C5pkMrzF91iFrCBFMPsFgV5jie82ikFN+JBU0rcoyOp44H9SGd7oRgBtYsmV1A6qPj7tMh
	1K8r+t5RJHqVmrV05Jrcqbs8NY62e+DpsVup2rJE/HziQUt1fREXStbVv4l4=
X-Received: by 2002:a05:690c:67c4:b0:80c:85c6:8984 with SMTP id
 00721157ae682-81ef265b313mr20908527b3.67.1784388582537; Sat, 18 Jul 2026
 08:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260715130932.1438994-1-ctheegal@qti.qualcomm.com>
In-Reply-To: <20260715130932.1438994-1-ctheegal@qti.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Jul 2026 08:29:16 -0700
X-Gm-Features: AUfX_mwizNh9o6TZqKaKoe2QFmJfOntKx-bHvV6CmBia-rdC3AMPFCJQy3h2KSM
Message-ID: <CAMKF1sqUtErjiuXXwPrGomhRgnMs9cug91zNOE-trb9tERHUkw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] boot-time-analysis-tools: add boot time
 profiling tools
To: ctheegal@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009a7f9e0656e4579b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 15:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128254

--0000000000009a7f9e0656e4579b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This depends on python3-systemd which comes from meta-python and meta-oe
does not depend on meta-python, so it. fails layers dependency check.
Please move this recipe under meta-oe/dynamic-layers/meta-python

On Wed, Jul 15, 2026 at 6:09=E2=80=AFAM Chitti Babu Theegala via
lists.openembedded.org <ctheegal=3Dqti.qualcomm.com@lists.openembedded.org>
wrote:

> Add two new recipes from the CentOS Automotive SIG
> boot-time-analysis-tools project to enable boot time profiling
> and measurement.
>
> boot-time-analysis-tools:
>   Python-based toolset for collecting, analyzing and visualizing system
>   boot timing data from the systemd journal. Provides the 'boot_timings'
>   CLI utility which queries D-Bus and the systemd journal to produce
>   structured boot time reports. Depends on python3-dbus and python3-syste=
md
>   for runtime journal and D-Bus access.
>
> cntvct-log:
>   Userspace C utility built with Meson that logs ARM CNTVCT_EL0 virtual
>   counter timestamps to correlate hardware-level timing with systemd boot
>   events. Installs cntvct@.service as a systemd template unit (disabled
>   by default) for on-demand per-instance activation. The service preset
>   file (98-cntvct-log.preset) is installed for system-preset-based
> enablement.
>
> Both recipes fetch from the same upstream git repository:
>   https://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools
>
> Signed-off-by: Chitti Babu Theegala <ctheegal@qti.qualcomm.com>
> ---
>  .../boot-time-analysis-tools_0.7.1.bb         | 13 +++++++++
>  .../cntvct-log_0.7.1.bb                       | 27 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/boot-time-analysis-tools/
> boot-time-analysis-tools_0.7.1.bb
>  create mode 100644 meta-oe/recipes-devtools/boot-time-analysis-tools/
> cntvct-log_0.7.1.bb
>
> diff --git a/meta-oe/recipes-devtools/boot-time-analysis-tools/
> boot-time-analysis-tools_0.7.1.bb
> b/meta-oe/recipes-devtools/boot-time-analysis-tools/
> boot-time-analysis-tools_0.7.1.bb
> new file mode 100644
> index 0000000000..00a5c8b960
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/boot-time-analysis-tools/
> boot-time-analysis-tools_0.7.1.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Boot time analysis tools from CentOS Automotive SIG"
> +REQUIRED_DISTRO_FEATURES =3D "systemd"
> +DESCRIPTION =3D "Tools for analyzing and visualizing system boot time"
> +HOMEPAGE =3D "
> https://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1c2e0cc0dec0b709fe547806b5573=
7b0"
> +
> +SRC_URI =3D "git://
> gitlab.com/CentOS/automotive/src/boot-time-analysis-tools.git;protocol=3D=
https;branch=3Dmain;tag=3D${PV}
> <http://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools.git;pro=
tocol=3Dhttps;branch=3Dmain;tag=3D$%7BPV%7D>
> "
> +SRCREV =3D "2409ce37e7389d8079bdb8740cb6a44b505fb8d4"
> +
> +inherit setuptools3 features_check
> +
> +RDEPENDS:${PN} =3D "python3-dbus python3-systemd "
> diff --git a/meta-oe/recipes-devtools/boot-time-analysis-tools/
> cntvct-log_0.7.1.bb b/meta-oe/recipes-devtools/boot-time-analysis-tools/
> cntvct-log_0.7.1.bb
> new file mode 100644
> index 0000000000..8cf2a4c225
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/boot-time-analysis-tools/
> cntvct-log_0.7.1.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "cntvct-log - ARM virtual counter boot time logger"
> +DESCRIPTION =3D "Userspace tool to log ARM CNTVCT_EL0 counter values for
> boot time analysis"
> +HOMEPAGE =3D "
> https://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D
> "file://../LICENSE;md5=3D1c2e0cc0dec0b709fe547806b55737b0"
> +
> +SRC_URI =3D "git://
> gitlab.com/CentOS/automotive/src/boot-time-analysis-tools.git;protocol=3D=
https;branch=3Dmain;tag=3D${PV}
> <http://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools.git;pro=
tocol=3Dhttps;branch=3Dmain;tag=3D$%7BPV%7D>
> "
> +SRCREV =3D "2409ce37e7389d8079bdb8740cb6a44b505fb8d4"
> +
> +S =3D "${UNPACKDIR}/cntvct-log-${PV}/cntvct-log"
> +
> +inherit meson systemd
> +
> +# Manually install service file if meson.build doesn't handle it
> +do_install:append() {
> +    if [ -f ${S}/usr/lib/systemd/system/cntvct@.service ]; then
> +        install -d ${D}${systemd_system_unitdir}
> +        install -m 0644 ${S}/usr/lib/systemd/system/cntvct@.service \
> +            ${D}${systemd_system_unitdir}/cntvct@.service
> +    fi
> +}
> +
> +SYSTEMD_SERVICE:${PN} =3D "cntvct@.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +# Explicitly include the service file in the package
> +FILES:${PN} +=3D "${systemd_system_unitdir}/cntvct@.service"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128218):
> https://lists.openembedded.org/g/openembedded-devel/message/128218
> Mute This Topic: https://lists.openembedded.org/mt/120280473/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009a7f9e0656e4579b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This depends on=C2=A0python3-systemd which comes from meta=
-python and meta-oe does not depend on meta-python, so it. fails layers dep=
endency check. Please move this recipe under meta-oe/dynamic-layers/meta-py=
thon</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Jul 15, 2026 at 6:09=E2=80=AFAM Chitti Ba=
bu Theegala via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;ctheegal=3D<a href=3D"mailto:qti.qualcomm.com@lists.openembed=
ded.org">qti.qualcomm.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Add two new recipes from th=
e CentOS Automotive SIG<br>
boot-time-analysis-tools project to enable boot time profiling<br>
and measurement.<br>
<br>
boot-time-analysis-tools:<br>
=C2=A0 Python-based toolset for collecting, analyzing and visualizing syste=
m<br>
=C2=A0 boot timing data from the systemd journal. Provides the &#39;boot_ti=
mings&#39;<br>
=C2=A0 CLI utility which queries D-Bus and the systemd journal to produce<b=
r>
=C2=A0 structured boot time reports. Depends on python3-dbus and python3-sy=
stemd<br>
=C2=A0 for runtime journal and D-Bus access.<br>
<br>
cntvct-log:<br>
=C2=A0 Userspace C utility built with Meson that logs ARM CNTVCT_EL0 virtua=
l<br>
=C2=A0 counter timestamps to correlate hardware-level timing with systemd b=
oot<br>
=C2=A0 events. Installs cntvct@.service as a systemd template unit (disable=
d<br>
=C2=A0 by default) for on-demand per-instance activation. The service prese=
t<br>
=C2=A0 file (98-cntvct-log.preset) is installed for system-preset-based ena=
blement.<br>
<br>
Both recipes fetch from the same upstream git repository:<br>
=C2=A0 <a href=3D"https://gitlab.com/CentOS/automotive/src/boot-time-analys=
is-tools" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/CentOS/au=
tomotive/src/boot-time-analysis-tools</a><br>
<br>
Signed-off-by: Chitti Babu Theegala &lt;<a href=3D"mailto:ctheegal@qti.qual=
comm.com" target=3D"_blank">ctheegal@qti.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0.../<a href=3D"http://boot-time-analysis-tools_0.7.1.bb" rel=3D"noref=
errer" target=3D"_blank">boot-time-analysis-tools_0.7.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 13 +++++++++<br>
=C2=A0.../<a href=3D"http://cntvct-log_0.7.1.bb" rel=3D"noreferrer" target=
=3D"_blank">cntvct-log_0.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 +++++++++++++++++++<br>
=C2=A02 files changed, 40 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/boot-time-analysis-tools/=
<a href=3D"http://boot-time-analysis-tools_0.7.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">boot-time-analysis-tools_0.7.1.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/boot-time-analysis-tools/=
<a href=3D"http://cntvct-log_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>cntvct-log_0.7.1.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/boot-time-analysis-tools/<a href=3D"h=
ttp://boot-time-analysis-tools_0.7.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">boot-time-analysis-tools_0.7.1.bb</a> b/meta-oe/recipes-devtools/boot-ti=
me-analysis-tools/<a href=3D"http://boot-time-analysis-tools_0.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">boot-time-analysis-tools_0.7.1.bb</a><br>
new file mode 100644<br>
index 0000000000..00a5c8b960<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/boot-time-analysis-tools/<a href=3D"http://b=
oot-time-analysis-tools_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">boot=
-time-analysis-tools_0.7.1.bb</a><br>
@@ -0,0 +1,13 @@<br>
+SUMMARY =3D &quot;Boot time analysis tools from CentOS Automotive SIG&quot=
;<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
+DESCRIPTION =3D &quot;Tools for analyzing and visualizing system boot time=
&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://gitlab.com/CentOS/automotive/src/boo=
t-time-analysis-tools" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
com/CentOS/automotive/src/boot-time-analysis-tools</a>&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1c2e0cc0dec0b709fe547806b5=
5737b0&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/CentOS/automotive/src=
/boot-time-analysis-tools.git;protocol=3Dhttps;branch=3Dmain;tag=3D$%7BPV%7=
D" rel=3D"noreferrer" target=3D"_blank">gitlab.com/CentOS/automotive/src/bo=
ot-time-analysis-tools.git;protocol=3Dhttps;branch=3Dmain;tag=3D${PV}</a>&q=
uot;<br>
+SRCREV =3D &quot;2409ce37e7389d8079bdb8740cb6a44b505fb8d4&quot;<br>
+<br>
+inherit setuptools3 features_check<br>
+<br>
+RDEPENDS:${PN} =3D &quot;python3-dbus python3-systemd &quot;<br>
diff --git a/meta-oe/recipes-devtools/boot-time-analysis-tools/<a href=3D"h=
ttp://cntvct-log_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">cntvct-log_=
0.7.1.bb</a> b/meta-oe/recipes-devtools/boot-time-analysis-tools/<a href=3D=
"http://cntvct-log_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">cntvct-lo=
g_0.7.1.bb</a><br>
new file mode 100644<br>
index 0000000000..8cf2a4c225<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/boot-time-analysis-tools/<a href=3D"http://c=
ntvct-log_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">cntvct-log_0.7.1.b=
b</a><br>
@@ -0,0 +1,27 @@<br>
+SUMMARY =3D &quot;cntvct-log - ARM virtual counter boot time logger&quot;<=
br>
+DESCRIPTION =3D &quot;Userspace tool to log ARM CNTVCT_EL0 counter values =
for boot time analysis&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://gitlab.com/CentOS/automotive/src/boo=
t-time-analysis-tools" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
com/CentOS/automotive/src/boot-time-analysis-tools</a>&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://../LICENSE;md5=3D1c2e0cc0dec0b709fe54780=
6b55737b0&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/CentOS/automotive/src=
/boot-time-analysis-tools.git;protocol=3Dhttps;branch=3Dmain;tag=3D$%7BPV%7=
D" rel=3D"noreferrer" target=3D"_blank">gitlab.com/CentOS/automotive/src/bo=
ot-time-analysis-tools.git;protocol=3Dhttps;branch=3Dmain;tag=3D${PV}</a>&q=
uot;<br>
+SRCREV =3D &quot;2409ce37e7389d8079bdb8740cb6a44b505fb8d4&quot;<br>
+<br>
+S =3D &quot;${UNPACKDIR}/cntvct-log-${PV}/cntvct-log&quot;<br>
+<br>
+inherit meson systemd<br>
+<br>
+# Manually install service file if meson.build doesn&#39;t handle it<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 if [ -f ${S}/usr/lib/systemd/system/cntvct@.service ]; then<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/usr/lib/systemd/system/cn=
tvct@.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_system_unitdir}/cn=
tvct@.service<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;cntvct@.service&quot;<br>
+SYSTEMD_AUTO_ENABLE =3D &quot;disable&quot;<br>
+<br>
+# Explicitly include the service file in the package<br>
+FILES:${PN} +=3D &quot;${systemd_system_unitdir}/cntvct@.service&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128218): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128218" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128218</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120280473/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120280473/1997914</a><br>
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

--0000000000009a7f9e0656e4579b--

