Return-Path: <pbasista@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE746BCEB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 22:30:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so7957760wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 14:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3hDrOCZm5ut3c5cefQpplpCn+UZTECiIu5Ur3pqvsBA=;
	b=pFoET1p8Ym/ADeqf0YiJETxCWNOZO19YakODRPOP+BiKY9t208i6tsPPT4feUVgxsg
	znY4xuOWqSlIhpTaHZwTZ7WXjcooss6+0LXaJaJVC4WV7rP5d47PEFCg5ytNfigWwguZ
	66hSFYvpk83xscFPtw6bfOviMDZSAcYrFriBJDOqR6xysPCWHIrfFe+sXHNXK2rpMGX5
	wn1vaNG4+xu4PPtHJjO8ZZRLVj5MyUOj9Vo/hLgE3dtRz6d8hQWt/zdAzOHZflg6zJE9
	cr+clQg0LuVnNvekpnBcKaMyb9Nw72aAjbyvwhS9TJLWeZgNCIiNdsdoETqV4VYQYTpl
	cd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3hDrOCZm5ut3c5cefQpplpCn+UZTECiIu5Ur3pqvsBA=;
	b=WSj+ITUmhu2l6lZR3bkVZWUgKHfOnXllc6gwbB64eXbs7v6u/GiPTlHctaHW97byD/
	EKFQ6JIYHd8v1NJZtBZaKe03CDIyCIYYkhnmWCM4eoCw5lOGGtRwXp3tSTospDvRWc6J
	3ff2Z537lilt4E92VgLBIk/9nj9bukP4thIBWWzGh+5oMnShaTOmU2NB2F4uf4shO0nw
	nubVDjU8ZG9jvwMTHouUW6VqSlfuyWdyCQvVBphy1qWHTmdNqDCjti0hx90rKic4JUjT
	dngIMT+sQMW093WpyTAAdepP+X9lRLUkOCETXKzUOvnh7P/EYbZNVtS06rfYrLKYGr4O
	Mhrg==
X-Gm-Message-State: AA+aEWbRXILaNjg4K69Xr189LAO2wtuMSgzIoLHnsdHIJ27ahBdo1LZq
	gp+qKtn3zpnCRBnsOFO3dwyMrMkURQk=
X-Google-Smtp-Source: AFSGD/UiHCXY8rkKflWS+6QKj4rk2AiMopZ3LzlAOhg1W1dxn+lQ9HEfdxxiwqU7KZSIhytOetq/rg==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr10941224wrv.161.1543012239455;
	Fri, 23 Nov 2018 14:30:39 -0800 (PST)
Received: from localhost.localdomain (nat-88-212-40-130.antik.sk.
	[88.212.40.130]) by smtp.gmail.com with ESMTPSA id
	a17sm12441668wrs.58.2018.11.23.14.30.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 14:30:38 -0800 (PST)
From: =?UTF-8?q?Peter=20Ba=C5=A1ista?= <pbasista@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2018 23:30:22 +0100
Message-Id: <20181123223022.30597-1-pbasista@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Peter=20Ba=C5=A1ista?= <pbasista@gmail.com>
Subject: [meta-multimedia][PATCH v4] Add a working Tvheadend recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2018 22:30:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The original one was previously removed
by commit ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3
as part of a clean-up of blacklisted recipes.

Signed-off-by: Peter Bašista <pbasista@gmail.com>
---
 .../recipes-dvb/tvheadend/tvheadend_git.bb    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
new file mode 100644
index 000000000..95cf10bf6
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Tvheadend: TV streaming server and recorder"
+HOMEPAGE = "https://tvheadend.org/"
+
+inherit autotools-brokensep gettext gitpkgv pkgconfig
+
+DEPENDS = "avahi cmake-native libdvbcsa libpcre2 openssl uriparser zlib"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
+
+SRC_URI = "git://github.com/tvheadend/tvheadend.git"
+
+SRCREV = "bdc2ae9e19520a10cdf0bec0fcc0050b32bc75ff"
+PV = "4.3+git${SRCPV}"
+PKGV = "4.3+git${GITPKGV}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--arch=${TARGET_ARCH} \
+                 --disable-hdhomerun_static \
+                 --disable-ffmpeg_static \
+                 --disable-libav \
+                 "
-- 
2.19.1


