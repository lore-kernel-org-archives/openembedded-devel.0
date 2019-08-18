Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id BAEB27F27C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id z23so1350051wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=V4q6TggubEiNTHOW7kmKYEC9Z1vy9Z2eVVStbBbJ0hM=;
	b=U0cRkpj3EAK81CaaEOnjyluCY0f9rAlBN/S9eqpekxExEJTVeo4klnmwLmVDCK8QO+
	KgD4JuyjsGYiv+6g53woWZBO9tQU5B8z2U2YsD1D0K7SY59+OnGv/QjDsIKpvV0I2lVi
	Hm3vXRDsUUF/BsvtyNudgbtWcL0MvpmgKWKGOMBe8u8vDg4Uqdvl0mh+/gDPQ0jzeWv9
	XUpO1DhVJp/AY7a2eNbIzxLlvvIjRxN+nDjPODdl4y9YeAKuFYDM/AujPrWBiey/UXcS
	CFM/9MLG3p90O5tqxEomg3plFRbi9D7tBkVf4W8hTvHjH/1rTYOIQqgQVBrqgAWFLgIV
	0zGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=V4q6TggubEiNTHOW7kmKYEC9Z1vy9Z2eVVStbBbJ0hM=;
	b=AdNheR4UM2DBRKXZNA2q2Z0voTCoycU2ezVv6tWjaMOmyyqADdEqaB+vTd4Bo4+uqF
	Id62g9DfJFZ2oJii57FeEmqlwqQ52mWsLg+hOX10wEyDAtaeXtwmBQeEszyevdRaASGp
	bOENF7AIsNG6nHIi+2JjJVWCwmm0fW4518/J/YY5mU0A1zzutkhaHOmkfTeoufM8DUr5
	pXiLYRkw7XQbIswENlQsMHkNhb0swlNQmOO2/g0gifkatiP2pN7i90IVWrgLUDPToltK
	ZpervjoulSqitOfz0KlNZ50OzAAuDyjy9XW+KrquPA0u+PWhwXvyUSilTa/Io/xNgGrK
	Osng==
X-Gm-Message-State: APjAAAU6jHGoQlGE8SmBbyHm3RQ0Fb9pU3ffHFOtOg38ViVZl8tGOXAX
	c91ruPexZbxMtDmDM1FOmfPFLXz4
X-Google-Smtp-Source: APXvYqx3K3FsRmCSPmBuYpi3CtSlhVsMuDZ0nEop4lm3HI9/imSEMxW4iemNlEWuEvYEdzK1Tq8asw==
X-Received: by 2002:a1c:9d8d:: with SMTP id
	g135mr18167948wme.115.1566167618978; 
	Sun, 18 Aug 2019 15:33:38 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:09 +0200
Message-Id: <20190818223316.19772-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818223316.19772-1-schnitzeltony@gmail.com>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 03/10] xfce4-smartbookmark-plugin: upgrade 0.5.0 -> 0.5.1
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

layout & translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-plugin_0.5.0.bb => xfce4-smartbookmark-plugin_0.5.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/smartbookmark/{xfce4-smartbookmark-plugin_0.5.0.bb => xfce4-smartbookmark-plugin_0.5.1.bb} (45%)

diff --git a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.0.bb b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.1.bb
similarity index 45%
rename from meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.0.bb
rename to meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.1.bb
index 6289ad31a..fa2c474d6 100644
--- a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Panel plugin allowing to send requests directly to browser"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-smartbookmark-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-smartbookmark-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "6f242fe584ee2fdd2b1d3d69ef3d5914"
-SRC_URI[sha256sum] = "139539c58d54d878de86ef8a882c793cd909981e6b888f7f9d5e230a8fe310a4"
+SRC_URI[md5sum] = "f1c97ac62dd9054e8f2b01568fef3ba6"
+SRC_URI[sha256sum] = "3e28fb7cd2e2251e89a8715684081b862406e3fb4e6d8c0caa1b798a97703600"
-- 
2.21.0


