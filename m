Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <angelox.123@gmail.com>) id 1PHmpS-0005UO-8D
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 01:21:50 +0100
Received: by yxd5 with SMTP id 5so814484yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Nov 2010 16:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=oIEMT3Cn05PwyjUdnlplt7ZhhRUpUcDSPg7Y+Sdku5c=;
	b=cLxIr8YID9Y4seVaKauHdHUH9Z5lyGrLrwiKKRTNzE+R1o3/kcvPhcMxueSNihJeLT
	uPIsRGb/lIRN40usGICj5DTd36tZyGewjlkd+qjCcdSh+qo9S6U4iUDLifx4HA56PRfr
	zunASAZAgr2vLbuUGHW+bGShKREbyyJ0bMZlM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EPXooqqDleBjvXqvSpyV5GNgthJ2bjP7KTagkYRQeU2R8ZczDqRJiDvYDhGuZCmUgF
	TGw4LzamwE9ilulyuaDVkac7GDv6KhaGsj+HSCkmH7vykujLwYO64MhrkyfhHNbFmO+9
	bP6vOrSU6mumsOfqt2aDJmvtO0qHzRNlEBryE=
Received: by 10.151.112.2 with SMTP id p2mr8297966ybm.398.1289780446287;
	Sun, 14 Nov 2010 16:20:46 -0800 (PST)
Received: from localhost.localdomain (201-95-47-20.dsl.telesp.net.br
	[201.95.47.20])
	by mx.google.com with ESMTPS id p30sm2662528ybk.20.2010.11.14.16.20.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Nov 2010 16:20:45 -0800 (PST)
From: angelox_123 <angelox.123@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Nov 2010 22:20:38 -0200
Message-Id: <1289780438-9926-1-git-send-email-angelox.123@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <angelox.123@gmail.com>
References: <angelox.123@gmail.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: angelox.123@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] metano.conf: Change eglibc to glibc
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
X-List-Received-Date: Mon, 15 Nov 2010 00:21:51 -0000

* Change eglibc to glibc on Metano's configuration file

Signed-off-by: Angelo S. Mavridis Bartolome <angelox.123@gmail.com>
---
 conf/distro/metano.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
index 4b47250..934c598 100644
--- a/conf/distro/metano.conf
+++ b/conf/distro/metano.conf
@@ -81,7 +81,7 @@ MACHINE_OVERRIDES += "${MACHINE_CLASS}"
 #############################################################################
 # TOOLCHAIN SELECTION
 #############################################################################
-LIBC ?= "eglibc"
+LIBC ?= "glibc"
 require conf/distro/include/sane-toolchain.inc
 require conf/distro/include/arm-thumb.inc
 
-- 
1.7.2.3



