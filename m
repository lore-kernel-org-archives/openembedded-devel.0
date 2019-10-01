Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1BCAD72EB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2019 12:15:17 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w14so21207167qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2019 05:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=TgAhSPa05ToZfVmVd9677hUsWiEVe4bOrEQBExDocfc=;
	b=C/wDfHyUFlT4O0IcqR5gOyEW38Oxurj44n6Is8lpKtbL41ddDvkdAApfkX7OxyRHXG
	Esvmb7FUTciTORBHaxE8Sxd3FUaf7AdQvrim5OuacnYgr/pTpZzeTAPK23EL/aXP/Xwy
	GHjLtoQvY6OXspIrNtfcCmkN/7PQ8qaBiNFN4QJoX2/1a4lwGnY950B8uqMbJF/n981w
	r0/9zIFkbqieHROOpvh/T+HBx+ZNhQG2Eonmy+e4TpUU8SseP/4/MkMbi6zMx+eaMBOd
	2zJk6rjnsyAvoPJcwORX1oQ+XBW9+pQBOOqiahim27QnjB/cLAFrIk2Q5rzEz6ZR0kC4
	zTKw==
X-Gm-Message-State: APjAAAXylRSq10KAP7UpRsrZHBTrmpKtRd41L+Yg1XJvhjhQyJ1jttDW
	TsbJfb/eBpkSI+Qzn7ZRYYhlPSn9L5I=
X-Google-Smtp-Source: APXvYqwtxoTZ8Wsh2us8OoRLoyxXf23XmMQl767Q1gQbpr2n6jToEwKnroQ4ektV9JgwNXtGCNuwvQ==
X-Received: by 2002:ac8:75cd:: with SMTP id z13mr29061053qtq.87.1569932117597; 
	Tue, 01 Oct 2019 05:15:17 -0700 (PDT)
Received: from localhost ([181.220.83.67]) by smtp.gmail.com with ESMTPSA id
	b26sm6986928qkl.43.2019.10.01.05.15.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 05:15:16 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  1 Oct 2019 09:15:10 -0300
Message-Id: <20191001121510.1180695-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH] modemmanager: Upgrade 1.10.2 -> 1.10.6
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
X-List-Received-Date: Tue, 01 Oct 2019 12:15:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../{modemmanager_1.10.2.bb => modemmanager_1.10.6.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.2.bb => modemmanager_1.10.6.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.2.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb
index 5fe7fb83f..92d4fe0f4 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb
@@ -14,8 +14,8 @@ DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "dad80b3b4f27c1d6eae7e019542338be"
-SRC_URI[sha256sum] = "bbcf6da35da3d72f688675bde91dfed6485845c3fedd1805ae914b71d1b783f2"
+SRC_URI[md5sum] = "7452a94f0d1ca361ae51ff1d287c53f5"
+SRC_URI[sha256sum] = "3c2ca73782215664141042422759899ca9846440fc26d6223c7cf7ea4dd3c996"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.23.0


