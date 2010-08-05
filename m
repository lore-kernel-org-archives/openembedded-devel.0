Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OgyKp-0005yb-BV
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 13:10:03 +0200
Received: by fxm12 with SMTP id 12so2870794fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 04:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ts10Iw8ud/oHH8YCQPYCWwsrbjaC27RtZ0La1ola0uo=;
	b=Nlt3tYpIqv9NTjnDjgjODkUxdctdwwaFIlpFRRXCv3MhcYoO+Pf+izHpVtC5fKfaTM
	jf+8aGKRrDLcfCJXRj9cowl4SB0HO/vRpA039wMN9E9RiLA9UF6mpED4lb9x7LG8BOnb
	bWycRKX/RPgxQjZyW3jcoUW8LSFujfT2afmEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=vpjE8U+FdQYfsX+F+X2eSOK2XPLymsaMVt5lCc6wursirWGOFo4TI3GlfYQ03DMJVr
	BMHCwaPwc8SDe/K7DzWT+DwuM36VdcV/M1acOplX1zXSmQKoD8wE1cpYDBUO2ue/BoJY
	XPbdMH2rYUnKgEXvkOneDdgwWMbRVZXgwx7Qk=
Received: by 10.223.104.145 with SMTP id p17mr10451870fao.34.1281006593997;
	Thu, 05 Aug 2010 04:09:53 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a9sm21823faa.27.2010.08.05.04.09.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Aug 2010 04:09:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Aug 2010 13:10:13 +0200
Message-Id: <1281006613-31148-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Revert "rootfs_ipk.bbclass: install the package manager in a separate pass from the other packages"
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
X-List-Received-Date: Thu, 05 Aug 2010 11:10:03 -0000

This reverts commit acc720fa80227d08fd15764117e0c34e2387e804.

Conflicts:

	classes/rootfs_ipk.bbclass
---
 classes/rootfs_ipk.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index 7c85aae..db04fb6 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -25,7 +25,7 @@ BAD_RECOMMENDATIONS ?= ""
 IPKG_VARIANT ?= "opkg"
 
 RDEPENDS_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "${IPKG_VARIANT} opkg-collateral", d)}"
-PACKAGE_INSTALL_PKGMGR = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "${IPKG_VARIANT} opkg-collateral", d)}"
+PACKAGE_INSTALL_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "${IPKG_VARIANT} opkg-collateral", d)}"
 
 fakeroot rootfs_ipk_do_rootfs () {
 	set -x
@@ -44,6 +44,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 		echo "Status: deinstall ok not-installed" >> $STATUS
 		echo >> $STATUS
 	done
+
 	opkg-cl ${IPKG_ARGS} update
 
 	# Uclibc builds don't provide this stuff...
@@ -63,7 +64,6 @@ fakeroot rootfs_ipk_do_rootfs () {
 			opkg-cl ${IPKG_ARGS} install $i 2>&1 || true
 		done > ${T}/log.do_rootfs-attemptonly.${PID}
 	fi
-	opkg-cl ${IPKG_ARGS} install ${PACKAGE_INSTALL_PKGMGR}
 
 	export D=${IMAGE_ROOTFS}
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}
-- 
1.7.1.1



