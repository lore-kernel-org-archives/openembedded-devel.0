Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id CF1FA6B836
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:51 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so180555eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=4bRi0C7DEzlmM1eQVxL9aypApY1Ltcmbz50tu4mXGqM=;
	b=BuH+pfqAWs2YlLW5rPEBSQ3+GD69RnnvX09zGJcZCj/l0og1Pxh+ljo4Qj8yBDHJ7O
	+JmmpCmkMQtGUfZx+D7NU1ZTUPIXixvHQPHkO2XAIQ9dR9djMdoZh/E9pt+8Ggmoqovj
	tsrWdVdE6OVDSOG2m3iKksqbXo3SCvb9MrzOuOBPhFCXHXZElUVw178UsF8Yz5U1i5K1
	7Jv3uiM8how/+KHTvW/Tjpt8DokKWekle6ecZ74h6WM+2FaB0TqwqUdkU9s6OS8GivAc
	IlRbyDBBNhIE9ejumtxE7VDPNJxmyJ41lcaSOb3pxHIIV1ijJhex1Z5QZHuL8X9pNN9o
	tGDQ==
X-Received: by 10.15.24.129 with SMTP id j1mr20859333eeu.17.1376551192259;
	Thu, 15 Aug 2013 00:19:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm69988455eei.10.2013.08.15.00.19.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:24 +0200
Message-Id: <12c575f8a0a246b4213b5f716e2ef08da31b9095.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 44/60] quagga: add PACKAGECONFIG for capabilities
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 07:19:52 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 160c458..d66eed3 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -29,6 +29,9 @@ SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagg
            file://watchquagga.default \
            file://volatiles.03_quagga"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
+
 inherit autotools update-rc.d useradd
 
 EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
-- 
1.8.3.2


