Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id E13996F23F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 18:47:33 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id 142so3634049ykq.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=VEW5qemsZiUupyjupcUMi1oGNEoeXOGxr3cbpA9T8Xw=;
	b=w799zaiWygjxFgNjxMhH0QgSkZYdsRcWFwfgR/912D3OmW9X7WKiklAI+9YcKhehoL
	s8KfTlLxDbH5P8Titv0hmSb/jQXQAnNXUrb6UFxrbqs5oqoXAdKNF/FzVpZOE/SXvtUG
	HVGRT0oluEcgDbJNHgEX/20KA7GcRw36HiJTA+reMwd9+R06r9eTIcTqzxFq0PYpV7lJ
	AMA5kXx/wr/HfH3nH+ognGbclatozAhuCa4EeCLn4zXt4jni0Xwznd/gXnu3M9oYvfzW
	PHRCgpKMpBMGdWKO+UbqfXGzi1MYEHmsV0KJ/jmDBXFCIsrtHRCGLK38aRm/KqERHeoY
	Upng==
X-Received: by 10.236.132.134 with SMTP id o6mr3758167yhi.147.1396291653821;
	Mon, 31 Mar 2014 11:47:33 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	a67sm26057956yhj.10.2014.03.31.11.47.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 11:47:32 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id D468019F09F78; Mon, 31 Mar 2014 15:47:28 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 31 Mar 2014 15:47:28 -0300
Message-Id: <1396291648-10453-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] libinih: Update to 25078f7
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
X-List-Received-Date: Mon, 31 Mar 2014 18:47:34 -0000

This updates the fork to a version based in SVN r29 and include a
CMake fix for out of tree build support.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/inih/libinih_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index 2a13d0a..5030c78 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
 PR = "r3"
 
 # The github repository provides a cmake and pkg-config integration
-SRCREV = "7a43a3655ceffa9f0f7fd68262d8d478c6d0d0af"
+SRCREV = "25078f7156eb8647b3b35dd25f9ae6f8c4ee0589"
 SRC_URI = "git://github.com/OSSystems/inih.git"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


