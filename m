Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqes-0004gT-LR
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:05:34 +0100
Received: by fxm17 with SMTP id 17so12730649fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=rSPa1NjmAEYVHV66OKdFaUtkt14FNaQeXH54/+msRsg=;
	b=pg8e0+Va4cg8YyKCmutsHXnYvvFujCsu4pRMhEgo83M8GZYUEhoEZtXu/7A4+uF98i
	2FWWjoPhglRSjIzwlGGJREg/afJ9Q8q02+B8egv4IApNk5Cl7I99YEbFpDEh2jd+3GfP
	m0LGJOQCJlg+efSrOggioXaDu3E1nUVkzWXcs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cWKGKZ9OwHCZMERNWysAe3x00qPe6Kyou/eib2GNFwlT3tA7mSWeo3+i41W3qdjWXX
	nabOw8aOTHvvGJwKoJKfa9WcP/W+C9meCXTJg/M+4CvgyYhFykYqInG+nI4fkuUusMAD
	lg6+tE3yMmjWX5wf873AIoW1QHHp/GLA4GPEA=
Received: by 10.223.83.201 with SMTP id g9mr14365fal.140.1294084939431;
	Mon, 03 Jan 2011 12:02:19 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a2sm4881421faw.46.2011.01.03.12.02.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:17 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000pE-S3; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:02:06 +0100
Message-Id: <1294084926-3115-12-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 12/12] xz: bump version
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
X-List-Received-Date: Mon, 03 Jan 2011 20:05:34 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/xz/xz.inc            |    1 +
 recipes/xz/xz_4.999.9beta.bb |    5 -----
 recipes/xz/xz_5.0.0.bb       |    5 +++++
 3 files changed, 6 insertions(+), 5 deletions(-)
 delete mode 100644 recipes/xz/xz_4.999.9beta.bb
 create mode 100644 recipes/xz/xz_5.0.0.bb

diff --git a/recipes/xz/xz.inc b/recipes/xz/xz.inc
index cc4f966..ad23884 100644
--- a/recipes/xz/xz.inc
+++ b/recipes/xz/xz.inc
@@ -1,6 +1,7 @@
 DESCRIPTION = "XZ Utils is free general-purpose data compression software with high compression ratio.  XZ Utils are the successor to LZMA Utils."
 SECTION = "console/utils"
 LICENSE = "Public Domain"
+HOMEPAGE = "http://tukaani.org/xz/"
 INC_PR = "r0"
 S ?= "${WORKDIR}/xz-${PV}"
 EXTRA_OECONF = "--enable-shared"
diff --git a/recipes/xz/xz_4.999.9beta.bb b/recipes/xz/xz_4.999.9beta.bb
deleted file mode 100644
index 8733023..0000000
--- a/recipes/xz/xz_4.999.9beta.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require xz.inc
-PR = "${INC_PR}.0"
-SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"
-SRC_URI[xz.md5sum] = "cc4044fcc073b8bcf3164d1d0df82161"
-SRC_URI[xz.sha256sum] = "330312c4397608d8b7be362cc7edbfeafa6101614bc2164d816ea767656aa15c"
diff --git a/recipes/xz/xz_5.0.0.bb b/recipes/xz/xz_5.0.0.bb
new file mode 100644
index 0000000..cbf1112
--- /dev/null
+++ b/recipes/xz/xz_5.0.0.bb
@@ -0,0 +1,5 @@
+require xz.inc
+PR = "${INC_PR}.0"
+SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2"
+SRC_URI[md5sum] = "0652c09fdbb93ae2ce78c1368ffda612"
+SRC_URI[sha256sum] = "47a89e65c4690364a0123871a221e663d23a9fbd1ca756a804b10dd4006056d8"
-- 
1.7.2.3



