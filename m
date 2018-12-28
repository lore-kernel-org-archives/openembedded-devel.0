Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE636C4C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 15:17:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v13so21181841wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 07:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=i5p4+JE3T0+uLNY/rRJawOH8ox6y6t4T56FLA88193g=;
	b=KkNRDj8wD/ZK8uzIsAI6af/qI/rGEEDjgn3QCPsxv/Aej0dvG0ZPEdoTY3M2z0Jwly
	r1a7fm6nye8zI01mcnjcU0aYvNgmnJAfxC5HXrx/7JvPJI+A5WXW6IQxTMjSiQ11bv0z
	MTF2fpYfkXkViL3lx0h9C5xDC556CcOS2AzNMlYOnoAOHhuVnz1G69GBaq02fc3KFljH
	tbgZgM2kcuIfgb/Fn/+w9rnzZjY0mXk8ILWZx5pkiPg6C3YZOZ8YgCIFZsbobtpIDBDk
	5dUB3i4BR8dcHf82tFMmGaq9LDLP0wS9xEkCUBjRPzw0uUy7JaR0N2QH7xjs/kRst37F
	9IeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i5p4+JE3T0+uLNY/rRJawOH8ox6y6t4T56FLA88193g=;
	b=VKEsy6ec5dWEUSZO+LJ0Qn+5BB7A8i3t2UmHdx4EntDfuCrZRTS9eiPFMmDJfA+g9l
	J2Gw7BdL50GAG5/1/WYEJIh6rg5449OBILf2Y1JhLgieS3OHQWdSbgaMHzDGT41jh32w
	0eacF/Z6XS/SuTeEjMQ9mOKgJsiL3FNgmlhqNmSCo7TIRKRBRRT65llw24SksQTpfPZo
	03ZijM0Tmbi2+5+yRd5Dr6Br4iesA35dmSLhCxF4t6SEuyCA9NyOWDfAMSPA4OKl9qNb
	2IYwuHhAstivSy/rKi4F7YGXfIRjRiisC/bNDsB5sKTk4leKu5kdllndapDjjDrtIDhM
	Ax/g==
X-Gm-Message-State: AJcUukeaJwmPmANB0Ao9Tt3DLuZ/we60HXIFbtVz5wrQDcQG8bczGU1J
	mbYqJvV4y+gS0v8ay+GaNOi0OtPj
X-Google-Smtp-Source: ALg8bN7ovvn5zXX9GMJpCe9h/zEiNFhhVKMR3My7aIv5fsXppbOo9yeZVV2fyITt7C42o3svQOIAtg==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr25957515wrn.264.1546010245465; 
	Fri, 28 Dec 2018 07:17:25 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC09E931E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:9e93:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v1sm39228834wrw.90.2018.12.28.07.17.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Dec 2018 07:17:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Dec 2018 16:17:12 +0100
Message-Id: <20181228151713.19266-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181228151713.19266-1-schnitzeltony@gmail.com>
References: <20181228151713.19266-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [thud][PATCH 3/4] networkmanager: move udev-rules from /usr/lib -> /lib
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
X-List-Received-Date: Fri, 28 Dec 2018 15:17:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Seems udev-rules in /usr/lib are ignored: systemd-analayse reported >3min!
for system startup time!

(From master: 331b717b)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../networkmanager/networkmanager_1.14.4.bb                    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
index 4cc4dbab5..870a52814 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
@@ -50,6 +50,7 @@ EXTRA_OECONF = " \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
     --with-nmtui=yes \
+    --with-udev-dir=${nonarch_base_libdir}/udev \
 "
 
 # gobject-introspection related
@@ -108,7 +109,7 @@ FILES_${PN} += " \
     ${nonarch_libdir}/NetworkManager/conf.d \
     ${datadir}/polkit-1 \
     ${datadir}/dbus-1 \
-    ${base_libdir}/udev/* \
+    ${noarch_base_libdir}/udev/* \
     ${systemd_unitdir}/system \
 "
 
-- 
2.20.1


