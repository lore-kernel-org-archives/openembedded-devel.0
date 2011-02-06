Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pm6zp-0002om-KC
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 16:57:53 +0100
Received: by wyb40 with SMTP id 40so3730117wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 07:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=5pIfnoz74QtYNA5v5x60XgDx364uoD8ysH0Mq2vXW5o=;
	b=MzndXAu9NYZq2qFK3u6bPWvf9aGS5+BO3nxBbwwUXSem+JlvES/hUaj3tOu8579RCZ
	O82WlezL0/yjhw7HqN0Kn5Yra2Bgc/EwNg9H5HTBUNwH7AgQDsfxU53ZU3/BJIR7W+wj
	nwSDBLcw9rAeJ2Gz3WvGMaUiDosfjrh6JAcK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=Bu++i7kSGMlW4jXC4xZA0/MJsSkQ2CRJIf72bUY3qdXxbTyL3aSDoNA35iogaQCL62
	oUBzC3RK6QdshRCQVvDFPs04x7j4GdiGBiHLA7itLLBxzHEfVcpI+BbsIctb3sOBCdrL
	K6HAHD0Qv5VSZvXVKJ3tmZQORNrlMhiOxul4A=
Received: by 10.216.30.137 with SMTP id k9mr13240588wea.31.1297007813273;
	Sun, 06 Feb 2011 07:56:53 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id f52sm1630955wes.11.2011.02.06.07.56.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Feb 2011 07:56:52 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Feb 2011 16:56:47 +0100
Message-Id: <1297007807-3333-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH v2] apt_0.7.20.2: fixed compilation errors with gcc-4.4.
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
X-List-Received-Date: Sun, 06 Feb 2011 15:57:53 -0000

Just like in apt-native_0.7.20.2.bb.
Related bugzilla entry: http://bugs.openembedded.org/show_bug.cgi?id=5511

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 recipes/apt/apt_0.7.20.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/apt/apt_0.7.20.2.bb b/recipes/apt/apt_0.7.20.2.bb
index 7921a23..5c932a5 100644
--- a/recipes/apt/apt_0.7.20.2.bb
+++ b/recipes/apt/apt_0.7.20.2.bb
@@ -5,8 +5,9 @@ require apt.inc
 
 SRC_URI += "file://no-doxygen.patch \
             file://no-ko-translation.patch \
+            file://fix-gcc-4.4-compile.patch \
             file://use-host.patch "
-PR = "r2"
+PR = "r3"
 
 require apt-package.inc
 
-- 
1.7.1



