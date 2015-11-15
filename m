Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 76ACB7736C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 16:17:47 +0000 (UTC)
Received: by wmww144 with SMTP id w144so82389668wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 08:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vnci/QOrsgZU7wvCx02xMV9XaP8PfmJzoozWUtoWicE=;
	b=A3C1TBkzPAkwhiuIyKzQDIy8U2Wl09RNKbYQzwXQE+UX8+kJmdnZlGW/AoVWlSC3EH
	ct+z/jq671S8YXD+MlHhIyZHXBCvUSt1sD3FGf5hlQc6qnvtW2YpeWtO58OjJKJtn0o6
	DzlVTSKjuz10TZqfA5LddrYOzxj57CvyhrcaWI0if1Up9A7IC39XFrehZLDEdlVlq5zq
	5xzYwdQd6WzRzExJe+AVD0HqnhqvoYY+o+iXOnsC8afXx5LsVZ39VwVZI5WYHKq/hPvI
	Up0oiqBeK9zTNILsAqv1Qy14iauQ6vD2351wmrMGnpAy4JPb+JFShRa6Teou32iLvJTw
	CoNw==
X-Received: by 10.28.137.211 with SMTP id l202mr14897012wmd.90.1447604267060; 
	Sun, 15 Nov 2015 08:17:47 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id d2sm7677646wjy.16.2015.11.15.08.17.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Nov 2015 08:17:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Nov 2015 17:17:37 +0100
Message-Id: <1447604260-5460-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 5/8] sox: add PACKAGECONFIG for flac, armwb, amrnb
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
X-List-Received-Date: Sun, 15 Nov 2015 16:17:48 -0000

* hopefully fixes:
  sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [build-deps]
  sox-14.4.0: sox rdepends on opencore-amr, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index 758fec9..eb40a3e 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -15,6 +15,9 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio
 PACKAGECONFIG[pulseaudio] = "--with-pulseaudio=dyn,--with-pulseaudio=no,pulseaudio,"
 PACKAGECONFIG[alsa] = "--with-alsa=dyn,--with-alsa=no,alsa-lib,"
 PACKAGECONFIG[wavpack] = "--with-wavpack=dyn,--with-wavpack=no,wavpack,"
+PACKAGECONFIG[flac] = "--with-flac=dyn,--with-flac=no,flac,"
+PACKAGECONFIG[amrwb] = "--with-amrwb=dyn,--with-amrwb=no,opencore-amr,"
+PACKAGECONFIG[amrnb] = "--with-amrnb=dyn,--with-amrnb=no,opencore-amr,"
 PACKAGECONFIG[magic] = "--with-magic,--without-magic,file,"
 PACKAGECONFIG[mad] = "--with-mad,--without-mad,libmad,"
 PACKAGECONFIG[id3tag] = "--with-id3tag,--without-id3tag,libid3tag,"
-- 
2.6.3


