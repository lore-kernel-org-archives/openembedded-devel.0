Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1TtTNH-0000rK-66
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 02:25:36 +0100
Received: by mail-ob0-f180.google.com with SMTP id wd20so1270473obb.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 17:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=TrWwrUZzk4YhLm2vS59IobrWWkOMMX4o+8uZymavrB0=;
	b=Wqb3Nl9BlNiyaMuoGzfsU8QAd12XnoV2eYPx9BfCjWw06w0UMpjr3BiCMq4SCBjvEd
	Tboy7vsperlmyQ4npX2oQOoI5tfctQ1i/IciGXgriPOx4ADNSok4c2yCak7RapUcKTVV
	37uw6tzCfj5TlwoekuPUvD1Ucno96jLgbeaO2+BTDIAVo5r+Yn3JA+nJOljYv+XgLpAM
	LoFwfCW/7Ud0+yl8+T+5/kV+sIEroG95Y4M07clqvwMc9SM0qjEsGmg7qAJm9MWimgSe
	HG6QGsUn+v789TLdjoTNQHvdaInJ+G5Rzmys9UOvy1YL6FLyAlmXKhqlRnbjD6+vlmb/
	Lhbw==
X-Received: by 10.182.31.33 with SMTP id x1mr53614233obh.29.1357866620532;
	Thu, 10 Jan 2013 17:10:20 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id zn9sm2445826obb.23.2013.01.10.17.10.19
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 17:10:19 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 17:10:46 -0800
Message-Id: <1357866646-31522-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQn970ppOqetp3BXcO7n3jKgCTtWOiNNZsx54Li5rxFi0yVUHWepw8zrOSCtf2N8isLk960e
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [oe-core][PATCH] connman: fixed init script so connman can runs over nfs
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
X-List-Received-Date: Fri, 11 Jan 2013 01:25:39 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Adding -I to the arguments, connmand will ignore the eth interface, so if you
are using nfs it will not be disconnected.

OBS: it might not work if using more than one eth interface. But it's better
than not using connman with nfs at all.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 meta/recipes-connectivity/connman/connman/connman |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index 4a0017f..aed4a79 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -28,9 +28,11 @@ done
 
 do_start() {
 	EXTRA_PARAM=""
-	if test $nfsroot -eq 0 ; then
-		$DAEMON $EXTRA_PARAM
+	if test $nfsroot -eq 1 ; then
+		ethn=`ifconfig | grep eth | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
+		EXTRA_PARAM="-I $ethn"
 	fi
+	$DAEMON $EXTRA_PARAM
 }
 
 do_stop() {
-- 
1.7.9.5



