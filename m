Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id E6C1777D19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:56:58 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l44so5795567wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IEujKC5mMN3V7veIgON7vDOArjUntiL3eFvzsp58umw=;
	b=Fba+SISTCir4Xa85Uj4ixyrQ5AL9lYxyQ/79c7bSYmCF/EiLbOoVikfliUj7++QnH5
	2FKY+YsBbgMWy2gM0/cK/yJla7QPTi6nop420wxWwm2V04Nr4AL5QrKnTQy03JX0hwKk
	DXI1h2MqkODI55UoPqj3KBg4iWJJbZL2OOiDI+lBDz04dYlhJ0TN4Sq5W8jRAaiALdP1
	PqnPKAUTZVsPsMDVvUulJ0v99BCebVdWwnpCqIwuAIHXxUcRU8oG5sccJWUZJXz3QCAE
	t3d1gJOpyi2XE1iB4ske6iziVOHf0R8mKgv8doyMSOHRDEvV2gXzFbWw8O5j1wHgcykV
	ijrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IEujKC5mMN3V7veIgON7vDOArjUntiL3eFvzsp58umw=;
	b=QsKX8TxpWt1yVtfqJOXZrOLVwCYqYeOSfgFc46DdKugyaqa5qoPTqBiPmAqD3UOqmW
	0dA2reGUs9pzNp1xkEIVNqyj83DYRAuqAb2eI5hVgsGo9j3XvSFzIWxkUoxDjPUcNVq7
	P5HjSA9usky7Dn1eNIxG1bw98Nl7wzJSwovFh4HfKkNQ7xIs7P6nEueDus8VaHPPBs3x
	6UsQWmvacvdD1u8Cw+11x5TS9UsfAnVo6ErhMVQmWH87bESIh/wKv8TaIIqcNQdkMB1t
	Z71QtXnG9pKptgxWioh69cjip6SYRdaNE+BcU1S00H9bEsoll5Z7Me+lY2gmsZjuyrQX
	dEqw==
X-Gm-Message-State: AN3rC/6P3OKn+LjrGcya/YVsOJIPDMfMILd19NU8MTmmdUHZZdUY9JILqn5Q5a40ilxVvw==
X-Received: by 10.223.182.174 with SMTP id j46mr4259909wre.143.1492027019892; 
	Wed, 12 Apr 2017 12:56:59 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.56.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:56:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:18 +0200
Message-Id: <20170412195638.3243-10-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/29] xfce4-diskperf-plugin: update 2.6.0 -> 2.6.1
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
X-List-Received-Date: Wed, 12 Apr 2017 19:56:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-diskperf-plugin_2.6.0.bb => xfce4-diskperf-plugin_2.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.6.0.bb => xfce4-diskperf-plugin_2.6.1.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.0.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.0.bb
rename to meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb
index 31845e6..161b2bb 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.0.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "fdb061b5dee6efe04b14d10c166727b0"
-SRC_URI[sha256sum] = "4897f34ccd8c3d050f8d2d95652af6ab740a670a108bf01f582945779305900e"
+SRC_URI[md5sum] = "63d5f03934c2dbddb3ad7bf7f535cc23"
+SRC_URI[sha256sum] = "212ddc742be3eecb6ad5554e1b1df03d5685cb71f48a558d5f895de37c57e4fa"
-- 
2.9.3


