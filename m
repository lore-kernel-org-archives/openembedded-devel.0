Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2opj-0006uN-Q5
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 18:56:01 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 6D57AEAD3A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 12:52:31 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 12:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=l6IE0iIpMwGV4emsOGtiDvvFZEw=;
	b=am2rlZgyZeQRqBBF0vO9ar1CbVfHSsfPZmO+4K8iT5u0JfADAuHgtxPvROH6oBduJzEnwfEFtyRfDN7Afmx3Mm425LrfxVsBn3vhyVbXT2JHgSrWo6oyyh4HYzrXb/OIa+Qpyc6hiLAjirIiqmFkpNpMwZMKDuuXosSqkfJn6Mg=
X-Sasl-enc: AFxxk4NWnPDwGyPe1bZh8pDZ9KpmpUZg1K87VFAMjimF 1271436751
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id E0DC67057
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 12:52:30 -0400 (EDT)
Date: Fri, 16 Apr 2010 18:52:29 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
Message-ID: <alpine.DEB.1.10.1004161851540.13187@vitus.devnet.local>
References: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/5] base-files: tb5200l specific changes
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
X-List-Received-Date: Fri, 16 Apr 2010 16:56:01 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

* create /opt directory
* fstab which mounts / and /opt from jffs2 filesystem on mtd
* link /tmp to /var/tmp
* issue and issue.net

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/base-files/base-files/tb5200l/fstab     |   10 ++++++++++
 recipes/base-files/base-files/tb5200l/issue     |    2 ++
 recipes/base-files/base-files/tb5200l/issue.net |    3 +++
 recipes/base-files/base-files_3.0.14.bb         |    8 +++++++-
 4 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 recipes/base-files/base-files/tb5200l/fstab
 create mode 100644 recipes/base-files/base-files/tb5200l/issue
 create mode 100644 recipes/base-files/base-files/tb5200l/issue.net

diff --git a/recipes/base-files/base-files/tb5200l/fstab b/recipes/base-files/base-files/tb5200l/fstab
new file mode 100644
index 0000000..38de296
--- /dev/null
+++ b/recipes/base-files/base-files/tb5200l/fstab
@@ -0,0 +1,10 @@
+# tb5200l filesystem, mount / read-only, mount /opt read-write
+
+rootfs		/		jffs2		defaults		1  1
+/dev/mtdblock4 	/opt 		jffs2		defaults		0  0
+proc 		/proc 		proc		defaults		0  0
+devpts 		/dev/pts 	devpts		mode=0620,gid=5		0  0
+usbfs 		/proc/bus/usb 	usbfs		defaults		0  0
+tmpfs 		/var/volatile 	tmpfs		defaults		0  0
+tmpfs 		/dev/shm 	tmpfs		mode=0777		0  0
+tmpfs 		/media/ram 	tmpfs		defaults		0  0
diff --git a/recipes/base-files/base-files/tb5200l/issue b/recipes/base-files/base-files/tb5200l/issue
new file mode 100644
index 0000000..5f4ee1f
--- /dev/null
+++ b/recipes/base-files/base-files/tb5200l/issue
@@ -0,0 +1,2 @@
+Cameron Linux \n \l
+
diff --git a/recipes/base-files/base-files/tb5200l/issue.net b/recipes/base-files/base-files/tb5200l/issue.net
new file mode 100644
index 0000000..b5cefd4
--- /dev/null
+++ b/recipes/base-files/base-files/tb5200l/issue.net
@@ -0,0 +1,3 @@
+Cameron Linux %h
+
+
diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index 483aef7..e341adc 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -42,7 +42,7 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
 	   ${localstatedir}/volatile/lock/subsys \
 	   ${localstatedir}/volatile/log \
 	   ${localstatedir}/volatile/run \
-	   /mnt /media /media/card /media/cf /media/net /media/ram \
+	   /opt /mnt /media /media/card /media/cf /media/net /media/ram \
 	   /media/union /media/realroot /media/hdd \
 	   /media/mmc1"

@@ -157,6 +157,12 @@ do_install_append_netbook-pro () {
 	mkdir -p ${D}/initrd
 }

+do_install_append_tb5200l() {
+	rmdir ${D}/tmp
+	ln -s var/tmp ${D}/tmp
+}
+
+
 PACKAGES = "${PN}-dbg ${PN}-doc ${PN}"
 FILES_${PN} = "/*"
 FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
-- 
1.5.6.5




