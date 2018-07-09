Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2149F605C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 22:07:02 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h4-v6so16738278qtj.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 15:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MWhs3B8jXkVxSgUJTk2V0WABwtOoTMrArJM2or0oFnw=;
	b=czCn4ibvIh7ERekl2CzAeipaRDS/bAhRqtnioVP6IkiODPcpldJJ7RMWi3b+RYj1PP
	b3tg8tj+gNS7WWTMEhV7ewxAaiZqKq4SIytTrgWPFRxIpFlkCFcCPdtUgxPhknx8Z/29
	UjrV2SGpdsIBgOvfuzc9IumRVI2ze/V0hof/TYmIbtFUdjNXOolldQIlvgb7XvNFyj/U
	lqLMbXN+itwwZ+7rXR4YEmT1vi1ySvsCYPapV2DTBtL8NV2pGh7zkPn0hC3CwjCPc5Vh
	tSF+zvEZUkHI3QTH+oYzHcpr9ZFhM4IAcajv/HF1HYaqt1A6BE1iPwCDEv6JwXmla4yR
	giDg==
X-Gm-Message-State: APt69E2vodQWyqK9Pa8+C2OiAgAznqqdHDGpMgKa1xsG38iAkLpwgqQH
	K9vhT+/aVIqJeWzO/3FpistXAUxF
X-Google-Smtp-Source: AAOMgpeonRx2vJf+F7QBOBvWmB4/OnQH27NkoZJ7dtZoAbH8a8UUT7FNybKzskPRtS8nRR4hiR/+xg==
X-Received: by 2002:ac8:1afc:: with SMTP id
	h57-v6mr5979433qtk.175.1531174023633; 
	Mon, 09 Jul 2018 15:07:03 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	w10-v6sm8439543qtn.74.2018.07.09.15.07.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 15:07:02 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 18:06:52 -0400
Message-Id: <1531174012-25360-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-simplejson: update to version 3.16.0
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
X-List-Received-Date: Mon, 09 Jul 2018 22:07:03 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-simplejson.inc             | 4 ++--
 .../{python-simplejson_3.13.2.bb => python-simplejson_3.16.0.bb}      | 0
 .../{python3-simplejson_3.13.2.bb => python3-simplejson_3.16.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-simplejson_3.13.2.bb => python-simplejson_3.16.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.13.2.bb => python3-simplejson_3.16.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
index e28d518..3d36f96 100644
--- a/meta-python/recipes-devtools/python/python-simplejson.inc
+++ b/meta-python/recipes-devtools/python/python-simplejson.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[md5sum] = "870bf6257465ce2ee8cad14e2394f7eb"
-SRC_URI[sha256sum] = "4c4ecf20e054716cc1e5a81cadc44d3f4027108d8dd0861d8b1e3bd7a32d4f0a"
+SRC_URI[md5sum] = "744fa99aed207478f8fbf9dd9f04fad3"
+SRC_URI[sha256sum] = "b1f329139ba647a9548aa05fb95d046b4a677643070dc2afc05fa2e975d09ca5"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb b/meta-python/recipes-devtools/python/python-simplejson_3.16.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb
rename to meta-python/recipes-devtools/python/python-simplejson_3.16.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.16.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.16.0.bb
-- 
2.7.4


