Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id BB23C7C547
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2019 06:18:02 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id m1so1124129pgq.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zZM3lzpaDNBjrxDMDDCREhYehEnxxmPkj6rytH0Eozk=;
	b=rsEADDa3fHgvcrUG8sBTTCto3ZTeWn5LOj/dmeDdlS0Peij8IOm0YCDeiLl059XF4x
	fy6SHq7qbHkWl2rHJGCOSaXEIcp7tnKl4uR5tjjZeAOsZJ2RJZNbK753v4CLsZZ71HIN
	BS3tnrfOZ6Kxvk26DN+bo2og8ykUFMk/mtVmw4aVwXvaHobwwda791mHBwyYrGERhMA0
	rs+Itg6aMCby8/4XxYoBn3Uu+2kyzLOIQ8YIms5Lv+HGhVsfFe+EJx3KIBPdDTR0w6ef
	IEXbb/XH6h1c5sveMG9PBJZN8inFxLUhr4Puz0O4+qfDH936EwIuMtoAIexRhqe5sk8h
	PuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zZM3lzpaDNBjrxDMDDCREhYehEnxxmPkj6rytH0Eozk=;
	b=ZUbr8X7KfdEx6H9WyTZuKsIAylw5VuuNbiMEew5iI/BZmByPXXvTI6vaaNtJYFQ6uy
	GXnZ6v+yDuSbpW7x09WNB1VcvH3D01J1Tqg27PxhTkNrH2GEd6hqb/SEh7QetgFfr4+O
	lvxmYIHEGguUNGHJ9qO8EqDmKkerGmDV3eltV0C4zruJGEk/OJnyzQYaWIf53WE6OzHO
	DhYrVCZcLhakhelcH9A08LFkax0QYSKkZy9BKYk90vQ3sgqzWLivputZXAXHcJyyQrVN
	cS40agq5T44c83C/kPiBMRYYecqdZAxmI1obQ+ze3nvExyKiR7WciKG/5YoQvRhPxika
	qn7A==
X-Gm-Message-State: AHQUAub4ks5O8iioGPM3VRM/tjibqJwcWgNk5s4oujemxGi6bYyGa606
	VvjV6pNkrMsJyDgoyIBvyQQLSC08
X-Google-Smtp-Source: AHgI3Ib/jXdkOPXNeuSQTnhQoVUizqBf3V7hOVEs7aMHEDQrgqQGrov7iUM2StN0e/ZOBRO1O4OLXw==
X-Received: by 2002:a62:e201:: with SMTP id a1mr20184709pfi.75.1549606683337; 
	Thu, 07 Feb 2019 22:18:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id b2sm1139905pgg.87.2019.02.07.22.18.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 22:18:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2019 22:17:46 -0800
Message-Id: <20190208061748.21556-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190208061748.21556-1-raj.khem@gmail.com>
References: <20190208061748.21556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/4] python-mprpc: Upgrade to 0.1.17
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
X-List-Received-Date: Fri, 08 Feb 2019 06:18:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/python-mprpc/python-mprpc.inc        | 4 ++--
 .../{python-mprpc_0.1.16.bb => python-mprpc_0.1.17.bb}        | 0
 .../{python3-mprpc_0.1.16.bb => python3-mprpc_0.1.17.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-mprpc/{python-mprpc_0.1.16.bb => python-mprpc_0.1.17.bb} (100%)
 rename meta-python/recipes-connectivity/python-mprpc/{python3-mprpc_0.1.16.bb => python3-mprpc_0.1.17.bb} (100%)

diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc b/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
index 05fbae48b4..e9eebe84af 100644
--- a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
+++ b/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
 DEPENDS += "${PYTHON_PN}-gevent"
 RDEPENDS_${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool"
 
-SRC_URI[md5sum] = "acde1f346411997d76ab89790a356823"
-SRC_URI[sha256sum] = "e8ddd47e7a2fb2d3b203fcc522443ee5be56c8f7e2c6d915c047445951cef1fb"
+SRC_URI[md5sum] = "8d97961051422f3de315613434982d3b"
+SRC_URI[sha256sum] = "3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1ca28f6a"
 
 inherit pypi
diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.16.bb b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.16.bb
rename to meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
diff --git a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.16.bb b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.16.bb
rename to meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
-- 
2.20.1


