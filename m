Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OKChj-0002Kd-5x
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 17:51:38 +0200
Received: by gwb15 with SMTP id 15so173551gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 08:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=/G1SXuIRm8bngaZNPoMHJe7uMh0iJylOVDsbWofAefQ=;
	b=jUQZ1pQ2fWIX3vyCKpnA0B2p7NM3aPGmDt8ANWliTRiPO6HrPV3JZhiynS5VQyymn+
	OY3KvwSEbOk15W1EqiftGVRBHI6+dZI+wT7olCzYMd4ZwQRyKjad3vyLUIXnjtrLlcg8
	zaCvNsibNNcaz48Ef8DAID0t0CI/LU7iNncBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VHnvPERPg+W8GpRL8z7TsdUcBbOxsjgwRphPPR/Nw98ZKnwSeRYwnGOwN4iAs111TI
	Bc/CxWii3S+wRl3sfdaStZ4sepqnF55nlLRkrAd0qLAxOdZBb08sI8o2x3mseMOSOeYI
	RUKTeXPJRdjDr01x+pKfE8YN4TcY6esBUPwME=
Received: by 10.150.56.25 with SMTP id e25mr8927944yba.188.1275580038903;
	Thu, 03 Jun 2010 08:47:18 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w3sm8802100ybi.21.2010.06.03.08.47.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 08:47:18 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jun 2010 10:41:26 -0500
Message-Id: <1275579688-19909-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1275579688-19909-1-git-send-email-chase.maupin@ti.com>
References: <1275579688-19909-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 2/4] alsa-state/dm365-evm: add asound file
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
X-List-Received-Date: Thu, 03 Jun 2010 15:51:39 -0000

* Add the asound.state file for the Texas Instruments
  dm365-evm platform.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../{dm355-evm => dm365-evm}/asound.state          |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)
 copy recipes/alsa/alsa-state/{dm355-evm => dm365-evm}/asound.state (99%)

diff --git a/recipes/alsa/alsa-state/dm355-evm/asound.state b/recipes/alsa/alsa-state/dm365-evm/asound.state
similarity index 99%
copy from recipes/alsa/alsa-state/dm355-evm/asound.state
copy to recipes/alsa/alsa-state/dm365-evm/asound.state
index 8a5f84a..7f369d3 100644
--- a/recipes/alsa/alsa-state/dm355-evm/asound.state
+++ b/recipes/alsa/alsa-state/dm365-evm/asound.state
@@ -49,7 +49,7 @@ state.EVM {
 		iface MIXER
 		name 'LineL DAC Playback Volume'
 		value.0 118
-		value.1 118
+		value.1 100
 	}
 	control.6 {
 		comment.access 'read write'
@@ -82,8 +82,8 @@ state.EVM {
 		comment.dbmax 0
 		iface MIXER
 		name 'LineL Line2 Bypass Playback Volume'
-		value.0 71
-		value.1 118
+		value.0 100
+		value.1 100
 	}
 	control.9 {
 		comment.access 'read write'
@@ -94,8 +94,8 @@ state.EVM {
 		comment.dbmax 0
 		iface MIXER
 		name 'LineR Line2 Bypass Playback Volume'
-		value.0 118
-		value.1 71
+		value.0 100
+		value.1 100
 	}
 	control.10 {
 		comment.access 'read write'
@@ -171,8 +171,8 @@ state.EVM {
 		comment.dbmax 0
 		iface MIXER
 		name 'HP Right PGA Bypass Playback Volume'
-		value.0 118
-		value.1 71
+		value.0 100
+		value.1 100
 	}
 	control.17 {
 		comment.access 'read write'
@@ -194,7 +194,7 @@ state.EVM {
 		comment.dbmax 0
 		iface MIXER
 		name 'HPR PGA Bypass Playback Volume'
-		value 118
+		value 100
 	}
 	control.19 {
 		comment.access 'read write'
@@ -249,7 +249,7 @@ state.EVM {
 		comment.dbmax 0
 		iface MIXER
 		name 'HPRCOM PGA Bypass Playback Volume'
-		value 118
+		value 100
 	}
 	control.24 {
 		comment.access 'read write'
-- 
1.6.0.4



