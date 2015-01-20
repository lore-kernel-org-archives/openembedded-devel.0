Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12D9C72C3C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 08:21:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0K8LlLX019977
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 00:21:47 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 20 Jan 2015 00:21:47 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Jan 2015 16:21:49 +0800
Message-ID: <1421742109-15709-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: set the default file permission
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
X-List-Received-Date: Tue, 20 Jan 2015 08:21:50 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We use the default file permission root:adm for syslog-ng,
so set the same for rsyslog.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
index 54f8bb6..324ae6d 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
@@ -14,6 +14,8 @@ $ModLoad imklog   # kernel logging (formerly provided by rklogd)
 #
 # Set the default permissions
 #
+$FileOwner root
+$FileGroup adm
 $FileCreateMode 0640
 $DirCreateMode 0755
 $Umask 0022
-- 
1.9.1


