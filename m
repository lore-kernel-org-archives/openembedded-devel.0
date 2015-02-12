Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 607AB733FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:29 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so7608069wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=7fIN0aI4gGTW4pVo2pHtc1MkQDMExtWx0eqpczJ2I3U=;
	b=XMyrt+Hae0WZRkMx45fPX4JAOgHjTr+MaSFBIAQ8eZ7BW7+nzkNK6Vp7fpHLH/sAVP
	6EnooWBwZM645wA+tH6Gw7sMBkDJmzCWbLLGMDaYrbVmnztUh1r/3k75zsT2XyhI00OL
	KoeHrYkAt9wdnaswQv8NH278W4fnWKjKqyy4617aOvoe9hRRk7n8VeDeItQflmjtQJ+A
	aiv5xJFzMHPXfa8AnFavaw+fQfzELeCLja+FNifqMpPe3HMGNUhXYGpfP81R2OSU4lRN
	UwvGmIntybFXD9q9gcaoxsMA8LihXAdU451VmrhYkYFla7F0OH748ylmGalEL0kctd8c
	uiqA==
X-Received: by 10.180.99.42 with SMTP id en10mr374924wib.26.1423776150154;
	Thu, 12 Feb 2015 13:22:30 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:52 +0100
Message-Id: <1423776119-14981-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 12/19] xfce4-netload-plugin: update to 1.2.4
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-netload-plugin_1.2.0.bb => xfce4-netload-plugin_1.2.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.2.0.bb => xfce4-netload-plugin_1.2.4.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.4.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb
rename to meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.4.bb
index ef1039b..c9f7a2a 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.4.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "05180d60ed347029dc125368c1d4406e"
-SRC_URI[sha256sum] = "c824f09e2d3860011b44d8272d661c458237786828027f3d9ad6a1d4f0096845"
+SRC_URI[md5sum] = "ce53e1135e4bff5afcd899627110bd11"
+SRC_URI[sha256sum] = "fface918822c012d806717116566e54947ad7613b9290b45a18e2d5ffb8730d3"
-- 
1.9.3


