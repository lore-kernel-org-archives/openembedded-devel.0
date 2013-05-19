Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17Y-00005B-V9
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:46 +0200
Received: by mail-ee0-f45.google.com with SMTP id l10so3307378eei.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=r/8KeEJf8p3p6VwIMKvV2Cr5yqPULEIhd8nxXlo262g=;
	b=IpiWY+lQfyrLSwyq9tVcdtCAyosdVNDrA4n6UPaDcqjRe57lTSsqk9gZlnO3XXzk1z
	hPLHxDILbGqtoVP/fGbUwNRfA6wZMxHTJvNpSWXVW2BTV35P/5qpXWmRrbHZnuD8fICl
	osRPhww5LRShgBeUOx2w+mGKaMQLTWCiP5E3a3qg6y4Ii8OKiDSGT6a9ocpjqTi4JyoN
	dWn97CkbDcot4yVoiWmyRU3xWIn4p7Ng+qt+q9DYNaO/LVSQ7AJie6GncQ1YW4tIecc2
	b4vRJquXb58LPzFA7D3C7jnLI/7Q7R9JgWYWU7r7oMjWxkBscWJPFc6tin/Jr4q/4Ain
	KNiQ==
X-Received: by 10.14.108.1 with SMTP id p1mr152886204eeg.31.1368959246665;
	Sun, 19 May 2013 03:27:26 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:04 +0200
Message-Id: <1368959233-28288-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 02/11] libsigc++-2.0: update to 2.2.11
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
X-List-Received-Date: Sun, 19 May 2013 10:45:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...sigc++-2.0_2.2.9.bb => libsigc++-2.0_2.2.11.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.2.9.bb => libsigc++-2.0_2.2.11.bb} (70%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.9.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
similarity index 70%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.9.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
index bcf69b8..fe3c891 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.9.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 DEPENDS = "mm-common"
 
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/libsigc++-${PV}.tar.gz;name=archive"
-SRC_URI[archive.md5sum] = "9d202af538d912fdacc9b89c84a1ef24"
-SRC_URI[archive.sha256sum] = "ef60d60403b6401e2bee97b6e3e1c3a464fdb6410285e0055eb1525b9fcc4473"
+SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/libsigc++-${PV}.tar.xz"
+SRC_URI[md5sum] = "815d0c6d61601f51bbcaeef6826606b0"
+SRC_URI[sha256sum] = "9834045f74f56752c2c6b3cdc195c30ab8314ad22dc8e626d6f67f940f1e4957"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
1.7.4.4



