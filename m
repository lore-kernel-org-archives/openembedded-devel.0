Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 54C3A7FE9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 03:23:27 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id k3so2516394pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 19:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=b9rqiNpcwSn+dw8BXHDWCFT5RxhayDcqgcdHCY4T5hM=;
	b=TcQhj8QMQf4HzVpnoS3Tf2inygKIiPs8VFEN3DYKgd149JKFPA92YnycGny3yxKHvM
	lZDgA69r/oC+i9/sGVOzLTzzuoUKHze6Ws1KkhLOMWyQHIxzjyoLlT9RUURYANxQJt9e
	vs2FIr+/YvpkcHNdZTL+PB88ja8liChnVkyNlDs2PmbMbjP20zeejhNlRkQhdgpBWJze
	ruJflJ6XeRoEf9HeeJO13LdrgToqXlDRSujy5WlbS1hIzLF9675hetQjUETANzw+kf2j
	ReGzVvYivyCDbSPPran5Ry3OiKpaO61maWYoiBjjKc2ZVbuUSeDOV2U4U7vObV7SZ5iS
	XiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b9rqiNpcwSn+dw8BXHDWCFT5RxhayDcqgcdHCY4T5hM=;
	b=GY3GKEtOu8i/AfJFk/Gwcemt4SfgX4B9LUXmX2MV1HJGIbWGZ4Rl1qhOTvIoOc50V7
	hDLVmejPl4GHI8RX4AeU4VTP5YwiNls6Qe/AjVVk7+Kn+r4t3/Km5+Y5CrjvybG5AYZu
	xH0nFIm1nEXSbG9yOxY5BEbzWwPuymmectyterrRRDzH3dlEkYij5pwrx0ocR0GKhpz6
	uhKDR14erhdF6gsc5c3JlpJPqfUvS/2K+qlLjA/Ql/rGfR39Sla3fbRghVt0+3i/gh31
	kSdB8dY8JjBGbJCJecf+0NkSKFJn6TdH5Mc94JsA9keCL21Q2bjjkudvCfD5yaFEJ6/E
	E1bg==
X-Gm-Message-State: APjAAAX/MG+C4VnouJmPHsVt7Rrgzy4VZNey91uK4vBZ0Tft9kS1qEer
	v35DqArAYmfDG7MznIhO/71k0FxVbvg=
X-Google-Smtp-Source: APXvYqxII7/rf50moeSNjMcxJ5IOi/KpnCdLvNLNjbzvir4/KR0hI70JVmFGCWuBRc9K28HzNIiQqQ==
X-Received: by 2002:a63:6e0e:: with SMTP id j14mr8638898pgc.361.1578540208018; 
	Wed, 08 Jan 2020 19:23:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id
	r30sm5657182pfl.162.2020.01.08.19.23.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 19:23:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jan 2020 19:23:17 -0800
Message-Id: <20200109032319.3645429-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109032319.3645429-1-raj.khem@gmail.com>
References: <20200109032319.3645429-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/5] python3-jsonrpcserver: Use PYTHON_BASEVERSION instead of hardcoding py version
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
X-List-Received-Date: Thu, 09 Jan 2020 03:23:27 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
index ceae6abd8c..a6dcef81de 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
@@ -23,5 +23,5 @@ RDEPENDS_${PN} += "\
 BBCLASSEXTEND = "native nativesdk"
 
 do_install_append() {
-    chmod 0644 ${D}${PYTHON_SITEPACKAGES_DIR}/jsonrpcserver-4.1.0-py3.7.egg-info/*
+    chmod 0644 ${D}${PYTHON_SITEPACKAGES_DIR}/jsonrpcserver-4.1.0-py${PYTHON_BASEVERSION}.egg-info/*
 }
-- 
2.24.1


