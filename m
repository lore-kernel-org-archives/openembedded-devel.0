Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB9373216
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 17:37:48 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id e1so15891741qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 09:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=n5wxCUkBkwHtQVFLPkiEXByO2qDnVVPcE96BVhKs2HE=;
	b=tjrSV8idVsM+EW8YjVCgfWyOT3zON/q2cK7/fmPUTy3nbqAciwRHz7whDFXPekj7F5
	nFbnEsrwVNImuMZfycquH5wD+nbghU+X0KiZBgyWB7H1qEbt6F5pmnZIlk6gfQY6OZ6n
	Ly4ztIlS9MQ9JTC7d7HYAf1CzU63LTo8UyHE9UyHAeaTcTpWFAd/LZKDLZQKNZMzwiTu
	fCkBtHvn7TtvmHENEwuqFU18jG69hLr3o/pdwDmAxG7fL9vCTGrlAth8K4/dQv7cB4Ve
	qZDZlHP7tnzyPl6+f0viUKwy3ZM8+I+3D5l/GhTwx4SXsYlatQ1OWa/x9pTD9rJnYFic
	xbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=n5wxCUkBkwHtQVFLPkiEXByO2qDnVVPcE96BVhKs2HE=;
	b=VPocbn/a8tkI6Qy/FOhDKxJ/1A6nCODd8VCHuEav5f/9nGwzilPqWuoPlDLL0VcVja
	sNmIFM42ZP2lWaFPp0zcXvpZ2Jy8zbvahlKEdQB/P/40yNCSQfA1MnpGm9FdOi9W+AaH
	NWDW7Pi4OLNga9Fc6LFFBKecARxeqvZDg96byZPDQa8Qka+MTOBHZOU0d4KIU9DHeYCU
	S7d03Ne1O/U2HV5QVA0DKeEPsj0zdVcRYSj9Xl+Ix8DPAeIYsXHy/j0V4WoKo8u6lLrQ
	MlIvNYdpLxfwDXZm1pIiu9tbIgT5uYTmbNjVNOEIHEzdMj30KvKZxnv5sTI1c27INqi3
	RfLQ==
X-Gm-Message-State: AMke39moySxrthNueX2u2IrfHNJyrnxonWggrLLypJkqK6cXmIfVtqQqSReoY1W2N1lnRQ==
X-Received: by 10.55.203.88 with SMTP id d85mr2881075qkj.169.1487007469146;
	Mon, 13 Feb 2017 09:37:49 -0800 (PST)
Received: from thuvia.localdomain (pool-108-4-175-67.ronkva.east.verizon.net.
	[108.4.175.67])
	by smtp.gmail.com with ESMTPSA id i1sm7932858qte.32.2017.02.13.09.37.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 09:37:47 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 12:37:43 -0500
Message-Id: <1487007463-12083-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyyaml: Fix build for per recipe sysroot.
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
X-List-Received-Date: Mon, 13 Feb 2017 17:37:49 -0000

Reverse order of include and inherit to prevent DEPENDS=
being overwritten.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-python/recipes-devtools/python/python-pyyaml_3.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb b/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
index 6d9f3e9..5a4c92d 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
+++ b/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
@@ -1,2 +1,2 @@
-inherit setuptools
 require python-pyyaml.inc
+inherit setuptools
-- 
2.7.4


