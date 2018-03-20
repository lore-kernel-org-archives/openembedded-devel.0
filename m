Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 05F0E78992
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 15:13:28 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n11so1656402qti.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 08:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QkYLXCcJfOVtwZynqdLM+FOa9ghm3V30Nj4TgkFURlQ=;
	b=XhmIuzPuPStUrScdQVwLqw9liRcK1zZzJ4sXehoj2/F7xm93f8hHTUybEL5BvNGoEN
	MVYm1SGe58JnkSRx2s/8uV9tCRhwDFWQCqihjXTjW3sTaWR3s0l8kaxw5g7TyGAe/8iN
	5k3n2kRzvQcCays8nvs6pX7cZts+Iv+eRY0pDTKqP2ASAWRCpL4Ownv5O7Xm2DV4g+aG
	3vAYhYDOB6VKOTlxknrlQe7qsby4T7If+3CtFVJNa5kxxMFn4tKgbjBheP0XoImfncIa
	+JA/8upwNA2hMqvkTRa8qoTCKG7Z9b+2wvzlu2QAEE61ELYZYNCP1Jvh4RTg8LXXXpEs
	xKeg==
X-Gm-Message-State: AElRT7G2NN8plfhcKJEgZJ3PiKvEQoTHg78+cn4H9M1JfbnNDXyM+fmv
	IyqIaO6HYMQNaKugEB92H/fJukjE
X-Google-Smtp-Source: AG47ELsofMNjXcaUU8ehUedl0vgu2aOLNw0Lbxu99RQKFMrrhkViWPJg7ojU/FQ9jtJxTkJHmSXIpA==
X-Received: by 10.200.36.35 with SMTP id c32mr3363630qtc.43.1521558809145;
	Tue, 20 Mar 2018 08:13:29 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id m66sm623208qkl.57.2018.03.20.08.13.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 08:13:28 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 11:13:01 -0400
Message-Id: <1521558781-2452-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-attrs: add crypto to the RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 15:13:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attrs.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index 12410bf..ad76852 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -9,5 +9,6 @@ SRC_URI[sha256sum] = "1c7960ccfd6a005cd9f7ba884e6316b5e430a3f1a6c37c5f87d8b43f83
 inherit pypi
 
 RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-ctypes \
 "    
-- 
2.7.4


