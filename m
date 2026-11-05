Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8385.1793918345028097438
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 14:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Nk2e1W4X;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261105223902fda2b4d96e0002078f-yqv9tb@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261105223902fda2b4d96e0002078f
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 05 Nov 2026 23:39:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=b0/WJ4grxGIkrDTc7LtPjeyLgU4EgDu5OlhGebHyK+c=;
 b=Nk2e1W4Xh4riTpoBcfvpSkmmp+1C4iLK1kjNyPPa7Plggtl2Fd//cU7UCTrVKJ+SmO8hmn
 23jk01IRv2qmyEjnL7c23GFPnkTI5L5NnVJrEhKOUnruGnx/wBq4a3h3gVYbIz/fgixcJggr
 RtX5XmnryTb0Udlurat9H1WztUo7ye5Jb34K2kXDFJ8AOKUzsDYxHY2Rv/iuWW7Ot/V94XtA
 8DOppUyPTbSEM2rz65QL5xXDcNktF/EXZUTkH6mrgfJ2aTZHGtq0kNd19na46poaftJri0LR
 GaUNOb0mqbEDRgYI7VWUtT+q09piXpjk6YasedQIUkMtEw4bHvFVgJ1w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 2/2] net-snmp: fix ptests
Date: Thu,  5 Nov 2026 23:38:21 +0100
Message-ID: <20261105223821.3628930-2-peter.marko@siemens.com>
In-Reply-To: <20261105223821.3628930-1-peter.marko@siemens.com>
References: <20261105223821.3628930-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 22:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131954
Content-Type: text/plain; charset="utf-8"

From: Gyorgy Sarvari <skandigraun@gmail.com>

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(From rev: 227dca88617741e07ca4670be8efcf341e3fa38b)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.9.4.bb            | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index ec55bd01802..9afeaf34bea 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -286,8 +286,12 @@ RDEPENDS:${PN}-libs += "libpci \
                         ${PN}-lib-helpers \
                         ${PN}-lib-mibs \
 "
-RDEPENDS:${PN}-ptest += "perl \
+RDEPENDS:${PN}-ptest += "${PN}-server-snmpd \
+                         ${PN}-server-snmptrapd \
+                         net-tools \
+                         perl \
                          perl-module-test \
+                         perl-module-socket \
                          perl-module-file-basename \
                          perl-module-getopt-long \
                          perl-module-file-temp \
