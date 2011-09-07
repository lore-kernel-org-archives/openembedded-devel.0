Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Inp-0004qz-Oa
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:33 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so214309bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=X6Pw1vou+HuPJVhN4eNVaJdaM1IM+UEz5ckh456TTLg=;
	b=lai7K04Q8tKetkriI3V1o6yeXPvwny50jv31zu5H4PVinDCOak9cAJ3Py1jQOpO148
	KgEBH/bAKzWU4ocJ37NPVt7zWKJxbRiwenzcqi4jrnF5TNi/9/wH9W2OFFVguo3RIQcE
	CLSz5qQ0YDPHXaqCnQmAQCfpVaSO5yQmUztVg=
Received: by 10.204.135.6 with SMTP id l6mr3710401bkt.284.1315404213650;
	Wed, 07 Sep 2011 07:03:33 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:32 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:03:06 +0400
Message-Id: <1315404187-18176-12-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 11/12] linux.inc: drop bigendian support
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:34 -0000

None of meta-hh boxes uses bigendian mode. Drop support for it.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index 477726c..d08cf5a 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -50,13 +50,6 @@ do_configure_prepend() {
             echo "CONFIG_ARM_THUMB=y" >> ${S}/.config
         fi
 
-	#
-	# endian support
-	#
-        if [ "${SITEINFO_ENDIANNESS}" = "be" ]; then
-                echo "CONFIG_CPU_BIG_ENDIAN=y"          >> ${S}/.config
-        fi
-
         echo "CONFIG_CMDLINE=\"${CMDLINE} ${CMDLINE_DEBUG}\"" >> ${S}/.config
 
         sed -e '/CONFIG_AEABI/d' \
-- 
1.7.2.5



