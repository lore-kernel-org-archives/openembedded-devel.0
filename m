Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 420ED71A70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:53:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d140so10010924wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 23:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8wip+q8QbPw1KtlTGrLnPJfpwjb9zgvR0SANbMJmOxk=;
	b=A7B6lxrclxVcAt1RrrbhadwhodZxFIjVZTV6/1OIij3Tq01qrTCkB8/qQ5vtmBmBA1
	8U45g8Y29zLaUeiGuUPnNleWWD+rK1SvI2N5t2KOD2C4HCVsXFUWen45SccQ3gKsqxU4
	c+LF9bn6wySBnIIiZaAjawSE9dqRboYOei5HgPhL6wsFcZ1Mu3bJya9ftwGH+nQ+62/y
	heZFg8aa1c85xbr6jprSo49BruR3XJEVs1qscZje8A0OVT7NgANoqJb9GE/g4zVezODN
	6z/9OTD5HMiiemVLYklHwpgDPvSrQjIRsqp2hMO9QRc2Bkfrs0dd3kGVl/C16ShQtjzd
	NKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8wip+q8QbPw1KtlTGrLnPJfpwjb9zgvR0SANbMJmOxk=;
	b=lmOtZd87Ku5j2pPKevnpQ6eHaaoSJORaEMwTPnIvQufh3PfbXLXHkcpdVtwEIkyuCn
	0Fh4Cal21EWkAEWC88a87bIFg1Y6S0gxfGjfY0p9HJHThWpw4J/5hFj3TQ0XbksQaksy
	66q3sELTUIwpFVqfuntzik3gtUhuaYGc6NWG1pW3RVPHJrHrvhRQUC7hy1TfrHbJk5hU
	/Wjkd17OOgRMSY6bKpwC5MXV4ArxM34XB+dU+R7lcj/xBbNVB1tqeS+OfRhKZ+Pb2NRy
	WmKJoe3eDcP/8fZUEx23ruGco2W67Rm6BZ3erKouUIuqyUUZLAEYFT2dF2DmoRuYQL2c
	/0CA==
X-Gm-Message-State: AIkVDXJxXRlaLKqA1897X9hnfOAlNK9K+eXaHp0r7DggV/UTLHkMWiCKrjXnrMXxUcGmnQ==
X-Received: by 10.28.8.213 with SMTP id 204mr6124302wmi.100.1484812427054;
	Wed, 18 Jan 2017 23:53:47 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	l67sm11050656wmf.1.2017.01.18.23.53.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 23:53:46 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:53:31 +0100
Message-Id: <1484812412-26806-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] jack: add a PACKAGECONFIG for opus - disabled by default
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
X-List-Received-Date: Thu, 19 Jan 2017 07:53:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It was broken before  libopus/--enable-custom-modes patch anyway and netjack2
is an enhanced feature not necessary by default.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/jack/jack_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index 2c09f1b..89fd638 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
     file://common/jack/jack.h;beginline=1;endline=19;md5=6b736ed6b810592b135480a5e853392e \
 "
 
-DEPENDS = "libsamplerate0 libsndfile1 libopus readline"
+DEPENDS = "libsamplerate0 libsndfile1 readline"
 
 SRC_URI = "git://github.com/jackaudio/jack2.git"
 SRCREV = "0279a2d65a36d1378f5bab56d95bf9e99cc8cefb"
@@ -23,6 +23,7 @@ inherit waf pkgconfig
 
 PACKAGECONFIG ??= "alsa"
 PACKAGECONFIG[alsa] = "--alsa=yes,--alsa=no,alsa-lib"
+PACKAGECONFIG[opus] = "--opus=yes,--opus=no,libopus"
 
 # portaudio is for windows builds only
 EXTRA_OECONF = "--portaudio=no"
-- 
2.7.4


