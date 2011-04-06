Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7VNf-0007tg-Oi
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 18:14:55 +0200
Received: by bwz5 with SMTP id 5so1318039bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 09:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=EDsnpWHPEABd2Oy1BOnxaotVQMUt7zMgQI9EHH2mn6I=;
	b=fZvPrU46RKGzXEQu6G6NYVVaVDKdNDC8jDQ+mX9JMHLxiZWB6Wg3MqdRMMPtjYmaMQ
	xJSzc2qHsdAJ3OgoSOqF6ayuDsbn4yOTQkLlgVIlJZGNOpaJ/E7bxV6H6tyeJTIQ16ol
	iigLRZdLCqRU5rbFt879KRo2EspPGzgkP3j1k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qS7EbX+0uAPoVd41QUZnmDpkjdECZtk6zoe/8xB6K5YtAWSi80gI/pTwDdSjnC8spf
	sBpDxxOAHG5BB8vcxhJl5sY7Wd3szhUoUJqydNrMClxDTpxH5VVb7dasY0CKPsfxAP2f
	sjgOhCY8kOlRaiV94evgfFV1lx3VPU3viSfvc=
Received: by 10.204.188.65 with SMTP id cz1mr1117636bkb.108.1302106368558;
	Wed, 06 Apr 2011 09:12:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v21sm466679bkt.23.2011.04.06.09.12.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 09:12:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 18:12:23 +0200
Message-Id: <1302106343-5331-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1302106343-5331-1-git-send-email-Martin.Jansa@gmail.com>
References: <ilt2d9$sr2$1@dough.gmane.org>
	<1302106343-5331-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2 3/3] generate-packages-dynamic-list: contrib script to generate disjunctive PACKAGES_DYNAMIC for each pack base/good/bad/ugly
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
X-List-Received-Date: Wed, 06 Apr 2011 16:14:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/generate-packages-dynamic-list.sh    |   60 ++++++++++++++++++++
 1 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100755 contrib/gstreamer/generate-packages-dynamic-list.sh

diff --git a/contrib/gstreamer/generate-packages-dynamic-list.sh b/contrib/gstreamer/generate-packages-dynamic-list.sh
new file mode 100755
index 0000000..932aca4
--- /dev/null
+++ b/contrib/gstreamer/generate-packages-dynamic-list.sh
@@ -0,0 +1,60 @@
+#!/bin/sh
+
+# PATH to tmpdir
+TMPDIR=tmp
+
+if [ $# -lt 1 ] ; then
+  echo "Usage: $0 path/to/recipe.bb"
+  exit 1
+fi
+
+if [ $# -eq 2 ] ; then
+  TMPDIR=$2
+fi
+
+if [ ! -d ${TMPDIR} ] ; then
+  echo "TMPDIR '${TMPDIR}' does not exist, update TMPDIR in script or use 2nd parameter"
+  exit 2
+fi
+
+RECIPE=$1
+
+if grep PACKAGES_DYNAMIC ${RECIPE} >/dev/null; then
+  echo "${RECIPE} already has PACKAGES_DYNAMIC defined, please remove it first"
+  exit 3
+fi
+
+# force old behavior spliting all
+echo 'PACKAGES_DYNAMIC = "gst-plugin-*"' >> ${RECIPE}
+
+echo "Cleaning ${RECIPE}"
+# don't know better way to get right WORKDIR from shell, we need to clean it anyways
+WORKDIR=`bitbake -c clean -v -b ${RECIPE} | grep "NOTE: removing work" | sed 's/NOTE: removing //g'`
+
+TMPDIR_PKGS=${TMPDIR}/${WORKDIR}/packages-split/
+echo "Packages are expected in ${TMPDIR_PKGS}"
+
+echo "Building ${RECIPE}"
+# -c build because some people use rm_work
+bitbake -c build -b ${RECIPE}
+
+if [ $? -ne 0 ] ; then
+  echo "${RECIPE} build failed, fix build first"
+  sed -i '/^PACKAGES_DYNAMIC = "gst-plugin-\*"$/d' ${RECIPE}
+  exit 4
+fi
+
+
+if ls -1d ${TMPDIR_PKGS}/gst-plugin-*-dev | grep gst-plugin-.*-dev >/dev/null; then
+  # replace temporary PACKAGES_DYNAMIC spliting all with list of created packages
+  sed -i '/^PACKAGES_DYNAMIC = "gst-plugin-\*"$/d' ${RECIPE}
+  echo '' >> ${RECIPE}
+  echo 'PACKAGES_DYNAMIC = "\' >> ${RECIPE}
+  ls -1d ${TMPDIR_PKGS}/gst-plugin-*-dev | grep gst-plugin-.*-dev| sed "s#${TMPDIR_PKGS}/\(.*\)-dev#\1* \\\#g" >> ${RECIPE}
+  echo '"' >> ${RECIPE}
+  echo "${RECIPE} PACKAGES_DYNAMIC were hopefully updated"
+else
+  echo "No directories found ${TMPDIR_PKGS}/gst-plugin-*-dev"
+  exit 5
+fi
+
-- 
1.7.4.1



