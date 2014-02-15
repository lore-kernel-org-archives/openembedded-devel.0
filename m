Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF1C6E7E5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2014 10:09:57 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id x48so3691374wes.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2014 02:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+vde5/zaF5ptNxvIYaUIOaXTMb/geIkDAoUXAJ4gftA=;
	b=N22rn1Y8rWKaBGBHERbLdGzMzxjd3GWTyJEUITWZX7Ti1I1gU+VagHZSavxCTVA7Or
	wQXb0jYUMS/EkfnWf711bGvmmulMTFc13dtyt5jD5I+uaKGESvoWEUWafBOWTajzjXRe
	TLRHN7ZnTL1W3DrE9oIBZHP2IhVb+KoY2dNKKaXhk9ZpAfEL47TTXllFe1inQFDBhMOY
	hCOWGmmWb62NKnatQ+o/Grya10Hm3A/DntHS3AjaN7lODMGVhIA5CHsv031MSxpZeGBy
	pbZvzsbHdH4m0dCVin4VR+6Se+yYEcxqE17TH1qpxEfen0sRIhaAbDkvLlCKMF+ZNdsp
	fnmA==
X-Gm-Message-State: ALoCoQlY+JqSE7Ycdarj7Q/ToPbXvLXBKBYK7BtmySC1DpfM76Bygh2xGnuY0qZabYU8P1nk8NwG
X-Received: by 10.180.107.1 with SMTP id gy1mr5570527wib.47.1392458997695;
	Sat, 15 Feb 2014 02:09:57 -0800 (PST)
Received: from localhost ([2001:610:612:0:21c:42ff:fef0:7f75])
	by mx.google.com with ESMTPSA id
	k10sm19421971wjf.11.2014.02.15.02.09.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Feb 2014 02:09:55 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2014 11:09:55 +0100
Message-Id: <1392458995-13404-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.5.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH] gnome-keyring: fix PAM install
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
X-List-Received-Date: Sat, 15 Feb 2014 10:09:58 -0000

PAM plugins belong in ${PN}, don't let the .so suffix fool you.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 0d0f171..e94b49a 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -25,13 +25,15 @@ EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-
 SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
 SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
 
-FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr"
+FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr \
+                ${base_libdir}/security/*${SOLIBSDEV} \
+               "
 
 FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
                     ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
                     ${libdir}/${BPN}/standalone/*.la \
                     ${base_libdir}/security/*.la \
-                    ${base_libdir}/security/*${SOLIBSDEV}"
+                   "
 
 FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
                     ${libdir}/${BPN}/devel/.debug/ \
-- 
1.8.3.4


