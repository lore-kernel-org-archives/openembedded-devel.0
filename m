Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9543E74F09
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:31 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id c5-v6so11152917wrs.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=aMk3xmZMaN9sVvHdIShQhfIKqT48+fsWYxdqYA/Zd3Y=;
	b=c1pPKkwEsxr7NAZewkXXqpbQfM29Udz+5xXCHy7ZjPYmIsxVv6ISSBkrDVc45uCIl6
	PtEBUV4WNGFWqoW5n8WERRisezz9mvt1OpYZApe0M6f1sX+QUoEez0/ZlBQpZiShzOnT
	3C1+QVKqK21u0OP9zN9OEMAUVaNtVS49UoTXzN+Nms0ETY5JxR4Trbw1w64EWMvRPLhI
	Fb7qJnhbMGkrWH7e/H2Qtaj2cm0eT58I7OS/SbmhtlQUBgck0Vr1Mj/7jEG71b1LsFP7
	sXmokxiwUWxWICk7LjQ2z0LJMAJQ00TDaf23Lrer0+lb+qqOajP3bVgdKbNhikTd6HLy
	/EyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aMk3xmZMaN9sVvHdIShQhfIKqT48+fsWYxdqYA/Zd3Y=;
	b=PfSTXLIaeqnN4McAVq5Fx125RD5AzvQR8+F9S8ibdF0x8jsfkB3yjNP+atV1V7+ogS
	RyzH7H8+/0XCgdqPQF7zXYoWj3f/qD0iGZgUvC7nztK0BjJg0QHhQCRxefSg2G6DjRsq
	B4GZgPAakB6GFJpwioxccRaBvKm3GcoKwYIPkZDF/sd1CDpGor6uc8fwYH8750zclY8K
	9abFiT8OpdkjId0bTF+pltpoIm8o/9vOoZ63XVmvC/AWUuhJOcvW2YsBTBFEUw4AkYBt
	CddPvQcF1mnpbFt2VC2VbzkRjgCYCNtOe2vLY5e7uzKY/eoarhVvPDOqMsaUBotY4YrB
	+Uow==
X-Gm-Message-State: APt69E0Mt989dMQ41trcH3cePC6pQM5GqS86XZ3MRLeH8kfG+wL+RVp4
	9cwvajr622covTaVR1xZ3p8ojw==
X-Google-Smtp-Source: AAOMgpfK3dlBHxlo/wy/3Xu2tQRj+xewdwMAEq3pkcDIdR/OC+5xlOrklmiyK3HZhu2Hk5DXnNu/SQ==
X-Received: by 2002:adf:a0c2:: with SMTP id
	n2-v6mr15352199wrn.23.1530360212117; 
	Sat, 30 Jun 2018 05:03:32 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:09 +0200
Message-Id: <20180630120315.29414-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/11] thunar-shares-plugin: initial add 0.3.0
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it has seen a major update recently (GTK3 Port / Thunarx-3 Port)
* it requires samba-server - so don't add it to packagegroup-xfce-extended for now.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../shares/thunar-shares-plugin_0.3.0.bb                       | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb

diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
new file mode 100644
index 000000000..b90e4e8c0
--- /dev/null
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Quickly share a folder using Samba from Thunar"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit thunar-plugin
+
+SRC_URI[md5sum] = "a1773168c0b3c7c0f253a339f02e5ae2"
+SRC_URI[sha256sum] = "d6adc01ca45a3d2567a2a969a3b16d1799a8975453ab1803a065fa82496b5b65"
+
+RDEPENDS_${PN} += "samba-server"
-- 
2.14.4


