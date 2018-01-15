Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DBAB071ADD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:14:15 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f3so358097wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qMOre6cVTAvC4ZRF3FfLrnLtWgKaIOz5yFZHnOn6/qA=;
	b=lK+PVY+cIZlrdHgzsBqGehCKapleIO5OMwYh4BNyb4KXvRltVYJeO6AcWgUQM+m7Mv
	jnASplXtrbagK8ZF9oyjFVlivXQw9ZZ2FA2kV0EXdYbZkME75Vg7BMhoQD4Wfk/urqH2
	iQMGZMywFVAy+W88tjFqyENF9JTn1FuP5Rbbd5LN6ffqRy5oPOTUDVy526OXefa/IcdN
	rBRN+7cXVsFWCtk3I5LQmhZgQtdWH5vXTm7dnIH715WB02vK2D7iJGd9l6VG5YfGVws9
	EuUA+ITfvbMIB2Qcb/J3I3dgXUHRvDfXFUJz/X5NrpBw2YRDC8FhY4axJnRx+kWViTNU
	/NhQ==
X-Gm-Message-State: AKwxytcG34JBWe9Y4QbZXT4NwZh8HUVUP4+sOWpFYgRShJHB6TnZTdeo
	YLiVIVGcotzTdycX0HgHtssPYJtn
X-Google-Smtp-Source: ACJfBosIJZfewSW/6QYpJbWq+qOVqWOWZ77iY4xMzEjmqLaOleR4KPSHOuQsaxq1w8YpNXby/1cDFg==
X-Received: by 10.80.140.99 with SMTP id p90mr2221574edp.284.1516007656361;
	Mon, 15 Jan 2018 01:14:16 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d3sm17254591edc.15.2018.01.15.01.14.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:14:15 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:14:08 +0000
Message-Id: <20180115091408.1133-8-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091408.1133-1-git@andred.net>
References: <20180115091408.1133-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 8/8] python-tornado: use beginline= in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 15 Jan 2018 09:14:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

'startline' is not a recognised keyword, it's beginline.
Also, 'endline' was wrong, as well as starline (beginline)
as counting starts from 1, not 0.

  python-tornado: The new md5 checksum is 8d463fc66ff8f275354ffe88d1896e12
  python-tornado: Here is the selected license text:
  vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=3 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  # Copyright 2009 Facebook
  #
  # Licensed under the Apache License, Version 2.0 (the "License"); you may
  # not use this file except in compliance with the License. You may obtain
  # a copy of the License at
  #
  #     http://www.apache.org/licenses/LICENSE-2.0
  #
  # Unless required by applicable law or agreed to in writing, software
  # distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
  # WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
  # License for the specific language governing permissions and limitations
  # under the License.
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=15 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-tornado.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 2c586556d..dfaea5c82 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -4,7 +4,7 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
 polling, WebSockets, and other applications that require a long-lived connection to each user."
 HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://setup.py;startline=2;endline=15;md5=5ab7571a79ad62d0ca7aea308bac7560"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=15;md5=8d463fc66ff8f275354ffe88d1896e12"
 
 SRC_URI[md5sum] = "ab41f6765d58089f30ba51e8ec084a7b"
 SRC_URI[sha256sum] = "1fb8e494cd46c674d86fac5885a3ff87b0e283937a47d74eb3c02a48c9e89ad0"
-- 
2.15.1


