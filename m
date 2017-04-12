Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1935E77CE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:56:57 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l28so5817544wre.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=i/F4g4Pr7Wj+FaZ9Gf2cf+dIKRJhb28oWVpF0LybSik=;
	b=hjweoJHJqxIwAg6f3UBgejQ6YexDZ6knV6+oa/lFy8nz7sP1MUKvnD5A+zwSDk0zqH
	EX+1zcOxVNRG/4mDUz237+DNCZVh1irQOq5tv7jSjCHeZSqxgo4DpXKuCuhDhyrViUdy
	Mtd1w+rKQvK8Ar3lwy5xRWT2v0h9wcJmjJj4NhwkZOMS4cRRKakbkJ5Be9NvCnetMhgX
	FXHtfm+hSqCBtirODKtEuWyXJUDKN6fTknwMx1YLg4OoWouucJev+pagqV45iZlqjACK
	RkJ8ZkNDTJ/yVW3R3g8PXRYia+lBcO0RukOmsz3ZgKK4V6urLiQvc1JlJshl0nCACE+3
	QPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i/F4g4Pr7Wj+FaZ9Gf2cf+dIKRJhb28oWVpF0LybSik=;
	b=D/nXE8ksPSiqQMQxYc/F7Macng8a3uJP5jlwAZZjTMCWRTo0Jv8wzVTuNFOnGA+j3m
	ntgaGsHjv6njrGiFC+STqHNL2IstMjs542hZUOgwaknyOSXrTnB+raygotkM0jSGoG1X
	Eo8JO7cUIQAEffrXEqEcPKirKKhYq5gktbUrOe2JezKFB+U5xWYbj5Iav8EUd0ALY8OH
	guM2qgrk3sAX7zy6T/l3KOiad0HjWjipG1dEzSnV41Mkoi6leh3koN/T8zqk8qQf5LWX
	OJlUV0rhNy3cgYYBJO9BXLANU2PgQhspM11BHdTKl9LbKLYP5uG7NMoREmgUmhgIsMB7
	P2tQ==
X-Gm-Message-State: AN3rC/5GPTDAPNXolbFwrHp/qYaC0N35j3CI7qo0AzoSoI0VKK1jZVHT2+IEf8PMGl8wbg==
X-Received: by 10.223.133.252 with SMTP id 57mr4589731wru.94.1492027018379;
	Wed, 12 Apr 2017 12:56:58 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.56.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:56:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:16 +0200
Message-Id: <20170412195638.3243-8-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/29] xfce4-taskmanager: update 1.1.0 -> 1.2.0
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
X-List-Received-Date: Wed, 12 Apr 2017 19:56:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb  | 10 ----------
 .../recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb  | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
 create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
deleted file mode 100644
index cb1be67..0000000
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Easy to use task manager"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-app
-
-DEPENDS += "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
-
-SRC_URI[md5sum] = "7da465a4798629ebd8650fef62770ab7"
-SRC_URI[sha256sum] = "2e1eb161f966cbfbd68bd029fb59115bc5ab0c0704cb500d20e7d73967e59ecb"
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb
new file mode 100644
index 0000000..f955585
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Easy to use task manager"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-app
+
+DEPENDS += "gtk+ cairo libwnck libxmu xfce4-dev-tools-native exo-native"
+
+SRC_URI[md5sum] = "6f30ce3c688454812008281065a6e05c"
+SRC_URI[sha256sum] = "5746d473ad428b13db7c05cfcbc8099fbea13da6be26d3a9359bcb4de971ba69"
-- 
2.9.3


