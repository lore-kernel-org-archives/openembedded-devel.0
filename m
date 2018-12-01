Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id F1BB16D523
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 13:53:03 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id y139so1558036wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 05:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9N4c4UyL4WhMouevUPmPFBVChZVI311P9PRLDtMhaV8=;
	b=VRi+KOH2dz9iWs59d28vVn0s1lCXAVwerQpVeceDqF9C20eaLD0Wl9O0GgTjICAhQ+
	+2Kt9M+wH8kZte0NiOCNfzMAlei5NC/o9M7/c6xN2UI4yEubOQVh/8s25c2pDQetTB/E
	q8YXYmpkA8sdlvDbwJNjSTuKzM5Su3mTXRDTO01oNXWgZUkC/03WFyH58+j6K7aElwJ0
	IiE9eW/D1thvhJi2GIVcU3bNg4aGG+Fy1E9sCAFLlRWNtzx0Ns5BIgj+KGgR111+70vz
	ZzeSvc5kD9/bJNrrbNigSmDsilL8XPlElALmFLdnMYCp8uYrtavDyvJz7i67mCO574JN
	761A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9N4c4UyL4WhMouevUPmPFBVChZVI311P9PRLDtMhaV8=;
	b=jf62Kji3Tm4Zy4d/vNwQm9fVJWT1fg01jTs8mrICvP+YA9k9i0eaHDddSJPrt6d6SD
	7i+H9hrN2x4LXdgEnBOyM7EVMVoZPIF2jZPkT6O2Wc3Jrp70qF+PCSDOMDgh/LoBS4Cc
	aKZ4X+LbAoibx7L7KJ9IH8+y/ElFqrg84L2tGWBshcFkyN5erBPQ3wxMZXCo0vrD10Et
	9hhEY8CbZWyr0GNW8TqRNboAl+99KbwLG9TCJqeo7YnH7uziCrxli6dKWpzIuTuqTNNH
	115KdGF5KC+rGYVwZs0sZRz4DrFKOYi7AKAsDnROndH2kkTNJucuXcuk7I6QZVBnShKQ
	B04Q==
X-Gm-Message-State: AA+aEWbr+pGDXx0jr2bvMNiLJBN8JDfv80hMYaFOwGTcP2Fa/+zBHflE
	QzTYl2cALVbMRLoYMP/viCZ01BcO
X-Google-Smtp-Source: AFSGD/ULUPCh60t4a+fE4Z99v7kjjsoaIEwwDuok8Rrc2N2ZCKHbzFSDw6bC/sMHGY4XQSKq68DjVQ==
X-Received: by 2002:a1c:282:: with SMTP id 124mr2291370wmc.113.1543672384215; 
	Sat, 01 Dec 2018 05:53:04 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BDAAA791E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bda:aa79:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 5sm3489208wmw.8.2018.12.01.05.53.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 01 Dec 2018 05:53:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 14:52:50 +0100
Message-Id: <20181201135250.16390-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181201135250.16390-1-schnitzeltony@gmail.com>
References: <20181201135250.16390-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] networkmanager: move udev-rules from /usr/lib -> /lib
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
X-List-Received-Date: Sat, 01 Dec 2018 13:53:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Seems udev-rules in /usr/lib are ignored: systemd-analayse reported >3min!
for system startup time!

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.14.4.bb       | 3 ++-
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
2.14.5


