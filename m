Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id ED1C07DAE7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 14:18:36 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c12so21219459wrt.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2o5GXIKicIhBBpj5i40+OYiEuxJOYsjGH0hrURT3Wmg=;
	b=mK82RZorkX+4Mqr4fW//Cm0H4uSIR+4IRwqF3mc1dpYByGXsMPoEFFanTORsAr0JVt
	6BQpTQ9rTaBJqtZ98VqmNDk3pyvfCmehqVmpXHEbHh8ONaNOABqfgr2lOBItKkueN7jW
	tOtl7AjA+TPnbQ8xdzpNgxkhA976vqKOKQjVuxD9lCdl6TfiU3NTgKUpzR71EkULQvc2
	UbdTaEXp/EB59WvQwylfBw5ze8KMDxs7oQhbwIoqmWQO/t3abI7wtEJvQtLYsoD5IS5U
	Svy7pUjbcEbARfaoGQp3IQIPEg9hWjEEMX3bfE1b8NEa+yWft9oTgE5/pR5Qc+zVMaH8
	iOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2o5GXIKicIhBBpj5i40+OYiEuxJOYsjGH0hrURT3Wmg=;
	b=FpyX0AzpovqBDjzdDjq8q6OEiNRX9iAKL5zOsjtS8CFMovcTvh4Kh7Y/1LJOtTuT81
	nYZ2SXrSmH6z4lHCWkIRTgQBBz0D/9gczpITo69ZymypXssAo4Hn1EnmUC4Ixs9jmnRS
	sBuAbZiBqq2hCpTUJx3St7TYDL5mVvDaXNBbxhtioCATvcOKMfY3T5Sl4wpwiKhYRdwI
	lqoEph8F5MmPSR2dRYnP5/mCAbgM43qrPjueBjlgGaTMTvGjEwxxB/l3/AMoIOY/VUj/
	DOAeFRfSC2maqQFs3ffsJ3i34hMr8zZ15XfVgxDlKC5LId0iNkdAuXEN8bRGeHbQm2/a
	Ydxg==
X-Gm-Message-State: APjAAAVhCCNeGIYu/+jIBh91Gbe3kTk4xiHmGGR4uIiWWt8AhNK1ju2c
	l3XQAYvNWY4FhO6s8EfIGooF2wjo
X-Google-Smtp-Source: APXvYqz/7lmQUVsuHNf6a6s+5juOfrmJD7PRq9NT1SCkSL6Tw6V7PIGcLZKPa3HAkDMnuCyTJyEggg==
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr11740523wrw.13.1556633917355; 
	Tue, 30 Apr 2019 07:18:37 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 10sm3023488wmd.25.2019.04.30.07.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 07:18:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2019 14:18:41 +0000
Message-Id: <20190430141841.4840-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] zbar: fix SRC_URI for multilib
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
X-List-Received-Date: Tue, 30 Apr 2019 14:18:37 -0000

---
 meta-oe/recipes-support/zbar/zbar_0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/zbar/zbar_0.10.bb b/meta-oe/recipes-support/zbar/zbar_0.10.bb
index 6b6e501114..ebd1f7a12f 100644
--- a/meta-oe/recipes-support/zbar/zbar_0.10.bb
+++ b/meta-oe/recipes-support/zbar/zbar_0.10.bb
@@ -6,7 +6,7 @@ DEPENDS = "pkgconfig intltool-native libpng jpeg"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=42bafded1b380c6fefbeb6c5cd5448d9"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://0001-undefine-__va_arg_pack.patch \
            file://0001-make-relies-GNU-extentions.patch \
 "
-- 
2.17.1


