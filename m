Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7F27F77A98
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 18:45:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id o126so28156991pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y7Go17F+Ml32SsCxJ/iBBo1KhUx7WX11NOwRyQ0j+dQ=;
	b=YeHNMYfk63dd0mrj2aX8E5NiwhhcOpkYajaPHcvf9feNF0EWHIVCVlVgWcM17S/WpC
	1cxkOG4/jFCSFXRqmu3Ik42nqXCiCKGoP+h1QJ9Y5aiPfgAPJOBLhKJveQXiEjtfZnw5
	qMvmGN2IJuNfLL0kxf4A/SBjOQSYy7d6+CTH0qFDB2KL8FDP38JAEv+iijm6VGlfKCRb
	JDqJ4732MikAUFmDzWQh/G7/D7rObjRejML6xpVVMvixSQRTg+zvwP74JMXjGMoOst5k
	erhpsHKbRZ88uME2FoamC/z1vLKBBPHINc9/ya2bV/orwiTeaAM9sbxJ8HshjzecgWBh
	CkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y7Go17F+Ml32SsCxJ/iBBo1KhUx7WX11NOwRyQ0j+dQ=;
	b=NKQw50pHEkTnKNNECUwioWGzTYgY6N8e2To/Agu0Nl5UTJ+pxUnRee01iOVOBL/wi0
	XEZHQoT/e7k8DesBrz9mLBFxC5twcppC9fGZcmSOxho6ZLUlA7y/XtmWm2x+WqH7s/l0
	bK3eCi0jiwVdXlmCDN6q0bC0Y918WQqMwiCR1x1AMylvsft4wgwwdb4BOg2jzlojmHOj
	O2JD64qSIAX6Qsky+nHCtXseklRaTAqjrlzkkcG8tEcpn+rj61Jlh3Vj8/ueVGzlb798
	K2RKUSQ/CAgiEY8yMhZSsL2+KnuJixZWL1AoYR9bnakdMZyVL0nTLbrul4DnmiNGkOZp
	MNtQ==
X-Gm-Message-State: AFeK/H3yt0CV62OLbI5FRNnTtXzaGiiYywn/0mzdymIr22rZdGEN113uIXOofiTUhKLcdQ==
X-Received: by 10.99.230.17 with SMTP id g17mr45086381pgh.84.1490208349558;
	Wed, 22 Mar 2017 11:45:49 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z4sm5404494pge.49.2017.03.22.11.45.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 11:45:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Mar 2017 11:45:28 -0700
Message-Id: <20170322184533.6501-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170322184533.6501-1-raj.khem@gmail.com>
References: <20170322184533.6501-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 05/10] ctdb: Fix build with musl
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
X-List-Received-Date: Wed, 22 Mar 2017 18:45:48 -0000

Fixes
| ./utils/smnotify/smnotify.h:9:10: fatal error: 'rpc/rpc.h' file not found
| #include <rpc/rpc.h>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
index 7cea0f681..b5a60645c 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
@@ -27,6 +27,9 @@ PACKAGECONFIG[libtdb] = "--without-included-tdb,--with-included-tdb,libtdb"
 PARALLEL_MAKE = ""
 
 DEPENDS += "popt libtevent libtalloc libldb"
+DEPENDS_append_libc-musl = " libtirpc"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+LDFLAGS_append_libc-musl = " -ltirpc"
 
 # ctdbd_wrapper requires pgrep, hence procps
 RDEPENDS_${PN} += "procps"
-- 
2.12.0


