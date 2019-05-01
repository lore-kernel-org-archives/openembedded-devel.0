Return-Path: <parthitce@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 547607D458
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 12:52:59 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id t76so3186424wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2wK0PewNULU2hAZMoVhBMxeSDLPNbOV4bLP7G4cgrkE=;
	b=ORCzLL2/KSRuMz4DhI2KyywTB1z0heTPZA3DExPLH8aFy/vwC4J/PQgM5M0j9d5W0c
	kSzXiMJDb7/iJmk+ZRW2HDpLYtb43EuTWlztKzcdsg0cEAalh9BIQQS9iDQ5QFgVR6zT
	WaqsFmsqnPT9SYuTdB1Qd42oZMZGmLtWhqenspqK5+J4wa4TpGUSBZNk0bkmG9yF4ZUz
	3MvdJ4YtZlQTpkGx8IeeTQ8as51fPsDY4fHpbuC9/YrHR+lX36hIrbRAAt4KGA95xDaA
	xPDQa7jeP+LXbva8sV5tijyCOuunUXebSgbA6n+SNTNsgX9tFbMPz7C9RXlh7V1v9kz5
	zJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2wK0PewNULU2hAZMoVhBMxeSDLPNbOV4bLP7G4cgrkE=;
	b=TDGFXnj4Ylpj4avMR1FuC0Q6tI/LMCWrXss2E2qXotk+qOG25CnnrAno3G2YMuTejl
	w7dOP2WUz7RL7wyuIcByRH4CDkNx5I3EwpAbI9r9MSXxWElnHPpqqtLKJuTK1JUIWrlk
	/edSRuY5y6GJmA5JByE1RkMRRRcyXrIphE81WkeqpHclPbBy9Df+SFljSL8gmQXkBx/z
	GKyAu4xr3hwWXztjhkJMy1kK0czzihEBrPMLk53XeF+uIOV5qgrXRAeiV2g0wA4NOdfi
	O20UrAZI7PhOixaDuUcdwJWkJZ8bhSKUyWnnX/sUK/njjIS06vH5Q9Wsddr6qHl8sorP
	6UfQ==
X-Gm-Message-State: APjAAAXW6QaxW0DmOPx88KI0XmoBpQf7I0ZV94cx/HlUchC7dAuIdPG7
	/63XBLgJV0TFfk0o3FEEEFjuMcBWNA==
X-Google-Smtp-Source: APXvYqxdIsEitSAlODvnviePyxbQ6hi0TbkPMV58/627IUGkRFDQcwf5syatfDZM6SQS9jwH9mJtZw==
X-Received: by 2002:a7b:cb4e:: with SMTP id v14mr6351768wmj.52.1556715179794; 
	Wed, 01 May 2019 05:52:59 -0700 (PDT)
Received: from xpert.denx.de ([62.91.23.180]) by smtp.gmail.com with ESMTPSA id
	v20sm1047674wmj.10.2019.05.01.05.52.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 05:52:58 -0700 (PDT)
From: Parthiban Nallathambi <parthitce@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 14:52:50 +0200
Message-Id: <20190501125250.2990445-1-parthitce@gmail.com>
X-Mailer: git-send-email 2.17.2
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [PATCH] python3-websocket-client: add version 0.56.0
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
X-List-Received-Date: Wed, 01 May 2019 12:52:59 -0000

DEPENS on python-six

Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
---
 .../python/python-websocket-client.inc         | 18 ++++++++++++++++++
 .../python/python3-websocket-client_0.56.0.bb  |  2 ++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-websocket-client.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb

diff --git a/meta-python/recipes-devtools/python/python-websocket-client.inc b/meta-python/recipes-devtools/python/python-websocket-client.inc
new file mode 100644
index 000000000..c4214b2fd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-websocket-client.inc
@@ -0,0 +1,18 @@
+SUMMARY = "websocket client for python"
+DESCRIPTION = "\
+websocket-client module is WebSocket client for python. \
+This provide the low level APIs for WebSocket. All APIs \
+are the synchronous functions."
+HOMEPAGE = "https://github.com/websocket-client/websocket-client"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
+
+SRC_URI[md5sum] = "89484bd5dac71123ae6a09b2f90fe62c"
+SRC_URI[sha256sum] = "1fd5520878b68b84b5748bb30e592b10d0a91529d5383f74f4964e72b297fd3a"
+
+PYPI_PACKAGE = "websocket_client"
+inherit pypi
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-six \
+"
diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
new file mode 100644
index 000000000..9b6696ead
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-websocket-client.inc
-- 
2.17.2


