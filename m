Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Pay10-0002Me-6f
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 23:09:02 +0100
Received: by yie16 with SMTP id 16so4566700yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 14:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=eHb2zN1U1rtFILgnampZ1zBPaUqPhv2xh/TTqEgFdC4=;
	b=iFg7IZy/Z2Q8smKXzBXrRVtueivM3JPeJMdgqeoua6K6CsIoVQ/aAcUfeewgjyKcUx
	r9fEWCkuM5qXl+MGMmreMzkemqndujwEsuLwQkxl4bTfYtUUjV+lixjBgu7htLnOcIb/
	jooDBWGy/eN6kKMMe8wX38s5Gd/AfHeCA3eq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vccQFR7O8CHWT+IEDB/EpqMtfk82qHixWO0LhLGbijbGLdeRsO/BqkCQqKFo4N1Api
	NHejuuooVmbbOJSTEyq7lKgjx0ykxw7oHXm6EfQX78YdoYj5ffM7Y9DlBLlN4vrAVVdf
	KlKpJehCVf35/jvb0vqV/uSJ8Kbgl0OWSiEOk=
Received: by 10.150.219.3 with SMTP id r3mr24594535ybg.240.1294351715562;
	Thu, 06 Jan 2011 14:08:35 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id 68sm936556yhl.19.2011.01.06.14.08.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 06 Jan 2011 14:08:34 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jan 2011 15:39:46 -0600
Message-Id: <1294349986-19411-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1294349986-19411-1-git-send-email-chase.maupin@ti.com>
References: <1294349986-19411-1-git-send-email-chase.maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/2] openssl: add support for OCF linux drivers
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
X-List-Received-Date: Thu, 06 Jan 2011 22:09:02 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* This patch adds support for openssl to use OCF linux drivers
  if they are available.
    * If the drivers are not available then openssl will
      default back to its own software implementation.
* Only enabled for the target side version since it doesn't
  make much sense for the host system.
* Bump the PR.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/openssl/openssl_1.0.0c.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/openssl/openssl_1.0.0c.bb b/recipes/openssl/openssl_1.0.0c.bb
index 1c0e37a..9348e53 100644
--- a/recipes/openssl/openssl_1.0.0c.bb
+++ b/recipes/openssl/openssl_1.0.0c.bb
@@ -1,10 +1,16 @@
 inherit pkgconfig
 
 require openssl.inc
+
+# For target side versions of openssl enable support for OCF Linux driver
+# if they are available.
+DEPENDS += "ocf-linux"
+CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+
 SRC_URI[src.md5sum] = "ff8fb85610aef328315a9decbb2712e4"
 SRC_URI[src.sha256sum] = "f731b36de3edaa361179ae6f449668b248a360e34e31e92902d976e9b9d604eb"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.0.4



