Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2982B6B7CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:18:58 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so182305eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=XDhQEuSpyxijZpBPdnMLMvfTiw+5EieH7Lj6leFs6NQ=;
	b=wl4ZpxSoWgYD91xUHSw/pdIVbD3TqzjuDT2LFvSoN642fPUGvriE7kmDNd9o+i18Mk
	s42sSAmTRZ8vZFkRl4cwAmN2UjH6O7UdQ2QBvhTvoBjR+J7hs3MjmB058+JTcnudZtQd
	Mg9I2poUQwz7miBkyTlFhQhr0FmkOIPnF1++rNu/kFO/U5GZ984uT0xXA7s8AD46SM6J
	tn913uimZ50pkFSDFgTvDLD9GPBqX0XhnqXDbiDc5q0i+JGAUZABELmdkUskwd8Hchjx
	37RcePKhGFqFF5F9sdMT848fh2LhYKHQQ4IxydoaysSiCbr+PRzFRNL52ZbF8yEB5rCN
	J+1g==
X-Received: by 10.14.38.14 with SMTP id z14mr20901486eea.49.1376551138535;
	Thu, 15 Aug 2013 00:18:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm82045704eeg.17.2013.08.15.00.18.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:18:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:44 +0200
Message-Id: <752d7a850fe391b541966b06d9dbc3ee9cc6e8de.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 04/60] fluidsynth: added dependency on glib
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
X-List-Received-Date: Thu, 15 Aug 2013 07:18:58 -0000

From: Paul Barker <paul@paulbarker.me.uk>

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
index a989e76..a5e65c4 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
@@ -4,7 +4,7 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPLv-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dda26baa823649da9a68947707650272"
 
-DEPENDS = "alsa-lib ncurses"
+DEPENDS = "alsa-lib ncurses glib-2.0"
 
 SRC_URI = "http://savannah.nongnu.org/download/fluid/${P}.tar.gz"
 SRC_URI[md5sum] = "0db3da78028d255026230809c6e21b44"
-- 
1.8.3.2


