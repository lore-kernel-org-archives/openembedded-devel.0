Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 74EB8731C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:03 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id r184so60389652qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=GjM4R2hnt687eS1PZGBYk9Z6F/v0wnAjeJy8R2H+HvA=;
	b=Ru9HyFwE9s48pd6lSdJflRvboQRH20p21dqh9q2rPoIF8IJ0424mVwxQqEsvDPsW+9
	276EfZAXFHr0wJAaw2Pp3+dmdydMsqV8GpQYrZA2dvLamXLErkH7QQ6+lpDVMhzgarBd
	hSERhlIoz1b2Mfa4YB0I024blpq7kN8PJFFp08J/Lb/p79UyhstLAvqOMnstcIMKdyxM
	L8iU5q3td3/yoYR0DERxB2FxD/+EDpoBAcL8HbtqKFQxI0GtAFYgEmKOtER4ft64BQo3
	tzoHVO848ysFT/29rNPzbX0yGwP4agImDTyuTH0K2gmmwQTCrV9PIJCVsetA7cirRO0Q
	fmqQ==
X-Gm-Message-State: AOPr4FV67piEt3m+wcViovNx/UdHbOxxu7c9a0KN4ALxdBYoHnlZTdCDOYF+w9bWhJrM2Q==
X-Received: by 10.55.163.86 with SMTP id m83mr20642592qke.75.1462543324611;
	Fri, 06 May 2016 07:02:04 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	b40sm5773448qga.47.2016.05.06.07.02.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:03 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:01:59 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:48 -0300
Message-Id: <1462543259-7206-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 11/22] sblim-sfcb: add missing dependency on unzip-native
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
X-List-Received-Date: Fri, 06 May 2016 14:02:05 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

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
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
2.8.2


