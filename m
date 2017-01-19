Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE8506FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:53:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r144so10013532wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 23:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dt1+4XAQe3TDdknv0h0C2EXwlqN8XD5EzIEw231bFmI=;
	b=DrGOYg5DmKJYGn83LNVfkAK5khiFCWFm/cXhbd1rIELG7kLhxIcmB437Nztzj8E1mE
	8ihcbjx3clcqNrwL/nVWNez5cf3xDR8NHzpN7ZlQrO16QbH/Ypai3F/EOOfnNhgjZEbg
	QtuRqKI4HUhQksQHZggH9hnsoFW73g6xRXM3XByFcHCKJuHQKCuFRpKDVi4Z8LV/VDMB
	YadU4hQ1czAt+JiOTxjEXGQrLbGdLeRMByVrv/af63UeDphshuV57KyIkLpqY3uoCX77
	gw4Y6A1dJEwfXCXg5v0Y0CU0jN0idktekds6o0qDH0sgJKlzIqd3Av5iTFYXI/nkEykA
	OKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dt1+4XAQe3TDdknv0h0C2EXwlqN8XD5EzIEw231bFmI=;
	b=XJzCIG9PEemqGpiUoO9ul17z1D7wyElkiOXpTSDUo4t0G3UTwvX5ICtaLWL/2FEanI
	OM+1qHDmpFo6p6d30pVNmjhUC97P0eLVpJ02KR16J2G+v8aV/+hgqH1j6P/JIim3MfCH
	nBy/YPuGTuvct6vtPlALaf/VjowcOR56U6D6dNngRFaOZHqDFT3BA/6XzwoT9vgNZ9Hd
	WouDsmCdlckSv/51o52RDzEGANOFajdQZh4lYVGPU37j1vTxzgqh+eOG3UmfyEDdkkul
	ju9xEwJj7GR7m49Biv4pGqAd97YRiFVqge95sIIb27X39q95gxWN4hiXCAQLVu1SO+Ia
	VO1Q==
X-Gm-Message-State: AIkVDXIpgyeTNwTRJDVfk+C9bjSJbdNwVDKWInIwoZEVpGiPphUSwcUrAj7eziOCFS9RPA==
X-Received: by 10.28.69.17 with SMTP id s17mr6246982wma.60.1484812422040;
	Wed, 18 Jan 2017 23:53:42 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	l67sm11050656wmf.1.2017.01.18.23.53.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 23:53:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:53:25 +0100
Message-Id: <1484812412-26806-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] xfce4-terminal: update 0.8.2 -> 0.8.3
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
X-List-Received-Date: Thu, 19 Jan 2017 07:53:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-terminal_0.8.2.bb => xfce4-terminal_0.8.3.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.2.bb => xfce4-terminal_0.8.3.bb} (68%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.2.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.3.bb
similarity index 68%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.2.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.3.bb
index 8df7b5f..7d49785 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.3.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "53d46d7dbcb74d238dc5e0c8dbc447cd"
-SRC_URI[sha256sum] = "92aad3e14f3ef8d4c6c1409463e989bd8f5eefb686234f3cdbfe574729401681"
+SRC_URI[md5sum] = "d4a3211c23aa3f588e86cb21d34c0e91"
+SRC_URI[sha256sum] = "40e6e4b3b8e887a326d9491a47388bbdc379f971a8d622509c0a006e53dc12f1"
-- 
2.7.4


