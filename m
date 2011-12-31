Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adrianopallavicino@gmail.com>) id 1RgwTr-00084G-I5
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Dec 2011 11:48:03 +0100
Received: by eeit10 with SMTP id t10so9233259eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2011 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YNrK8Qqi8+3FdWgJl0thgSVBv/hbXen+5HzGZOTysOY=;
	b=PJ5VrwgvhTCX2oPcliorond2tgggbhl3Ura/1SZ/3+Ab/8OPtA1FgIjbwPmm3zPjdj
	lyG0AFySOQ+IDW7klQe9kHnIcTW5+d4bTUUux68uh0ZS1FX81u+13JW4+3mwsk4KL5y8
	CfhRhNgDjeDBJ+vTAjV5Xz1Sbc9zH6Jfe/AjA=
Received: by 10.14.16.145 with SMTP id h17mr16803161eeh.62.1325328037957;
	Sat, 31 Dec 2011 02:40:37 -0800 (PST)
Received: from localhost.localdomain
	(host39-232-static.225-95-b.business.telecomitalia.it.
	[95.225.232.39]) by mx.google.com with ESMTPS id
	t59sm160565946eeh.10.2011.12.31.02.40.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Dec 2011 02:40:36 -0800 (PST)
From: Adriano Pallavicino <adrianopallavicino@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Dec 2011 11:40:13 +0100
Message-Id: <1325328013-23217-1-git-send-email-adriano.pallavicino@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Adriano Pallavicino <adriano.pallavicino@gmail.com>
Subject: [PATCHv1] binutils_2.20.1 fixed md5 and sha256 sum
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
X-List-Received-Date: Sat, 31 Dec 2011 10:48:03 -0000

Signed-off-by: Adriano Pallavicino <adriano.pallavicino@gmail.com>

Fixed md5sum and sha256sum
---
 recipes/binutils/binutils_2.20.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
index 5154e2d..f40b676 100644
--- a/recipes/binutils/binutils_2.20.1.bb
+++ b/recipes/binutils/binutils_2.20.1.bb
@@ -24,8 +24,8 @@ SRC_URI_append_nios2 =" \
 	file://binutils-nios2.patch \
 	"
 
-SRC_URI[tarball.sha256sum] = "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
-SRC_URI[tarball.md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
+SRC_URI[tarball.sha256sum] = "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
+SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
 
 # powerpc patches
 SRC_URI += "\
-- 
1.7.4.1



