Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.40058.1595802911439342709
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bsu2ejqT;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id m20so1264071eds.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 15:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LyWh129Wm7bElDGLzQ7TqOUBjN97zH8QWaHCYK4aPWQ=;
        b=bsu2ejqTsqEkx+/Yv6za/cDViT+hrmjw5KE1tdAY+0OXClDkXxWg4cBDPgfH6dkiPh
         2qcbl7KfkSSAhAq+Af/AwpNDhF+mRTkKQqj0ESMOXfPAiresk104ZhlBuALSavGIySSk
         LKDt97SEi7RUfVA0t+0VRdm8bfhDstylilVfbGapckfz3XfL6YU2cu3nF56KvNllFRqB
         nEk9GUq5Mg1to/nkCq8ZKzBTIxeRBI/L6rFyzC3eZnJI5b5ahISjIYm73cCTvL1cmTLE
         hFyWv2j/VlmlNwugGvwP+KXOGlDtt+vSwcRDJqk49IVUJvvdGvTso2SgdKzjDgs1uCQt
         WXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LyWh129Wm7bElDGLzQ7TqOUBjN97zH8QWaHCYK4aPWQ=;
        b=D9nRAR7baWcK+PYZDfnQp0SWpMas8JNGjK5LM1ouY+KM7OAka/zztsOLIUO6S6Zd/P
         nQ7qJQnKZ6bwFos2FllAjvZVHr3MpTQwoXhBpaM4itA4HMTtAXYFumVbOHSpD7i/HQBP
         XqEPzCNJnGe1ERyQ4wv3mbDMBYtnrCZW0bwcuDtHyNO1PqXiU3ghjYfmzPO2WQpCms9z
         +j0LRHO02/o6z3i14hF57TS+QsQoaAC6l5NzJcR0gwnPR4rmeulM/WljjeQ8QC8JniDy
         ufeQU3zAdtIdkPOyILG+624ItvRiVwAzJmoKdSJ5qeLW7gFMApda4w1Ygoy3cH2Kq9sh
         ApBA==
X-Gm-Message-State: AOAM5334K1Fa+ZXDI8FvAsUM8gDZU9sXem46TxkgBsxCP9mNze9cCt+S
	Nlvxdfvklxnck2+o8FuSY2gtZ1JP
X-Google-Smtp-Source: ABdhPJzusnKt86gvkRUJV49VG4vuMuE6jwv3sU5BbF5Awfz49abIOzhSCz8PHkO9UnCdbXpBoiQ8Eg==
X-Received: by 2002:a50:d8c2:: with SMTP id y2mr18597155edj.114.1595802909806;
        Sun, 26 Jul 2020 15:35:09 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f46e203fabf36e58663abdc.dip0.t-ipconnect.de. [2003:f0:7f46:e203:fabf:36e5:8663:abdc])
        by smtp.gmail.com with ESMTPSA id x64sm6404096edc.95.2020.07.26.15.35.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:35:09 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/10] evolution-data-server: upgrade 3.36.3 -> 3.36.4
Date: Mon, 27 Jul 2020 00:34:50 +0200
Message-Id: <20200726223455.333001-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726223455.333001-1-schnitzeltony@gmail.com>
References: <20200726223455.333001-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Evolution-Data-Server 3.36.4 2020-07-03
---------------------------------------

Bug Fixes:
	I#215 - Utilize If-None-Match header for WebCal refresh (Milan Crha)
	I#222 - Camel: Match-All condition doesn't show any messages (Milan Crha)
	I#226 - CVE-2020-14928: Response Injection via STARTTLS in SMTP and POP3 (Milan Crha)
	I#228 - Restarting evolution-source-registry re-enables user-disabled CalDAV accounts (Milan Crha)
	evo-I#982 - 'Message contains'-search broken in 3.36.3 (Milan Crha)

Miscellaneous:
	camel-folder-search: Fix a memory leak when searching message body (Milan Crha)
	Rename camel_stream_buffer_truncate() to camel_stream_buffer_discard_cache() (Milan Crha)

Translations:
	Baurzhan Muftakhidinov (kk)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 6150df167..8276ce25a 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "4990dbdbf5850cbbfc46727367776058"
-SRC_URI[archive.sha256sum] = "1f5f48173d0f288219d73d4f193cb921ae631932ba84030f05751c42bb003db2"
-PV = "3.36.3"
+SRC_URI[archive.md5sum] = "30282c322622a5a2d4b4a26eee661af4"
+SRC_URI[archive.sha256sum] = "39f83f1eee65c18785dfc2594720d5150e3fc37ea57e7b3b9bc2c40b4d3e4c0f"
+PV = "3.36.4"
 
-- 
2.26.2

