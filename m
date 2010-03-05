Received: from fg-out-1718.google.com ([72.14.220.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NnWAG-0006mn-Ab
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 12:57:56 +0100
Received: by fg-out-1718.google.com with SMTP id 19so162412fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 03:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=XWjYVRVnhRIXMlYEEWXML/3BGjyZlLV8FA2LN7btsqc=;
	b=iaZReM8JN40J1LbFqZDd1ns6VBkKor1eG+D6dP3cXWogxylqf/dqOGmokoumcC2DVf
	g2Im9Z3jckA6SWK8k19Encxx6GRqEWgQZKTKsc/gHOW5YZR/ob0gWVXFl8N145o78Vnr
	VulZ+K8ym9eT6a+Z9svEgNUEk5nue+ZzwYoas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=O3ZWp7D2nBpWbSyfZR0q26OD6ygPUnCbibalYE9/Lg/zk2fwPa2sT7pj4iJ2Dn+glI
	6Lp3eAC055KRnfMHMyMivt0kkeNJmlNw93fGqYc9w9PcUC6my0mz6o9tCsTPcnJB15VH
	DybAGR3vtMk5CZsqIpmskfRTA70F6peqIiKfc=
Received: by 10.87.45.33 with SMTP id x33mr1075161fgj.68.1267790105334;
	Fri, 05 Mar 2010 03:55:05 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm1113361fxm.10.2010.03.05.03.55.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Mar 2010 03:55:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Mar 2010 12:55:32 +0100
Message-Id: <1267790132-25931-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1267790132-25931-1-git-send-email-Martin.Jansa@gmail.com>
References: <1267790132-25931-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] util-linux-ng: use u-a for /etc/default/mountall (collision with busybox-mountall)
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
X-List-Received-Date: Fri, 05 Mar 2010 11:57:56 -0000

---
 recipes/util-linux-ng/util-linux-ng.inc |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 7f4333b..031b80b 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -7,7 +7,7 @@ inherit autotools
 
 DEFAULT_PREFERENCE = "-1"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 # allows for a release candidate
 RC ?= ""
@@ -46,7 +46,7 @@ FILES_util-linux-ng-umount = "${base_bindir}/umount.${PN}"
 FILES_util-linux-ng-readprofile = "${base_sbindir}/readprofile.${PN}"
 
 PACKAGES =+ "${PN}-mountall"
-FILES_${PN}-mountall = "${sysconfdir}/default/mountall"
+FILES_${PN}-mountall = "${sysconfdir}/default/mountall.${PN}"
 RREPLACES_${PN}-mountall = "busybox-mountall"
 
 RRECOMMENDS_${PN} = "util-linux-ng-fdisk util-linux-ng-cfdisk util-linux-ng-sfdisk util-linux-ng-mount util-linux-ng-readprofile "
@@ -152,7 +152,7 @@ do_install () {
         done
 
 	install -d ${D}${sysconfdir}/default/
-	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
+	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall.${PN}
 
 	rm ${D}${sbindir}/swapoff -f
 	ln -sf ${base_sbindir}/swapon.${PN} ${D}${base_sbindir}/swapoff.${PN}
@@ -269,3 +269,10 @@ pkg_prerm_util-linux-ng-readprofile () {
     update-alternatives --remove readprofile readprofile.${PN} 100
 }
 
+pkg_postinst_util-linux-ng-mountall () {
+        update-alternatives --install ${sysconfdir}/default/mountall default_mountall mountall.${PN} 100
+}
+pkg_prerm_util-linux-ng-mountall () {
+        update-alternatives --remove default_mountall mountall.${PN}
+}
+
-- 
1.7.0



