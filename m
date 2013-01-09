Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tt5Xf-0004vx-Ox
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 00:58:44 +0100
Received: by mail-ea0-f176.google.com with SMTP id d13so888934eaa.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 15:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=s6JbjXvt4ghy13KllUeq7BV7DBT3llcat3dLyVnht3k=;
	b=HNEDvNkoL02tYi59hVNWnqzMvW18YVWhuiMtAqFFXRcAFyrjvAnR/plsXQznqbC3Be
	cZP/IpbaC9fokubffg8JdC1ni4plNzI4mNZuZ2m5AtUqSVfgq51wlOjFMtFe4VL33jzR
	hhmf+b4wUhkD21cDBFkZPHoYy2XJjJ3Af/q4NG4izVqtQbs+Xssm8+RNX1EYJDGpcaSf
	roTN+1DnOp5s1ZQ6FKZ7rf7YSmH9uW8xu8pSmlK3RMsbuanev5rr+1UVhyRLWMwX4G9Z
	hpV5ehoAEjYSHMwxJWVZnBKvFVIZWIV8OdaNoGzvqLKNnZEyanoCaxPXc0zVCf7KMexT
	cm9Q==
X-Received: by 10.14.218.69 with SMTP id j45mr186760800eep.35.1357775011383;
	Wed, 09 Jan 2013 15:43:31 -0800 (PST)
Received: from localhost.localdomain (p5B0A280F.dip.t-dialin.net.
	[91.10.40.15])
	by mx.google.com with ESMTPS id e2sm144302197eeo.8.2013.01.09.15.43.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 15:43:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 00:43:14 +0100
Message-Id: <1357774995-1104-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-multimedia/meta-oe/meta-systemd 2/3] physfs: initial add 2.0.3
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
X-List-Received-Date: Wed, 09 Jan 2013 23:58:45 -0000
X-List-Received-Date: Wed, 09 Jan 2013 23:58:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/physfs/physfs_2.0.3.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/physfs/physfs_2.0.3.bb

diff --git a/meta-oe/recipes-support/physfs/physfs_2.0.3.bb b/meta-oe/recipes-support/physfs/physfs_2.0.3.bb
new file mode 100644
index 0000000..641d7ec
--- /dev/null
+++ b/meta-oe/recipes-support/physfs/physfs_2.0.3.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "PhysicsFS is a library to provide abstract access to various archives"
+HOMEAPAGE = "http://icculus.org/physfs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5d94e3eaaa10b00ca803ba35a3e87cde"
+DEPENDS = "readline zlib"
+
+inherit cmake
+
+SRC_URI = "http://icculus.org/${PN}/downloads/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "c2c727a8a8deb623b521b52d0080f613"
+SRC_URI[sha256sum] = "ca862097c0fb451f2cacd286194d071289342c107b6fe69079c079883ff66b69"
-- 
1.7.4.4



