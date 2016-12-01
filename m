Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 67A7771AC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 10:24:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB1AOK51020511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Dec 2016 02:24:21 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Dec 2016 02:24:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Dec 2016 02:24:19 -0800
Message-ID: <20161201102419.5356-2-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161201102419.5356-1-liezhi.yang@windriver.com>
References: <20161201102419.5356-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lftp: do_configure: fix "Argument list too long"
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
X-List-Received-Date: Thu, 01 Dec 2016 10:24:20 -0000
Content-Type: text/plain

Fixed when len(TMPDIR) =  410:
aclocal: error: cannot open echo [snip]: Argument list too long

This is becuase it has a lot of m4 files, use relative path for them
can fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
index b0cd399..2878211 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "ce6519831603c19c2cf2e3c10b41d6ddc87a16049b99383e7b9b77fbc7
 
 inherit autotools gettext pkgconfig
 
+acpaths = "-I ./m4"
+
 EXTRA_OECONF += "--with-modules"
 
 PACKAGECONFIG ??= "libidn openssl zlib gnutls readline expat"
-- 
2.10.2


