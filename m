Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAoJT-0006BN-2T
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 21:08:47 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so2162877wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wb6UwGvi2/rz7vHIx8Y5mwmSFiJFNkmGoj6lIywK+iE=;
	b=FBPxw/anTBgBBFScOLER153vHUXwbGVoax3O+lfSnsVclZsK0Un0tJaPv8iYt6d3K1
	gY8WLVK3h28p+kSnLne3pvztA+Cnr9xJjMjonTh3JD1sSjaxpVnONohJUM2Uf7AyVVUU
	GySA9qULGpDAWBVTmRX2vh22OCuXR8/hvepQ2iFGa8wZjUCpdmdCzxSK6iQN5ZbcomjH
	QNB7Ji3WZEUvuliIzyui7dSLDQshXOCmrliyL1HqPjrXt4GMaA12DJFM41oNgppjcDVL
	gvMaTTGLWgKymbSEGxpb7mDcU30UZ7XwKScYFjmMZnLEk72xsyLm9r5Er0oAA5cnj8s0
	UTpQ==
Received: by 10.216.136.232 with SMTP id w82mr5285574wei.119.1332446394083;
	Thu, 22 Mar 2012 12:59:54 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id l5sm7657734wia.11.2012.03.22.12.59.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:59:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 20:59:41 +0100
Message-Id: <1332446382-24958-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 7/8] dietsplash_git: replace ${base_libdir}/systemd by ${systemd_unitdir} set in oe-core
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
X-List-Received-Date: Thu, 22 Mar 2012 20:08:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-graphics/dietsplash/dietsplash_git.bb  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
index 2e77058..a3f1aad 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
@@ -14,7 +14,7 @@ inherit autotools
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF = " --with-systemdsystemunitdir=${base_libdir}/systemd/system \
+EXTRA_OECONF = " --with-systemdsystemunitdir=${systemd_unitdir}/system \
                  --disable-staticimages"
 
-FILES_${PN} += "${base_libdir}/systemd/system/"
+FILES_${PN} += "${systemd_unitdir}/system/"
-- 
1.7.6.5



