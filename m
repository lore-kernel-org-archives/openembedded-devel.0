Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 05E4B73196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 01:11:36 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id l125so69084ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 18:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aRdGy/Ao3gb3irzssuXR77NKoPsBKRMaCZFc03SDki8=;
	b=JGE/XmG4LjG3wDkVBgcDUZm4QQfqHAXiJJsEKJvMeTmVqdlPhnlY69HoyueH1rc2vI
	5WpecOQHArgkJG1xnegkJTXRrKsHjqxVMlv4oVTe533Wi1ypMGP5ezR6uudk6zy1IWY3
	CY5JcRQawtoQLzfvKT5SjYpIaTSNdQkYlNIrD2wVUEy5JkeDRG1FlWPLBzZ6D3R4QnOq
	ReLNS1s2dArRMPGFHsFsxQUV6WNk+ziOvTl1r856fN59VoS+PUdVYKAS8kEcrtAi6wPw
	SdkTyFbzDFNo6bAtu05WkJbcKAn+qL6z+aWy7p3y722YMV81DP1dF4XZcO2FHIi3r3lB
	Aq/A==
X-Gm-Message-State: ALyK8tJSBn+sNtzSKaIunLf33UGCmO24GEsKNq6x4YYzWhCGsa6CqY8QSPOTFiPbnTMyJA==
X-Received: by 10.129.110.7 with SMTP id j7mr8863944ywc.62.1468285897281;
	Mon, 11 Jul 2016 18:11:37 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-183-30.public.wayport.net. [64.134.183.30])
	by smtp.gmail.com with ESMTPSA id 8sm7205699ywa.28.2016.07.11.18.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jul 2016 18:11:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jul 2016 21:11:10 -0400
Message-Id: <1468285870-24052-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468285870-24052-1-git-send-email-derek@asterius.io>
References: <1468285870-24052-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] pyrtm: Add RDEPENDS to the package
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
X-List-Received-Date: Tue, 12 Jul 2016 01:11:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/pyrtm_0.4.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
index d341ecf..72f0921 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
@@ -9,3 +9,8 @@ SRC_URI[md5sum] = "7c87da94656b620dfe532ca63d642eb8"
 SRC_URI[sha256sum] = "b2d701b25ad3f9a1542057f3eb492c5c1d7dbe2b8d1e8f763043dcc14ee1d933"
 
 inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netclient \
+    "
-- 
1.9.1


