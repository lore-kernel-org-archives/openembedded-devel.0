Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1ORidy-000538-Gv
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 11:26:51 +0200
Received: by fxm13 with SMTP id 13so1877235fxm.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=hjleyQiGw4X/tZNNd4IT53k8c2Gwz92MMv7rwrecu70=;
	b=VgvrftWQgS1O6dXLLxyG0zb4u7XCBSkeyyc038Mj82PRCS27qkdnOaBcNqWSEzxLND
	X8R1HsfC4NvZmz2q7cflTYUo1BtZRduVyDU1WG39IjBUoHDY4nkIHTWBpFRxOH2D2ZWE
	0UWSM0k4L9H3tsA9jlXe/2NzbuqaQd7awoe+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UvzalWcMMARarym2FiGPt/CwEjRwqrsURaWKYDvHbBCXhh7X0kXenm0i+qSCN95Pfk
	XhGDwp4vLY1OO473BE9S8dXhyrI4cLRuZEStW5ZGhLOQV2TKsrCJzS+OlwsJZ0OgZL6K
	pKPfSvSW2OuzPfrFiZM9BJWnV/TWHEYuUfROs=
Received: by 10.223.92.144 with SMTP id r16mr9005671fam.62.1277371088541;
	Thu, 24 Jun 2010 02:18:08 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm40341492faf.3.2010.06.24.02.18.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 02:18:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jun 2010 11:18:00 +0200
Message-Id: <1277371081-15867-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.51
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] evas-native: drop PACKAGES_DYNAMIC to hide multiple providers errors
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
X-List-Received-Date: Thu, 24 Jun 2010 09:35:25 -0000
X-List-Received-Date: Thu, 24 Jun 2010 09:35:25 -0000

* while building image lot of errors like this:
  NOTE: consider defining a PREFERRED_PROVIDER entry to match evas-engine-buffer
  NOTE: multiple providers are available for runtime evas-engine-fb (evas-native, evas)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/efl1/evas-native_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/efl1/evas-native_svn.bb b/recipes/efl1/evas-native_svn.bb
index a769976..5a599ec 100644
--- a/recipes/efl1/evas-native_svn.bb
+++ b/recipes/efl1/evas-native_svn.bb
@@ -1,6 +1,7 @@
 require evas.inc
 inherit native
 DEPENDS = "freetype-native libxext-native libpng-native jpeg-native eet-native eina-native libfribidi-native"
+PACKAGES_DYNAMIC = ""
 PR = "r3"
 
 EXTRA_OECONF = "\
-- 
1.7.1



