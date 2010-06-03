Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OKChl-0002Kh-2F
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 17:51:40 +0200
Received: by gyg10 with SMTP id 10so191927gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 08:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=p8wAg+3lA/DA8G2yod9nsCEkdC/ymmSzCO+0umXWsRI=;
	b=ChhcpoiicTVKv816S5McID7KqCRBMTqxmk8R5TV2YXjS0e0Maa4YpnS60Y63P2TmsU
	6iGQRJD5nohWLTmNvkXN0FsExLRhBigf3XK/lmfA0dLmdDEH7wepMKWm4CVGWZrV4l9d
	R65TUyTHa+/yEqevNH5wWBdlZ3p8z0BZVScx8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KB7sjkEGTS2yEsRFkeSKkxgmBP1ibIb69JGgarmdsqcRS6ikg1GojaqbcuKB0fDtvB
	2/KsnwVknyJ3BPWT68C/gE02JSp+PESt7qIHnJTYKL9qjZsm6in+FhakzrghW3ucfL02
	cI2XYTGJ6zMbRXT1HWxd13mAutRXO1ujdXamk=
Received: by 10.150.250.42 with SMTP id x42mr9027480ybh.193.1275580040484;
	Thu, 03 Jun 2010 08:47:20 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w3sm8802100ybi.21.2010.06.03.08.47.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 08:47:19 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jun 2010 10:41:27 -0500
Message-Id: <1275579688-19909-3-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1275579688-19909-2-git-send-email-chase.maupin@ti.com>
References: <1275579688-19909-1-git-send-email-chase.maupin@ti.com>
	<1275579688-19909-2-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 3/4] alsa-state/dm6467-evm: add asound file
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
X-List-Received-Date: Thu, 03 Jun 2010 15:51:42 -0000

* Add the asound.state file for the Texas Instruments
  dm6467-evm platform.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../{dm355-evm => dm6467-evm}/asound.state         |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 copy recipes/alsa/alsa-state/{dm355-evm => dm6467-evm}/asound.state (100%)

diff --git a/recipes/alsa/alsa-state/dm355-evm/asound.state b/recipes/alsa/alsa-state/dm6467-evm/asound.state
similarity index 100%
copy from recipes/alsa/alsa-state/dm355-evm/asound.state
copy to recipes/alsa/alsa-state/dm6467-evm/asound.state
index 8a5f84a..0ddbb54 100644
--- a/recipes/alsa/alsa-state/dm355-evm/asound.state
+++ b/recipes/alsa/alsa-state/dm6467-evm/asound.state
@@ -534,7 +534,7 @@ state.EVM {
 		comment.count 1
 		iface MIXER
 		name 'Right PGA Mixer Line1R Switch'
-		value true
+		value false
 	}
 	control.57 {
 		comment.access 'read write'
@@ -566,7 +566,7 @@ state.EVM {
 		comment.count 1
 		iface MIXER
 		name 'Right PGA Mixer Mic3R Switch'
-		value false
+		value true
 	}
 	control.61 {
 		comment.access 'read write'
@@ -604,7 +604,7 @@ state.EVM {
 		comment.count 1
 		iface MIXER
 		name 'Left PGA Mixer Line1L Switch'
-		value true
+		value false
 	}
 	control.65 {
 		comment.access 'read write'
@@ -628,7 +628,7 @@ state.EVM {
 		comment.count 1
 		iface MIXER
 		name 'Left PGA Mixer Mic3L Switch'
-		value false
+		value true
 	}
 	control.68 {
 		comment.access 'read write'
-- 
1.6.0.4



