Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id B7635606CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Oct 2016 20:17:09 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id m5so2039774qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2016 13:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=/X/z+5gWf+cNlJKOAY2UU8Z/ZPoGFZi1crzeS1qgUaA=;
	b=Qb70rm3qKgWht4PcJujXHXpYHj7e/hSGy9Vns2rDqLHqZ4FKDr50ZPTD1s9Msow8Me
	Of6hTvnehkErVx3j0CKs13tGqOihNKxNMK0CH+4AI30YJeHRfZRbxBxK5ZCO8aNSZQH6
	ktI1qK3bihNIzVtrepIiX9v3H9QuERG4fZ9aKg1SQpFFEQIqQD2jDaPyaC9ahrrUDGbo
	kqM3pnQwC5E+IY26wNIE0jPzisWEIOpBLzZAaJ4ss9BdkszmmtkoS13kDhk6CM2F41a7
	LLB1zf48N4wGOgmSj0HS46cgbCTRiak1yTN7KLEiNiRGKtUInL7D3iQOGPEsERWUiMDU
	37Sw==
X-Gm-Message-State: AA6/9RmV4jgamD+n/UapQMdMS5b//s2WfH6Kr9/dPw+dE9wxNfz8L2O2bDHSzEva/Cp3mw==
X-Received: by 10.200.45.133 with SMTP id p5mr11878145qta.32.1475525830668;
	Mon, 03 Oct 2016 13:17:10 -0700 (PDT)
Received: from localhost ([177.100.224.38]) by smtp.gmail.com with ESMTPSA id
	l187sm17882096qkc.8.2016.10.03.13.17.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Oct 2016 13:17:10 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 03 Oct 2016 17:17:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon,  3 Oct 2016 17:17:02 -0300
Message-Id: <20161003201702.9024-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.10.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python for-krogoth PATCH] pypi.bbclass: Allow fetching without requiring the hash
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
X-List-Received-Date: Mon, 03 Oct 2016 20:17:10 -0000

This allow the fetching of packages in a backward compatible way[1],
using un-hashed packages.

1. https://bitbucket.org/pypa/pypi/issues/438/backwards-compatible-un-hashed-package

A equivalent fix is available on master in commit 7edad4d (pypi:
update the base pypi url to use the package info without requiring the
hash) so this is really a backport but without unrelated changes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
index 659e1c0..cd27cd2 100644
--- a/meta-python/classes/pypi.bbclass
+++ b/meta-python/classes/pypi.bbclass
@@ -13,7 +13,7 @@ def pypi_src_uri(d):
     package = d.getVar('PYPI_PACKAGE', True)
     package_ext = d.getVar('PYPI_PACKAGE_EXT', True)
     pv = d.getVar('PV', True)
-    return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
+    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
 
 PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
-- 
2.10.0


