Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDE67E6EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id p9so13597154wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RRppTIk91pPG0b/VdfZSMY59rk2qmKdPT8s0HJBaj94=;
	b=mhsyStVLGZG1rTo4M4c9PubM/J2Q8CHL49bFc/ZJyC3M9QJhP3XNffxCrrxsrPSQ+F
	UKJLqKn20LQaqBmWkdsuIhsa6k21FAQTX3cRI+scdMMYoHSPeaNN24ClC7bVc9ixi+N3
	Sxp15+RpjBedGFwAyhOFvholiLa3x2dI9U2fGxBzOVIACL4uvGflygcYkPMQUfmLJQ7L
	1Hwj3qfJh6BcV79FbJtOPv5z1lQZL2yrbiFmWGhppjpL4Eoi7v06ORM3GEyi10uOxVua
	b+L/bHg5QyZuMKzfV/ssNmGxwUw73+m5E9/kd0NW4k1N6+98EUDHwI88QUKbF659SyVt
	cpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RRppTIk91pPG0b/VdfZSMY59rk2qmKdPT8s0HJBaj94=;
	b=eCqDuH1zeDgH9w3TDcaQa8VmunHRcwvh9BQ3ewG53oeF8aUlKeRDPPnCLsF15dNC9W
	k/0ZjkXBFmr/k16QYHQmf6YEvnV5lyt+W61lfH652519BsQMMwo+kYPM/Pdcxbae0HhG
	LxFM1ORvTD4kvbJgg/vXlgKmsNmKSy1EEVkheUEWT5/zWz+AvvFp9l2UMu9CBWhUu6gs
	yyB4pgRWuS/kZYUy2okZTdcDkBoQVcEpLfnE/UcI+bH/cb7zrO4owiovJHZpK2cz64q2
	j512TZyLzxOKDSJkIM8LUB+2OEi3RE3qO1BjJGhbAPILM5TtywPnm6v7dEQmlqf26vgq
	cVMg==
X-Gm-Message-State: APjAAAX83JNjrj7vgNQp/tLel69E6JFWVsaeH/jjcG7j8lvaniATVjAM
	N1zjjVyGeZNmUQkxpbhZ7KvZBao+
X-Google-Smtp-Source: APXvYqwbqXBIZjShLfXBhB+QZ8kSVG4o4g4zarAxGP1+hacEvupfQlkIzZXJmasBS+lPPE3VmIt0dg==
X-Received: by 2002:a05:600c:204c:: with SMTP id
	p12mr21759834wmg.61.1575851945505; 
	Sun, 08 Dec 2019 16:39:05 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:25 +0100
Message-Id: <20191209003840.3383-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/29] gsound: initial add 1.0.2
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

yet another dependency for gnome-control-center

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb

diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb b/meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
new file mode 100644
index 000000000..e4478e14a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Small gobject library for playing system sounds"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=447b837ae57f08b7060593ac6256163f"
+
+DEPENDS = " \
+    glib-2.0 \
+    libcanberra \
+"
+
+inherit gnomebase gettext gobject-introspection vala
+
+SRC_URI[archive.md5sum] = "c26fd21c21b9ef6533a202a73fab21db"
+SRC_URI[archive.sha256sum] = "bba8ff30eea815037e53bee727bbd5f0b6a2e74d452a7711b819a7c444e78e53"
-- 
2.21.0


