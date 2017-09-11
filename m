Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9E7780B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 10:29:29 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h4so4729488pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 03:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Qm5t2BKvpdqDiQw9PET4rYFkvOEBhGD/wc0jGzYlDXw=;
	b=HZw7G9kohH91d5JtH/D55J/taCgAiykhcB5i0rfAu/CWQr66ovF/iwtu+429CjeaTb
	Oeg/L3oN6w3zifkwnXpH/jd2Cl3XaI6ZyGni8BvVykSkweht3bkldowq7pvdbilMwvjN
	Vw02PwfKtw3wI5Em4fwkezqToEY434w1k/dXLHagaCDm2/KgLLgJ8xrBmXxXBLy54I+I
	HUsbEh8Vxm60l9RIqHygqUxZkMoGNVWZ8bxR7QduaMQPJZCu0TAqtzcCDi9JY2PINrmX
	mzSwkcenzkCVzzocfUk4pP01N2UdIB/dgvkDBv8IScmoFaGm8ed8JjZmusjbbLJM0eCz
	cCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Qm5t2BKvpdqDiQw9PET4rYFkvOEBhGD/wc0jGzYlDXw=;
	b=kFajAcFiGbyXuOYAiChW4Hu/qZ4TskxFAGf4s81vYQ3pLkOGpLifoWeZ9pI700YhCA
	t3ELzfqRvw5di3NLHUN0uwGnH4CP8ktcDHqwjwQCBVH67t1dPQ19odHmj3zLENgXHEDy
	zj8Bu9s1NbGzBEUCpNdN9obg2nZc1D1JDFp8QWU1ORKtpIhjapvmLynuxvvF6foqHoYR
	qEO0oMbjNSgA3yP2NJtvNgdrQCBpuyA0BBpySfZ6uJBN8TWbepBLoogp5/K5ztM8Loum
	UGM2ww+oLoc9tkmeNJIMwrENbFdAAQkV+ZQ5noIbkBHKg2eJv4saJt8XwUTRSSsMS+l0
	+YRw==
X-Gm-Message-State: AHPjjUi3GlD/GMw/l2qdHVhVHwIuP8369ZeqYKzdpxXgPVnWETnL4THJ
	Y7Gv2WYQRJtlXxVzr2U=
X-Google-Smtp-Source: ADKCNb4tuxhDZefrgk+70i9xMtmyEVFRdIRWrNp5V5VO1TV0Rqqv8Ui3ELN2kxdvBGRdSM5y1oPCVw==
X-Received: by 10.98.100.69 with SMTP id y66mr9738656pfb.337.1505125770552;
	Mon, 11 Sep 2017 03:29:30 -0700 (PDT)
Received: from ankit.iind.intel.com ([192.55.54.40])
	by smtp.gmail.com with ESMTPSA id
	d186sm15414568pfa.97.2017.09.11.03.29.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Sep 2017 03:29:29 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Sep 2017 16:03:31 +0530
Message-Id: <1505126011-30376-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] ell: upgrade SRCREV
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
X-List-Received-Date: Mon, 11 Sep 2017 10:29:29 -0000

 7b7c15c build: Include check for xxd binary when in maintainer-mode

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/{recipes-connectivity => recipes-core}/ell/ell_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/{recipes-connectivity => recipes-core}/ell/ell_git.bb (88%)

diff --git a/meta-oe/recipes-connectivity/ell/ell_git.bb b/meta-oe/recipes-core/ell/ell_git.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/ell/ell_git.bb
rename to meta-oe/recipes-core/ell/ell_git.bb
index d259f52..10df6e1 100644
--- a/meta-oe/recipes-connectivity/ell/ell_git.bb
+++ b/meta-oe/recipes-core/ell/ell_git.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "399099946abaeb2f3718a0667cc11436a7c0be14"
+SRCREV = "7b7c15c2e5caff88fc45e7a8b874a47196a0eddd"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
 
 do_configure_prepend () {
-- 
1.9.1


