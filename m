Return-Path: <sbabic@denx.de>
X-Greylist: delayed 534 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 May 2019 09:03:56 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 132187E575
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 09:03:56 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 45FdYy55htz1rKJr;
	Fri, 31 May 2019 10:55:02 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 45FdYy4w9bz1qrGN;
	Fri, 31 May 2019 10:55:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id ruilVpqNbLgD; Fri, 31 May 2019 10:55:00 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Fri, 31 May 2019 10:55:00 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id A78874540343;
	Fri, 31 May 2019 10:54:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id CpzBvvX-tL2b; Fri, 31 May 2019 10:54:57 +0200 (CEST)
Received: from papero.fritz.box (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id D4CC645401EE;
	Fri, 31 May 2019 10:54:56 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 May 2019 10:54:47 +0200
Message-Id: <20190531085447.827-1-sbabic@denx.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systat: systemd never enables the service
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
X-List-Received-Date: Fri, 31 May 2019 09:03:57 -0000

Even if SYSTEMD_AUTO_ENABLE is set to "enable", the service is never
activated by systemd. The cause is the postinst function in the recipe:

 pkg_postinst_${PN} () {
         if [ -n "$D" ]; then
                 exit 0
         fi
         if [ -e /etc/init.d/populate-volatile.sh ]; then
                 /etc/init.d/populate-volatile.sh update
         fi
 }

This generates with activated systemd the following postinst script:

	set -e
	        if [ -n "$D" ]; then
	                exit 0
	        fi
	        if [ -e /etc/init.d/populate-volatile.sh ]; then
	                /etc/init.d/populate-volatile.sh update
	        fi
	OPTS=""

	if [ -n "$D" ]; then
	    OPTS="--root=$D"
	fi

	if type systemctl >/dev/null 2>/dev/null; then
		if [ -z "$D" ]; then
			systemctl daemon-reload
		fi

		systemctl $OPTS enable sysstat.service

		if [ -z "$D" -a "enable" = "enable" ]; then
			systemctl --no-block restart sysstat.service
		fi
	fi

Due to the exit statement, systemctl is never called and the service is
never enabled in rootfs.
Invert the logic for the check to let run the rest of postinst script.

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 meta/recipes-extended/sysstat/sysstat.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 0bc7e14d36..850a6d1465 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -51,12 +51,11 @@ do_install() {
 }
 
 pkg_postinst_${PN} () {
-        if [ -n "$D" ]; then
-                exit 0
-        fi
-        if [ -e /etc/init.d/populate-volatile.sh ]; then
-                /etc/init.d/populate-volatile.sh update
-        fi
+	if [  ! -n "$D" ]; then
+		if [ -e /etc/init.d/populate-volatile.sh ]; then
+			/etc/init.d/populate-volatile.sh update
+		fi
+	fi
 }
 
 
-- 
2.17.1


