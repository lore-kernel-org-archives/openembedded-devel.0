Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 057B2757ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:21:33 +0000 (UTC)
Received: by iesa3 with SMTP id a3so43200703ies.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/JSG2pYEvfxgQf8VaRruHZxvl38IY+gIyY5R+XZJjFA=;
	b=IQqLiyMBxDpt1crSpNUkFYp5FFEim96YioeTfCI7QCF+kptqik664NnkviFk1NdlgR
	uRX+chxiSDwZG/KkztqeTQQXtMCYpNmeKEKt0KoAfMnCQ0JbUlEzIqYJ3DkQGzacEkZS
	vWQXslLpsQ/sC86JJTI+x785A+FNTRpFjzCeMQJUHBF3E0d97wZJVhg7ZMKWPE3+ABCw
	rL7F1Z1eKdL3YUwhquYqGl0asjHFPav1WE+NjImTB3R2Kt1Ixw8f0daI94UNnhVJju2f
	Qh584zc+St5z8bseyHOaGNBJQK94Y60X9ugkCNKI1EPAhFexv7xMtaqHh2Z9l160V/tM
	9BJg==
X-Received: by 10.50.59.180 with SMTP id a20mr35984092igr.23.1433445695170;
	Thu, 04 Jun 2015 12:21:35 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	je10sm9950529igb.15.2015.06.04.12.21.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:21:33 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:21:03 -0700
Message-Id: <1433445666-7207-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
References: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 4/7] gst-plugins-base: use x86 over-ride instead of i586
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
X-List-Received-Date: Thu, 04 Jun 2015 19:21:34 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
index c8a9499..0bcb659 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
@@ -36,4 +36,4 @@ do_configure_prepend() {
 
 FILES_${PN} += "${datadir}/${BPN}"
 
-CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
-- 
1.9.1


