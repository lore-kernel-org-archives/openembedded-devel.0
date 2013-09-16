Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 12E1760E7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:04:31 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1839930eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=oAL7FHB9IU/l2MbGSUDPUdNM43cjRRkdkqg6xHCS7R4=;
	b=p9RO+ZYRBqJINxlFzKX9PBd11RhM9B8QKA0FI2EGnHIWomUpANc2W4zi6r0VqxosV4
	5gfPCXJLjK0QR36wesRffEXmh3RTbVsEV7MhaHATnu6dd7ephWyXmHy941hPQsKvUCxR
	hu3qIPzvCpwG/un3xSRQNb0dZcREa8m2GE19kX5afWtvRyjtwokgB4Sd/G6e/UEGbuu1
	Fl5BbJXJ56MKUNA5ciug8MVxMb+UYPlkBe0MXVT8bkTCCqAyXZN9paJhHX0xysWUFr/H
	XdVldKH07BkZ34773QAnxpJZlXN/fH43Mn2Gb4sUQmp13kGUik4m576L4Afv1MzYcdVu
	ceaQ==
X-Received: by 10.14.108.194 with SMTP id q42mr13890eeg.113.1379322273514;
	Mon, 16 Sep 2013 02:04:33 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id f49sm40119433eec.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 02:04:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:04:11 +0200
Message-Id: <1379322259-3831-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 1/9] libcanberra: add PACKAGES_DYNAMIC so we use the splitted packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2013 09:04:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libcanberra/libcanberra_0.29.bb                |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
index 89cbce0..378fddc 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
@@ -32,6 +32,7 @@ python populate_packages_prepend() {
 }
 
 PACKAGES =+ "${PN}-gnome ${PN}-gtk2 ${PN}-gtk3 ${PN}-systemd"
+PACKAGES_DYNAMIC += "^libcanberra-.*"
 
 FILES_${PN} = "${bindir}/ ${libdir}/${BPN}.so.*"
 
-- 
1.7.6.5


