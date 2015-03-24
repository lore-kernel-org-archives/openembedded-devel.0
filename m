Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 42BFC60034;
	Tue, 24 Mar 2015 23:48:49 +0000 (UTC)
Received: by pacwe9 with SMTP id we9so8967733pac.1;
	Tue, 24 Mar 2015 16:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=03qoGP3FhXbvngYaMdp/Z2ulTL1d23Q5cyTQcfW8lN8=;
	b=YKtsGAKjjheum0qBZsOymwsBUyGnKk+HUmC8aTzz+78SRUsQCrwNyA622ylaVgk6nD
	I9v2VUTbGZlaxKVsEDvAfqdCofKQk/AiUnvC7L0mAUqTDdPiib4QUL/UugXJKx2M4evo
	KRGT+LuWt8blZbwPtQ556lFNRDLicQIfuVDVJUAbJYCCthQdL10nojW95CWBwRjBGWXE
	USntl2AobPzqaxqjra3GD0Ibp3g5JeIZSFgeWAedSbS4/53s2uVQjrEBtdN3/2BQRl1N
	+oX00T9CRhrnwMB04QdZ2Mu+imyYfJ9H4slOMS6Ew71IPJqYGP5dyZ+vtt8dby80F4GF
	099A==
X-Received: by 10.68.212.227 with SMTP id nn3mr11498975pbc.59.1427240930793;
	Tue, 24 Mar 2015 16:48:50 -0700 (PDT)
Received: from gumstux.mystix.com (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180])
	by mx.google.com with ESMTPSA id bv5sm226992pbb.61.2015.03.24.16.48.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Mar 2015 16:48:50 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: martin.jansa@gmail.com, openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Tue, 24 Mar 2015 16:48:43 -0700
Message-Id: <1427240923-7428-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <CAMKF1spUz8OsY5b50tCXE==Na=iPicbg-zUZt-NH91gjn6XbdQ@mail.gmail.com>
References: <CAMKF1spUz8OsY5b50tCXE==Na=iPicbg-zUZt-NH91gjn6XbdQ@mail.gmail.com>
Cc: openembedded-commits@lists.openembedded.org
Subject: [PATCH v2] mpd: Add build dependency on samba
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
X-List-Received-Date: Tue, 24 Mar 2015 23:48:50 -0000

Version 0.19 [1], adds the smbclient plugins for storage and input so
needs samba when building with the --enable-samba option.

[1] http://git.musicpd.org/cgit/master/mpd.git/plain/NEWS?h=v0.19

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
index feec985..f6152a6 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
@@ -20,6 +20,7 @@ EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemds
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
 PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
+PACKAGECONFIG[smb] = "--enable-smbclient,--disable-smbclient,samba,samba"
 
 do_install_append() {
     install -d ${D}/${localstatedir}/lib/mpd/music
-- 
2.1.0


