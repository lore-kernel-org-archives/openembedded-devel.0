Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5E15C76719
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:46:34 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so56114968wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 12:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sgQofVzuZ4Y2X1IDa8yxOFPKAFLTt+Obn5KZ262MhTE=;
	b=tIw/zxfMotDWT/2bNmS0U47dnfy2yy+dxOhPK7/uVktSSwd7atj4445R1/Q+lNKTNh
	vlt3/G3mi58tvmFnU710G455ZhVgJMMN/pU15Wz86/VV64ldCsKrMSr2VzkLcS4GtucE
	VAwTv7MsCcjD2N2pcV/aqL1X/N2LKmTR41xUYk1gUWfk+yf7mTT+tIQTYg9Ue1z9db9k
	U9ETqrPmGAXvG7j8qx4OMvKmCLHcpMegG/55x5wk+5nL1bFL3ZkDnJLSjALbJkNWRFQq
	Cm9HXC0YjZdQDBGfpw9DWJ3w7MwWZj46o02uwtQki3aZ66hUKTpmyzgFpJ+t8giQTtSB
	DDbQ==
X-Received: by 10.180.99.71 with SMTP id eo7mr27973657wib.25.1439754394075;
	Sun, 16 Aug 2015 12:46:34 -0700 (PDT)
Received: from Saturn.local.all (212-41-85-106.adsl.solnet.ch. [212.41.85.106])
	by smtp.gmail.com with ESMTPSA id
	p1sm18490730wjq.28.2015.08.16.12.46.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Aug 2015 12:46:33 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Aug 2015 21:40:16 +0200
Message-Id: <1439754023-13290-2-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
References: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
Cc: gary@mlbassoc.com
Subject: [meta-browser][PATCH 1/8] firefox: Update download server
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
X-List-Received-Date: Sun, 16 Aug 2015 19:46:36 -0000

The ftp mirror currently seems not to work, change to the download server
recommended here:
https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Source_Code/Downloading_Source_Archives

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-mozilla/firefox/firefox_10.0.11esr.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
index f89da58..e07555b 100644
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -7,7 +7,7 @@ DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx v
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=9cb02f27e77e702043b827c9418bfbf8"
 
-SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
+SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
            file://mozilla-${BPN}.png \
            file://mozilla-${BPN}.desktop \
            file://fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch \
-- 
1.8.4.5


