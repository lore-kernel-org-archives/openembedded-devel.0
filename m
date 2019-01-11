Return-Path: <troth@openavr.org>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3DC6BA10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 19:14:56 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id l14so12983525ioj.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 11:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=openavr-org.20150623.gappssmtp.com; s=20150623;
	h=from:date:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=zxx4isGVGkfHq0i8bAuiIDZNKY9GIGYsO7c5uoG97wI=;
	b=oybfzypKWF56Ol9DY01T+QrI/6S0ijkRLL15gckbzjjbLCAe10hIGUCB/YDhV8ZK/U
	L7WLyjV144jtz+Nyv0cpogjovtmTdjdegB+X66eZgmhXyd8hviNMYx7TSUC097L71+7f
	WUoXxdlHl8bw2uGml9xtmi8tKpaWmhndygPc6unFHHb/Sxc9A9HlpLBHd0TvH4DQ8wb5
	oW6cT8K8hLEkNq94t7dEzcqb0/TDGmqDOuJFOdTfqyzFLS1pOotYdP6SXDMYTE+ulfnV
	X0IkNd+iYq5ye5jgTl3Cpfwb0Cm8x0U66S3ZWolz3dxvEL0iBq7Uq+uik/1Tn4EmxcnR
	oC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=zxx4isGVGkfHq0i8bAuiIDZNKY9GIGYsO7c5uoG97wI=;
	b=UgQCvcki1d27ZvqXyDaJzyOHOcCz+1EADUFnk88EJxAzRSOaitepOsAY9F6hMjMuKI
	YIOK6nlcFuMdA4ei7Gh30FfqxxnfP8MYv6Xq6GyRfNPKkF1CV3a42v/hFPnZ7VO0iSXU
	fVzkkcQ1ifVxU3EQp/74lIWa8bkx/mlwrvFUHNlc91Ck8Nly8y71GUjmvwTGLX3gY/jB
	fJJIzh3AcIzk+k0U8eU8w5q4Id0+TABhF/ji0DDiyCuHJLoKiAKI5e39RpEPzVMKG1Mt
	ldmQaeSjSSHEioL8SXj7z0UEu66ujgu3zEOBkgEQ3f5MuuqQo98dy3MhetsYMr1UvZi3
	JqbA==
X-Gm-Message-State: AJcUukc07YnnNVFaDFoB1m5fG4S6ZZmFzQgfhKZyrk6utgqo7FrGv1qC
	3AcRt/ytFnAwoKknZYIbjg20cXLM9WFsaQ==
X-Google-Smtp-Source: ALg8bN5KY+yU08taJroFPtNgtsW0ihq/lxFJxIT0lMMUft7wThQUQaGsZMgh4JvyybVNHD52TSLQ5w==
X-Received: by 2002:a5d:954e:: with SMTP id a14mr10831959ios.176.1547234097118;
	Fri, 11 Jan 2019 11:14:57 -0800 (PST)
Received: from mrt.bozoland.org (c-73-243-79-134.hsd1.co.comcast.net.
	[73.243.79.134]) by smtp.gmail.com with ESMTPSA id
	j133sm1719719itj.16.2019.01.11.11.14.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 11:14:56 -0800 (PST)
From: "Theodore A. Roth" <troth@openavr.org>
X-Google-Original-From: "Theodore A. Roth" <theodore_roth@trimble.com>
Date: Fri, 11 Jan 2019 12:14:54 -0700
To: openembedded-devel@lists.openembedded.org
Message-ID: <20190111191454.GA7211@mrt.bozoland.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Matthew Stanger <matthew_stanger@trimble.com>
Subject: [PATCH] modemmanager: Add libxslt-native to DEPENDS
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
X-List-Received-Date: Fri, 11 Jan 2019 19:14:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Addresses the following build error:

| make[2]: Entering directory '/home/matt/renew_thud/build/tmp/work/armv5e-poky-linux-gnueabi/modemmanager/1.8.2-r0.tr0/build/include'
| xsltproc --xinclude --nonet ../../ModemManager-1.8.2/build-aux/header-generator.xsl ../../ModemManager-1.8.2/introspection/all.xml > ModemManager-names.h
| /bin/bash: xsltproc: command not found
| make[2]: *** [Makefile:651: ModemManager-names.h] Error 127

Problem doesn't manifest if the host has already installed xsltproc
outside of OE environment.

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Matthew Stanger <matthew_stanger@trimble.com>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
index f8e074a87..b374cb77a 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 
-DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
+DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            file://0001-Do-not-set-Wno-unused-but-set-variable.patch \
-- 
2.17.1


