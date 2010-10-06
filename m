Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3bF3-00026J-9L
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 23:09:38 +0200
Received: by ewy7 with SMTP id 7so4192ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=i+AIBZ2D1XZ1EEDgyTXLoGMFruehDQ3lAKFYOkJf9rI=;
	b=Zu/BJFQ4QKAlARDtRwv9yr+tN4mdQpVZUWHR+DEjjSnPdzAeUyZ2vWqfVP5Gx+RVY5
	xVm6ykq1mtgkyAuIRDBPxjvIHcWKPYZ5MdtVrDZgddplJ+d9jG2T6lJiCk1LL+aetpAa
	xkA148DzmN7mQl4jcySLGPwbVB1jy/aTJMVhI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nx0TU8VzcTqUJX4rZxaUqLX3kF+UtcN/J+uCl4wGIGg69sHmRjaj1/WATNiJc/GWbY
	uDPTw16h1+LVDbV2kT46djCPWQSS7gMtQOG9rePUoSpStvG/hqOKVV8RTCmAfRCaBQOY
	wTBVZxsiyIr8fGdqyOkLvOJKZngCg1elnQVT8=
Received: by 10.213.12.196 with SMTP id y4mr9743205eby.89.1286399357669;
	Wed, 06 Oct 2010 14:09:17 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm2171654eei.1.2010.10.06.14.09.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 14:09:16 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 23:08:58 +0200
Message-Id: <1286399340-15927-3-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
References: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	SUBJ_ALL_CAPS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Wed, 06 Oct 2010 21:09:39 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/distutils-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/distutils-base.bbclass b/classes/distutils-base.bbclass
index 59864f7..4d5de24 100644
--- a/classes/distutils-base.bbclass
+++ b/classes/distutils-base.bbclass
@@ -1,4 +1,4 @@
 DEPENDS  += "${@["python-native python", ""][(bb.data.getVar('PACKAGES', d, 1) == '')]}"
-RDEPENDS += "${@['', 'python-core']['${PN}' == '${BPN}']}"
+RDEPENDS_${PN} += "${@['', 'python-core']['${PN}' == '${BPN}']}"
 
 inherit distutils-common-base
-- 
1.6.4.2



