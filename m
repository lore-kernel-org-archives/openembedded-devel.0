Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 393E47FA55
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:34 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id c22so880045wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DjzkkPCyCP3h6OIs7dnUxjSzYGSXxjr2Bke362ejOgE=;
	b=k5KbOhU81uQAEiu2FdC/I2AOzCbDeXyheN/I5a3moSPM3IgzZ/t6F6agSuqplQSMU2
	pKSrI3MmprlVi1ARNc+TbnaSbF09ge+CCcJEVIz9bBk7dNzKQc5JAxgYJ5bxmG6PBKTB
	ALHt9Fj/foU7JOyL3gCQH+nVioh5RchX6lLC01wmGIsrHGCe53JVibpVTfLdA/EdOszq
	itO171aP/56hTLT1uiyLS6MpaovXmWfnPI7h+k7Uj6V/bdSnQAhqGXDHGXQ/UQiGwbUD
	A3DxxypkZXGjnaoAHe8JVQoopbyZRa+R3YLxl7jpZOAAgUwazjE4mq/CnhD5d1fQTE+x
	IHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DjzkkPCyCP3h6OIs7dnUxjSzYGSXxjr2Bke362ejOgE=;
	b=LZEwBWH3u081VggpLmZIMa9zrcguL+TnIlp3UhKgM+uYbeCQRVZSMiLmHPjTvvagxH
	Pqat0X3JLSqpmoE65z8Ifr0uLxZoxz3wVwbRVA2T/rtk4JWdBlAdrES6KMGowPSHJZ3L
	nkhMZHD9/vboa5bBXfiHfezsZYn2x1oXw3hdtta62LyCW51kjNyL8WPCgVz/YnpnEAbZ
	pwzUyggo3HgiBy/dZUol1GJq7v+MZgHk2jtQfZHCXxbW42OA1uRt3D34gFMMfsIdHZi0
	KQT/bztJ+qaYyRvZzQ0nAupmYwVWUB4NET1hSBzZwAmH8Gx+WjU5DU3mWDFUFUA1pT01
	czmA==
X-Gm-Message-State: APjAAAVW53fXmy5RSBUOjD0wTjXrwIcWN6E7TERmZ+WDLXbcH5U7mhTZ
	u2J2tVW0gIKDa7/EPQfB9gIpKGV1
X-Google-Smtp-Source: APXvYqwjjjnAJ442S3r6piQnnEcScsVSj+1R30/rXIP2CBcvD+wAqTai91z4cbMrCuTN2SNI3UDWkQ==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr1977437wmj.91.1571988094513;
	Fri, 25 Oct 2019 00:21:34 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:07 +0200
Message-Id: <20191025072113.11172-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/15] zenity: pretify recipe a bit
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"xz" is default for GNOME_COMPRESS_TYPE

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
index 295288bfb..707f78c6b 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
@@ -10,13 +10,12 @@ DEPENDS = "gtk+3"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+SRC_URI = " \
+    ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
     file://0001-build-don-t-generate-manual.patch \
 "
-
 SRC_URI[archive.md5sum] = "ba2b2a13248773b4ec0fd323d95e6d5a"
 SRC_URI[archive.sha256sum] = "e786e733569c97372c3ef1776e71be7e7599ebe87e11e8ad67dcc2e63a82cd95"
-GNOME_COMPRESS_TYPE="xz"
 
 do_install_append() {
     # Remove gdialog compatibility helper - we don't want to pull in perl
-- 
2.21.0


