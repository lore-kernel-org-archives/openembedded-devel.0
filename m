Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1F078473
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 17:42:58 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id 136so6386272qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 09:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E6jpdBxjeacupUtH6Jq6BRDWeH34hLhM2iEnwHq0sIo=;
	b=XK8Zi6ghl9jmQL5NupvorMdxdRZTroLw0Mz37wdvjqJ2m2MC2LCxphPvugOPdOFSJi
	5fKN7OV6ybXxUrvZ9lXNgOvphDnDKHE1fDrvW3kKbNVTxANnXn5NExqmuH33xot+rG1F
	+Mgnif2TLbuW6qnPcDYwVRiGnLGV3yxmAdMwj27fW4NRTTfLziEsh+aOqmL4DG/pO3fi
	SI0+e7T3NgnLkHh2KHxKE9E+kaGK/jCyOFd7MoDvC0YVDNrcdEuDJQtcKaJnZ3Lcn1SC
	JK01zsLWcohOqAWvdGpw/tEDt4TDbGI8A/B5km9IMe3zBNUAjFYFJkNcrdhSY5CMloIh
	WdvA==
X-Gm-Message-State: AJaThX4Y4aVBVw/Ahk/+DUNZJ2lzs96kLFdQbMzQwXikCtIbjsBVhGfu
	1db3zAf7tze1VI8b5pRqHOM5YFi2
X-Google-Smtp-Source: AGs4zMaagCkcNj9vtF0JIqaS1F5gH4NoJKGdntcR7tC+LUJz5PO4i1thASeuOjp0gchy7LpGjL7ktQ==
X-Received: by 10.55.56.147 with SMTP id f141mr9463281qka.310.1510508580043;
	Sun, 12 Nov 2017 09:43:00 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	b202sm5523657qkg.18.2017.11.12.09.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 09:42:59 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 12:42:52 -0500
Message-Id: <1510508572-11203-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-simplejson: update to version 3.12.0
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
X-List-Received-Date: Sun, 12 Nov 2017 17:42:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-simplejson.inc             | 4 ++--
 .../{python-simplejson_3.11.1.bb => python-simplejson_3.12.0.bb}      | 0
 .../{python3-simplejson_3.11.1.bb => python3-simplejson_3.12.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-simplejson_3.11.1.bb => python-simplejson_3.12.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.11.1.bb => python3-simplejson_3.12.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
index 13c0456..7f436f2 100644
--- a/meta-python/recipes-devtools/python/python-simplejson.inc
+++ b/meta-python/recipes-devtools/python/python-simplejson.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[md5sum] = "6e2f1bd5fb0a926facf5d89d217a7183"
-SRC_URI[sha256sum] = "01a22d49ddd9a168b136f26cac87d9a335660ce07aa5c630b8e3607d6f4325e7"
+SRC_URI[md5sum] = "048548acae58984b3e939b3bcf182c8e"
+SRC_URI[sha256sum] = "df5e38f5e0a24abe0e02276aa5c3f8504150047a51c0b6b848b8153e6e6d395e"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-simplejson_3.11.1.bb b/meta-python/recipes-devtools/python/python-simplejson_3.12.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-simplejson_3.11.1.bb
rename to meta-python/recipes-devtools/python/python-simplejson_3.12.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.11.1.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.12.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.11.1.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.12.0.bb
-- 
2.7.4


