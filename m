Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E2C7D71AE6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c17so20256601wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=soAW6Oo34n4Z3PNqPKTSs6M3/U8aDzM7SR0rpji2TuQ=;
	b=nusQukwyJ5GM0ruzAqnFM3GHIE8plzzXYHz/gFBx3P/CFQ16twNuaqsdmrb5iYWoZV
	HpD3BFsy48tFegrNqltsyIAADnJUC8lV2VoyTcPZi5sT2JoA0scuomsaNil4oOdP3tkS
	3UzDaWxqJcwP1ka3WyTfsZtKUigjjwCfOESqzPrAsPM+5GXYoQ4UrHbQTg4ni8H2S8hM
	p6MV4v0/DXSL2HP/d+GFjjwIi5e7omjB2xAmVztK6WbIv+sTCmW+cMEGxxZFNLsJhxww
	dNYV+3wXjGiVExMeuzmLAMghp1J9dsrUKgs+mv6gw7XpJoG0CHv5J30Zp2oFl7lDDkc/
	oloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=soAW6Oo34n4Z3PNqPKTSs6M3/U8aDzM7SR0rpji2TuQ=;
	b=kKWTQ3SV3OrKVvdglpWCRYBo9iepRjtPxPQR01I0JVIiFcBjw7Zjam22FnnpvoPnJM
	D+2pbthXQNy9mMMVPuI1VbAzpla9225tnKKc5JI8wbvO4VPmnuxd0vfcYL8fG25Zu/xO
	GAPivjrE0GBUQdEQLP2OBGW4HiZdYWjiNJsy3/rJ64PXyuXGKtm+KQ4MT8bFJzf1NCp5
	4ahmpjl1+zwC3xW+IgB/K0hRR7sKthGV8UVLBBHHbUTlkBFzYK/Qag2Ic6a376Ua8Hsq
	hazr1YxtVUiwc9cnWhc/02wczl41RzrH6XzWx8+HVC4Hz7nuglIMmnu9wiK9E2fEjtSH
	b2Vw==
X-Gm-Message-State: ABUngvcVbD4L0+If7K0nbuxbMk/VnmWg0e+KxPkCIf9wWfja+wkcLodHtzbt3DOgG4ebGQ==
X-Received: by 10.28.154.77 with SMTP id c74mr11867434wme.23.1477951871796;
	Mon, 31 Oct 2016 15:11:11 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:44 +0100
Message-Id: <1477951849-32149-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] xfconf: update to 4.12.1
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfconf/{xfconf_4.12.0.bb => xfconf_4.12.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.12.0.bb => xfconf_4.12.1.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.12.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.12.1.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.12.0.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.12.1.bb
index ff1dfa4..a42426f 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.12.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.12.1.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "8ebfac507b4d6ce3f4bac9d257c2853b"
-SRC_URI[sha256sum] = "9910eaea8405336415d4d7f3056403f8c67bc23ba0dce251eac35205c603b156"
+SRC_URI[md5sum] = "20dc8d2bfd80ba136bf4964021b32757"
+SRC_URI[sha256sum] = "35f48564e5694faa54fdc180cd3268e16fc2352946a89a3c2fc12cbe400ada36"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
-- 
2.5.5


