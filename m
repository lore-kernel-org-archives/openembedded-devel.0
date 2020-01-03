Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1124C7F935
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:42:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0032gmG4026732
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Jan 2020 18:42:49 -0800 (PST)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 2 Jan 2020 18:42:48 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Jan 2020 10:42:45 +0800
Message-ID: <20200103024245.25311-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [meta-networking][PATCH] ntp: restrict NTP mode 6 queries
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
X-List-Received-Date: Fri, 03 Jan 2020 02:42:49 -0000
Content-Type: text/plain

The current NTP server responds to mode 6 queries from any clients.
Devices that respond to these queries have the potential to be used in
NTP amplification attacks. An unauthenticated, remote attacker could
potentially exploit this, via a specially crafted mode 6 query, to cause
a reflected denial of service condition.

See: https://www.tenable.com/plugins/nessus/97861
     https://scan.shadowserver.org/ntpversion/

Update ntp.conf to restrict NTP mode 6 queries.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp/ntp.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp/ntp.conf b/meta-networking/recipes-support/ntp/ntp/ntp.conf
index 676e18645..b59003092 100644
--- a/meta-networking/recipes-support/ntp/ntp/ntp.conf
+++ b/meta-networking/recipes-support/ntp/ntp/ntp.conf
@@ -14,4 +14,8 @@ driftfile /var/lib/ntp/drift
 server 127.127.1.0
 fudge 127.127.1.0 stratum 14
 # Defining a default security setting
-restrict default
+restrict -4 default notrap nomodify nopeer noquery
+restrict -6 default notrap nomodify nopeer noquery
+
+restrict 127.0.0.1    # allow local host
+restrict ::1          # allow local host
-- 
2.17.1


