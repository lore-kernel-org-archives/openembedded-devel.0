Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QsGVJ-0001Bh-I4
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Aug 2011 17:52:05 +0200
Received: by ywe9 with SMTP id 9so2553024ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Aug 2011 08:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=dAvpFvClWsxUQBMdUt3JCs/nno96iVji4zVX27Up7HM=;
	b=bYRGwed8QPd6SetObedCI5eyjPAx21omXm+1BdRk/0qVzVXgqx7nvlonhM0JENqbCM
	DWkmi7zjZPAPUnOesgimYnRDp7trpTpVlLlikP9KcGV3gep8YeIMLT/ZLwx0/bc7ixno
	wjlQx/eMT2DKjM84J7QX/f8YrRiJn48u7Yheo=
Received: by 10.100.245.35 with SMTP id s35mr2235398anh.84.1313250451085;
	Sat, 13 Aug 2011 08:47:31 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d7sm3475310anb.14.2011.08.13.08.47.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 13 Aug 2011 08:47:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Aug 2011 08:47:15 -0700
Message-Id: <1313250436-32653-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH 1/2] ocf-linux: extend to provide native and nativesdk recipes
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
X-List-Received-Date: Sat, 13 Aug 2011 15:52:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/openssl/ocf-linux.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/ocf-linux.inc b/meta-oe/recipes-connectivity/openssl/ocf-linux.inc
index b98f887..f4ec7c9 100644
--- a/meta-oe/recipes-connectivity/openssl/ocf-linux.inc
+++ b/meta-oe/recipes-connectivity/openssl/ocf-linux.inc
@@ -22,3 +22,4 @@ do_install() {
 }
 
 ALLOW_EMPTY = "1"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5.4



