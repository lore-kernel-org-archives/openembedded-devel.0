Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 008A260CA0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 16:33:11 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id a15so4029009otf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 08:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+CZjVSxYwIe+gIX7PkSRt0tFSfz6ZIOF02v4iKglk7w=;
	b=e1eq83bP7NFECcMA4B4eMGcKOsN6XuExwv4TBE+JBih38FmR3xbXAqQMdgf04JX0aZ
	C0/skNAdBSi4bsM7gCRfG22zH5XWnc3nLaTOPu7LpgEdl4JgDn+QyrdKcXoL0TnDGwuW
	12S75uP4BNehv31lfRtwbzfiZH1HaxvOEWzxCWvihS/ylIeln/rjDIjM7Y6EbuhK5N6M
	X9ZsqB4D+6bu+4NndPxVOuZVc7/mUGL9cFFsYkdgaCxBCBZn2/uhJzN3mJSmpNol22++
	aNSu9HOwUVii+Y8yJ1TBGjZGusR3jmX2Quldhiax840HU3E22gALG4fOSJAdeHlFqTEl
	rHcA==
X-Gm-Message-State: APjAAAWeUzfsQbHowfUhbG5d2gDfqePKdIlV/GnGtGbBU7Q/InONJ1vJ
	/smlE/nTvk9hgVra2UkGCXJbgcB9/Wo=
X-Google-Smtp-Source: APXvYqwB21/Gz2n2eVmk5o9F6AnwJ99z5dKtyI07lsEL/v7bdnztHJOSbsj6r9DFq+ffGw3SDb28jw==
X-Received: by 2002:a9d:bb8:: with SMTP id 53mr5893855oth.150.1581265992688;
	Sun, 09 Feb 2020 08:33:12 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	p83sm3136547oia.51.2020.02.09.08.33.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:33:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 11:33:00 -0500
Message-Id: <20200209163300.19063-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200209163300.19063-1-derek@asterius.io>
References: <20200209163300.19063-1-derek@asterius.io>
Subject: [meta-python][PATCH][v2 2/2] python3-aiohttp: alphabetize RDEPENDS for readability
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
X-List-Received-Date: Sun, 09 Feb 2020 16:33:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-aiohttp_3.6.2.bb        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
index 979acc9cff..121447cdb7 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
@@ -11,11 +11,11 @@ PYPI_PACKAGE = "aiohttp"
 inherit setuptools3 pypi
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-async-timeout \
+    ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-chardet \
     ${PYTHON_PN}-idna-ssl \
+    ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-yarl \
     ${PYTHON_PN}-typing \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-attrs \
+    ${PYTHON_PN}-yarl \
 "
-- 
2.17.1


