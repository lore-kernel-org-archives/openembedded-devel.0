Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UB2jT-0005CO-0M
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 13:37:09 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so1113443pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=QjYeKgT2f5O2TiQQNjywYezTW6WGtr1G1hQ+YnmO8Jo=;
	b=XiEgqOH0uyNtw4QurmZO+N4Q31Jb75sI8AjOa+66W9NhelD47X5eAyQoYw9e8UliNM
	tK0+cK0L3HHW+89DhY1rNbWSPpqZOJC3gnDgYdQm4QmUPURNHsCNdRebGMG27u+Gq+tw
	x3xXzs9B0PVkb5k5Asi9h+q8/AzlgHoLCWh+4vR5IHe3/P/eHhcW9sr5WggC4sYHbYNU
	cf6Rw5oiH+UAyFOeUnijMS3lWeYK/EJRhW8SiGkO/R92t69QXBsRPXfbKJPaO7U69+2M
	cRHJcPtuqruJWwmUHLFMzBCXDxEmBnNiHn2O1gV3wiEX7mQsSShoQP/uja9wS2nAdWG8
	Hzuw==
X-Received: by 10.68.154.202 with SMTP id vq10mr8756655pbb.45.1362054044368;
	Thu, 28 Feb 2013 04:20:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id mz8sm5585027pbc.9.2013.02.28.04.20.38
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 04:20:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Feb 2013 13:20:07 +0100
Message-Id: <228648beacc815ae6da8390aa763a6dc97373540.1362053615.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1362053615.git.Martin.Jansa@gmail.com>
References: <cover.1362053615.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1362053615.git.Martin.Jansa@gmail.com>
References: <cover.1362053615.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH][for-danny 1/3] meta-ruby: add empty layer
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
X-List-Received-Date: Thu, 28 Feb 2013 12:37:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-ruby/COPYING.MIT     | 17 +++++++++++++++++
 meta-ruby/README          | 15 +++++++++++++++
 meta-ruby/conf/layer.conf |  9 +++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 meta-ruby/COPYING.MIT
 create mode 100644 meta-ruby/README
 create mode 100644 meta-ruby/conf/layer.conf

diff --git a/meta-ruby/COPYING.MIT b/meta-ruby/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/meta-ruby/COPYING.MIT
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
diff --git a/meta-ruby/README b/meta-ruby/README
new file mode 100644
index 0000000..51cab2b
--- /dev/null
+++ b/meta-ruby/README
@@ -0,0 +1,15 @@
+This layer depends on:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: master
+revision: HEAD
+
+URI: git://git.openembedded.org/meta-openembedded
+branch: master
+revision: HEAD
+
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+
+When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+
+Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
diff --git a/meta-ruby/conf/layer.conf b/meta-ruby/conf/layer.conf
new file mode 100644
index 0000000..6c2369f
--- /dev/null
+++ b/meta-ruby/conf/layer.conf
@@ -0,0 +1,9 @@
+# We have a conf and classes directory, append to BBPATH 
+BBPATH .= ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "ruby-layer"
+BBFILE_PATTERN_ruby-layer := "^${LAYERDIR}/"
+BBFILE_PRIORITY_ruby-layer = "7"
-- 
1.8.1.4



