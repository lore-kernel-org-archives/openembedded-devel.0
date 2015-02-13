Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 13AC7733C5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEiuWq025022; Fri, 13 Feb 2015 14:44:56 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vowzu_cr3kp9; Fri, 13 Feb 2015 14:44:56 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEipSa024979
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Feb 2015 14:44:52 GMT
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1YMHU6-00026w-D4; Fri, 13 Feb 2015 14:44:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 14:44:29 +0000
Message-Id: <1423838674-8066-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/7] lttng-ust: 2.5.2 -> 2.6.0
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
X-List-Received-Date: Fri, 13 Feb 2015 14:44:59 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/{lttng-ust_2.5.2.bb => lttng-ust_2.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.5.2.bb => lttng-ust_2.6.0.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.5.2.bb b/meta/recipes-kernel/lttng/lttng-ust_2.6.0.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-ust_2.5.2.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.6.0.bb
index eda52bb..080e744 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.5.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.6.0.bb
@@ -18,10 +18,10 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "85d1d2791f3cebfd741a821261bf2924928a90e7"
+SRCREV = "5748584c5ae8ca5c4da26f41b6c61bb816e6d50b"
 PE = "2"
 
-SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.5 \
+SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.6 \
            file://lttng-ust-doc-examples-disable.patch \
            file://add-aarch64.patch \
 	   "
-- 
2.1.0


