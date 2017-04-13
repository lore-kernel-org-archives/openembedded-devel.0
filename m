Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id CE29577E0A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:30:02 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c45so8101298qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 07:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=iHl7tcQLARH9oUxGPTACqdI20b/ZltMhyEQ34IqrfvE=;
	b=f7NSW8HzEWqnka7r9/SbFF7hc+VzbTlcNHQGI8qfYWxacXbDesPuNW57rRQ0B4RVRu
	uCnZ5cWJT9TNyKiWjy6+pQW8BOpzPVU5Dgzp3KpbSolw0Lxs+j336Fa2qhfcnRUawYsa
	u6QYhg/TwIkN05l5+ZsTaVodeOGNd8n3biz4Qd4BjzO5PMWReHUBjYuVNnBfCVn6A5Ht
	Fq8djHWcvAERD7YNylJD9JqRwEHQVLDbuTwO9zx2pSGVxEr7ajJ7qil8F4pkn5hZoeJP
	RX7fmQzudspuduZpMXIH29xIG6eM+OsrNp4qieTWSPxcNofZkaiuIb/I6ImUNHafVlh7
	x3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=iHl7tcQLARH9oUxGPTACqdI20b/ZltMhyEQ34IqrfvE=;
	b=NBOYZNLkZXRmNyZxoxf7bvzEE2kXfI9YLCW+X5IWBCuhMusdzZot4NXAqGjsxC3W31
	3n8qTJCN6m0p0vXSWhnd18eLapXSQAWFvbT46J50rMvCQeor0r0NbOajmTF/I1RZ4s4h
	Sn8i+kAPsYDASfh1m8sZNJfrazRr0blnB6pIhtl/K9+SXZKfjUTZ1C1vYYV0oMFTaufU
	3VRAkf8HMGsph8mv2iPEB4wS4duoQLVLj/yJ15U1C/m118AyeGQA4UBR/BEm5mL+fhTE
	ImpoNIG0vV9QY7QxjUgr5v4W9IGZX8tcgAhIeJ75C0i44yBYFmrDyKfEkngL5qBE7a/l
	J/mQ==
X-Gm-Message-State: AN3rC/5AD7vmQonP1iCIFbalpFFuyzvQUd6YPaxYY9Vj1RDya0AxHudQ
	yS4rJh02T3KKeQ==
X-Received: by 10.237.53.218 with SMTP id d26mr2756975qte.149.1492093803634;
	Thu, 13 Apr 2017 07:30:03 -0700 (PDT)
Received: from centrium.lab.ossystems ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	c189sm3086775qkg.6.2017.04.13.07.30.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Apr 2017 07:30:02 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 11:29:43 -0300
Message-Id: <20170413142943.13749-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH] libsodium: Extend recipe for native and nativesdk usage
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
X-List-Received-Date: Thu, 13 Apr 2017 14:30:03 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
index 22d315504..cbcbe96cd 100644
--- a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
+++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "b58928d035064b2a46fb564937b83540"
 SRC_URI[sha256sum] = "a14549db3c49f6ae2170cbbf4664bd48ace50681045e8dbea7c8d9fb96f9c765"
 
 inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


