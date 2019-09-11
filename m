Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 738517D71B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 06:55:48 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id x127so13046923pfb.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 23:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5/RmFvjWMvwddWiVIskxM6u5hjgESiNYw2TAc6Gx1Yg=;
	b=hEJxv3qeazNLDkW4b6RZBjLGht9xIlIyzIoFWV1R1GU0kjSlXyD9jADszhr8vzlNYR
	uiUrW//dwsBxvtBlxvRjK1TTDIC4qBCwD+avUpZ54asHp+r+VoF5oS5HJFXt1EmrRrcH
	M78ZLX+qJEzV4jJVcmAyopyiCjMrTj4IHDQz3RoU7RM0rdGKnQHBsjdcvGwsQUTaCzxr
	cq/lBiPPAeXtqiETeCSa0FEvFAbK0/ZCyIBhqhW8l8vf8Rn9o9W0xLSKwEkFWoK39UIq
	7vlcdDe8kzImPMOWiJk9zSSz1iIsGPvWTHqQrvAHagaYhSTTVHUln6PVmhOzDSX6nmp/
	qEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5/RmFvjWMvwddWiVIskxM6u5hjgESiNYw2TAc6Gx1Yg=;
	b=hSq6Hg1R0PYQwcRc2q0MQVd/0BhhxqbYz9Ue9pFeJzA+b6Z8v7Q+nmBYNVODd2uaRF
	YdwQuzr4+pCTryZUs1KUvw0+rNKhQDtQ6DZ96/iV2EKdenE+lLBJGiNbwtFIpqZyxhLy
	FWGPp5E2R2tc183H+X0xPyB8DxzsjyxMeUBMOCEZLwwqKnmjxbfgKZW0iS05+S2/Hag/
	oFU4goxXOAu6/E2oDUPJ9mTlYj3danDSSx8VlVV4Oe4WGd7aGE8wIGufveT5eFfgvt5q
	cly3JaQvdLEy/bQixG6GPb8790E2vDwC9kRcA8fUyQtZmoemHnyYgJDI5sUatO9S7129
	1FCA==
X-Gm-Message-State: APjAAAV41k9FALjqfYt1Tlz3o6hsHfrD8kXDO3BwI/whDKHhpkIKfDAz
	ZB6bUuVk/W4WaVIzhD6IJQwd3+0iDTw=
X-Google-Smtp-Source: APXvYqzhtN4K4W8heTyD8lny6m5lwLcca1m8+Y2FsrQe16Js3o0YiUbrvxJwwyQgT7WfndPeZrGjiw==
X-Received: by 2002:a63:1d0e:: with SMTP id d14mr31671351pgd.324.1568184948901;
	Tue, 10 Sep 2019 23:55:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j1sm18864063pgl.12.2019.09.10.23.55.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 23:55:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 23:55:08 -0700
Message-Id: <20190911065508.579805-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] safec: Define _GNU_SOURCE
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
X-List-Received-Date: Wed, 11 Sep 2019 06:55:49 -0000
Content-Transfer-Encoding: 8bit

musl does not define this variable automatically but safec does provide
wrapper for some GNU extentions as well e.g.

error: implicit declaration of function 'localtime_r' is invalid in C99

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/safec/safec_3.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.4.bb
index b4c125faf4..cc1fbcb735 100644
--- a/meta-oe/recipes-core/safec/safec_3.4.bb
+++ b/meta-oe/recipes-core/safec/safec_3.4.bb
@@ -10,6 +10,8 @@ S = "${WORKDIR}/git"
 SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
 SRC_URI = "git://github.com/rurban/safeclib.git"
 
+CPPFLAGS_append_libc-musl = " -D_GNU_SOURCE"
+
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm).*-linux'
 
 RDEPENDS_${PN} = "perl"
-- 
2.23.0


