Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A2F9A789ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:27 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f125so9819372wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BdDIFNRFiqHzgontKwZqaFzwLNOaFo+/Tzsz/ng2yYw=;
	b=kF+0KQz7SfAQAB4/+VDqaEnZ+j/Uy/Hg8QGa96hhGsw9ur7E58TdvXeLwX9rcL8xJu
	FbMc8W+lo505SeJ7fE+eD5WHymGji6Mxlgq2LVJcFg4NyCqVYLxnYDkBaqOwj+LTxqoB
	Ql1fSJZeAMmXirTy/pyVkszFGpkE9pM8+E6FGAQgKhqsy73HCsb0Q4lIVg78Gx+YEFF7
	4CEcaXrAqz3KB57HAADNAo34hcDUTRvrKUY1iY476HGUgOBE2Mnv6jeH6c5ppoS/F7+Z
	4FIEwP7F3LqACPLSnCIr+N+IXPeN9jcaaQ40NbW+vrp/A+3iFvfNe2PXjzGh/8Bck8+V
	74bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BdDIFNRFiqHzgontKwZqaFzwLNOaFo+/Tzsz/ng2yYw=;
	b=rZ25Ij7nRUs2nQmtSl99sDp5qtxzohBzKOnp/QRdqZ9c0AaZNEFCicNUU6WkY8gC+J
	w7E3Si4ROl1lZTgSDIYSAPA6bx70NPyK/vM3sKFYtLj9/AD5sGHBU5Mag7K5xSgL7rDo
	d/CP4AXDOgnlkLjZV219FsQY31VkBykaygVULGWzlE0bXAyqUoCwQQwv3jG75QffQO0E
	Dg36XLuIf+JK4xGyvUtNSZtoqgwqrCKmoAnmOnhpAwaYp12bBjPAPh+tKzXRvpyGzUz/
	8UTWLPx7AV0V1sr2MnFTZCkO8aFooaACAV3TNdvAD/3Bg29GZio4BuZGSugo9HxVla02
	l+uw==
X-Gm-Message-State: AElRT7Gsp2VF2alm1kSXSCJBuAMMh8GN7cxfPYANB7TE8Brv4wQwITA9
	G3aHaxW7fIlpo53QAoJ8ONeb4Q==
X-Google-Smtp-Source: AG47ELsg8n8/UTS7aEXxgvh29RYggz7MK7JMhX72ipJ3p0Isw+0T4r49jI08Fw7dB7wCUEmW41EinQ==
X-Received: by 10.28.137.147 with SMTP id l141mr56823wmd.141.1521491367960;
	Mon, 19 Mar 2018 13:29:27 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:28:59 +0100
Message-Id: <20180319202911.30760-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/17] glade3: remove gnome packageconfig
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libbonoboui is gone

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb b/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
index 6667e2901..c3da3e9b9 100644
--- a/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
+++ b/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
@@ -20,7 +20,4 @@ SRC_URI[sha256sum] = "58a5f6e4df4028230ddecc74c564808b7ec4471b1925058e29304f778b
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
-PACKAGECONFIG ?= "gnome"
-PACKAGECONFIG[gnome] = "--enable-gnome,--disable-gnome,libbonoboui libgnomeui"
-
 FILES_${PN} += "${datadir}/icons"
-- 
2.14.3


