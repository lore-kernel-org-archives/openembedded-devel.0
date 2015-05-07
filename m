Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9C9E773C81
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2015 14:24:33 +0000 (UTC)
Received: by wgic8 with SMTP id c8so18760937wgi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2015 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=JquU0LUSPsZAOexYAx0aO/CylyYhsY2gGb2sSywVvUg=;
	b=NG+s+SL6BFoX6638LpvC3VQlbcYgK+gCt1jLGSfyG7KKeirb/RXk3x4f4JAaiJMjgH
	YzDIUbT9kePqL16MCh667VfgsM0sk15/IiSxgF1XHpUQfYHrcz6zCEvBrqEWlGXxlaJr
	MydWo+6UWG86Sp0y/IqbZDvwcFs8cB0k+LSHFo7geBuyKtqnaeUaz1OHd7YuV3eHJaD+
	mnFd34WfFjtbOmTjrMs7ZLj/Vn3efC5AAOjUG7QbYSKvH0V5Wk7jcXYf21m3Dol4Af/6
	C3uxSPRDlCGdSG0wbTspezNPvQbMdrnFWjd3OGmXd6L8D9CFuoyG15fe9AydAHdNWda7
	esIQ==
X-Received: by 10.180.100.194 with SMTP id fa2mr7253745wib.8.1431008674211;
	Thu, 07 May 2015 07:24:34 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id hu1sm4259609wib.6.2015.05.07.07.24.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 May 2015 07:24:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 May 2015 16:24:03 +0200
Message-Id: <1431008643-20963-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1431008643-20963-1-git-send-email-schnitzeltony@googlemail.com>
References: <1431008643-20963-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH] udisks2: disable manpage creation
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
X-List-Received-Date: Thu, 07 May 2015 14:24:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
| warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
| cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
index 2de2061..4ff6687 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
@@ -14,7 +14,7 @@ inherit autotools systemd gtk-doc
 
 S = "${WORKDIR}/udisks-${PV}"
 
-EXTRA_OECONF = "--disable-introspection"
+EXTRA_OECONF = "--disable-introspection --disable-man"
 
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
                 ${datadir}/dbus-1/ \
-- 
1.9.3


