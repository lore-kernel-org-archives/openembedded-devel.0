Received: from mail-we0-f182.google.com ([74.125.82.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UYZ9o-00047y-VK
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 May 2013 11:53:38 +0200
Received: by mail-we0-f182.google.com with SMTP id r46so1881197wey.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 May 2013 02:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=IAm1ywmzgoJpoCCX53kxMwE9HjmYQwNxuUFp9j0liR8=;
	b=bgtDJHpcXjKV65h2QeQ2gzp9+KXm1o6YUNrTfP+aP4ZizPbHCEPNB6EvGCo9rZ8z9/
	8ZIq2I8wCYCNvJhRDS2WPnl075/EYwebfGA3Qq67zdOlPMIgOmh63PYc+o25Rw1BjcdX
	N7dt0Kn5yE0mEtUWkiTUcqSg5xgWKBIif79AjSbAHiowbqDXiU2PiO1Kpuc8Yqa0DQCD
	w8dYVPrgxER5Rqtfle68y7r72xehPrtFAnwy8TozaQO4JhukFlRGpdSrisv3OYFcZOWW
	nsY/dS0FxpWBkSneKg5MsFbLpbJ+HtfJip0RugxF//i5U/8yio24x3DuQZRQcUnGwIIr
	oGgA==
X-Received: by 10.180.21.242 with SMTP id y18mr1487961wie.7.1367660136940;
	Sat, 04 May 2013 02:35:36 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id ed20sm2150948wic.0.2013.05.04.02.35.35
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 04 May 2013 02:35:36 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 May 2013 10:35:14 +0100
Message-Id: <1367660117-19572-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.2.2
In-Reply-To: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
References: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-multimedia][PATCH 2/5] fluidsynth: added dependency on glib
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
X-List-Received-Date: Sat, 04 May 2013 09:53:49 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
index 4986da2..80b2de9 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
@@ -4,7 +4,7 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dda26baa823649da9a68947707650272"
 
-DEPENDS = "alsa-lib ncurses"
+DEPENDS = "alsa-lib ncurses glib-2.0"
 
 SRC_URI = "http://savannah.nongnu.org/download/fluid/${P}.tar.gz"
 SRC_URI[md5sum] = "0db3da78028d255026230809c6e21b44"
-- 
1.8.2.2



