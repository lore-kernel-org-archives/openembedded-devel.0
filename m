Return-Path: <andrei.kholodnyi@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8717C60125
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 18:33:53 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so70668158wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 11:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=EgTJuTqnRpRg9wArn4JTZdsCe9bXo0Xv2oXa8fvrVuI=;
	b=cwEQJeAmP4znH6VZcs60Rddq7A/I23aMjmdIuPlJhmfObgRVC3yzBWOKlJl1oUijYe
	WjbM9pSWUmBEzP8KNHzXP/zfb2t1F6AVz48ghrJXPYbVsAhomV2CfPnVnYiWTMACr4OX
	g8qdhNgVLQJ4hjUB/v336F0IXpy1Js5/pmDJ82qx+H3VkJc04mUpA47lFaFqIBnxpa/W
	+sZ8BTL8NclTj6qsa0LI6IcUWx3Gq1AOs4apd8E4T+DLya7RfltdVzf9ASePeTv+cIo2
	YSLmQT4TPJqGeckbQRyv9HMaIli4rQ+xcUkEgRXVlxhNkQz0hySYguO9SKPlB81gfDAH
	ZtoA==
X-Received: by 10.180.8.232 with SMTP id u8mr3394881wia.26.1443897233722;
	Sat, 03 Oct 2015 11:33:53 -0700 (PDT)
Received: from razilix.corp.ad.wrs.com ([128.224.251.2])
	by smtp.googlemail.com with ESMTPSA id
	gh9sm17645593wjb.27.2015.10.03.11.33.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 03 Oct 2015 11:33:53 -0700 (PDT)
From: Andrei Kholodnyi <andrei.kholodnyi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Oct 2015 20:30:05 +0200
Message-Id: <1443897005-23957-1-git-send-email-andrei.kholodnyi@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] talloc: remove default packages from the packages list since empty
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
X-List-Received-Date: Sat, 03 Oct 2015 18:33:57 -0000

populate_sdk fails with following message:
error: talloc-dev-2.1.1-r0 requires talloc = 2.1.1-r0

these packages are empty,remove them from the package list
---
 meta-oe/recipes-support/talloc/talloc_2.1.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
index 89c390f..0c98bb6 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
@@ -20,12 +20,9 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
 
-PACKAGES += "libtalloc libtalloc-dbg libtalloc-dev pytalloc pytalloc-dbg pytalloc-dev"
+PACKAGES = "libtalloc libtalloc-dbg libtalloc-dev pytalloc pytalloc-dbg pytalloc-dev"
 
 #ALLOW_EMPTY_${PN} = "1"
-FILES_${PN} = ""
-FILES_${PN}-dev = ""
-FILES_${PN}-dbg = ""
 
 FILES_libtalloc = "${libdir}/libtalloc.so.2 \
                    ${libdir}/libtalloc.so.2.1.1"
-- 
2.1.4


