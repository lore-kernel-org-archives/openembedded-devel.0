Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 870E7755F8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jan 2016 21:47:39 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b14so20835041wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 13:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=jOaRIl19PKRKPMa58v8nz5O3yUJdiQayprMgH5Te7fY=;
	b=i0vC+PHd+6Lrknamgvn1fWLkY899O47zrfCIIYaMGzIXvdwjjyjWcj7uENgciNk6vt
	bbzTuWQdKa825Aol9S9Xio38kop7GOqtxZAjwjW0aIdznp5zzTNVSvjb8c6HNDNxc2Y9
	/96A+VAf53Zi9WH2N40Hq8yzH15hIrVK3Ce5ohMk8YsIvSMC4zmdmAPnZepG+51EopXV
	RQqQrlUZzjYUWLSW775Thf3Pd7XTghofF66HL7O6ALakev3WE6cQUjrDoRCmmoHjxTce
	AoAYNo/Tp+6YPsno7yPjmYtioCsD93PNlbPRxJ8nskuC8aBbiVbnbHIq/y7MB7mU7F5L
	wpmg==
X-Received: by 10.28.68.214 with SMTP id r205mr5845178wma.23.1452376060439;
	Sat, 09 Jan 2016 13:47:40 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D02.dip0.t-ipconnect.de.
	[79.223.29.2]) by smtp.googlemail.com with ESMTPSA id
	z17sm112721160wjq.1.2016.01.09.13.47.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 13:47:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 22:47:22 +0100
Message-Id: <1452376042-19248-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452376042-19248-1-git-send-email-schnitzeltony@googlemail.com>
References: <1452376042-19248-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] thunar: remove udisks from RRECOMMENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Jan 2016 21:47:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

now gvfs takes care to include all we need for automounting / network browsing

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb
index 8393007..1485924 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb
@@ -30,4 +30,4 @@ FILES_${PN}-dbg += "${libdir}/thunarx-2/.debug/ \
                     ${libdir}/xfce4/panel/plugins/.debug/ \
                     ${libdir}/Thunar/.debug/"
 
-RRECOMMENDS_${PN} = "gvfs gvfsd-trash udisks"
+RRECOMMENDS_${PN} = "gvfs gvfsd-trash"
-- 
2.5.0


