Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6048B72374
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 06:24:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57485633"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Feb 2015 14:21:13 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1C6O0rK010389
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 14:24:00 +0800
Received: from localhost.localdomain (10.167.226.63) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 12 Feb 2015 14:24:58 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Feb 2015 14:24:10 +0800
Message-ID: <1423722250-1839-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.63]
Subject: [meta-oe][PATCH] logwatch_7.4.1.bb: Bug fix
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
X-List-Received-Date: Thu, 12 Feb 2015 06:24:47 -0000
Content-Type: text/plain

The "ln -sf ../..${datadir}/logwatch/scripts/logwatch.pl ${D}${sysconfdir}/cron.daily/0logwatch" is wrong.
it will lead to the logwatch unable to be used. so delete it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
index 650d6f8..001b3de 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
@@ -36,7 +36,6 @@ do_install() {
 
     install -m 0755 -d ${D}${sysconfdir}/cron.daily
     install -m 0755 -d ${D}${sbindir}
-    ln -sf ../..${datadir}/logwatch/scripts/logwatch.pl ${D}${sysconfdir}/cron.daily/0logwatch
     ln -sf ../..${datadir}/logwatch/scripts/logwatch.pl ${D}${sbindir}/logwatch
     cat > ${D}${sysconfdir}/cron.daily/0logwatch <<EOF
     DailyReport=\`grep -e "^[[:space:]]*DailyReport[[:space:]]*=[[:space:]]*" /usr/share/logwatch/default.conf/logwatch.conf | head -n1 | sed -e "s|^\s*DailyReport\s*=\s*||"\`
-- 
1.8.4.2


