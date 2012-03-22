Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAm3E-000518-3D
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 18:43:52 +0100
Received: by wibhj13 with SMTP id hj13so970789wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 10:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=MTJH2NCfdaGZIGFGjCmzlCGfBmI+rE0FVkuzrcb3spo=;
	b=jh6SLnVLYxja4+rgMHY89VfoTZf5NvBgaVAP5lcOI2ASk8kMI61nzs9286VetbP6DS
	TvHIuhd0ezJ2VIrBWZQV7JSZ5UFdML/LY1Voog0WDOlmfUkBJrbrnSzh43VmVjo3Am+6
	dwyq2CNsHfNYRKqDDVSAjHGt6DeCQZd2cbBdVR7DmESIqAprZCGE1aOfMFXd3AY/9/Fl
	AxRE2gdZVKmcd44gwi4mFGuB7r4VZamjiLRYF+p3KJj1hYhWuyzFPOqR2LGBOSEmxdwY
	0oNae2U9ki+ANFQKdJNppZxrZIL3KJS1wJIfaFIEW/D9xnm1tc56Q1GptxN9J+q5vdrQ
	5KAw==
Received: by 10.216.132.151 with SMTP id o23mr5001524wei.120.1332437696663;
	Thu, 22 Mar 2012 10:34:56 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n15sm6755618wiw.6.2012.03.22.10.34.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 10:34:56 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 18:34:50 +0100
Message-Id: <1332437690-32065-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQnO0ov+6W8ZxJfF35DBpUAp32pl9wwON/OSshuXtlPlXuA+oydPluEmh19uxr7csxZBMxb9
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] toolchain-layer: initial add
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
X-List-Received-Date: Thu, 22 Mar 2012 17:43:52 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 toolchain-layer/COPYING.MIT     |   17 +++++++++++++++++
 toolchain-layer/README          |   14 ++++++++++++++
 toolchain-layer/conf/layer.conf |   25 +++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 toolchain-layer/COPYING.MIT
 create mode 100644 toolchain-layer/README
 create mode 100644 toolchain-layer/conf/layer.conf

diff --git a/toolchain-layer/COPYING.MIT b/toolchain-layer/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/toolchain-layer/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy 
+of this software and associated documentation files (the "Software"), to deal 
+in the Software without restriction, including without limitation the rights 
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
+copies of the Software, and to permit persons to whom the Software is 
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in 
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
+THE SOFTWARE.
diff --git a/toolchain-layer/README b/toolchain-layer/README
new file mode 100644
index 0000000..15ac069
--- /dev/null
+++ b/toolchain-layer/README
@@ -0,0 +1,14 @@
+This layer depends on:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: master
+revision: HEAD
+
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][toolchain-layer]' in the subject'
+
+When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][toolchain-layer'
+
+You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
+
+Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
+
diff --git a/toolchain-layer/conf/layer.conf b/toolchain-layer/conf/layer.conf
new file mode 100644
index 0000000..ca81eb1
--- /dev/null
+++ b/toolchain-layer/conf/layer.conf
@@ -0,0 +1,25 @@
+# It really depends on order of the layers appearing in BBLAYERS
+# variable in toplevel bblayers.conf file, where bitbake will search
+# for .inc files and others where bitbake uses BBPATH since it will
+# search the directories from first to last as specified in BBPATH
+# Therefore if you want a given layer to be considered high priority
+# for the .inc and .conf etc. then consider it adding at the beginning
+# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
+# the recipe contention so the order of directories in BBFILES does 
+# not matter.
+
+# We have a conf directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "toolchain-layer"
+BBFILE_PATTERN_toolchain-layer := "^${LAYERDIR}/"
+
+# Define the priority for recipes (.bb files) from this layer,
+# choosing carefully how this layer interacts with all of the
+# other layers.
+
+BBFILE_PRIORITY_toolchain-layer = "6"
+
-- 
1.7.2.5



