Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id F259971915
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:46 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so28821wgh.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=vB/9TDU6o9wMLqIH4oyAvamrGyIkOvGIXFZEMN1gGJ0=;
	b=Q8pEFWQt/B9N6rLFWOpHtpQ34DzDlFLih4rrwO4OBV8s5zBIzHYOygDt8q1VJ67onC
	RXgqfv0qqdH/Kz47kVi+CxN+oMRIkI/l0UI41WCx8SVZIcnGUjRQ/WkfIErP04XUvq82
	SN62cH4rvasteV0W3p/3vGcu63SU42je5XgIqRGnd0mX9jD8bzCufreBBhRcM46FFWrZ
	c+a28mj5POHTGhgY/RBfemvmfVdUvj4uFE8jaQwtxJ7ZAnN2XGdgwgPOItSTlxKIISBL
	n7wnae4LM7L6taTIAU+pPeFiu7V6yLrVZa9BtkTxA0/cmWXTP1U8dHIBqPSZeGqsvTfC
	PPIA==
X-Received: by 10.194.158.33 with SMTP id wr1mr5295689wjb.112.1413324886815;
	Tue, 14 Oct 2014 15:14:46 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:20 +0200
Message-Id: <1413324868-11856-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/15] mime-support: add perl to RDEPENDS
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

most executables are perl scripts.

fix
| mime-support-3.48: mime-support requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/mime-support/mime-support_3.48.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
index a4628c1..7f8b40a 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
@@ -4,6 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://debian/README;md5=36bbe2ace0a05c3fb684b73208fbf30b"
 
 DEPENDS = "file"
+RDEPENDS_${PN} = "perl"
 RRECOMMENDS_${PN} = "file"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}-1.tar.gz"
-- 
1.8.3.1


