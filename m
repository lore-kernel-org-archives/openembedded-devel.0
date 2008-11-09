Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAgp-0001Zf-Hj
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:50:55 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2044586fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=KyCbFm7RFivHtrEVx5ar70pUoKF3MtrLcodZPeHoZ9k=;
	b=VJYiDPPy6ZqxYBBDrM1ZLS1eznccO6z0RFVslb7TLhjMWa/+gALRwR+XTljLfHrurZ
	bfN9paejmHKMg6Ig5XiOYCeYsIqJkmChY/0O+I6L0pSSIqBDT3jB/v0tCowhXhqyiGCV
	xZy+RF21nfIzgzYilfaQ10gVZxsM3x9XraCNs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bjMHi+9Aca4xD6pjXSlwgsCiRiwwTYZExtoLKBoXrSvkA4OB4JbuC7QMvuz7TALjuG
	2WXAQ9Yi3c9235ALaXYW3XJxdpIVbD+VM0IrkD+RaeyqJyrVp4NnEpETD1Lm8YohkrES
	iUQ7vgantnOo4ZZ2F5HuvNy18+wubXb77o8D0=
Received: by 10.86.99.9 with SMTP id w9mr6174690fgb.38.1226237342833;
	Sun, 09 Nov 2008 05:29:02 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.00
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:01 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:04 +0300
Message-Id: <1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] opie-cardapplet: add 1.2.4 version recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Nov 2008 13:50:55 -0000

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 packages/opie-cardapplet/opie-cardapplet_1.2.4.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 packages/opie-cardapplet/opie-cardapplet_1.2.4.bb

diff --git a/packages/opie-cardapplet/opie-cardapplet_1.2.4.bb b/packages/opie-cardapplet/opie-cardapplet_1.2.4.bb
new file mode 100644
index 0000000..6c4d3c1
--- /dev/null
+++ b/packages/opie-cardapplet/opie-cardapplet_1.2.4.bb
@@ -0,0 +1,10 @@
+require ${PN}.inc
+
+PR = "r0"
+
+SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/noncore/applets/cardapplet \
+           ${HANDHELDS_CVS};tag=${TAG};module=opie/pics \
+           ${HANDHELDS_CVS};tag=${TAG};module=opie/sounds \
+           ${HANDHELDS_CVS};tag=${TAG};module=opie/apps \
+           ${HANDHELDS_CVS};tag=${TAG};module=opie/etc"
+
-- 
1.5.6.5



