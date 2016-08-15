Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 430CA77042
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 05:04:43 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g202so3156201pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 22:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nLC4ILdtkIhzCqmpIeu1wXcOudGe8Fu0byupYT/50B4=;
	b=KuXBOaz4N6WOP8AN5G79Z0QBCLQm3RQdu3dbYU7cPtfWyXkKxHD9TTkPE+hQw4b+NB
	KUQEFEl2y31PF0Tcy4gRnSJmAx2a7r8AtL9037lcDNVh/i6qiDc5+o9iWaXa1GZ4rJkk
	BOFarcCgck3xQhDfF13HzB0o8/e795COlIH6yrmSaZ7mmUR/zN9RJZRtgD+AGTN3BF8d
	B6H+qnbocpQ8z3WCaaTJPVZMSvrBqrAwjvxf11NuKu/iEiVUpeLJATx4OpFzIYRrF7NR
	vEqc+BwXME9mmqtTIBFk1z2pbWEYvCtPTog0hRxAarzCFwEx16WVmnFY3V1ZEex9slw0
	nNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nLC4ILdtkIhzCqmpIeu1wXcOudGe8Fu0byupYT/50B4=;
	b=Mq1Gw6JJSE9NWFJmMHvIIhnX/uagzcTRNnEG4IZrcI13KdGpX1Cu+KcN8GnGuJtphL
	CBJV6IypmfBkIkTgPrUdZPqFKKGRVKoHRE/SM1mHRvYZxBP9QO+uFldsPiGhh6OMhD+u
	xeydlA4i3K8SiUk/1SGOYeTLo5h2TgANkn1A6HiOQiyTadGnaBpySbAP/jYT1UA8m8bp
	PwCGqvGKkEWQxCsprb4UoS4Jsi1d6AhWsjgxt1H8zdVMSaFozzVO71ocZ2ecEZO6bkC3
	u4JdFLV5/HccnXwdsgpcKF+qj5Ox41EUufOkDh6mPcU/7Fx2bUl7DJtVrKLzBvk2zsul
	3BFA==
X-Gm-Message-State: AEkoouuhYaZjLozX5dzpmwofuYLKW5xuZo1yLnkKwcg1sT4Kxdsg6uQ0lbk+MrbAzuF/oA==
X-Received: by 10.98.98.193 with SMTP id w184mr50543375pfb.120.1471237484324; 
	Sun, 14 Aug 2016 22:04:44 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	ty6sm29178421pac.18.2016.08.14.22.04.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Aug 2016 22:04:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Aug 2016 22:04:32 -0700
Message-Id: <20160815050434.20974-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][PATCH 1/3] libgphoto2: Fix build when security flags are enabled with clang
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
X-List-Received-Date: Mon, 15 Aug 2016 05:04:44 -0000

clang is more pedantic and throws below errors

../../libgphoto2-2.5.8/camlibs/ptp2/chdk.c:1131:14: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        sprintf(lua,luascript); /* This expands the %q inside the string too ... do not optimize away. */
                    ^~~~~~~~~

Backport a patch to silence the warnings where it avoids
the use of sprintf all the way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgphoto2-2.5.8/avoid_using_sprintf.patch     | 133 +++++++++++++++++++++
 .../recipes-graphics/gphoto2/libgphoto2_2.5.8.bb   |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch
new file mode 100644
index 0000000..fba4c69
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch
@@ -0,0 +1,133 @@
+From 4adfe5a6c9db07537df302f3c17713515bf23a2e Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Sat, 11 Jul 2015 09:38:13 +0000
+Subject: [PATCH] avoid use of sprintf to convert %% to %, duplicate the macro
+
+git-svn-id: https://svn.code.sf.net/p/gphoto/code/trunk/libgphoto2@15490 67ed7778-7388-44ab-90cf-0a291f65f57c
+---
+ camlibs/ptp2/chdk.c     |  8 ++---
+ camlibs/ptp2/chdk_ptp.h | 82 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 84 insertions(+), 6 deletions(-)
+
+diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
+index 5fb84ea..3b8a995 100644
+--- a/camlibs/ptp2/chdk.c
++++ b/camlibs/ptp2/chdk.c
+@@ -1119,18 +1119,14 @@ chdk_camera_capture (Camera *camera, CameraCaptureType type, CameraFilePath *pat
+ 	int		ret, retint;
+ 	char		*table, *s;
+ 	PTPParams	*params = &camera->pl->params;
+-	char		*lua;
+-	const char	*luascript =	PTP_CHDK_LUA_SERIALIZE_MSGS \
++	const char	*luascript = PTP_CHDK_LUA_SERIALIZE_MSGS_SIMPLEQUOTE \
+ 				PTP_CHDK_LUA_RLIB_SHOOT	\
+ 				"return rlib_shoot({info=true});\n";
+ 
+ 	ret =  camera_prepare_chdk_capture(camera, context);
+ 	if (ret != GP_OK) return ret;
+ 
+-	lua = malloc(strlen(luascript)+1);
+-	sprintf(lua,luascript); /* This expands the %q inside the string too ... do not optimize away. */
+-	ret = chdk_generic_script_run (params, lua, &table, &retint, context);
+-	free (lua);
++	ret = chdk_generic_script_run (params, luascript, &table, &retint, context);
+ 	GP_LOG_D("rlib_shoot returned table %s, retint %d\n", table, retint);
+ 	s = strstr(table, "exp=");
+ 	if (s) {
+diff --git a/camlibs/ptp2/chdk_ptp.h b/camlibs/ptp2/chdk_ptp.h
+index d11e0b7..65dcfd7 100644
+--- a/camlibs/ptp2/chdk_ptp.h
++++ b/camlibs/ptp2/chdk_ptp.h
+@@ -198,10 +198,92 @@ function serialize(v,opts)\n\
+ 	return table.concat(r)\n\
+ end\n"
+ 
++#define PTP_CHDK_LUA_SERIALIZE_SIMPLEQUOTE "\n\
++serialize_r = function(v,opts,r,seen,depth)\n\
++	local vt = type(v)\n\
++	if vt == 'nil' or  vt == 'boolean' or vt == 'number' then\n\
++		table.insert(r,tostring(v))\n\
++		return\n\
++	end\n\
++	if vt == 'string' then\n\
++		table.insert(r,string.format('%q',v))\n\
++		return\n\
++	end\n\
++	if vt == 'table' then\n\
++		if not depth then\n\
++			depth = 1\n\
++		end\n\
++		if depth >= opts.maxdepth then\n\
++			error('serialize: max depth')\n\
++		end\n\
++		if not seen then\n\
++			seen={}\n\
++		elseif seen[v] then\n\
++			if opts.err_cycle then\n\
++				error('serialize: cycle')\n\
++			else\n\
++				table.insert(r,'\"cycle:'..tostring(v)..'\"')\n\
++				return\n\
++			end\n\
++		end\n\
++		seen[v] = true;\n\
++		table.insert(r,'{')\n\
++		for k,v1 in pairs(v) do\n\
++			if opts.pretty then\n\
++				table.insert(r,'\\n'..string.rep(' ',depth))\n\
++			end\n\
++			if type(k) == 'string' and string.match(k,'^[_%a][%a%d_]*$') then\n\
++				table.insert(r,k)\n\
++			else\n\
++				table.insert(r,'[')\n\
++				serialize_r(k,opts,r,seen,depth+1)\n\
++				table.insert(r,']')\n\
++			end\n\
++			table.insert(r,'=')\n\
++			serialize_r(v1,opts,r,seen,depth+1)\n\
++			table.insert(r,',')\n\
++		end\n\
++		if opts.pretty then\n\
++			table.insert(r,'\\n'..string.rep(' ',depth-1))\n\
++		end\n\
++		table.insert(r,'}')\n\
++		return\n\
++	end\n\
++	if opts.err_type then\n\
++		error('serialize: unsupported type ' .. vt, 2)\n\
++	else\n\
++		table.insert(r,'\"'..tostring(v)..'\"')\n\
++	end\n\
++end\n\
++serialize_defaults = {\n\
++	maxdepth=10,\n\
++	err_type=true,\n\
++	err_cycle=true,\n\
++	pretty=false,\n\
++}\n\
++function serialize(v,opts)\n\
++	if opts then\n\
++		for k,v in pairs(serialize_defaults) do\n\
++			if not opts[k] then\n\
++				opts[k]=v\n\
++			end\n\
++		end\n\
++	else\n\
++		opts=serialize_defaults\n\
++	end\n\
++	local r={}\n\
++	serialize_r(v,opts,r)\n\
++	return table.concat(r)\n\
++end\n"
++
+ #define PTP_CHDK_LUA_SERIALIZE_MSGS \
+ PTP_CHDK_LUA_SERIALIZE\
+ "usb_msg_table_to_string=serialize\n"
+ 
++#define PTP_CHDK_LUA_SERIALIZE_MSGS_SIMPLEQUOTE \
++PTP_CHDK_LUA_SERIALIZE_SIMPLEQUOTE\
++"usb_msg_table_to_string=serialize\n"
++
+ #define PTP_CHDK_LUA_EXTEND_TABLE \
+ "function extend_table(target,source,deep)\n\
+ 	if type(target) ~= 'table' then\n\
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
index dde14ad..098da79 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://40-libgphoto2.rules \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
            file://0002-correct-jpeg-memsrcdest-support.patch \
+           file://avoid_using_sprintf.patch \
 "
 
 SRC_URI[libgphoto2.md5sum] = "873ab01aced49c6b92a98e515db5dcef"
-- 
2.9.3


