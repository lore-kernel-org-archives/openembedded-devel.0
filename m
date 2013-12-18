Return-Path: <muller.ch@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 019F260D7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 14:44:07 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so3611314ead.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 06:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=TFzYlgdRgGS0rTnCQiMi2Di8znuHMbo92uiU3/FdC7g=;
	b=RlyZ2Hx3Ip8vaWqtrNOmcRX6XI3t4oMjQaucm842pNhhdCaAFgKgEVVUTvUEBHUm1q
	kEC278GLSmIJZp+eWBhC24bCHoQ7UkzcSCOg3esZm6JRIHfzwa3T7SyRELO+xGZjDr76
	2Lj6c36GnLNQ+jSn+iHVSjnMvuQWnJggpnkKNcqhPcxGzpEu+pWAP+zPOQfqp2bRKCWc
	D3lRaftNCmfO5DO/VPv64gm583Vtvg2e4vuFpk1SSPFlMq7BY9OVnPPfHAkWVWPACEzw
	hFxO2RnwspyhgnIrO6bDjUKUk6bklAMS/JZGtp8477AkWX15T/Bod/+oUdhO4/NlLfpH
	fJEA==
X-Received: by 10.14.199.1 with SMTP id w1mr29442089een.29.1387377848425;
	Wed, 18 Dec 2013 06:44:08 -0800 (PST)
Received: from christian-reds.einet.ad.eivd.ch (pub1.heig-vd.ch.
	[193.134.216.2])
	by mx.google.com with ESMTPSA id m1sm664406eeg.0.2013.12.18.06.44.07
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Dec 2013 06:44:07 -0800 (PST)
Sender: Christian Muller <muller.ch@gmail.com>
From: Christian Muller <christian.mueller@heig-vd.ch>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Dec 2013 15:43:58 +0100
Message-Id: <1387377839-27441-1-git-send-email-christian.mueller@heig-vd.ch>
X-Mailer: git-send-email 1.8.1.2
Cc: Christian Muller <christian.mueller@heig-vd.ch>
Subject: [PATCH 2/2] Fix evas_loader_generic recommanded dependency override
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
X-List-Received-Date: Wed, 18 Dec 2013 14:44:08 -0000

---
 meta-efl/recipes-efl/efl/evas_1.7.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/evas_1.7.9.bb b/meta-efl/recipes-efl/efl/evas_1.7.9.bb
index 588f74e..455df46 100644
--- a/meta-efl/recipes-efl/efl/evas_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/evas_1.7.9.bb
@@ -46,7 +46,7 @@ PACKAGES_DYNAMIC += "^evas-engine-.* ^evas-loader-.* ^evas-saver-.* ^evas-cserve
 # http://blog.gmane.org/gmane.comp.window-managers.enlightenment.user/page=3
 RRECOMMENDS_${PN} += "evas-loader-generic evas-generic-loader-svn"
 
-RRECOMMENDS_${PN} = " \
+RRECOMMENDS_${PN} += " \
     evas-engine-fb \
     evas-engine-software-generic \
     evas-engine-software-x11 \
-- 
1.8.1.2


