Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE6D078A2A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:24 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z10so1302839pfh.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oplQID337Pq5w2ZVmscWuuasdtFB4z/TEQQuA4QAKY8=;
	b=Wv8mRt89vKaEENL2UZtW0K+uYTtICyq2hIfnM7Gi9RLsua3iX6UE5wZvbuIkaUFCDl
	J0+onxIwX0Q2IKDffEA+GtZ0HPXUtVNaGmQp0hqp07fh231CqQ5x65Iq0rb6pfheLUKQ
	/WYzaNgoJICChP7e/khrTpjiSfeuwujE/obOJEdYq8RC7JXFKXzqNu0BMfFY+PDdAB/8
	I9PGGJNaYN1klO5h23kBtK8kzJGOwrySJa9f1vxDeFCSXRAy5tQ2KJTO0Fx9P0MHoJJ9
	lOGMrHcthCzJ3w0bqqc3wTCBAixUxjpW3a5/hZjyqfqjhoeONFOwT1rEjMUsmjXBB/K3
	TFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oplQID337Pq5w2ZVmscWuuasdtFB4z/TEQQuA4QAKY8=;
	b=kec70GKj5782JCawoYXvVoEmw88/zt91WiCvmJewCAWgoddftTyKEW3mFfIpU6kAFk
	R6pN+90oWzcLauBeuRff3yHsRrqm53GdWBaAyEUfoPyqHpi/mbsgPyrJ0gJwP+xBwJOt
	LB+crU42mO7cPm6382KfSdpz4VU+4kd4Hx76pQB2LqZVcSqMq4ML3YIXeKFNyhIVcvIx
	g7XiJW7hJFMWsKw6RnCfz6TorsDc8IzGnYDyj+tuBDgfj52dUbjKeNpciOIpKBM0d5j2
	+wRjolmKYNCelxNejwcbpTkp9e2SbLpYCr2tGrQOwPR2uh47B1WIGAbuLDZ3UxAP+RDG
	CRVg==
X-Gm-Message-State: APf1xPBN+LEJOEC0qY511R9njSRgn8f/wpru5ehqpaBWLtq07R5OPQ31
	5YksTMu46BLzdzmx+wp1cg8=
X-Google-Smtp-Source: AG47ELuYTujxGIbgfYL0Tg3MpXK696ZXrCEJiYeTyfrb9oPgT8MKrCcOuultdpqIfSb8Vu4CJ2VbUg==
X-Received: by 10.98.12.11 with SMTP id u11mr23785597pfi.192.1520449284964;
	Wed, 07 Mar 2018 11:01:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:00:56 -0800
Message-Id: <1520449275-29492-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 04/23] evince: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:25 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_3.24.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb b/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
index 78a9495..c7ecf2b 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
@@ -7,6 +7,8 @@ PR = "r5"
 
 inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
 
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0001-help-remove-YELP-macro.patch \
            file://0001-Add-format-attribute-to-_synctex_malloc.patch \
-- 
2.7.4


