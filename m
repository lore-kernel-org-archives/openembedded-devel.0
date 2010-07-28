Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Oe7Kt-0003Oh-TW
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 16:10:26 +0200
Received: by yxi11 with SMTP id 11so998511yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=94Fmh1B4HWkzVDbz/qQunLi5jG4aCiaT0kxFgt+Eppg=;
	b=DsWpi3WiBQ75oHOsPpp6okmdotD9HCb6nB/Iqv9xocwNYCPTZZgEhJ6wEXbI/DNBE2
	XKKkA7Pvimkp9uOZ8BmqsahMpWomtu1l7Gr4QinT9QMI4Ca04WuRNEI+BRvdk2CBsZXR
	5+pnXN3v0apU/zAJnTm7yvvpfkSZAKOAHGe50=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GCsf8Euj+DbrBB7zXzJBV+2LMydzEGt/vhjtg12AuXVjDBYAm/DFLJQlhKWmzLwLSX
	GME/3m4iwCdUrJxBivu1JYdnuaihPCNcMDVo9zlWkrhrDUdOopc3Mt4oYaRAf2mCgapG
	afe0upSApwGkONhkkBu/1dlX6ArmqtWS687O4=
Received: by 10.151.28.8 with SMTP id f8mr12352740ybj.397.1280326198539;
	Wed, 28 Jul 2010 07:09:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u41sm8364029yba.10.2010.07.28.07.09.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Jul 2010 07:09:57 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jul 2010 09:06:18 -0500
Message-Id: <1280325978-3507-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1280325978-3507-1-git-send-email-chase.maupin@ti.com>
References: <1280325978-3507-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 2/2] sourceipk: use ar to package ipk instead of tar
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
X-List-Received-Date: Wed, 28 Jul 2010 14:10:28 -0000

* Changed the command that packages the contents of the
  source ipk to ar instead of tar to match how other ipks
  are built.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 classes/sourceipk.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index 9acd9a5..4957e4a 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -114,7 +114,7 @@ sourceipk_do_create_srcipk() {
         mkdir -p ${DEPLOY_DIR_IPK}/${SRCIPK_PACKAGE_ARCH}
         pkg_file=${DEPLOY_DIR_IPK}/${SRCIPK_PACKAGE_ARCH}/${PN}-src_${PV}-${PR}_${SRCIPK_PACKAGE_ARCH}.ipk
         rm -f $pkg_file
-        tar -C $srcipk_dir -czf $pkg_file .
+        ( cd $srcipk_dir && ar -crf $pkg_file ./debian-binary ./data.tar.gz ./control.tar.gz )
 
         # Remove the temporary directory
         rm -rf $tmp_dir
-- 
1.7.0.4



