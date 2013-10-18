Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7F76CB44
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:23:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9I8N3Lb025103
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 01:23:03 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 18 Oct 2013 01:23:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Oct 2013 04:22:58 -0400
Message-ID: <1382084579-341-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [meta-virtualization] [PATCH 1/2] conf/layer.conf: fix "No newline at end of file"
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
X-List-Received-Date: Fri, 18 Oct 2013 08:23:01 -0000
Content-Type: text/plain

The last line lacked a newline (usually '\n', aka CR or CRLF) in the
end, so there was a warning from git diff:

\ No newline at end of file

The last byte of the file should be a newline.

Note:
It seems that nothing is changed in this commit, but it does change the
end of the last line.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 conf/layer.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 4c1fa19..15ed1df 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_virtualization-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_virtualization-layer = "7"
 
 # Custom licenses used by some packages in this layer
-LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
\ No newline at end of file
+LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
-- 
1.7.10.4


