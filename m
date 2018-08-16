Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5C90679267
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:27:56 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id h9-v6so4989658wro.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=I+En53rxPyKmfiuXXIFithbs+5SdUQkranYDLie5Au8=;
	b=W6i8nug04/3v12L758AcomSIYcg2zbpZn+DePutBTGVsobxNiXo8dCZ2YsraGVhifc
	Nh1sNeEZuglif2jncblyNU9H2ZA29YXeGq6lEMuBp27Qi+zu0fgi0FoaXAvTZOnR5xlt
	r+xxucL6jBeU/kBEWo8zZmn7Nrkl/ZAXMzZV5AdWCjZdvInNulEt1bYVXWsdZWCRRilD
	xNfyL+JHH8A3yIDxIg+1j48v19u90dN9u0bp3LISHAJRPTjQswUItfPPtHy5V8UdWKGY
	R0wVxWCy8cyhN3DMX14nIsCMKtMfgDaG/1Ozf1Zco4j4cy7ca5/ZnsKXHxL7bT1g7PnR
	opeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I+En53rxPyKmfiuXXIFithbs+5SdUQkranYDLie5Au8=;
	b=oCAg3IyHRfBCDPQclXhL0bduR2pERwmADcNmv+xBpgvqiTZHSnx+w4PPP+3bEDoeRH
	U6v2Y48xddM/lRAZGPul2f6zfUhxrDLSYb82S459zORWAdwBupJqRMeZ4zBjrrFqLkc4
	SM0PzvfK1XjhgGiQkaj1ukbyAU03rSp9H71nzUtDkylZp4fNrj/Zfd6LM4TS7wQ7Kt4p
	Mm5cWBVQSKOPeE8kx+5uHYRzbHoMnENoIw3gTDDy0eKDCDGKHa0ULQjvhf+rKbMlZgk2
	tKhQu/XykQqz7XIlDxGoTrdMBOG3QCQl310+3yifXDWd0JrI4DGGnu8reYNWLojKgzC5
	bC5g==
X-Gm-Message-State: AOUpUlHCln4nUKxCSTANLAP0gB71/Vfaiz65Ph+qvFkqj0g+2UaFskXC
	9MhTnSq7iW3L0/QaW7/PXkE3ZIlg
X-Google-Smtp-Source: AA+uWPxowQJN8H6lOx+n8wRvKApK02bhG9G6Oh6JyObAvhu+Rg8ipSnqHIXyyCwMZ5xo3OvmBBDD0g==
X-Received: by 2002:adf:b2a7:: with SMTP id
	g36-v6mr19414443wrd.218.1534444076803; 
	Thu, 16 Aug 2018 11:27:56 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.27.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:27:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:33 +0200
Message-Id: <20180816182748.2400-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/16] gvfs: upgrade 1.36.0 -> 1.36.2
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
X-List-Received-Date: Thu, 16 Aug 2018 18:27:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/{gvfs_1.36.0.bb => gvfs_1.36.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.36.0.bb => gvfs_1.36.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.36.2.bb
index 5f7391285..1e8f8d180 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.2.bb
@@ -8,8 +8,8 @@ DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2 polkit sha
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.md5sum] = "216d461c5e96e2cea74253be407af6dc"
-SRC_URI[archive.sha256sum] = "9ec388afeb373a213f2cc489184f76a17ae273a000e8a4ec720c1995943256bb"
+SRC_URI[archive.md5sum] = "10b84073fe5f3d540abd9d36ed342b37"
+SRC_URI[archive.sha256sum] = "c4e279a33dd9cd208135e8bfc4788ceaf264c61a24a85255f6696a934a0101f7"
 
 do_configure_prepend() {
     # make automake happy..
-- 
2.14.4


