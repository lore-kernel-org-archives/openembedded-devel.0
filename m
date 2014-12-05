Return-Path: <awais.belal@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE617237F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 11:41:10 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id y10so549592pdj.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Dec 2014 03:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gCNs4rc5pfKK6LJSlZIAu+xA36Kx/fuwV9aWhj3WRNE=;
	b=o1rQzLE0WNHZsTeGiEcOgMXJOw6Pa+D8tP8wGsPxeeLlKCr4Gcj9GOqp8MMxsNFZaB
	/FwXzeO1XwZABIswbMorC/cYy5qLxkr9ZCNYx8RrCdIc0Opr72TZDddqwqHKhLQjr9pN
	mHOZRiThP2IMqecLFhhNd682MHAjLAy0hNxUpqhlB1Ij7KtyT1IgkzQTAHCoZAyZczUf
	0bIc5ZgboyUmgLFbHt3BywrfKg89pn8hQyvY3YLQjfOjevWCkFni929GWa2Va46qC+gL
	3qtpqdNJGMXk2mRu3cTmU7xgXJYTaR125jo89/4yPk9x4XA/0BDDos3Cs7h5Cmwil1/4
	wP1w==
X-Received: by 10.70.128.80 with SMTP id nm16mr14448582pdb.1.1417779671696;
	Fri, 05 Dec 2014 03:41:11 -0800 (PST)
Received: from awais-Precision-M4700.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id
	xx2sm23695526pab.17.2014.12.05.03.41.09 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Dec 2014 03:41:11 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
X-Google-Original-From: Awais Belal <awais_belal@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Dec 2014 16:41:00 +0500
Message-Id: <1417779660-18387-2-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1417779660-18387-1-git-send-email-awais_belal@mentor.com>
References: <1417779660-18387-1-git-send-email-awais_belal@mentor.com>
Subject: [meta-oe][PATCH 2/2] mplayer2: cleanup empty directories
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
X-List-Received-Date: Fri, 05 Dec 2014 11:41:13 -0000

The mplayer "make install" phase leaves an empty
/usr/lib directory seemingly regardless of the setting
of libdir.  Remove it to avoid a packaging warning.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 4656057..7e6ff0d 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -142,4 +142,5 @@ do_install() {
     install ${S}/etc/input.conf ${D}/usr/etc/mplayer/
     install ${S}/etc/example.conf ${D}/usr/etc/mplayer/
     install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/
+    [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib
 }
-- 
1.7.9.5


