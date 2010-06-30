Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlQv-0001MW-QY
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:45:47 +0200
Received: by gyc15 with SMTP id 15so146406gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=MnNsUwHtVNTty2zckPKUfv/bL53588jL9C8oZF/pKwY=;
	b=Grhoe0uRJzMt0WFh1QA1PeVaL5ftR3MqCiKRRgm6WASBk5YxJw6UAZfwMX7sUdikVj
	qE7+HBbV2+xVT2ZLq7wybezdQZL5ykj34usQ3pIxjb416CjgqZHbRSFJvpcy/BwSZqbS
	xs3OW3FZ9yL5FwWgbI+LOfJ0p1Upj9qoZh7kE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=oKvrNVj1QXyIZma75kcgsqnygrGFE1AnQ2y52EcGV85ZMaUJkLiEx+HjyZ7r9ptUzj
	nNBuNuU5moiTs6x13Agj+0DEkRMgmSJov+C05NlKqI1yOYZj4tUNRyGPTBA6D4/XMBtc
	b/9WfliBKjDlHFTSRX1ChFlUt2WxW5uxJgmBM=
Received: by 10.100.246.4 with SMTP id t4mr9583111anh.138.1277858462009;
	Tue, 29 Jun 2010 17:41:02 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id 36sm344282ybr.8.2010.06.29.17.41.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:41:01 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:40:40 -0300
Message-Id: <1277858443-27280-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
References: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/5] Remove mistake configs
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
X-List-Received-Date: Wed, 30 Jun 2010 00:45:47 -0000

---
 recipes/cgreen/cgreen.inc    |    2 --
 recipes/cgreen/cgreen_svn.bb |    6 ------
 2 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/recipes/cgreen/cgreen.inc b/recipes/cgreen/cgreen.inc
index 9c71db5..eb3307e 100644
--- a/recipes/cgreen/cgreen.inc
+++ b/recipes/cgreen/cgreen.inc
@@ -11,5 +11,3 @@ BBCLASSEXTEND = "native sdk"
 
 inherit cmake
 
-#FILES_${PN}-dev += "${bindir}/*-config"
-#FILES_${PN}-utils = ""
diff --git a/recipes/cgreen/cgreen_svn.bb b/recipes/cgreen/cgreen_svn.bb
index 88dad6d..65f2f34 100644
--- a/recipes/cgreen/cgreen_svn.bb
+++ b/recipes/cgreen/cgreen_svn.bb
@@ -13,9 +13,3 @@ EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
 EXTRA_OECMAKE = ""
 
 OECMAKE_SOURCEPATH = "../cgreen"
-
-PARALLEL_MAKE = ""
-CCACHE = ""
-
-
-
-- 
1.7.0.2



