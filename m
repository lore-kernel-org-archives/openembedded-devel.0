Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <angelox.123@gmail.com>) id 1PHmt7-0005br-Oi
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 01:25:38 +0100
Received: by gyf3 with SMTP id 3so2872556gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Nov 2010 16:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=qLs93/xaXNYrG1OfknE2++sXNojamyWNyZkIPHv9jjQ=;
	b=jcSQeDpFzaaAoAmSMqLnFAdulvWNJY4RGzggij4RmM3f2HDLGHl3OdC/DYFNpsQpJ4
	pmdzP+eWUgydb7zpCMVVOsuiZcZKlvITqBqAJoWV68NVOndXSC7YZiJ7MQIb2USwKjUH
	vtCV2xcVgDShcM4DEsqn20uiHUXRw/pNi6Usg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=bMQi2Fx1wk8MBooX+/zhP94gFct6qV1SQeC+aL40qXByWJd5jKMcgt/+rt2cbkVJ8Z
	n+eqdwy/z2N7rFUgqzt0fnxY5GhP/qjwUE4KvIbuO+AAanWJs8SQtbiBRXPyTbSYGErF
	KJoUjdCHXYo4HZaqJ8bkPKl5zM8A/ncCfeLYQ=
Received: by 10.150.192.5 with SMTP id p5mr4637055ybf.362.1289780673851;
	Sun, 14 Nov 2010 16:24:33 -0800 (PST)
Received: from localhost.localdomain (201-95-47-20.dsl.telesp.net.br
	[201.95.47.20])
	by mx.google.com with ESMTPS id r18sm2664592yba.15.2010.11.14.16.24.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Nov 2010 16:24:33 -0800 (PST)
From: angelox_123 <angelox.123@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Nov 2010 22:24:22 -0200
Message-Id: <1289780662-9999-1-git-send-email-angelox.123@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <angelox.123@gmail.com>
References: <angelox.123@gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: angelox.123@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: =?UTF-8?B?W1BBVENIIHYyXSBtZXRhbm8uY29uZjogQWRkIElNQUdFX0JBU0VOQU1FIHRvIElNQUdFX05BTUUgaW4gTWV0YW5v4oCZcyBjb25maWd1cmF0aW9uIGZpbGUu?=
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
X-List-Received-Date: Mon, 15 Nov 2010 00:25:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* This will help me to identify the names of our images :)
* By: Angelo S. Mavridis Bartolome (angelox_123) (from IRC #metano_linux),developer and maintainer of Metano Distro

Signed-off-by: angelox_123 <angelox.123@gmail.com>
---
 conf/distro/metano.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
index 934c598..ba0e3d7 100644
--- a/conf/distro/metano.conf
+++ b/conf/distro/metano.conf
@@ -56,7 +56,7 @@ IPKG_VARIANT = "opkg"
 #############################################################################
 # IMAGES CONFIGURATION
 #############################################################################
-IMAGE_NAME = "Metano_Linux-PD.Edition-${DISTRO_VERSION}-${MACHINE}"
+IMAGE_NAME = "Metano_Linux-PD.Edition-${IMAGE_BASENAME}-${DISTRO_VERSION}-${MACHINE}"
 
 CACHE = "${TMPDIR}/cache/${LIBC}/${MACHINE}"
 DEPLOY_DIR ?= "${TMPDIR}/deploy/${LIBC}"
-- 
1.7.2.3



