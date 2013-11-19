Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDF186D8FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 21:50:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAJLom85011540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Nov 2013 13:50:48 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 19 Nov 2013 13:50:48 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Nov 2013 15:50:38 -0600
Message-ID: <1384897838-11066-4-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1384897838-11066-1-git-send-email-mark.hatle@windriver.com>
References: <1384897838-11066-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [meta-networking][PATCH 3/3] ntpd: make start-stop-daemon command available for ntpd
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
X-List-Received-Date: Tue, 19 Nov 2013 21:50:48 -0000
Content-Type: text/plain

From: Qiang Chen <qiang.chen@windriver.com>

If ntpd script is being called by a non-root user using sudo,
it will fail as follows:

/etc/init.d/ntpd restart
Stopping ntpd: /etc/init.d/ntpd: line 29: start-stop-daemon:
command not found
done
Starting ntpd: /etc/init.d/ntpd: line 24: start-stop-daemon:
command not found
done

This is because /etc/init.d/ntpd calls start-stop-daemon which
is in /sbin (not in the default path for non-root users)

Explicitly configure the PATH to include /sbin.

Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>

Reworked to set PATH instead of hardcode the location of start-stop-daemon

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-networking/recipes-support/ntp/files/ntpd | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networking/recipes-support/ntp/files/ntpd
index ae50f13..53fa2d1 100755
--- a/meta-networking/recipes-support/ntp/files/ntpd
+++ b/meta-networking/recipes-support/ntp/files/ntpd
@@ -1,5 +1,7 @@
 #! /bin/sh
 #
+PATH=/sbin:/bin:/usr/bin:/usr/sbin
+
 # ntpd	init.d script for ntpdc from ntp.isc.org
 test -x /usr/bin/ntpd -a -r /etc/ntp.conf || exit 0
 # rcS contains TICKADJ
-- 
1.8.1.2.545.g2f19ada


