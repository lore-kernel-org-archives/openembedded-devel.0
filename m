Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OnEPq-0006hz-Lc
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 19:33:08 +0200
Received: by pwj8 with SMTP id 8so208209pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=iABJ9akfd9xraJby0aoZW1DiiGrQSQ80TPWpTP0+MUI=;
	b=iLMfXTBmUzATCBJs42VimuxnhZ7pLCDwDB9K6UuHXv3NTOqoGNjdtzRGGx8M4wrAft
	nLYYBUZDIRITnb9jlmIejQ+l4MMup1D6n1HICyk8pSCRnBf55hrklwJkW9QYqEy5dAfn
	OL4ghBRgMjETSTrOZLQZ7wktDui61tmVIV0UA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GeWroRqfRYGqmA/Ymmi+NJiV57pLK9q/RWjtgJHMaV9fluT1LfUWgpVIG5B6TKDs82
	TMl96CBb2gtK5KVyCMjkDVaOpUrDXLo4kCce4EuJR45dLV7iPB/ctAxbkMX+0BaSufSJ
	3FDzQ5U/oDquYDfVPeNSWgXPqCo9btcYK2X3A=
Received: by 10.143.18.20 with SMTP id v20mr3436441wfi.12.1282498350327;
	Sun, 22 Aug 2010 10:32:30 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d4sm7179794wfh.23.2010.08.22.10.32.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 22 Aug 2010 10:32:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 10:32:25 -0700
Message-Id: <1282498345-8697-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ncurses_5.7.bb: Make DEFAULT_PREFERENCE
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
X-List-Received-Date: Sun, 22 Aug 2010 17:33:08 -0000

* Select 5.7 if none pinned.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/ncurses/ncurses_5.7.bb |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/recipes/ncurses/ncurses_5.7.bb b/recipes/ncurses/ncurses_5.7.bb
index ab029ae..57374ec 100644
--- a/recipes/ncurses/ncurses_5.7.bb
+++ b/recipes/ncurses/ncurses_5.7.bb
@@ -6,9 +6,6 @@ PATCHDATE = "20100501"
 PKGV = "${PV}+${PATCHDATE}"
 PR = "r11"
 
-# recipe is experimental for now...
-DEFAULT_PREFERENCE = "-99"
-
 DEPENDS = "ncurses-native unifdef-native"
 DEPENDS_virtclass-native = "unifdef-native"
 
-- 
1.7.1



