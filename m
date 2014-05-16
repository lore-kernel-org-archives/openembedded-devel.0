Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCC066078
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2014 08:26:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4G8Qt6X011713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2014 01:26:55 -0700 (PDT)
Received: from pek-hostel-vm07.wrs.com (128.224.153.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 16 May 2014 01:26:54 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 May 2014 04:26:52 -0400
Message-ID: <1400228812-30966-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400228812-30966-1-git-send-email-Qi.Chen@windriver.com>
References: <1400228812-30966-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] liblockfile: remove unrecognized configure option
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
X-List-Received-Date: Fri, 16 May 2014 08:26:58 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The '--enable-static' is an unrecognized configure option, thus removing
it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../liblockfile/liblockfile_1.09.bb                |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
index 0b9fdaf..38e1915 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
@@ -17,7 +17,7 @@ inherit autotools-brokensep
 
 # set default mailgroup to mail
 # --with-libnfslock specify where to install nfslock.so.NVER
-EXTRA_OECONF = "--enable-shared --enable-static \
+EXTRA_OECONF = "--enable-shared \
                 --with-mailgroup=mail \
                 --with-libnfslock=${libdir} \
 "
-- 
1.7.9.5


