Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 61CBD60097
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 13:57:06 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so3814845wgg.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 05:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=W5o6zPxXQlGNV1qGTFwRXKqh1Nulau6nqZ2EHk8lnNI=;
	b=Qy2hrY3hJPrV/y21eG2EqfNwv0WCRnV4XkuapZ1KkTYO+kfEdjzshfCdffimAsr0fE
	Ioy5ROxQjgPuQGnCMYuR+bov7S2rhcb91/23qnAjAiyFsEDDE1Wu8s44Gv+5lgLxHb1d
	zlS5u7vBfWY2kEGomB3gc1+wo3MMqSDdJ0G05YucT2x/h5nHIlHvy45GJk6Kw+jgwV+z
	/aD/j6fRG9HgkIHYBQP9H3UsO1NRg9qel/pastvDaRST3RVujVcNCqOA+51ioIeQFZB+
	Ey92zL0oF9HbXPHCgDb+fNjYDlCFJTjoCxP1HUfPEwrNvGQKtEdvFgOYOc+1kGeb45h/
	cEgg==
X-Received: by 10.194.234.40 with SMTP id ub8mr50599440wjc.100.1417010227210; 
	Wed, 26 Nov 2014 05:57:07 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	vm8sm6493683wjc.6.2014.11.26.05.57.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Nov 2014 05:57:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2014 14:57:04 +0100
Message-Id: <1417010224-9996-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [meta-oe][PATCH] iotop: Drop python-distutils from RDEPENDS
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
X-List-Received-Date: Wed, 26 Nov 2014 13:57:08 -0000

* nothing in iotop is using that for normal function

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/iotop/iotop_0.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
index 111b072..d629245 100644
--- a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
@@ -20,6 +20,6 @@ do_install_append() {
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py  || true
 }
 
-RDEPENDS_${PN} = "python-distutils python-curses python-textutils \
+RDEPENDS_${PN} = "python-curses python-textutils \
                   python-codecs python-ctypes python-pprint \
                   python-shell"
-- 
2.1.3


