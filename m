Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PlmIu-0002BC-RL
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Feb 2011 18:52:12 +0100
Received: by wyb40 with SMTP id 40so3230428wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Feb 2011 09:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=a0DMU+0dHcRDZgUnyZDR75UoWs9pm929wETRAGu4ACc=;
	b=KfynFIwx6Jkf0GFxD1Gaygu1k6s6c00CwG0xeSz2IeAFSpcFIJcDUg7RyTFbxwjxcl
	04yq+2yKCe348R9wJwmx1Azz1FMQMcmG4t7lfV7yGg04HaS9BB4mjw/R1dK0xN7gvEVu
	lDuuIJ6/XCMJj2U3J4yvxyfBcFI9SV0SQGYp8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=YsVu/WrIDivaxNNd3topZsvz8fEmSH0VXvET/6mh3BiCAoUeFdhEDw1yz+XBUggsoj
	DP5dTqjjx51DZwMGRX7sSmDIAWbpp75BLKuAi7t9npKK++7obAjpENxsUuVO2CCEeWZr
	/4+qoqbeAfztopDy8uJ3WyNIW5/wHiZMbAsdQ=
Received: by 10.227.195.79 with SMTP id eb15mr13432384wbb.192.1296926455279;
	Sat, 05 Feb 2011 09:20:55 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id u2sm1106353weh.36.2011.02.05.09.20.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Feb 2011 09:20:53 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Feb 2011 18:20:40 +0100
Message-Id: <1296926448-2465-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] apt_0.7.20.2: fixed compilation errors with gcc-4.4.
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
X-List-Received-Date: Sat, 05 Feb 2011 17:52:12 -0000

Just like in apt-native_0.7.20.2.bb.
Related bugzilla entry: http://bugs.openembedded.org/show_bug.cgi?id=5511
---
 recipes/apt/apt_0.7.20.2.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/apt/apt_0.7.20.2.bb b/recipes/apt/apt_0.7.20.2.bb
index bd0f41e..b03ef5d 100644
--- a/recipes/apt/apt_0.7.20.2.bb
+++ b/recipes/apt/apt_0.7.20.2.bb
@@ -5,6 +5,7 @@ require apt.inc
 
 SRC_URI += "file://no-doxygen.patch \
             file://no-ko-translation.patch \
+            file://fix-gcc-4.4-compile.patch \
             file://use-host.patch "
 PR = "r2"
 
-- 
1.7.1



