Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1405F6D3A2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:19 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w6so4867025pgl.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=y/JwS7jCXNcWD7mNLzXekkRsxUpD1D4JKtYgxbwAv9E=;
	b=A9cV2zvAX0fLEVkatNNoCAI6hZxq0ojEmUeTD7+zpSQNkXqMlHbUAV9RmIOEHxTLC+
	F9lPV6ksFM7wUZzBdk5u9r+7cKFAYC5YBLhvP9G8MotFp4b3OPF1xmOhnUCHtt5sD6T0
	QXJ8Y6FtlgV8oGqoqOfYMQWY0cb7O/AclH1Ya6RCrfWe51UMS4doON7/iUAOGznOWHkM
	iGO0XiwcxNdXlVJ/yegsnFpz6dC5O/JT+nAKv8SlbIoRdKNX1HVos6mDGnmS9n+zn+y5
	ruZmKJBb5T3rF0CxIWl/J3IF8uMaAJxcY5NPa/I/lmGshRkGam1qH9pmnesFPNOc2fPP
	rfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y/JwS7jCXNcWD7mNLzXekkRsxUpD1D4JKtYgxbwAv9E=;
	b=lvNRMkHXZTdg3cpsyTRZzaLXi8tAtTTU9wykC7AFiKLBjP/wLTvqNAXXUw9QNV6jeJ
	bi6jfS4QWTlXxsbmDXzNczgeDtFsuxQoNd6dbYS7o+fNs6nfffj1hreGUaBb07uI/yJT
	+M/uHf+oiv8+LbdFpdYypfCAafee0YHOIlchFoScfEdddI98S912ARdtG9lLCHHDjk6F
	cjZmAbimtVO+absIdWSHaw9lBwkKK96zTLgjgQrBy59q/NRJx+FVP1q1o0S7Yu1ox1q/
	tgwFDFFqSIrMvi7qLfR+g+5vCylaAj9tX1Ec906Subr0Zx6aIE2YLCIboqDRez3HVMz3
	wv1A==
X-Gm-Message-State: AJcUukfSxAh0QeRddlg+hhb+fddCaox/lc/sib5ySmGK0cxB3V92yj4j
	oSJ7l+zXVgEVqpUq3iNLw58hNXKdOXc=
X-Google-Smtp-Source: ALg8bN7GHp0gF1+btR5cC29lvU6dykeD35NCrBOJ+RzEWQU06o/yL9fBavUdu26roPoucMhhphUZ6g==
X-Received: by 2002:a63:235f:: with SMTP id u31mr10280730pgm.122.1545600980681;
	Sun, 23 Dec 2018 13:36:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:51 -0800
Message-Id: <20181223213557.7834-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 12/18] tvheadend: Add dependency on dvb-apps
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:20 -0000
Content-Transfer-Encoding: 8bit

Fixed errors like
ERROR: Failed to fetch dvb-scan data (use --disable-dvbscan)
NOTE: The following config.log files may provide further information.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 95cf10bf6c..dc6cd46b0a 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://tvheadend.org/"
 
 inherit autotools-brokensep gettext gitpkgv pkgconfig
 
-DEPENDS = "avahi cmake-native libdvbcsa libpcre2 openssl uriparser zlib"
+DEPENDS = "avahi cmake-native dvb-apps libdvbcsa libpcre2 openssl uriparser zlib"
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
-- 
2.20.1


