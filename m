Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 98FBD7F306
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:43:34 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id c3so12006803qtv.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 15:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=r4vbUOIoLDrxBioMblXaPgNtYoeDgD4+H8GfKJjewIo=;
	b=A4aaZLEFbAABeaEJM6hNSukH0N0Shk8cPBT0NI6qJ+PHqtoA9OU4wG/hjhtfozNJRB
	lTEeXLCir/j7RmQwtXHd/tvgzi5PDoELo1k/wqkOWmJWT/dI/nQh7e9GX+b03jmg/qWL
	OLkiqdaI57xMMACml4E8PtGrCDxFORw8ZDOeE45hCpuQpY6x9eS1O2BT9mTLdIEhytcq
	BXZlU/ZjiNJrP6n4aEblVMhuHJueiRiSsErcNvXr7y9kthTzDp+REldCzIxH4K4LDXUV
	hIyYjqIrsKbR+ibOpKNImIndFAcj6tO0JiBRnGJaEwa7KH9Nc8tW8n5zeKMcz1W4cJJa
	PGoQ==
X-Gm-Message-State: APjAAAVNfIsb9qKaKzFRRr/7rkp/1wm7WAwTlXoy+i7xdbvHmAzWPKGE
	xZnJC2uVkjmwJc76SVxmAK0OfBG8KMA=
X-Google-Smtp-Source: APXvYqxDvYcDcASiqeIqXBpO75vi9m7QabOWqj44vPG0VPhhRQx0N/jeVndr0/FCIH//b/Axi4lDpw==
X-Received: by 2002:ac8:224b:: with SMTP id p11mr17892367qtp.38.1569710615437; 
	Sat, 28 Sep 2019 15:43:35 -0700 (PDT)
Received: from localhost ([181.220.83.67]) by smtp.gmail.com with ESMTPSA id
	y17sm5460108qtb.82.2019.09.28.15.43.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Sep 2019 15:43:34 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 28 Sep 2019 19:43:18 -0300
Message-Id: <20190928224318.4127069-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190928224318.4127069-1-otavio@ossystems.com.br>
References: <20190928224318.4127069-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH 5/5] modemmanager: Upgrade 1.10.0 -> 1.10.2
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
X-List-Received-Date: Sat, 28 Sep 2019 22:43:35 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../{modemmanager_1.10.0.bb => modemmanager_1.10.2.bb}      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.0.bb => modemmanager_1.10.2.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.2.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.2.bb
index ef5af3a57..5fe7fb83f 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.2.bb
@@ -13,8 +13,9 @@ DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "92d25176d0cc9d588ca29700b33c7d98"
-SRC_URI[sha256sum] = "fd0f39996025dac96995daea8a58ec7dd571582f7563a8ae0d5f65b571b76ee2"
+
+SRC_URI[md5sum] = "dad80b3b4f27c1d6eae7e019542338be"
+SRC_URI[sha256sum] = "bbcf6da35da3d72f688675bde91dfed6485845c3fedd1805ae914b71d1b783f2"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
@@ -38,6 +39,7 @@ FILES_${PN} += " \
     ${datadir}/icons \
     ${datadir}/polkit-1 \
     ${datadir}/dbus-1 \
+    ${datadir}/ModemManager \
     ${libdir}/ModemManager \
     ${systemd_unitdir}/system \
 "
-- 
2.23.0


