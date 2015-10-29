Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 67AA27653B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 16:27:13 +0000 (UTC)
Received: by ykdr3 with SMTP id r3so47979816ykd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9SK3VcasYOgehwurkIGXUll+wCTpLXUX9Yc6BAp9aL4=;
	b=icMn36gKees1Bq+/TJRpxPRLG6+Y196UuWin9IKghhcdH+haEY7m8NtOMVWYkqGoz1
	Nq4IQcrKhX1nSraKoqykAGQyqn7KGlCnXTBHX/G5KB1cJTTpIQvysijnF3RCnbywacvo
	/Mn8xgerKfhYMaJbg5FCxElhi4SJqYh8k9PN0Gf+Dgr8/5ybpT6cNf+v1BXnQp71v/JJ
	4YreLmaEielH1O8yVShVYx8QBlqSbtCAAIFfT6+O1EDlqQPzF1z8MNxaQw7gUIiTDEsT
	t9aYmX5g0IaB+KO7VdOh5ljQh7hzXX7gXtHYzuBtmogJD0ISACv6ajQP5MAJ/Ejk7xHM
	fJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9SK3VcasYOgehwurkIGXUll+wCTpLXUX9Yc6BAp9aL4=;
	b=m9H0QS6vDz1r0Tbk9tTMhSGkmDcYcJS/dsZdiq6eOBpI443R8v2EJbWiM1HFiOzKI6
	TNr5gwGx1BrlGpVlacbYQEF1vUROHbvJgJiCQi1hxxa5PtJXUr0i50WwWJ14PcXdJbn+
	Jb7qtgynuDLlNE2c7jMBgwIKEVCIiOvTEzhM9UjQtqrOIcT98p26y026mqhS6QEBoLxK
	WP9IOvG1WB62qdiDbyHp3vd/I4MRGkfvLLWe2r0+FIjivr2GJGbSIlhJt9M2QV+QPTOd
	vt0ke/54Q9qC0Z+QUaathoHO6Ud3sRyBzmrewkmH2oc+HVFDsMMSdhyjVJS2kXQnlSuW
	vSyw==
X-Gm-Message-State: ALoCoQl9MT9lcN5cia4KICMUbFZJblFG2qgVWZ37tbJFZhb/iVer9PBp8zq+IwLvMub+n072Sz8y
X-Received: by 10.129.105.66 with SMTP id e63mr2084012ywc.244.1446136033772;
	Thu, 29 Oct 2015 09:27:13 -0700 (PDT)
Received: from localhost.localdomain ([201.22.227.56])
	by smtp.gmail.com with ESMTPSA id
	f67sm1267890ywd.19.2015.10.29.09.27.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 09:27:12 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Oct 2015 14:27:00 -0200
Message-Id: <1446136020-13787-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-python][PATCH] python-cffi: Update to version 1.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 16:27:13 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../python/{python-cffi_1.2.1.bb => python-cffi_1.3.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.2.1.bb => python-cffi_1.3.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-cffi_1.2.1.bb b/meta-python/recipes-devtools/python/python-cffi_1.3.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-cffi_1.2.1.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.3.0.bb
index 0d0958c..0336bd8 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.3.0.bb
@@ -3,8 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS = "libffi python-pycparser"
 
-SRC_URI[md5sum] = "faca1e420e80433db409bb1bdd0a3f45"
-SRC_URI[sha256sum] = "eab571deb0a152e2f53c404c08a94870a131526896cad08cd43bf86ce3771e3d"
+SRC_URI[md5sum] = "a40ed8c8ac653c8fc7d5603711b06eaf"
+SRC_URI[sha256sum] = "9daa53aff0b5cf64c85c10eab7ce6776880d0ee71b78cedeae196ae82b6734e9"
 
 inherit pypi
 
-- 
2.1.4


