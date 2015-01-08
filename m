Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 093F4706D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 18:58:20 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ey11so13407827pad.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jan 2015 10:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BAyaB6Fc56wIiAG1cg89AaQ3lCiZcMAvCTtegGEoxZc=;
	b=PalfhnRbrswdvjvxJaNEyvfd/nAw5gGmyULlvs/deLmkRS41OZaYT/z6PI8t4VzAhT
	CgwBKbfFBB+doVzIwTditkuCkcDtnq6IvGWtrHFE55+///QpuWUuiEI+rNgXwC5dZdVY
	3mWnefu1Ia+Bzg8v1CVeFjbeSSo9OsULbnfbXEQgvXm7rX90MLMlVRjuOdYugovAiApZ
	L0RnAMBNacKfHEW49MTiCBtbQkr2LvWiv3s6tAayz/P3LuCoNFtzLsWgsrQX0P7cMRi5
	iHCfPJMxW5vGxXyzdGm5m+g0xIG0m/V1TVukbZkCW391eMtufJno8mrc3VaQXcz9xQri
	ZsHw==
X-Received: by 10.70.102.193 with SMTP id fq1mr17497303pdb.19.1420743501487;
	Thu, 08 Jan 2015 10:58:21 -0800 (PST)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18])
	by mx.google.com with ESMTPSA id rb5sm5199121pab.14.2015.01.08.10.58.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jan 2015 10:58:20 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Jan 2015 10:58:19 -0800
Message-Id: <1420743499-13211-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <20141124110858.GB2456@jama>
References: <20141124110858.GB2456@jama>
Cc: ubik3000@gmail.com
Subject: [PATCH] mpd: ship systemd socket file
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
X-List-Received-Date: Thu, 08 Jan 2015 18:58:29 -0000

As of mpd version 19.1, as systemd socket file, mpd.socket, is
installed. Ship this file as part of the mpd-systemd package.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
I also suppressed the 
  "mpd rdepends on libsmbclient, but it isn't a build dependency? [build-deps]"
warning by adding samba to the DEPENDS.  I haven't included it in the patch
though as I have no idea if there is any real build dependency on Samba.

 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
index 04eed0a..feec985 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
@@ -48,7 +48,7 @@ do_install_append() {
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "mpd.service"
+SYSTEMD_SERVICE_${PN} = "mpd.service mpd.socket"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = " \
-- 
2.1.0


