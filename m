Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id A90DD65F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:37 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so1107836wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=JHRqna6XY7pzRy+q+SJAiQjaOzosNMrmFRmGKfNx678=;
	b=wMNNC6ghs/7Ck0Spg+nSbMf8NOj/WerXWhCmd06pR85M0V8ztw80krd7/HMTaunm3W
	1wQ4bZBc5RxxGz4z9P8xGXMiuKdrarui2u7cWRK4dBW/GgS5pV9Jzc488zgNYgTJDNQN
	yklUm4AcuVVuIf2DK2EPHixdFWoHRPeygFrRcP0BYZnqPzIIrgOUGU0Iu5lTqQFsYaRu
	aDXYxkkllPbeeXja88B6cMt0zi1gKwdIOvM0TOcsY+gbCTU3rhBI13CE3MIPgZ4MBgpM
	ghFbu29n5lsvya/mkFfGt62AA1fvO17X8oDJ4dSksgzyTK40eyJDWDQ9xrWAbcMXOsGF
	jznA==
X-Received: by 10.194.242.33 with SMTP id wn1mr19582516wjc.110.1412151578717; 
	Wed, 01 Oct 2014 01:19:38 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:15 +0200
Message-Id: <1412151555-19865-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 15/15] bash-completion: resolve sysroot conflicts for util-linux and networkmanager
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Oct 2014 08:19:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* continue the priority for packages shipping bash-completion
* oe-core's latest changes turn sysroot conflicts into critical error

ERROR: The recipe bash-completion is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
   /home/a.mueller/tmp/oe-core-glibc/sysroots/overo/usr/share/bash-completion/completions/nmcli
   Matched in manifest-overo-networkmanager.populate_sysroot
   /home/a.mueller/tmp/oe-core-glibc/sysroots/overo/usr/share/bash-completion/completions/su
   Matched in manifest-overo-util-linux.populate_sysroot

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
index 9a0ff35..fbe4278 100644
--- a/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
+++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
@@ -23,9 +23,12 @@ do_install_append() {
 
 	# Delete files already provided by util-linux
 	local i
-	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake; do
+	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake su; do
 		rm ${D}${datadir}/${BPN}/completions/$i
 	done
+
+	# Delete files for networkmanager
+	rm ${D}${datadir}/${BPN}/completions/nmcli
 }
 
 RDEPENDS_${PN} = "bash"
-- 
1.8.3.1


