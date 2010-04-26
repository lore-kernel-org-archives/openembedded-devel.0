Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1O6X67-0001QS-N8
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 00:48:16 +0200
Received: by fg-out-1718.google.com with SMTP id 19so2429415fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 15:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=b1hJg2f6aVVGfTfFliAXPRcE/nGVOBlvnwjY1WhghzY=;
	b=nhMkKcfoJhzQFA1XiaT8M2kaRDi5BvcQ4GkAlJ7KsiFHFJElM8ulplVV1/B1sAz5Kq
	qB/RvW0e3XEa4Dv3EYb7O4Mscjh5FZOj5mRfgLO2eYY/eUPw0NWxrghv6atIxJu+A8kz
	Vt5NaqKf9F/JSAykxawH2m9GOaIvpmaLn4NcE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fxax6GBxBnIl9YcDESet/oZycRCZX4guPtv9D57HDcCBGBOUaCzzUXYM9alH4KBuKx
	ZKpodUzu8TJPJEQ9soe0yzk59zUMLzPINzI5x3L58alJiSGsgUJ0jT1xCuxsGYYJx3x0
	pKlNRoOsiE7m2msBrVOSYq0zILZv0Oyt1e+Rk=
Received: by 10.87.62.17 with SMTP id p17mr230260fgk.30.1272321877978;
	Mon, 26 Apr 2010 15:44:37 -0700 (PDT)
Received: from localhost.localdomain (z0701.wist.uni-linz.ac.at
	[193.171.42.194])
	by mx.google.com with ESMTPS id e20sm4047987fga.16.2010.04.26.15.44.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Apr 2010 15:44:37 -0700 (PDT)
From: =?utf-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Apr 2010 00:41:38 +0200
Message-Id: <1272321699-5405-2-git-send-email-matgnt@gmail.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1272321699-5405-1-git-send-email-matgnt@gmail.com>
References: <1272321699-5405-1-git-send-email-matgnt@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2 2/3] topas910: Add u-boot support.
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
X-List-Received-Date: Mon, 26 Apr 2010 22:48:16 -0000

---
 recipes/u-boot/u-boot-topas_git.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-topas_git.bb

diff --git a/recipes/u-boot/u-boot-topas_git.bb b/recipes/u-boot/u-boot-topas_git.bb
new file mode 100644
index 0000000..d7ce94c
--- /dev/null
+++ b/recipes/u-boot/u-boot-topas_git.bb
@@ -0,0 +1,23 @@
+require u-boot.inc
+
+PV = "2008.10+${PR}+git"
+PR ="r2"
+PE = "1"
+
+SRC_URI = "git://git.labs.kernelconcepts.de/u-boot-topas.git/;protocol=git;tag=ca81d0245469af242e9a73360e46e99235eaadbf \
+          "
+
+UBOOT_MACHINE_topas910 = "topas910_config"
+
+S = "${WORKDIR}/git/u-boot-topas910/"
+
+do_compile () {
+        unset LDFLAGS
+        unset CFLAGS
+        unset CPPFLAGS
+        oe_runmake ${UBOOT_MACHINE}
+        oe_runmake all
+#        oe_runmake tools env
+        oe_runmake tools
+}
+
-- 
1.6.3.3



