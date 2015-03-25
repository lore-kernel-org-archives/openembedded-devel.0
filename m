Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 08E9660034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2015 01:49:16 +0000 (UTC)
Received: by pagj7 with SMTP id j7so11815941pag.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mgNFVgIvUbWtfWgvSLu1hbAOkn6IyJipSaG2NvtkRLQ=;
	b=0xmWHdISz7h2nWg1aQCOLfI6E9yGI0PDE7bRhw+wE7W6WSUzKTvK/WPfE4CdFa2khI
	HG9coIsmaG89vz4eSXS1ZLauX2JAhXtgSdt0j/WcbBHy02Kz1IYSRpqe3I+jTMM2cpfr
	A4GjE0lUDxU4oQ4iFadCHiOwlQ7Q07SDGTB7yZ01CCRbWunkRLL9czoUIEE2GLtRi82Y
	X9szd4A7zvCh4t2EEs4WF6eE5yJia1QptIDPBqd3DSdCpdKCSlBkus0IZiQw8cRp3NwO
	r/qd1PgMPoU5eou7WN5LvCJWlzBypGKv/EcRM98TWwGwpUaTNalF6KW7ABnGeGA1QBMI
	uEVQ==
X-Received: by 10.69.15.99 with SMTP id fn3mr12309752pbd.45.1427248157918;
	Tue, 24 Mar 2015 18:49:17 -0700 (PDT)
Received: from gumstux.mystix.com (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180])
	by mx.google.com with ESMTPSA id dl1sm582188pdb.75.2015.03.24.18.49.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Mar 2015 18:49:17 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: martin.jansa@gmail.com, openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Tue, 24 Mar 2015 18:49:16 -0700
Message-Id: <1427248156-28810-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <20150325001117.GI3904@jama>
References: <20150325001117.GI3904@jama>
Subject: [PATCH v3] mpd: Add build dependency on samba
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
X-List-Received-Date: Wed, 25 Mar 2015 01:49:17 -0000

Version 0.19 [1], adds the smbclient plugins for storage and input so
needs samba when building with the --enable-samba option.

[1] http://git.musicpd.org/cgit/master/mpd.git/plain/NEWS?h=v0.19

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
index feec985..a5cd557 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
@@ -20,6 +20,7 @@ EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemds
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
 PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
+PACKAGECONFIG[smb] = "--enable-smbclient,--disable-smbclient,samba"
 
 do_install_append() {
     install -d ${D}/${localstatedir}/lib/mpd/music
-- 
2.1.0


