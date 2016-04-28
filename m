Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A166873192
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 08:49:40 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n129so11517013wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 01:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OdG+Hqyvyfp7OkRaIiu6WfSOk1del/cgY99RyCePbpY=;
	b=F5D9SgiY/ldhAJmRCb5tQxFD6sK6+sgWU7Yaz5zDE4yiM4V70CmFAAUht9E4oXFgdY
	QISRyF8dmt3L/nc14ULtDGVafN1q1y6qzUkSK+JPBlzf5Eckn3DH69kpW4iJ/3HLqolr
	HDaaICiYe12R/fAMHXMlcRon+Cn3c3I7cGrfB6PWuuTna6uX+XgMiYre6Fb2CjDmZIEv
	Y3lzb6oa6ozGCkAXgMHWESDf26rZ/IZ3odHWLBoMgQTUE6/dTj3nxcOJWrYMCjIpozqY
	+VYtcUf8rWFl3/K2JvtFB1UiZSgQ7Czci022WxJCMZhTvG2o5TwXPS6VMzsONTCbznIH
	PRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OdG+Hqyvyfp7OkRaIiu6WfSOk1del/cgY99RyCePbpY=;
	b=hlJyLI+oFjfeQY+nT/smOy58eiFhOmcabUICHXkYbvneKQU17nYTXM1me6E56MzHcn
	P/Z7oLuGhiavr+9J1GDkF1A3UXP+6M902GFxPMy5KPclJyA4wdymYltjcQZ0Q074Ed1n
	CbIsE55yCXVaerkRf8VqO75IN3bU8VE6B5+CQiBvyJi5X09yyOIReYNkXpQLLrPHnIMt
	LbkUTCqu32QlJOhOF3wRKDvMyhY8k2qB95lRcgdb+Bwf6itiuhtjkr1BUqk7Iu8kFn4D
	Te2dEIvjwpbp3Q7aOmyiRekIYzPuyNCjBNvGvelN78E58+IRhm/g/Uh3g1uc0iKAOdzc
	A1Pg==
X-Gm-Message-State: AOPr4FVWN8kMIqqYI02FsYdrkM211UbnK1GgKH3Qiz5wDoBrsmyfINuBJsYNSxks2aljsw==
X-Received: by 10.28.111.14 with SMTP id k14mr12126216wmc.32.1461833380598;
	Thu, 28 Apr 2016 01:49:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l124sm12796546wmf.11.2016.04.28.01.49.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Apr 2016 01:49:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Apr 2016 10:50:22 +0200
Message-Id: <1461833422-5248-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][meta-oe] sblim-sfcb: add missing dependency on unzip-native
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
X-List-Received-Date: Thu, 28 Apr 2016 08:49:40 -0000

* otherwise configure fails with:
  | checking whether to build shared libraries... yes
  | checking whether to build static libraries... no
  | checking for unzip... no
  | configure: error: Could not find unzip
  | NOTE: The following config.log files may provide further information.
  | NOTE: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/sblim-sfcb/1.4.9-r0/build/config.log
  | ERROR: configure failed
  | ERROR: Function failed: do_configure (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/sblim-sfcb/1.4.9-r0/temp/log.do_configure.9838)
  NOTE: recipe sblim-sfcb-1.4.9-r0: task do_configure: Failed
  ERROR: Task 5 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb, do_configure) failed with exit code '1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index ed5382e..41626d1 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://www.sblim.org"
 SECTION = "Applications/System"
 LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
-DEPENDS = "curl libpam openssl sblim-sfc-common"
+DEPENDS = "curl libpam openssl sblim-sfc-common unzip-native"
 
 SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch \
-- 
2.8.1


