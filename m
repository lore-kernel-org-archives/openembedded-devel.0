Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 67D17793F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 20:14:56 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t70-v6so4923652pgd.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qb195SMmIRJ3/OAH/4euoloL2ZelqnWzZ80tBnXnpfk=;
	b=jOgBsP+FuVUuUm+fWolxz9/JYPI59YsTIerSQwVXVIHlvsAdbtI6+ty4vdsJRlkb5V
	wx+RL4BR87PoWeuQsnr1XRpDZQbhBY4wp0o/+aC+vps7M92h8CN6YVxuAoUTgvq0v7id
	kzVuQbLGPRMauVSgcCC41YvnA+ZEfMEhPzcnnk9zWH1h7Xg8mxCvqxDSKzuRb5E6IZZb
	FvAk9LslbubXIX1A6mxGtPRc1PwmMHQJJ+YRcST5F3tdIseKUggqD0IqzYrdTyeZznMv
	YGnn+G8nEfY5IGi+jlfaP+oz9mpZQNSPd5teiKtyydlO5eMhYEdPl6tZ6TG8FK0YXU9I
	RDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qb195SMmIRJ3/OAH/4euoloL2ZelqnWzZ80tBnXnpfk=;
	b=Hvz88P6v2VtKCkHvSgX6G7+FO+qbyB5sY61KFvdAiqbZk4BS7fTsSf4XWzvGGe3b11
	iXJ1VlhgIsywpG8Kv7CVpgSelhPYZGJsg0kKW2hTtxM2C5SUwqgM7SL4gP3iUmxWE9f2
	Xf1+PT63PQlc0vxL5CAiX/r2s/5QEAyeYMrb9ATXCTXcV9Pj18Ep3M2KlAip6hMBGpfc
	fngGevGIDZvtIKYf2yQkBZ0c1RdHAJGKkDuImEzYJATJsJrqtPAJ4w9jtsXG63Wm3hIN
	LKSDpMRrGuveqiGRJehYDCPq2RqyqiCA5CIAB05gHcKT0DknKy2W4chtEUWQB81xDtpM
	PP0g==
X-Gm-Message-State: ABuFfoj5BEK8fBIteuhId4aRAdq3vbUJ5TaWFcJ2rflmK1zM+E8zBuCG
	6sBfV0Om8pZXyLhQIxEVB8J0c4XH
X-Google-Smtp-Source: ACcGV601LNFgENwxJzsn2ez9rQUa0gaeJP+YThts2tHWFsHlBH5yjbF5XpyKYB9uKZhO3A8s7mu7/A==
X-Received: by 2002:a17:902:3081:: with SMTP id
	v1-v6mr383298plb.58.1537820097079; 
	Mon, 24 Sep 2018 13:14:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	s195-v6sm176398pgs.76.2018.09.24.13.14.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Sep 2018 13:14:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Sep 2018 13:14:47 -0700
Message-Id: <20180924201447.2360-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180924201447.2360-1-raj.khem@gmail.com>
References: <20180924201447.2360-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] vsftpd: Fix build with musl/x86
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
X-List-Received-Date: Mon, 24 Sep 2018 20:14:56 -0000
Content-Transfer-Encoding: 8bit

F_SETLKW64 and F_SETLK64 are defined in
include/asm-generic/fcntl.h on musl target
but just including this header does not work
since both include/asm-generic/fcntl.h and include/fcntl.h
define same structures resulting in
conflicting declaration of structs.
Having local definitions of these values seems reasonable here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index 80b0117c88..2e3e0e8843 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -47,7 +47,7 @@ inherit update-rc.d useradd systemd
 
 CONFFILES_${PN} = "${sysconfdir}/vsftpd.conf"
 LDFLAGS_append =" -lcrypt -lcap"
-
+CFLAGS_append_libc-musl = " -D_GNU_SOURCE -include fcntl.h"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 do_configure() {
-- 
2.19.0


