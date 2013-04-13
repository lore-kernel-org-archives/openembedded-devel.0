Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQytJ-0004eC-Qu
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 13:45:23 +0200
Received: by mail-ee0-f44.google.com with SMTP id c41so1641699eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 04:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ep/TT1NFpYvE3DqglqdmwFerGjyXF23fe385xQGemm4=;
	b=fENDOv3el19hcbPj4blndzO/xx75b7SIbUCTB/5e14nhl4xbK2kfAzAnDc4S3Ccozx
	kWjxw2qGKJQ4nFv9u7X2U//rr2yv5w8ZycHKNg4JyQM5lYqqa0CDHsaVc2WgNQdRTlxX
	crDALFB0hJ7sThT9VlLvxcYvMfAGEbn7h0WRleLC84adFIaroRKg/oZENFRNsdBxvnbH
	t6MJhzp7sZ7Yp6dCyAt6Yo3IDPhTzMPS9KBRJPK1JX0j1Xw/iVoDIqdu1S2UH4cnbS8J
	6ZEq/uPmEpIkA+Iz0vw9i6ptAU83qA9BpCuvTgaPWUMa03Nq+QMEk83vHgmBgk67wbNW
	SBJg==
X-Received: by 10.15.22.76 with SMTP id e52mr38863650eeu.7.1365852464339;
	Sat, 13 Apr 2013 04:27:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q5sm15855434eeo.17.2013.04.13.04.27.43
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 04:27:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 13:27:40 +0200
Message-Id: <1365852460-3361-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365852460-3361-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365852460-3361-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 5/5] rpcbind: move bbappend to oe-core subdirectory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 11:45:36 -0000

---
 .../{meta-oe => oe-core}/recipes-extended/rpcbind/rpcbind/rpcbind.service | 0
 .../{meta-oe => oe-core}/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/rpcbind/rpcbind/rpcbind.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind/rpcbind.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind/rpcbind.service
rename to meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind/rpcbind.service
diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
rename to meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
-- 
1.8.1.5



