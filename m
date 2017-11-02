Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id A0D097822B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:51 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id g90so4515634wrd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GmaElF/ehdHdjNndv/gMEZdkLC3K6EDs3y9DyI034io=;
	b=AEHASLj2BXpUvHEfJzRGlN5WoXly+bt1a0itsNajfwEpB+YsqlAcWXIDpzH+db+sg2
	4N53lhAacX5Xyg1AqxGCjPLMGdp9dQVCh2k+HlkfA+1GC2UHWEfJrdlKgxIINisrdWOY
	temh/LMgAu76ebhLbHJsy/bnIUOmKgyCsYY4ca8MDSLd0FZvJmcbMc+/vWs44UwPDIXV
	I8Jh+lgFu7sUfJX6tP6FKdW92tWnPmnHws9GQpvaYmcwx2f41S6O9A1gO+NRSN8YHaZr
	vlDiusKwUP8o43B4rbGgrG5/5WK2W6j+s5bhINieFHjTWe94q0oP9oxrZiMGpWTGhVhP
	BNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GmaElF/ehdHdjNndv/gMEZdkLC3K6EDs3y9DyI034io=;
	b=trkHkl9fUHJuqyZ4td0MuTqZWzTIGxS+NhJuGKvhU3Bx9E5Okv7fYnq0LmFn/rVxeV
	XtMXAx4l+YZeetVZ7lJmDCYB9GhHK/4LJAQgfSq64i5cyr7VvILeeU61FMiptiqSw6pn
	+mB1mxMxMYoMk/wRGZh0koaC9IhHlFNFcRTW9uyiSf1DojLF5KRgZ3eByWKmLeBKur5B
	dntQMZCThEcqdDk/N4T9phWMgVP+WU4uFjv7lh2SDaWttYYCTCYsLVbyork/qlIVLGQe
	LFga72eMsoDfSB2SSRwzwg96GIjdpbwOzqajus2q7d9i8y2m8Y8l0oBR3RoVnO9k1QO2
	0/Pg==
X-Gm-Message-State: AMCzsaWZQPLo+coqAR1p+b3EKE92+newc4vVQTxxRWKJxr5Bym+6lj+x
	xKS3F/ZtBMcjlyskkUI0OBZ1NQ==
X-Google-Smtp-Source: ABhQp+TXHEYafH8fGy/M95r66gAMR17I2p1mO9CXCOIOpJb4zlF/OGcwIHChbADAeGkM1+o9hkEvoA==
X-Received: by 10.223.165.7 with SMTP id i7mr2325551wrb.155.1509618711443;
	Thu, 02 Nov 2017 03:31:51 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:22 +0100
Message-Id: <20171102103129.3703-4-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171102103129.3703-1-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] libgphoto2: update 2.5.8 -> 2.5.14
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Nov 2017 10:31:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

changes from patches

* 0001-scripts-remove-bashisms.patch
* 0002-correct-jpeg-memsrcdest-support.patch
* avoid_using_sprintf.patch

were found in the code so assume they are upstream

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-scripts-remove-bashisms.patch             | 149 ---------------------
 .../0002-correct-jpeg-memsrcdest-support.patch     |  54 --------
 .../libgphoto2-2.5.8/avoid_using_sprintf.patch     | 133 ------------------
 .../0001-configure.ac-remove-AM_PO_SUBDIRS.patch   |   0
 .../10-camera-libgphoto2-device.fdi                |   0
 .../10-camera-libgphoto2.fdi                       |   0
 .../40-libgphoto2.rules                            |   0
 .../{libgphoto2_2.5.8.bb => libgphoto2_2.5.14.bb}  |   8 +-
 8 files changed, 3 insertions(+), 341 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0001-scripts-remove-bashisms.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/0001-configure.ac-remove-AM_PO_SUBDIRS.patch (100%)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/10-camera-libgphoto2-device.fdi (100%)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/10-camera-libgphoto2.fdi (100%)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/40-libgphoto2.rules (100%)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.8.bb => libgphoto2_2.5.14.bb} (85%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0001-scripts-remove-bashisms.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0001-scripts-remove-bashisms.patch
deleted file mode 100644
index 0e0dc87..0000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0001-scripts-remove-bashisms.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From c00e63e97d8718836ba011d9172128732eecf001 Mon Sep 17 00:00:00 2001
-From: Ismo Puustinen <ismo.puustinen@intel.com>
-Date: Tue, 24 Jan 2017 22:24:05 +0200
-Subject: [PATCH] scripts: remove bashisms.
-
-Convert bash scripts to more generic shell scripts. This removes the
-strict bash dependency and the scripts should now run with any posix
-shell. Also fix the issues reported by shellcheck while at it.
-
-Upstream-status: Accepted [https://github.com/gphoto/libgphoto2/commit/39b4395532058c0edb9a56d0ff04e48a472e4743]
-
----
- packaging/generic/check-ptp-camera          | 12 ++++++------
- packaging/linux-hotplug/gphoto-set-procperm | 14 +++++++-------
- packaging/linux-hotplug/usbcam.console      |  4 ++--
- packaging/linux-hotplug/usbcam.group        |  2 +-
- packaging/linux-hotplug/usbcam.user         |  2 +-
- packaging/linux-hotplug/usbcam.x11-app      |  4 ++--
- 6 files changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/packaging/generic/check-ptp-camera b/packaging/generic/check-ptp-camera
-index 1793fc8..bc3c6ac 100644
---- a/packaging/generic/check-ptp-camera
-+++ b/packaging/generic/check-ptp-camera
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # This program is free software; you can redistribute it and/or
- # modify it under the terms of the GNU Lesser General Public
- # License as published by the Free Software Foundation; either
-@@ -20,13 +20,13 @@ INTERFACE="${1:-06/01/01}"
- 
- BASENAME=${DEVPATH##*/}
- for d in /sys/${DEVPATH}/${BASENAME}:*; do
--	[[ -d ${d} ]] || continue
--	INTERFACEID="$(< ${d}/bInterfaceClass)"
--	INTERFACEID="${INTERFACEID}/$(< ${d}/bInterfaceSubClass)"
--	INTERFACEID="${INTERFACEID}/$(< ${d}/bInterfaceProtocol)"
-+	[ -d "${d}" ] || continue
-+	INTERFACEID="$(cat "${d}"/bInterfaceClass)"
-+	INTERFACEID="${INTERFACEID}/$(cat "${d}"/bInterfaceSubClass)"
-+	INTERFACEID="${INTERFACEID}/$(cat "${d}"/bInterfaceProtocol)"
- 
- 	#echo ${d}: ${INTERFACEID}
--	if [[ ${INTERFACE} == ${INTERFACEID} ]]; then
-+	if [ "${INTERFACE}" = "${INTERFACEID}" ]; then
- 		# Found interface
- 		exit 0
- 	fi
-diff --git a/packaging/linux-hotplug/gphoto-set-procperm b/packaging/linux-hotplug/gphoto-set-procperm
-index d72ee68..977cbf5 100644
---- a/packaging/linux-hotplug/gphoto-set-procperm
-+++ b/packaging/linux-hotplug/gphoto-set-procperm
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # This program is free software; you can redistribute it and/or
- # modify it under the terms of the GNU Lesser General Public
- # License as published by the Free Software Foundation; either
-@@ -18,22 +18,22 @@
- # This is taken from Fedora Core gphoto2 package.
- # http://cvs.fedora.redhat.com/viewcvs/*checkout*/devel/gphoto2/gphoto-set-procperm
- 
--console_user=`cat /var/run/console/console.lock` 
-+console_user=$(cat /var/run/console/console.lock)
- 
- if [ -z "$console_user" ] ; then
-   exit 1 
- fi
- 
--if [ -z "$HAL_PROP_USB_BUS_NUMBER" -o -z "$HAL_PROP_USB_LINUX_DEVICE_NUMBER" ] ; then
-+if [ -z "$HAL_PROP_USB_BUS_NUMBER" ] || [ -z "$HAL_PROP_USB_LINUX_DEVICE_NUMBER" ] ; then
-   exit 1 
- fi
- 
--if [ $HAL_PROP_USB_BUS_NUMBER -lt 0 -o  $HAL_PROP_USB_LINUX_DEVICE_NUMBER -lt 0 ] ; then
-+if [ "$HAL_PROP_USB_BUS_NUMBER" -lt 0 ] || [ "$HAL_PROP_USB_LINUX_DEVICE_NUMBER" -lt 0 ] ; then
-   exit 1 
- fi
- 
- 
--bus_num=`printf %.3u $HAL_PROP_USB_BUS_NUMBER`
--dev_num=`printf %.3u $HAL_PROP_USB_LINUX_DEVICE_NUMBER`
-+bus_num=$(printf %.3u "$HAL_PROP_USB_BUS_NUMBER")
-+dev_num=$(printf %.3u "$HAL_PROP_USB_LINUX_DEVICE_NUMBER")
- 
--chown $console_user /proc/bus/usb/$bus_num/$dev_num 
-+chown "$console_user" /proc/bus/usb/"$bus_num"/"$dev_num"
-diff --git a/packaging/linux-hotplug/usbcam.console b/packaging/linux-hotplug/usbcam.console
-index d72128f..7ac6dc5 100755
---- a/packaging/linux-hotplug/usbcam.console
-+++ b/packaging/linux-hotplug/usbcam.console
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # This program is free software; you can redistribute it and/or
- # modify it under the terms of the GNU Lesser General Public
- # License as published by the Free Software Foundation; either
-@@ -50,7 +50,7 @@ then
-         /var/lock/console.lock
-     do
-         if [ -f "$conlock" ]; then
--	    CONSOLEOWNER=`cat $conlock`
-+            CONSOLEOWNER=$(cat $conlock)
-         fi
-     done
-     if [ -n "$CONSOLEOWNER" ]
-diff --git a/packaging/linux-hotplug/usbcam.group b/packaging/linux-hotplug/usbcam.group
-index f96c33d..8761fac 100755
---- a/packaging/linux-hotplug/usbcam.group
-+++ b/packaging/linux-hotplug/usbcam.group
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # This program is free software; you can redistribute it and/or
- # modify it under the terms of the GNU Lesser General Public
- # License as published by the Free Software Foundation; either
-diff --git a/packaging/linux-hotplug/usbcam.user b/packaging/linux-hotplug/usbcam.user
-index c46f155..a3ba71a 100644
---- a/packaging/linux-hotplug/usbcam.user
-+++ b/packaging/linux-hotplug/usbcam.user
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # This program is free software; you can redistribute it and/or
- # modify it under the terms of the GNU Lesser General Public
- # License as published by the Free Software Foundation; either
-diff --git a/packaging/linux-hotplug/usbcam.x11-app b/packaging/linux-hotplug/usbcam.x11-app
-index 023ae9b..618e7db 100644
---- a/packaging/linux-hotplug/usbcam.x11-app
-+++ b/packaging/linux-hotplug/usbcam.x11-app
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # This program is free software; you can redistribute it and/or
- # modify it under the terms of the GNU Lesser General Public
- # License as published by the Free Software Foundation; either
-@@ -69,7 +69,7 @@ then
-     if [ "${USER}" != "root" ]
-     then
- 	# we don't want to run this as root. definitely not.
--	cd "${DIRECTORY}"
-+	cd "${DIRECTORY}" || exit 1
- 	usrhome=~${USER}
- 	"${SU}" "${USER}" -c "${ENV} DISPLAY=${DISPLAY} HOME=${usrhome} ${X11_APP}"
-     fi
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch
deleted file mode 100644
index cf2d86d..0000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch
+++ /dev/null
@@ -1,54 +0,0 @@
---- libgphoto2-2.5.8/camlibs/ax203/jpeg_memsrcdest.h.orig	2016-06-15 09:03:20.625774684 -0400
-+++ libgphoto2-2.5.8/camlibs/ax203/jpeg_memsrcdest.h	2016-06-15 09:03:47.049774148 -0400
-@@ -1,5 +1,7 @@
- #include <jpeglib.h>
- 
-+#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
-+
- void
- jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
- 	unsigned long bufsize);
-@@ -7,3 +9,5 @@
- void
- jpeg_mem_dest (j_compress_ptr cinfo, unsigned char ** outbuffer,
- 	unsigned long * outsize);
-+
-+#endif
---- libgphoto2-2.5.8/camlibs/ax203/jpeg_memsrcdest.c.orig	2016-06-15 09:03:58.689773913 -0400
-+++ libgphoto2-2.5.8/camlibs/ax203/jpeg_memsrcdest.c	2016-06-15 09:04:17.769773526 -0400
-@@ -26,7 +26,7 @@
- 
- /* libjpeg8 and later come with their own (API compatible) memory source
-    and dest */
--#if JPEG_LIB_VERSION < 80
-+#if JPEG_LIB_VERSION < 80  && !defined(MEM_SRCDST_SUPPORTED)
- 
- /* Expanded data source object for memory input */
- 
---- libgphoto2-2.5.8/camlibs/jl2005c/jpeg_memsrcdest.h.orig	2016-06-15 09:05:01.893772632 -0400
-+++ libgphoto2-2.5.8/camlibs/jl2005c/jpeg_memsrcdest.h	2016-06-15 09:05:17.433772318 -0400
-@@ -1,5 +1,7 @@
- #include <jpeglib.h>
- 
-+#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
-+
- void
- jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
- 	unsigned long bufsize);
-@@ -7,3 +9,5 @@
- void
- jpeg_mem_dest (j_compress_ptr cinfo, unsigned char ** outbuffer,
- 	unsigned long * outsize);
-+
-+#endif
---- libgphoto2-2.5.8/camlibs/jl2005c/jpeg_memsrcdest.c.orig	2016-06-15 09:04:42.641773022 -0400
-+++ libgphoto2-2.5.8/camlibs/jl2005c/jpeg_memsrcdest.c	2016-06-15 09:04:48.657772901 -0400
-@@ -26,7 +26,7 @@
- 
- /* libjpeg8 and later come with their own (API compatible) memory source
-    and dest */
--#if JPEG_LIB_VERSION < 80
-+#if JPEG_LIB_VERSION < 80  && !defined(MEM_SRCDST_SUPPORTED)
- 
- /* Expanded data source object for memory input */
- 
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch
deleted file mode 100644
index fba4c69..0000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 4adfe5a6c9db07537df302f3c17713515bf23a2e Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Sat, 11 Jul 2015 09:38:13 +0000
-Subject: [PATCH] avoid use of sprintf to convert %% to %, duplicate the macro
-
-git-svn-id: https://svn.code.sf.net/p/gphoto/code/trunk/libgphoto2@15490 67ed7778-7388-44ab-90cf-0a291f65f57c
----
- camlibs/ptp2/chdk.c     |  8 ++---
- camlibs/ptp2/chdk_ptp.h | 82 +++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 84 insertions(+), 6 deletions(-)
-
-diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
-index 5fb84ea..3b8a995 100644
---- a/camlibs/ptp2/chdk.c
-+++ b/camlibs/ptp2/chdk.c
-@@ -1119,18 +1119,14 @@ chdk_camera_capture (Camera *camera, CameraCaptureType type, CameraFilePath *pat
- 	int		ret, retint;
- 	char		*table, *s;
- 	PTPParams	*params = &camera->pl->params;
--	char		*lua;
--	const char	*luascript =	PTP_CHDK_LUA_SERIALIZE_MSGS \
-+	const char	*luascript = PTP_CHDK_LUA_SERIALIZE_MSGS_SIMPLEQUOTE \
- 				PTP_CHDK_LUA_RLIB_SHOOT	\
- 				"return rlib_shoot({info=true});\n";
- 
- 	ret =  camera_prepare_chdk_capture(camera, context);
- 	if (ret != GP_OK) return ret;
- 
--	lua = malloc(strlen(luascript)+1);
--	sprintf(lua,luascript); /* This expands the %q inside the string too ... do not optimize away. */
--	ret = chdk_generic_script_run (params, lua, &table, &retint, context);
--	free (lua);
-+	ret = chdk_generic_script_run (params, luascript, &table, &retint, context);
- 	GP_LOG_D("rlib_shoot returned table %s, retint %d\n", table, retint);
- 	s = strstr(table, "exp=");
- 	if (s) {
-diff --git a/camlibs/ptp2/chdk_ptp.h b/camlibs/ptp2/chdk_ptp.h
-index d11e0b7..65dcfd7 100644
---- a/camlibs/ptp2/chdk_ptp.h
-+++ b/camlibs/ptp2/chdk_ptp.h
-@@ -198,10 +198,92 @@ function serialize(v,opts)\n\
- 	return table.concat(r)\n\
- end\n"
- 
-+#define PTP_CHDK_LUA_SERIALIZE_SIMPLEQUOTE "\n\
-+serialize_r = function(v,opts,r,seen,depth)\n\
-+	local vt = type(v)\n\
-+	if vt == 'nil' or  vt == 'boolean' or vt == 'number' then\n\
-+		table.insert(r,tostring(v))\n\
-+		return\n\
-+	end\n\
-+	if vt == 'string' then\n\
-+		table.insert(r,string.format('%q',v))\n\
-+		return\n\
-+	end\n\
-+	if vt == 'table' then\n\
-+		if not depth then\n\
-+			depth = 1\n\
-+		end\n\
-+		if depth >= opts.maxdepth then\n\
-+			error('serialize: max depth')\n\
-+		end\n\
-+		if not seen then\n\
-+			seen={}\n\
-+		elseif seen[v] then\n\
-+			if opts.err_cycle then\n\
-+				error('serialize: cycle')\n\
-+			else\n\
-+				table.insert(r,'\"cycle:'..tostring(v)..'\"')\n\
-+				return\n\
-+			end\n\
-+		end\n\
-+		seen[v] = true;\n\
-+		table.insert(r,'{')\n\
-+		for k,v1 in pairs(v) do\n\
-+			if opts.pretty then\n\
-+				table.insert(r,'\\n'..string.rep(' ',depth))\n\
-+			end\n\
-+			if type(k) == 'string' and string.match(k,'^[_%a][%a%d_]*$') then\n\
-+				table.insert(r,k)\n\
-+			else\n\
-+				table.insert(r,'[')\n\
-+				serialize_r(k,opts,r,seen,depth+1)\n\
-+				table.insert(r,']')\n\
-+			end\n\
-+			table.insert(r,'=')\n\
-+			serialize_r(v1,opts,r,seen,depth+1)\n\
-+			table.insert(r,',')\n\
-+		end\n\
-+		if opts.pretty then\n\
-+			table.insert(r,'\\n'..string.rep(' ',depth-1))\n\
-+		end\n\
-+		table.insert(r,'}')\n\
-+		return\n\
-+	end\n\
-+	if opts.err_type then\n\
-+		error('serialize: unsupported type ' .. vt, 2)\n\
-+	else\n\
-+		table.insert(r,'\"'..tostring(v)..'\"')\n\
-+	end\n\
-+end\n\
-+serialize_defaults = {\n\
-+	maxdepth=10,\n\
-+	err_type=true,\n\
-+	err_cycle=true,\n\
-+	pretty=false,\n\
-+}\n\
-+function serialize(v,opts)\n\
-+	if opts then\n\
-+		for k,v in pairs(serialize_defaults) do\n\
-+			if not opts[k] then\n\
-+				opts[k]=v\n\
-+			end\n\
-+		end\n\
-+	else\n\
-+		opts=serialize_defaults\n\
-+	end\n\
-+	local r={}\n\
-+	serialize_r(v,opts,r)\n\
-+	return table.concat(r)\n\
-+end\n"
-+
- #define PTP_CHDK_LUA_SERIALIZE_MSGS \
- PTP_CHDK_LUA_SERIALIZE\
- "usb_msg_table_to_string=serialize\n"
- 
-+#define PTP_CHDK_LUA_SERIALIZE_MSGS_SIMPLEQUOTE \
-+PTP_CHDK_LUA_SERIALIZE_SIMPLEQUOTE\
-+"usb_msg_table_to_string=serialize\n"
-+
- #define PTP_CHDK_LUA_EXTEND_TABLE \
- "function extend_table(target,source,deep)\n\
- 	if type(target) ~= 'table' then\n\
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0001-configure.ac-remove-AM_PO_SUBDIRS.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
similarity index 100%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/10-camera-libgphoto2-device.fdi b/meta-oe/recipes-graphics/gphoto2/libgphoto2/10-camera-libgphoto2-device.fdi
similarity index 100%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/10-camera-libgphoto2-device.fdi
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2/10-camera-libgphoto2-device.fdi
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/10-camera-libgphoto2.fdi b/meta-oe/recipes-graphics/gphoto2/libgphoto2/10-camera-libgphoto2.fdi
similarity index 100%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/10-camera-libgphoto2.fdi
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2/10-camera-libgphoto2.fdi
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/40-libgphoto2.rules b/meta-oe/recipes-graphics/gphoto2/libgphoto2/40-libgphoto2.rules
similarity index 100%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/40-libgphoto2.rules
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2/40-libgphoto2.rules
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.14.bb
similarity index 85%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.14.bb
index 4434af9..d7290fa 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.14.bb
@@ -14,13 +14,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://10-camera-libgphoto2.fdi \
            file://40-libgphoto2.rules \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
-           file://0002-correct-jpeg-memsrcdest-support.patch \
-           file://avoid_using_sprintf.patch \
-           file://0001-scripts-remove-bashisms.patch \
 "
 
-SRC_URI[libgphoto2.md5sum] = "873ab01aced49c6b92a98e515db5dcef"
-SRC_URI[libgphoto2.sha256sum] = "031a262e342fae43f724afe66787947ce1fb483277dfe5a8cf1fbe92c58e27b6"
+SRC_URI[libgphoto2.md5sum] = "65acb6cbd2b4f3f46829599f5dabd89c"
+SRC_URI[libgphoto2.sha256sum] = "d3ce70686fb87d6791b9adcbb6e5693bfbe1cfef9661c23c75eb8a699ec4e274"
 
 inherit autotools pkgconfig gettext lib_package
 
@@ -54,3 +51,4 @@ FILES_libgphotoport = "${libdir}/libgphoto2_port.so.*"
 FILES_${PN} += "${nonarch_base_libdir}/udev/* ${datadir}/hal"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 FILES_${PN}-dev += "${libdir}/*/*/*.la"
+FILES_${PN}-doc += "${datadir}/libgphoto2_port/0.12.0/vcamera/README.txt"
-- 
2.9.5


