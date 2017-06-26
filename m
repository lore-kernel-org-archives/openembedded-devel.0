Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5B51C77E94
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:11:30 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id 62so398731wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CYnuNnaJ1GUcxLmDNcvYTSZ3FzX8vkRRueaPK91Q87M=;
	b=NrGEODPUX2NG8ybQGxRnwvd46mtoUOugxtHElb3fLgYuNus22AhpH2inHk/gDIez9N
	QS8PiPS/YI6HaARk0ox8CKVroqmPI8KRt7Un92M4DXmlZlBk0T1h39ioJVUmxlfvclmm
	tz5tlEgADfPom35jXb5F2r31ZT6KivbVCFkiToWVZ0C1VQkztc4PRCpvSBf3INDpYePR
	5Tkp9aYwNOU+ryBhwytPViLy90uduMuD3qSVYOJUIHaxyW2c/g/jiWMfx7A0vtAicQtl
	fDA2QX8rrsSGlFZ+Ksq4u6f+LpD8VcfiF5v0IZXd2+Fup7P0EVBDe61NmWKT85mySZYc
	jOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CYnuNnaJ1GUcxLmDNcvYTSZ3FzX8vkRRueaPK91Q87M=;
	b=rAKSemkr33U2jPhMo9P2mW8bpI5zndrKmnmzgdXEki6hqZaR86CclQ/aaOIHG1hQyU
	QXyDHYh6L1GVktXPHeSe1jxZFxpKlf7yweH/r5+qkuN8dGz6poFrbiDtkuzEaG+M/XEr
	giZ2aZ9znh877Ij2CfAXlg/9UTtCINmdY7bMX5dVDxAZAd/vh1OaKfEk8l55k/Ptppcl
	xgUczScGxf99a3EiOIonxjyQ8Y7Gfn5NFqFAUYnO4nE2bqWzWbG0VdHb9V5yhEeQcw7S
	PFOAwhHW0c3k9CvRbwUjZll2yOEUQwBOL8bt2kQYUowY8akp4DLo3K+Zpex8NylRfDb6
	f8eA==
X-Gm-Message-State: AKS2vOz1l2ExDeBE01kE+XhhcDPg7PLB9fJjVjCP/neP/69XZOAWHGfC
	3pdWP35XbL594fmyBgM=
X-Received: by 10.28.132.210 with SMTP id g201mr48700wmd.26.1498489891479;
	Mon, 26 Jun 2017 08:11:31 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d91sm368379wma.7.2017.06.26.08.11.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 08:11:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jun 2017 16:11:13 +0100
Message-Id: <20170626151117.6221-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626151117.6221-1-ross.burton@intel.com>
References: <20170626151117.6221-1-ross.burton@intel.com>
Subject: [meta-oe][PATCH 4/8] meson: set RDEPENDS globally instead of just for target
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
X-List-Received-Date: Mon, 26 Jun 2017 15:11:31 -0000

Now that python3-native has the correct provides, the RDEPENDS can be set
globally instead of just for target (which helps a future nativesdk-meson
package).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/meson/meson_0.40.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
index a2c5e4d39..ab54b8c79 100644
--- a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
+++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
@@ -14,6 +14,6 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
-RDEPENDS_${PN}_class-target = "ninja python3-core python3-modules"
+RDEPENDS_${PN} = "ninja python3-core python3-modules"
 
 BBCLASSEXTEND = "native"
-- 
2.11.0


