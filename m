Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.742.1794499092603273171
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 07:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iq44cMPY;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so6811eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 07:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499092; x=1795103892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=txExOnDKU44BmOGODwigcHIK5LkIBpSz+w7E5Z/z+vw=;
        b=iq44cMPYl4GFjpCVN5XSRJkioj7w1VaPfZeMtYSyqN3tXbao5aRldV66hihq4nOkN+
         UB23O5FvGDrQ4WNn9fMOew5aMSbni+x/uPM89K8+slF/7Svf2AiKDhpifAT9tjN6QCeb
         AxeJlYU2lKFE+vWsOQuVhluIALkv/eVBGwqHpjRw25G/wIuZYHg4DsZvNHyT1Y0jiB0u
         +GTlBvWxZXsGQ2d/DJgtCwWQoTi6tm8/BfNeQ5gQei31KkzvEuIJpCX7+c3HJUOOIeUf
         Vx3VvxFs0af/sicrppNHAUAxwm3RvrQoXBNW6pasumFZ+rHB1EZeSHR/kwZBHeXztMr2
         fRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499092; x=1795103892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txExOnDKU44BmOGODwigcHIK5LkIBpSz+w7E5Z/z+vw=;
        b=jyiZV3DacHjXMkFBh1Y31n8X8o7tqQ/esGOV5iQCXASSlGpTp92wC/cY7vH0UAoXv1
         N4TOAPhCV2rYWdl9rdQEP25AeMDs6bDLeobFjjUNw8hJuHUoM64VcbT81wgmyQKliZub
         +FJQQiIYZAMX7oR+mtJCPdmShrLiMoo2Hl4AkcLvVfgSkPQgucYALc1OFW1lml3tf4NF
         DhVByAaUjFDW+jU45Ys27SlUiXUrbMgKbFQ0nBle8IwVgoG2TG4g4dxPhKlOl8GFxBG4
         7WBxsfxr3+7SqknPnCmOUFMPqgG2wUl+Skuxx+nu2iJp1JK5DWExiw6XJQiNi+WzSrIf
         7jlw==
X-Gm-Message-State: APuU4Z/VXp7liFYILggETXkoSxwfXkZ0Fw/GEtv0IJOocVTBQ2dqR9SW
	cJkVws81R8ILUZOdkM2IxOQ9uf8SI2FHzZVy3SxrwmCQy4srmNAtl1OMLoydCEB7AaI=
X-Gm-Gg: AYBFou3htGBJAFDRAlSPkGzEieJJudI6XEUjOThLx6vLPOTEB9BeLqvgI+uER5Sbtdy
	S2dBtDagR9q5mD3l2+uBnJzGi7gGlCs58ElXuHDVYBmnFRnTszx9/o3VWujlkdFa2AKJfWhOCIF
	HoheytR0DaP57xtGf/RdUVcIuVhZoqjVmp/ZfCS/IzjfIcAX5300MqyIxAwWYRooiHEDkAFhtXP
	nlyA+ttZue8wmEvvwgEkrlRNzZ7MK4raf3OB4ws3ThXxqXOac3tEcF9vHZy4Q05xwc2A1kFfa5O
	VOaxM2S8NkDlk+khwsn/WcXukuY26OllyR0zfuZVPFdfxkuc8QMA2jmJ3mJKFLw4vsYoLQucSWy
	4qr0SEtqgbEX7UDQSvixQuzUfeYeet2IaOZwxrljuGLHjwq9DL1J1HjNzg6dweqtgf1/3O1jOqG
	9F+rnfjDlr2CJt2m2AaJ83x+l2EPWcyf12xSyByKpo5pgXg/35hCakpMeqPag9k1/ltgCMjiURe
	JmOaFT+ZB6qt5+hhz1uvjw7ZTPrVTjC5fYURxSwmtT9PIPO4MVKBNT155Yz7zLXjtTWV91dis0J
	fX3CuwXOLlAPDygrlkdC8I240Mt5K3C7O6w7yw+mD34Rp5Uhgo7PiSRFK3FFk58rtXaqCgV8YMb
	D+ai+DBKAf8gctF3dEth1GRtmTyNZoypFthzQ6+yNMr20UgyZ57gQORHYn6beZFeOljQSeJAz0i
	XFZ2JZeIhZS5DtHc3W2WTneJMm+VgHWNDSuzygsCB0/G2ih+F7tCsF/Jb3Tuk+dGgpTIBBeS3CR
	pvqfD5/8vi8064r3a6TbwYGC5siXiG6UTzNyWct4An8c+zm7zZgved5Wdf6sbgkpljebkQ1RHBF
	IF5M
X-Received: by 2002:a05:693c:65c5:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-37686950cffmr6483510eec.39.1794499091612;
        Thu, 12 Nov 2026 07:58:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37926255ad0sm546563eec.25.2026.11.12.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:58:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] frr: Do not look at host include paths in configure
Date: Thu, 12 Nov 2026 07:58:07 -0800
Message-ID: <20261112155807.502040-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 15:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132209
Content-Type: text/plain; charset="utf-8"

frr 10.7 added an OpenBSD fallback that retries the libunwind.h check
with -I/usr/include/c++/v1 when libunwind is not found. gcc with
-Wpoison-system-directories reports that as unsafe for cross-compilation,
failing the configure-unsafe QA check. clang does not warn about it.

Only use the fallback on OpenBSD.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ry-the-OpenBSD-libunwind-location-on.patch | 41 +++++++++++++++++++
 .../recipes-protocols/frr/frr_10.7.1.bb       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0002-configure-Only-try-the-OpenBSD-libunwind-location-on.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/0002-configure-Only-try-the-OpenBSD-libunwind-location-on.patch b/meta-networking/recipes-protocols/frr/frr/0002-configure-Only-try-the-OpenBSD-libunwind-location-on.patch
new file mode 100644
index 0000000000..81a8c72497
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0002-configure-Only-try-the-OpenBSD-libunwind-location-on.patch
@@ -0,0 +1,41 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 12 Nov 2026 00:00:00 -0800
+Subject: [PATCH] configure: Only try the OpenBSD libunwind location on OpenBSD
+
+When libunwind.h is not found, configure retries with
+-I/usr/include/c++/v1, which is where OpenBSD keeps it. On other
+systems this only makes the compiler look at a host directory. When
+cross-compiling with a gcc that has -Wpoison-system-directories, that
+is reported as "include location /usr/include/c++/v1 is unsafe for
+cross-compilation".
+
+Limit the fallback to OpenBSD hosts.
+
+Upstream-Status: Submitted [https://github.com/FRRouting/frr/pull/24383]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8778c24..cbd0767 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2629,6 +2629,8 @@ if test "$enable_backtrace" != "no" ; then
+           backtrace_ok=true
+         ])
+       ], [
++        case "$host_os" in
++        openbsd*)
+         # OpenBSD. no idea why the header file is under C++, but it is
+         ac_cflags_save="$CFLAGS"
+         CFLAGS="$CFLAGS -I/usr/include/c++/v1"
+@@ -2652,6 +2654,8 @@ if test "$enable_backtrace" != "no" ; then
+ 	  LIBS="$ac_libs_save"
+         ])
+         CFLAGS="$ac_cflags_save"
++        ;;
++        esac
+       ])
+     ])
+     if test "$enable_backtrace" = "libunwind" -a "$backtrace_ok" = "false"; then
diff --git a/meta-networking/recipes-protocols/frr/frr_10.7.1.bb b/meta-networking/recipes-protocols/frr/frr_10.7.1.bb
index 6e238fc7bf..d0ddf2ea7d 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.7.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.7.1.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/${@oe.utils.trim_version('${PV}', 2)};tag=frr-${PV} \
            file://frr.pam \
            file://0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch \
+           file://0002-configure-Only-try-the-OpenBSD-libunwind-location-on.patch \
            "
 SRCREV = "f8c0b08dcb0c78f9e42b9b86ae70b049e4e617c1"

