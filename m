Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5674377D64
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:08 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u18so5830817wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FuKjDUgwqnyOSzVtSi7/B8wyH2fTzhNB7mcgM+egDjI=;
	b=MJFWkQDrpI2SmugbsHz3XUI/ywkKFKH6xXTFHxntpYwHyPpdFZmRq0v6LZyWCdQECb
	QYJT2gGoEdSHJdFd11k8V/rAoYaT+22CiycOHjbkplPDTQY8J7SuXJ6wj//zE+R3U1XH
	ygzPhwB+zcIKrpQC7LI5SgW+tlUmv2SJLoYEwaWs4qI0Nr85xmduQbCqdLS72Fc9fE2R
	s397J93Tk6RNgSGbwi+Xcn1mq5zmF62jhdfqFtTXNfx4SEj3D71L8nPnNuD/yMVfIyeT
	/XDKV5vyNyWWE4U7hH+Cripahet5TgNqHZeQudhKcL6h6gg75a3Ucz1mXu9Utl5ltZOz
	nltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FuKjDUgwqnyOSzVtSi7/B8wyH2fTzhNB7mcgM+egDjI=;
	b=YPMyvZ8ZbBGLz0cQzFNslyLiU5UDzk+6wEmJjPR7RdeUpxIwyC38wlD9viOkuD2QCC
	/X8MOSF6fgzYbIFYLEx7zxCMQYuN0/0vkuInQmNcpylKGmUmd9rOdW4ARsKb1a7nA8qK
	lQGhn9cNONmhplriYmyi/QT8cdN/owIlDFUBxZ8clw+iy82wHAP2YcjjwxV4am323yq0
	PuV4Z+6xlpDVKD8vt1mnTDEcISPeRDorORpabFxiFLEspmJUOEpxY7NhB4OUcNAl6u5b
	Y4qSbq/yrDOTheCoroTophawfBG7FkCHnRw3NX/fnr5boJO9HXRv+UdfnuhTXbNsywJ6
	9wbQ==
X-Gm-Message-State: AN3rC/7GID5UJJp7o9+A1gzyFbkMTVz+Eub6H5w0CDGnFpljXqOvtA91KakP4OmrGIBUeA==
X-Received: by 10.223.136.125 with SMTP id e58mr4348336wre.73.1492027029958;
	Wed, 12 Apr 2017 12:57:09 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:29 +0200
Message-Id: <20170412195638.3243-21-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 20/29] networkmanager-openvpn: update 1.2.6 -> 1.2.8
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...etworkmanager-openvpn_1.2.6.bb => networkmanager-openvpn_1.2.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.2.6.bb => networkmanager-openvpn_1.2.8.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
index d360a71..cce3f91 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
@@ -9,8 +9,8 @@ DEPENDS = "dbus dbus-glib networkmanager openvpn intltool-native glib-2.0-native
 inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
-SRC_URI[md5sum] = "47ed9b6c43ca364976a15e84207687df"
-SRC_URI[sha256sum] = "2373e2bb0a8a876cb2997cd8b0e3d6e10012d9bef3705ea3ac21f6394b3f1fb0"
+SRC_URI[md5sum] = "9f325be386aa906ff9b0b7c0bdf2a59a"
+SRC_URI[sha256sum] = "3e0b4007f248d96df4b8eb5d0f937536044af7053debbbf525e67c9bc5d30654"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.9.3


