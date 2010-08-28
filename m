Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxx-0001rs-LC
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:32 +0200
Received: by pzk2 with SMTP id 2so1637571pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=BJo0uZ4Hzc5BHfdZGan93AVlWtjjywNwbzGJNCcRWfM=;
	b=xpFQCaBCSlpIgXpZGTO/OsWemw3dajqvpyfKN85BhOWFxCrlrq59nF2TqwrHsKaFT3
	eBLLNeoTyKXyydXa0pSFk3h0r83GyIG5AR7+LHtBsnwEqftTpPHodmqGz1kuGZBg8wEg
	yW+Eeh/xSpdXvxuGGY+udZIhaWSnzYk4gy+9g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vbOvxlOCtqv7lOB51e80Tv7Lw2sIXEXRlMWsMKnBenHekn08hU0U4S0zXlomnxmZea
	R45Bv0FZwnpWpDIg6vLF1GXe4rnyCcSNDH7TzTEfFp9PZr/rbl8BpCYHfQSm/Ktr2UnW
	+2Mi4j3ZixUEIYBrdYkgHRxhLtdhT/5lA8Tsg=
Received: by 10.143.9.19 with SMTP id m19mr2642865wfi.335.1283027097262;
	Sat, 28 Aug 2010 13:24:57 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:22 -0700
Message-Id: <1283027073-12308-13-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 12/23] vlc-davinci_0.8.6h.bb: Rename codec-engine to ti-codec-engine
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/vlc/vlc-davinci_0.8.6h.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/vlc/vlc-davinci_0.8.6h.bb b/recipes/vlc/vlc-davinci_0.8.6h.bb
index ed53508..c7fa7b4 100644
--- a/recipes/vlc/vlc-davinci_0.8.6h.bb
+++ b/recipes/vlc/vlc-davinci_0.8.6h.bb
@@ -10,7 +10,7 @@ PR = "r6"
 
 PV = "0.8.6h+${PR}+gitr${SRCREV}"
 
-DEPENDS = "codec-engine dbus libxml2 gnutls tremor faad2 ffmpeg flac  \
+DEPENDS = "ti-codec-engine dbus libxml2 gnutls tremor faad2 ffmpeg flac  \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
 
 SRC_URI = "git://git.videolan.org/vlc.git;protocol=git;branch=0.8.6-neuros"
-- 
1.7.1



