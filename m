Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nU-0007Tj-SL
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:18 +0200
Received: by mail-ea0-f177.google.com with SMTP id q14so1567453eaj.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=fwCJLyJLm4WJ379jSRW+nkv5SOUFeVWiWiDX2ddGPQw=;
	b=Px4yyMBSK5L4bGggjCfpmK1r0TTxz0ywcheR1NNT7TeqENVJMA1V3XAf8VVeQnRZ8c
	VRd6vyYERfooICCu2kO+oSzrpFllipM72rsYZvlOTnfvFRBbwYg5PtAPdH4j6q23nwV3
	jdH9Fq8gf7lrQjAadGjfl/ULANwcHGsOBYUkNKVS1LJU/pj4hQRqA68XLl9/pspu7MHm
	V3JKAa0hNnI3RSMU3K+tgyE1vxnSl5L0ndTS0Rm7GQVPHnKr2ScQrmNt8xo4jdmtEofR
	AS+woPmBNe32Y2jH8wZnpVP1iUOFLAj7A1MjiWGBtdhPDCEiL45WsSm1vJuBpZTQXYoI
	NwhQ==
X-Received: by 10.15.22.76 with SMTP id e52mr39960723eeu.7.1365859791237;
	Sat, 13 Apr 2013 06:29:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id n48sm2907187eeg.12.2013.04.13.06.29.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:29:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:19 +0200
Message-Id: <1365859790-20947-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 02/33] dropbear: move bbappend to oe-core subdirectory
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
X-List-Received-Date: Sat, 13 Apr 2013 13:47:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{meta-oe => oe-core}/recipes-core/dropbear/dropbear/dropbear.socket   | 0
 .../{meta-oe => oe-core}/recipes-core/dropbear/dropbear/dropbear@.service | 0
 .../recipes-core/dropbear/dropbear/dropbearkey.service                    | 0
 .../{meta-oe => oe-core}/recipes-core/dropbear/dropbear_2012.55.bbappend  | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/dropbear/dropbear/dropbear.socket (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/dropbear/dropbear/dropbear@.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/dropbear/dropbear/dropbearkey.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/dropbear/dropbear_2012.55.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear.socket
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket
rename to meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear.socket
diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
rename to meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbearkey.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service
rename to meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbearkey.service
diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2012.55.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
rename to meta-systemd/oe-core/recipes-core/dropbear/dropbear_2012.55.bbappend
-- 
1.8.1.5



