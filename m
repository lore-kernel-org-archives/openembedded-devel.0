Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OlbYx-0003Vg-A2
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 07:51:56 +0200
Received: by pwj1 with SMTP id 1so157433pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 22:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=HNnuNVCVq70fzWs5gT5Wacreczyed+Cbql/8eYCBg5I=;
	b=LInyje3EF2klj936ddc/fypj1qS/QDTKZ7jc8VjVBuQ0ApdPIny+w0JAueY+SQnsZ1
	iQf4M9RR+HQkTQP7OCdtRDiTZpo71kru0N/J73UAhgTuBaaQUNMyLVPEfSHQ+z6JO0IZ
	BC5nmJzy/I4g/Ls5kyZKNNiIUM0tTIxI48P3k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=th5AGdWlvqNSo7UT3G7M47VG2UexAIQQSxnv3vyvTfrcG3/JLb8kiXSFlnrzxd5bU4
	RTZ+nG1ErzmhpZOYNz7hQRO+mQEXE+6GkQHXC9BnkL/nyx3nmkRk24B7sVCUDWXtEu/P
	c4GJJWu12kJFhTKsK5lxiz4M+POUmMpG9ILS8=
Received: by 10.114.26.6 with SMTP id 6mr9104741waz.82.1282110677431;
	Tue, 17 Aug 2010 22:51:17 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	q6sm15827924waj.22.2010.08.17.22.51.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Aug 2010 22:51:16 -0700 (PDT)
Message-ID: <4C6B74CF.2090708@gmail.com>
Date: Wed, 18 Aug 2010 15:21:11 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] rootfs_ipk.bbclass: Fix BAD_RECOMMENDATIONS.
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
X-List-Received-Date: Wed, 18 Aug 2010 05:51:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

See http://code.google.com/p/opkg/source/detail?r=553
And previous discussions:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01423.html
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg04051.html

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 classes/rootfs_ipk.bbclass           |    2 +-
 conf/distro/include/sane-srcrevs.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index 915e3d7..77e573c 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -41,7 +41,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 	for i in ${BAD_RECOMMENDATIONS}; do
 		echo "Package: $i" >> $STATUS
 		echo "Architecture: ${TARGET_ARCH}" >> $STATUS
-		echo "Status: deinstall ok not-installed" >> $STATUS
+		echo "Status: deinstall hold not-installed" >> $STATUS
 		echo >> $STATUS
 	done
 
diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index bfce5ad..6efdd21 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -1,5 +1,5 @@
 # this is alphabetical!
 # only SRCREVs included in more recipes should be here, otherwise put sane SRCREV to recipe directly
 
-OPKG_SRCREV ?= "550"
+OPKG_SRCREV ?= "554"
 EFL_SRCREV ?= "50438"
-- 
1.7.1



