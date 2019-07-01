Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 435217D6AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 11:07:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45cl2w09Gbz2C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 13:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561979272;
	bh=3ploHad3MZOoGtwCuV/D7q4LLxiKeD+L+aWG4Hatc0g=;
	h=From:To:Subject:Date:From;
	b=ciJidRLo+n5kSKnb/UUYcDYaLd03pxuE7M+Q81yUiUfVByizBQx02SrMxWMNDu4Uz
	J+CGGQC4r7lF64HbBbkIAcbWzcsWIpFk4PQVvMJINQpMoqnMHWp1XyAZF++pVjPAXo
	2NlSPNwOVLaFfeN1GJapz9Phq0VN/lfZYE8MJKuYlpOCy4wElQxGLjR6fV5JsDL84h
	ofbBppMCE+hPXEoNEKcJKpeeWONfA3+PP2I1ElHc2juDgRSMbKI5uv2qq3sg4yMQ13
	TuVI+Kn9NJQ8EIm3/dJsDRYHIpF+GjWd5olaz1UZ88es1/qX+PbXbPiSfWhoDLQJJm
	DRzwKCSCre7C/a+WqV7/vpaQmc/G8cJOchYdZJTQTDtSwwzy0NYF6x/j+fDNyd7yK9
	EXJd2KH+lkJcQpLWbzOGDoU2gd6f5KjSF3fQSdQOBfJ1uiRAFnG98YIasZapad7WBC
	LzGsQC2i0+hlC7b3EoWaXcYDkduqoGgJqwXMB1+PKR18V2W12/mOgsRche1K2hADNv
	C8Ya11B5Jb9jFYulP6EtovOo+DXISgKWXMO5l4JiU1NtExF1DwFd5UhVlkTfPtdqum
	0wBlsvP5lbNuTpReCnY7ArjFvKLyNH4PCFHyan/SW5tGzx3UWCK1sNcw2bPDk6SiZE
	OvVBajGbmx1vaD+kirL9GgcA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 14:07:50 +0300
Message-Id: <20190701110750.22462-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] vlc: Remove the obsolete dependency on dbus-glib
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
X-List-Received-Date: Mon, 01 Jul 2019 11:07:52 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 0bedc5da9..5c38be31f 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native \
-   dbus dbus-glib libxml2 gnutls \
+   dbus libxml2 gnutls \
    tremor faad2 ffmpeg flac fluidsynth alsa-lib \
    lua-native lua libidn \
    avahi jpeg xz libmodplug mpeg2dec \
-- 
2.17.1


