Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OHEb7-0001du-7B
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 13:20:36 +0200
Received: by pxi14 with SMTP id 14so2205835pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 04:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=foohE3ZpLm+QLfQlpjwHISIFkwKFOP3942YK4iQn5+I=;
	b=pP7PxBnsf+I/5rKqJXgiHYn/tHKuPFGakuPK/f296+3qaJHSiETgVJCBPUEElw/4hy
	huFV3r7ZTDb9pUq3cNVJ9z25B1pQmFLnjrJn2Oxd7K5VoXmrXwPIm5FKkvUGEZdOiP9P
	Bj3VknT+VSinMnXFB3UDgA/w7zCy5ItFJKKBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=MIvPNy5Avx7gOlYQa/90PBz1jTdkzmFaz5iArqI7dg/U14uvTE/ActWaFchSZsX5wj
	ixQL6uUSr7yaR8BhI5Zwwa8YjPyHPO94OsTgaCLGRGeBmKZTfeO3xGOLlDkI0oD7SJdq
	miSoNe+UBYAOia1L6WpyvWctIl7vpm3pF7gM0=
Received: by 10.115.39.34 with SMTP id r34mr7440443waj.123.1274872339571;
	Wed, 26 May 2010 04:12:19 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b6sm56284012wam.21.2010.05.26.04.12.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 04:12:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 04:12:14 -0700
Message-Id: <1274872334-31018-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] image.bbclass: Make zap_root_password to disable root's password not the user root itself.
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
X-List-Received-Date: Wed, 26 May 2010 11:28:17 -0000
X-List-Received-Date: Wed, 26 May 2010 11:28:17 -0000

* With shadow now running pwconv after commit 7c5f81b2139e55622ca2f23ff6b63438d4825d87
  It converts :*: passwd entry into equivalent /etc/shadow entry :*:
  which in shadow means disable the account as per
  http://tldp.org/LDP/lame/LAME/linux-admin-made-easy/shadow-file-formats.html
  As a result root can not login unless one boots into shell and then
  resets the password.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index f695d3c..2105195 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -205,7 +205,7 @@ log_check() {
 # can decide if they want it or not
 
 zap_root_password () {
-	sed 's%^root:[^:]*:%root:*:%' < ${IMAGE_ROOTFS}/etc/passwd >${IMAGE_ROOTFS}/etc/passwd.new
+	sed 's%^root:[^:]*:%root::%' < ${IMAGE_ROOTFS}/etc/passwd >${IMAGE_ROOTFS}/etc/passwd.new
 	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
 } 
 
-- 
1.7.0.4



