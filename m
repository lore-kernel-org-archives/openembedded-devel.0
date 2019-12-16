Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 937E87F7E2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 01:21:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id q9so4934439wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1IIDjdwB5hPzbVWjx4x1dyNXdwHogL66nNfEOvd9FzY=;
	b=J+lBFRefSWxXQ133pH99Gb1wWONU1y7CJDsrM4xZ2WSCm6KXyscXdBadAuSiuFuGEe
	1hyDGtGZB6+LHdDVMogvrMm4GA4YoBPqfrSI8s30J+R/Zs12tFpLQ65ENYwunHkamQLv
	6FfyTZqA9iDruPn4IhE+O9GJGD+QOsTXkpHfFkG+DzAu+WEyL9DmtmhBaTo26j8osFg/
	8w8EUAF9bq+fCPu9G7nNSWapJbjXbmCnvoKTywM3EKCuoqqlgwAdYswYclYd/h94rdvw
	hCybnilL7PpdXHsfb8eAec1NcMmRfF48S+ZnebbbCOAkc3O3MDCODsVMwzOJz8yYAEkG
	bDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1IIDjdwB5hPzbVWjx4x1dyNXdwHogL66nNfEOvd9FzY=;
	b=lzjl+h/PEiLpDwlCLdfauShg0E4W0c7LMERBYwLFydzr9lzF39KZOlho5nyXt6kaqT
	2DSmWRb3W97DsbgKMu1OlD++l6d+JH2Y5DpZSHOAaHcOUIRUPQdwYUye/RU23Iz0dn8f
	am2g5s5H21WDkYjC52ILMcV8Ji1qFyCdgtxzxn7BrZTzaB9hXxCwP/RCZxY4OEHpoJR0
	YxKvwsAvt++266Fr/KIYJ96Pdh2vMe9G1n8CxRBCDjr8vR9i2R0tUo82PZErUxiAhzgf
	MdjfC/UBsNkTU545FHHHc6NZKe6ikUEetP4d3sY7DLUPWsjP0MvvaZbBbtoEVW4dbafr
	z7Sg==
X-Gm-Message-State: APjAAAXqCkICm3Bw0jTNY2298Yo5zEDay+TkBiSHFuGJUD0SUd2uyjlJ
	h0TaElk9qguXNBtROWUHQX4oYG9h
X-Google-Smtp-Source: APXvYqxIZgKp5e2tYIANtxR3ACYxJX1tW73TypX2cblFROKXBz+kvv07AOCpVNHFTrtr4kLaNkLVmg==
X-Received: by 2002:a05:600c:214f:: with SMTP id
	v15mr21111694wml.110.1576459260960; 
	Sun, 15 Dec 2019 17:21:00 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F06A307CB3B21B8240595DD.dip0.t-ipconnect.de.
	[2003:f0:7f06:a307:cb3b:21b8:2405:95dd])
	by smtp.gmail.com with ESMTPSA id
	t190sm10877063wmt.44.2019.12.15.17.20.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 17:21:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2019 02:20:44 +0100
Message-Id: <20191216012047.17312-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191216012047.17312-1-schnitzeltony@gmail.com>
References: <20191216012047.17312-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] exo: remove pythonnative from inherit
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
X-List-Received-Date: Mon, 16 Dec 2019 01:21:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested with oe-core patch removing python2 from hosttools
* checked log files and there are no traces that a running python is required

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.12.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.10.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.10.bb
index 246504b6d..4deedbfbc 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.10.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+3 libxfce4ui virtual/libx11 liburi-perl-native cairo"
 DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native intltool-native"
 
-inherit xfce pythonnative perlnative gtk-doc features_check
+inherit xfce perlnative gtk-doc features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 REQUIRED_DISTRO_FEATURES_class-native = ""
-- 
2.21.0


