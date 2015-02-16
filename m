Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 59F5271EC3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 07:25:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57782627"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Feb 2015 15:21:31 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1G7OITN007004
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 15:24:18 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 16 Feb 2015 15:25:06 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Feb 2015 15:20:00 +0800
Message-ID: <1424071200-4999-3-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1424071200-4999-1-git-send-email-biannm@cn.fujitsu.com>
References: <1424071200-4999-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH 2/2] postfix: fix bug of main.cf_2.0
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
X-List-Received-Date: Mon, 16 Feb 2015 07:25:09 -0000
Content-Type: text/plain

${exec_prefix}/libexec/${PN} => ${libexecdir}

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/postfix/files/main.cf_2.0 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0 b/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
index bb31451..9e1077f 100644
--- a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
+++ b/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
@@ -30,7 +30,7 @@ queue_directory = /var/spool/postfix
 mail_spool_directory = /var/spool/mail
 readme_directory = no
 command_directory = /usr/sbin
-daemon_directory = /usr/libexec/postfix
+daemon_directory = /usr/lib/postfix
 mail_owner = postfix
 setgid_group = postdrop
 unknown_local_recipient_reject_code = 450
-- 
1.9.1


