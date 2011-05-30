Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3v7-0008Lf-Ew
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:58:17 +0200
Received: by gxk3 with SMTP id 3so353578gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=6B9d3FVM7TxfAyLAnxn48VZTz+bY/+i394quMOGsIQg=;
	b=Szxa1AUJ+kHKMiDubsyxHHj6nxEwFOPJzBc9EdJiq57mwFtUroq4TRkSpcQWpvVYCW
	khcL2ilZkjkEbwpKbABfLFlrRvLdb+6kcaBRN+EEAijcoLl3kzYhpyGBAtLMOXI9Kq3L
	uMXTPWTk1bwryO04GK/R2wlsKXg3pIuGbdlN8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=sfC85buZIXk9rgY6DHzfo+rIWebt9NcrfmaFZxVvDoqKV//PPvwmQbZS4ITAUOin+z
	LzIGpozQk1rx1bAWE2Cd6nobHb9lOj2ClXqB0MeXRUwWh0srwGbKpTQOXYHsJ3CrnU1B
	FipZyT3qgINHjy7TGkWERJeOkEE7epR/H8kMY=
Received: by 10.236.197.99 with SMTP id s63mr6042892yhn.325.1306767298580;
	Mon, 30 May 2011 07:54:58 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.54.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:54:57 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:14 +0000
Message-Id: <1306767263-29895-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 08/17] libav: depends on yasm-native
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
X-List-Received-Date: Mon, 30 May 2011 14:58:18 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/libav/libav.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libav/libav.inc b/recipes/libav/libav.inc
index fa7b934..202e16d 100644
--- a/recipes/libav/libav.inc
+++ b/recipes/libav/libav.inc
@@ -11,10 +11,10 @@ ARM_INSTRUCTION_SET = "arm"
 
 PE = "2"
 
-DEPENDS = "zlib libogg libvorbis libtheora faac faad2 ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'lame liba52', d)}"
+DEPENDS = "zlib libogg libvorbis libtheora faac faad2 yasm-native ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'lame liba52', d)}"
 RSUGGESTS_${PN} = "mplayer"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 inherit autotools pkgconfig
 
-- 
1.7.1



