Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC6B7D251
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:08:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U980N5001590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Aug 2019 02:08:00 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 30 Aug 2019 02:08:00 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 05:06:54 -0400
Message-ID: <1567156014-79892-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-realtime][PATCH] layer.conf: add openembedded-layer to LAYERDEPENDS
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
X-List-Received-Date: Fri, 30 Aug 2019 09:08:02 -0000
Content-Type: text/plain

latencytop.bb depends on gtk+ which exists at openembedded-layer.

So we should add openembedded-layer to LAYERDEPENDS, otherwise
"yocto-check-layer-wrapper meta-realtime --dependency 'cat mylist'"
will fail with "NO PROVIDE gtk+ ..."

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index cb24358..72ae7ad 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -16,4 +16,4 @@ BBFILE_PRIORITY_realtime = "5"
 # cause compatibility issues with other layers
 LAYERVERSION_realtime = "1"
 LAYERSERIES_COMPAT_realtime = "thud warrior"
-LAYERDEPENDS_realtime = "core"
+LAYERDEPENDS_realtime = "core openembedded-layer"
-- 
2.8.1


