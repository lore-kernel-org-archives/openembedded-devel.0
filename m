Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5BEC5AD7B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 19:02:00 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37639.1786388519327076672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 12:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EkjwVkuW;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81ed000b507so18266737b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786388518; cv=none;
        d=google.com; s=arc-20260327;
        b=PRWk5+0Lm+xQxwco2R/db31ZaJO98POrQPI0bVWhgRCcSL+pxS/Aiu+CY0B6TRc1Wn
         xWkB5kbWo4yDgydGtZzwqmrcpphKUQBe6yjberd87Vc8drgc/eGUh+5ORIcgnydURRC5
         JdWfr7/7OJ9kEH15GBQyD2eNK6NeWMSpNNCAZLtWDdt5G2+GZsVotsuo8SiaTfwrLhQr
         zYFGTpQiXtKZiOirMlZ8WytYnXTzx/jE8JvrBtnGnxVXnxnxsF1Ax5WgxfsErJGmHumd
         +L9/925I+i9NqtEdi5+QjJoDq4lMrE4O2F+Wqvq0LiADy2g+Qv+HmWKb1im2zLWLW9eu
         dy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VvHUXz5D4P7le6KcTSM+5ny80FJaBW2lQbDZZbCs2DM=;
        fh=8keRl2qkbBaB+fIMFJvlKJ0uiBueEFIWGp/Rf5nhwrw=;
        b=hzoAPyDCTVGYD31wyxFlOLTJBaemE9nWLdDhqrjWIQKwf+FM4pEDFiU7QGAdbnOami
         krbn1nKJux54m37EX6HiJptNr+ZYKsjHPkduQgfDHqzDEXbYHagMuRJw6YtWvQjjqQpQ
         bDPiJRAM+2al17HQhPSCz3f2ypMCIiV5WmYZ6frUpDrciQJwOLzVZxicSSPhZRTCxjNF
         Ohs2aDds6+RL1drLcAkUE6x0ZEdVirImW7k29D2Rb4qECs74MYU5eZS8bcmUGsjP41SE
         syQdcsi8KEhXO1lY9BXBpH7+4EK+yjwQIjZhI0Zke/ftne7AVW/Ipckxh8adCvBSZ20Y
         jFWg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786388518; x=1786993318; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvHUXz5D4P7le6KcTSM+5ny80FJaBW2lQbDZZbCs2DM=;
        b=EkjwVkuWetJ4x5nFL5X5W3oLFeUQQPu+MM2oBJZykJcA+1fTJaGUQuc8qDPQxN8J7F
         MmkJ+zeFyIpIrIhtkM0yvm21yq1iSvk+x82AQhVq3ACw70CdrcclHNt/ncztSFj12oah
         iNsw8AMdcZ44dftnw/mguxcYAKfez2SjWLI7u8oB7cTuE5uMsPDix6VUnM749FEHZtAc
         awmKtvSqxOB7hIngaG5ZeYo07gNaas/rjlZ68lEXUbPK3Dax4XqNxqNmHFnhCJwHaMMk
         pJCrse1nbeY1AGz4bOcvPjZaqLiwSLcyHi7+4HWXAc+ot7hvhhsV3xNTpvpEb6QJL0V6
         tVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786388518; x=1786993318;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VvHUXz5D4P7le6KcTSM+5ny80FJaBW2lQbDZZbCs2DM=;
        b=XAOrL559KrGL8i2zP/TArsFKFDgYU1NH2YKTXQ8V8Muac+o2Segn9qiBPrhTZBj+xV
         72Aie5BUn1VmGrnKCNdVuDU/9TTfovteNTO2GQ8q5wAeDO0ihuedbLNnfWNS1UIinqry
         BTJ+hWQHn9ie7cP2zP+2/KHJqjoLdgpQL+CQVZhmxxLkyPcLDlND1JiP5Gf6epnID14j
         o3IdsxE1x+Ouh8H+tFAxzG+zJ9NQalHmkwEqh2iDthBk9xEwE6IU9RpUXnBzaXOiAfdf
         Q769x6HHW1DGMxMp0MhfYodrX4vvkZ/Df38yE40mWmtAy7PBOfSlMgpeoOrW7ByuXG25
         IK3A==
X-Gm-Message-State: AOJu0YwRDDevx68lfSZeVcwxBYs9ZfebOCZgiXOo2UiEAjJ3irUlMm2B
	bwKimp9KsdGJ3HApa0ZssoC/2M4GC5DkEEJwbczD2qLxI+RxnSOGfuqXj1UCjFtcHnCapJO9DOL
	2/BYcjCRUucaOsX0JA17v2p0UDfreLwY=
X-Gm-Gg: AR+sD12nLFp39luMApIyI6xntCWChhjX2DPeVTBBRHHf5G5ep0dmnEIqv5L082TAUOL
	r6+kSfRWN8V8Q1JEazsKpblgBZBO7UVCybgwhVwURXmjObB+eB/QTI+llIo9JbHHx99KpAR0LVm
	72dGFqTXW0RF33BotActyhd8wKZ7o2yLW0vafKGItS2LcGWXscxMV1V8EWqZyTV4DyLn3FyVuES
	jdoPxcQcGKfmGSJC0HB4YiQeJBAThXWZmB3ySg5xnUksaE8JfSBeWWv7KnLZ5kPbpW3rAz/knTr
	jbf/g9pBeR9sbGpHMkmEp0aMANVPavZWyDKiasqtDfXrB02niSLPmzlT+kUKkSQdIb+OnBxbsmJ
	PYTt5+YvayT3YP+CmRxW62zhJIGmt9rzDw2BLH0/hcaoArwWXN6dvyeHZditkv97eDJc6ebkB2H
	LnONxRR/09/P2KVRr57PHggdd7vsIRoU6G1XDxzYs6YQNjMcUyD9r3tLyyP/vxRAMphTJD+EiIk
	4pwZFtSzMc=
X-Received: by 2002:a05:690c:f0f:b0:81e:6658:53fe with SMTP id
 00721157ae682-824443f51damr145916047b3.20.1786388518014; Mon, 10 Aug 2026
 12:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260805054533.1722572-1-ctheegal@qti.qualcomm.com> <20260809132414.1934095-1-ctheegal@qti.qualcomm.com>
In-Reply-To: <20260809132414.1934095-1-ctheegal@qti.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Aug 2026 12:01:31 -0700
X-Gm-Features: AUfX_mzExdIrNPEQlVa5sZR9n2Mf88SkL7ixxKAT7qbsBvJWyX0JmuXjxMqPkgY
Message-ID: <CAMKF1sqDNTgWXHYk-HN3s2HAiM2O3OTksk+iQx-XgJ72jQa+nw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] boot-time-analysis-tools: add boot time
 profiling tools
To: ctheegal@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000c13e40658b5fd4b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 19:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128905

--0000000000000c13e40658b5fd4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this fails when systemd is not the init system like what poky has sysvinit

stdio: ERROR: Nothing RPROVIDES 'python3-systemd' (but
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/dynamic=
-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-ana=
lysis-tools_0.7.1.bb
RDEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'boot-time-analysis-tools-dev' (but
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/dynamic=
-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-ana=
lysis-tools_0.7.1.bb
RDEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'boot-time-analysis-tools' (but
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/dynamic=
-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-ana=
lysis-tools_0.7.1.bb
RDEPENDS on or otherwise requires it)



please test it out and fix it before sending v3.

On Sun, Aug 9, 2026 at 6:24=E2=80=AFAM Chitti Babu Theegala via
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
>
> ---
> Changes in v2:
> - Move recipe under meta-oe/dynamic-layers/meta-python to fix
>   layers dependency check (meta-oe must not depend on meta-python
>   unconditionally). Reported by Khem Raj.
> ---
>  .../boot-time-analysis-tools_0.7.1.bb         | 12 ++++++++
>  .../cntvct-log_0.7.1.bb                       | 28 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644
> meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-to=
ols/
> boot-time-analysis-tools_0.7.1.bb
>  create mode 100644
> meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-to=
ols/
> cntvct-log_0.7.1.bb
>
> diff --git
> a/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-=
tools/
> boot-time-analysis-tools_0.7.1.bb
> b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-=
tools/
> boot-time-analysis-tools_0.7.1.bb
> new file mode 100644
> index 0000000000..87fbd68f78
> --- /dev/null
> +++
> b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-=
tools/
> boot-time-analysis-tools_0.7.1.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Boot time analysis tools from CentOS Automotive SIG"
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
> +inherit setuptools3
> +
> +RDEPENDS:${PN} =3D "python3-dbus python3-systemd "
> diff --git
> a/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-=
tools/
> cntvct-log_0.7.1.bb
> b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-=
tools/
> cntvct-log_0.7.1.bb
> new file mode 100644
> index 0000000000..434ddc5893
> --- /dev/null
> +++
> b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-=
tools/
> cntvct-log_0.7.1.bb
> @@ -0,0 +1,28 @@
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
> +inherit meson systemd features_check
> +REQUIRED_DISTRO_FEATURES =3D "systemd"
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
> View/Reply Online (#128871):
> https://lists.openembedded.org/g/openembedded-devel/message/128871
> Mute This Topic: https://lists.openembedded.org/mt/120669348/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000c13e40658b5fd4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this fails when systemd is not the init system like what p=
oky has sysvinit=C2=A0<div><br></div><div><pre class=3D"gmail-bb-log-previe=
w-contents gmail-select-content gmail-log" style=3D"box-sizing:border-box;f=
ont-family:SFMono-Regular,Menlo,Monaco,Consolas,&quot;Liberation Mono&quot;=
,&quot;Courier New&quot;,monospace;font-size:12.25px;margin-top:0px;margin-=
bottom:0px;overflow:auto;color:rgb(238,238,238);padding:9.5px;background-co=
lor:rgb(0,0,0)"><div class=3D"gmail-logline" style=3D"box-sizing:border-box=
"><span class=3D"gmail-log_o" style=3D"box-sizing:border-box"><span style=
=3D"box-sizing:border-box">stdio: ERROR: Nothing RPROVIDES &#39;python3-sys=
temd&#39; (but /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tool=
s/<a href=3D"http://boot-time-analysis-tools_0.7.1.bb">boot-time-analysis-t=
ools_0.7.1.bb</a> RDEPENDS on or otherwise requires it)</span></span></div>=
<div class=3D"gmail-logline" style=3D"box-sizing:border-box"><span class=3D=
"gmail-log_o" style=3D"box-sizing:border-box"><span style=3D"box-sizing:bor=
der-box">stdio: ERROR: Nothing RPROVIDES &#39;boot-time-analysis-tools-dev&=
#39; (but /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-=
oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/<a =
href=3D"http://boot-time-analysis-tools_0.7.1.bb">boot-time-analysis-tools_=
0.7.1.bb</a> RDEPENDS on or otherwise requires it)</span></span></div><div =
class=3D"gmail-logline" style=3D"box-sizing:border-box"><span class=3D"gmai=
l-log_o" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-b=
ox">stdio: ERROR: Nothing RPROVIDES &#39;boot-time-analysis-tools&#39; (but=
 /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/dynami=
c-layers/meta-python/recipes-devtools/boot-time-analysis-tools/<a href=3D"h=
ttp://boot-time-analysis-tools_0.7.1.bb">boot-time-analysis-tools_0.7.1.bb<=
/a> RDEPENDS on or otherwise requires it)</span></span></div></pre><br clas=
s=3D"gmail-Apple-interchange-newline"></div><div><br></div><div>please test=
 it out and fix it before sending v3.</div></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Au=
g 9, 2026 at 6:24=E2=80=AFAM Chitti Babu Theegala via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;ctheegal=3D<a href=3D"m=
ailto:qti.qualcomm.com@lists.openembedded.org">qti.qualcomm.com@lists.opene=
mbedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add two new recipes from the CentOS Automotive SIG<br>
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
<br>
---<br>
Changes in v2:<br>
- Move recipe under meta-oe/dynamic-layers/meta-python to fix<br>
=C2=A0 layers dependency check (meta-oe must not depend on meta-python<br>
=C2=A0 unconditionally). Reported by Khem Raj.<br>
---<br>
=C2=A0.../<a href=3D"http://boot-time-analysis-tools_0.7.1.bb" rel=3D"noref=
errer" target=3D"_blank">boot-time-analysis-tools_0.7.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++<br>
=C2=A0.../<a href=3D"http://cntvct-log_0.7.1.bb" rel=3D"noreferrer" target=
=3D"_blank">cntvct-log_0.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 28 +++++++++++++++++++<br>
=C2=A02 files changed, 40 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtool=
s/boot-time-analysis-tools/<a href=3D"http://boot-time-analysis-tools_0.7.1=
.bb" rel=3D"noreferrer" target=3D"_blank">boot-time-analysis-tools_0.7.1.bb=
</a><br>
=C2=A0create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtool=
s/boot-time-analysis-tools/<a href=3D"http://cntvct-log_0.7.1.bb" rel=3D"no=
referrer" target=3D"_blank">cntvct-log_0.7.1.bb</a><br>
<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-=
analysis-tools/<a href=3D"http://boot-time-analysis-tools_0.7.1.bb" rel=3D"=
noreferrer" target=3D"_blank">boot-time-analysis-tools_0.7.1.bb</a> b/meta-=
oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/<a =
href=3D"http://boot-time-analysis-tools_0.7.1.bb" rel=3D"noreferrer" target=
=3D"_blank">boot-time-analysis-tools_0.7.1.bb</a><br>
new file mode 100644<br>
index 0000000000..87fbd68f78<br>
--- /dev/null<br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysi=
s-tools/<a href=3D"http://boot-time-analysis-tools_0.7.1.bb" rel=3D"norefer=
rer" target=3D"_blank">boot-time-analysis-tools_0.7.1.bb</a><br>
@@ -0,0 +1,12 @@<br>
+SUMMARY =3D &quot;Boot time analysis tools from CentOS Automotive SIG&quot=
;<br>
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
+inherit setuptools3<br>
+<br>
+RDEPENDS:${PN} =3D &quot;python3-dbus python3-systemd &quot;<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-=
analysis-tools/<a href=3D"http://cntvct-log_0.7.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">cntvct-log_0.7.1.bb</a> b/meta-oe/dynamic-layers/meta-pytho=
n/recipes-devtools/boot-time-analysis-tools/<a href=3D"http://cntvct-log_0.=
7.1.bb" rel=3D"noreferrer" target=3D"_blank">cntvct-log_0.7.1.bb</a><br>
new file mode 100644<br>
index 0000000000..434ddc5893<br>
--- /dev/null<br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysi=
s-tools/<a href=3D"http://cntvct-log_0.7.1.bb" rel=3D"noreferrer" target=3D=
"_blank">cntvct-log_0.7.1.bb</a><br>
@@ -0,0 +1,28 @@<br>
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
+inherit meson systemd features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
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
View/Reply Online (#128871): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128871" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128871</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120669348/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120669348/1997914</a><br>
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

--0000000000000c13e40658b5fd4b--

