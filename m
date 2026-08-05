Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20661C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 06:47:53 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34649.1785912464748990863
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 23:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r8u9P2aX;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6681e7911b0so872099d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 23:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785912464; cv=none;
        d=google.com; s=arc-20260327;
        b=YFW+JsmfNYxAs6bLua9cUP97BNMoIyqGVyJMB2p1HPHFyLKLlIQotrwf21+W6snmeG
         ZSOQgCvZJZbmTZ4LNgb7yu4e9EpISLsV+Q059nefclhhU5nGQ1tWqz8hAOyhbexCZBNI
         699pdw6xYMHFcDa7MU1sp8nHql60w7XxYcAqss+Epodp1o+ZSAF7rEXNb/QSSfU+MWCj
         gIpzEEK5kR3T/upuX+oDWZhsTB8VRvQaO5vnhURODhLOf5xAUka6YYy+HB7K7KxBEqLx
         UsmOHsHxQYcJoRUckMAhecdOTiKEqj473l2W55jgrbjlnDj4DLS43vrzi/Vx4UBiciT4
         9fyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eqQhmSZ9HvTTgDqtszhAuxJG98wz3n269IbxmFd/EEE=;
        fh=DDYFt52ZgYsz8CGpqpSB6LwmBm4U0pSZOFBSunn207w=;
        b=ApzBWeEVQ3cUutR0vhR0qwypmwy8eirhRsU8Teh3ho0IUBnfrOHKDP1mlZ1xhsrn4l
         xlreSCfY6rAGq6em1NABguv11zFUnP19hqVWlatvBCDrOKidV5yrwHtIGVJa4wb85To0
         V877+foB9bCJhH9eES5tGhwdbGFdefzp4uKZrqCqE1Cq70DTFbcd/rnwZiFBCEJLVVXo
         64dMBfidm79a1CWsppCRdMDsBY9UFjsOYDmSaJJFXlA1FeeD80L/giS9v0UUgzMM2wID
         dA2y37/NRNTBxzOkM+bytbgZnOuGd/G+BfByCr39+Kg8xH4t+LFXjz3zuK9ocfKEKf/g
         AfAg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785912464; x=1786517264; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqQhmSZ9HvTTgDqtszhAuxJG98wz3n269IbxmFd/EEE=;
        b=r8u9P2aXXdb4QRz0LkHol9HemfginF/CBYH62MIXpuW51JKulkv/p4EgJS1Z+PcVyN
         VmVymtFhRk7Xj+p5Bg0tX4tmHmMMz+Wsx1tZHe/EcVo6rWJwNdne9DvmQ9yOwaSm0XeZ
         PmGKTWvl3pz+mQoLnEF+jM8NrioJN3b3i7IyAFND//OyJzWkJVMktAZBCtBru2XiZqhY
         dUGzG/aOqmjRHuXKBxl+Sx7qbLglgfl2dBvI3UYbGvqIoVKJeHJLG0eQtILW1tF8CPu1
         pzJlCtBArwHgV7qL5Bond7qROMnTEeMTmA5vuEKoAQD4zMdUGrhUYQoIkJau68X6uVB6
         IAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912464; x=1786517264;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eqQhmSZ9HvTTgDqtszhAuxJG98wz3n269IbxmFd/EEE=;
        b=AnRfF+XZUGrpzb+eTxxNbMxKGbTH1zpfneoP3RyzjG7Po4a76hWNsDvnBLkay54oCB
         m3dSGoEj0z00D1Eo9p7F0d2EBYgxjXTD/ewEEN9jVaN6A/CVti4s1zArlXkKCJfoUwms
         4hfuFQdICTIm6zV7YLpSSVZ2HR7bfOE5jivKaeE59vccRWka0ASeH2hrSf5ARXIUAz1H
         Wnw27FbMGZnkln37w7KIlY2gjOE+hZY2Jo26wDXT2k6PLf5n6agEeADAf0n3bWn5nMhR
         eZiiNPUwJDVFzirUqPDAdxdWkSbzP2TVkiBBuE6KMisvYufCVe+Lx/yPrf3BAPmyy2a1
         ROMw==
X-Gm-Message-State: AOJu0YzXFVumnBptYwrl4pfI9xjg0uzWaC0MgRlAmMeO4yBJN1Bizgfu
	RLDMu4OHEEn1XJhPOSMkaN2Sw/WJ73hbo4kyEMb9/v87SFn5Zltfeo60Nq5DmEFt+SGnhOXDHE5
	RXRSsHBxnaQkno1FCAB0EsZF/YmaiR5Y=
X-Gm-Gg: AR+sD1216jwQDDnGmuMYDAY02lyvQGMcobqbkg0PwbMWCBQbsdaxIdAeCl7JoI9pO22
	l+3KavB0uDPI7r0hnXa61G31W7hOchwf6fxuQngxJWjfMyNiTRkJPHJifK+CEUky0wblnS/14SY
	tzDbYZUa4lvDOu/PtHnzUnI6ZYs1Z5QMe0RO4gdq57DzldGarZOmE0uPwsdKoVk0wtOW5Ww5453
	bNNoWfIgePUok4+6FjX0oXtHbaG+Ds7DVTpsyO46FNGBydjQpEhEPQwBNp1JDGw1LpwrunkN2eB
	7xzaoU088b5DcTW+eSrZ1somcS9oT4ycxENqrqPmYG+L4Yb0VEXRuszwr4uWC41zhxYwZDttn13
	fxFK1Fx4TVYZ6yq9RLzWXBWRBJzjX1tu+CxXuUGp4oKZTk2No00unQ6uoJEcdof0o1cytgoO+6C
	VyIpEocTxrpN/MjH7e6fr1L1AIXRVn+fJqGHBfu1verg==
X-Received: by 2002:a05:690e:450b:20b0:668:53e7:5569 with SMTP id
 956f58d0204a3-6699ab890f6mr2056204d50.32.1785912463600; Tue, 04 Aug 2026
 23:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260715130932.1438994-1-ctheegal@qualcomm.com> <20260805054533.1722572-1-ctheegal@qti.qualcomm.com>
In-Reply-To: <20260805054533.1722572-1-ctheegal@qti.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Aug 2026 23:47:17 -0700
X-Gm-Features: AUfX_mz5A6lAZuwtOebpg2LyITmtm_Jg_zwoDBalRQe1bqRDQRIbvWcpTRUpYa4
Message-ID: <CAMKF1sr4osxiY8Hoc1u88Q8yoqQ5-2sVoCEevPg6TiTEBq4LwA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] boot-time-analysis-tools: add boot time
 profiling tools
To: ctheegal@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org, ctheegal@qualcomm.com
Content-Type: multipart/alternative; boundary="000000000000fe327306584725b7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 06:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128801

--000000000000fe327306584725b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ERROR: ParseError at
/mnt/b/yoe/master/kas-build/../layers/meta-openembedded/meta-oe/dynamic-lay=
ers/meta-python/recipes-devtools/boot-time-analysis-tools/
boot-time-analysis-tools_0.7.1.bb:2: unparsed line:
'REQUIRED_DISTRO_FEATURES =3D "systemd"   # only build if systemd is in use=
'
ERROR: Parsing halted due to errors, see error messages above
P

On Tue, Aug 4, 2026 at 10:46=E2=80=AFPM Chitti Babu Theegala via
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
>  .../boot-time-analysis-tools_0.7.1.bb         | 13 +++++++++
>  .../cntvct-log_0.7.1.bb                       | 27 +++++++++++++++++++
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
> index 0000000000..67dba14897
> --- /dev/null
> +++
> b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-=
tools/
> boot-time-analysis-tools_0.7.1.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Boot time analysis tools from CentOS Automotive SIG"
> +REQUIRED_DISTRO_FEATURES =3D "systemd"   # only build if systemd is in u=
se
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
> index 0000000000..8cf2a4c225
> --- /dev/null
> +++
> b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-=
tools/
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
> View/Reply Online (#128798):
> https://lists.openembedded.org/g/openembedded-devel/message/128798
> Mute This Topic: https://lists.openembedded.org/mt/120606442/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fe327306584725b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ERROR: ParseError at /mnt/b/yoe/master/kas-build/../layers=
/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot=
-time-analysis-tools/<a href=3D"http://boot-time-analysis-tools_0.7.1.bb:2"=
>boot-time-analysis-tools_0.7.1.bb:2</a>: unparsed line: &#39;REQUIRED_DIST=
RO_FEATURES =3D &quot;systemd&quot; =C2=A0 # only build if systemd is in us=
e&#39;<br>ERROR: Parsing halted due to errors, see error messages above<br>=
P</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Aug 4, 2026 at 10:46=E2=80=AFPM Chitti Babu =
Theegala via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;ctheegal=3D<a href=3D"mailto:qti.qualcomm.com@lists.openembedded=
.org">qti.qualcomm.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Add two new recipes from the C=
entOS Automotive SIG<br>
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
 =C2=A0 =C2=A0 =C2=A0| 13 +++++++++<br>
=C2=A0.../<a href=3D"http://cntvct-log_0.7.1.bb" rel=3D"noreferrer" target=
=3D"_blank">cntvct-log_0.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 +++++++++++++++++++<br>
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
index 0000000000..67dba14897<br>
--- /dev/null<br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysi=
s-tools/<a href=3D"http://boot-time-analysis-tools_0.7.1.bb" rel=3D"norefer=
rer" target=3D"_blank">boot-time-analysis-tools_0.7.1.bb</a><br>
@@ -0,0 +1,13 @@<br>
+SUMMARY =3D &quot;Boot time analysis tools from CentOS Automotive SIG&quot=
;<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;=C2=A0 =C2=A0# only build =
if systemd is in use<br>
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
index 0000000000..8cf2a4c225<br>
--- /dev/null<br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysi=
s-tools/<a href=3D"http://cntvct-log_0.7.1.bb" rel=3D"noreferrer" target=3D=
"_blank">cntvct-log_0.7.1.bb</a><br>
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
View/Reply Online (#128798): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128798" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128798</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120606442/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120606442/1997914</a><br>
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

--000000000000fe327306584725b7--

