Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2255D600AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 23:34:39 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id g62so1262690wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 16:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=E+PMYUh2XF/pZYfDLRcjMWGDSmBZk4jSE2wOmGO0yKY=;
	b=H9tfyQlTR9ZNWVei+J9ORPvbROYCeiaLv25F4HtEOHdqY+upujc3icBeBvlifRRmvJ
	jgSDEh1nAlDuUP25KwN+3xSq5rSgDDqbxTKBc3wSKczln1WQnu5WWjH/tl+z48AC+T6d
	r/d6LnpoIgPXXr4YvvL791Qch9dn9vjgCK/wdZgzZUxF6o+r/sVSd/q13bNq/BCQtJqb
	x59ZGdZ4emjfUZ1u/lU7VHetzLxQIEsijO6L0Swb6qEdG0zrUCfDNghrLreUbKHcm3S8
	DNxtilgoxoe/kkTzpOr2gYsFhj1Piui2oDjb4XsoCVWbp8o9HPfr9+DIcfozAIxpQ3De
	hV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E+PMYUh2XF/pZYfDLRcjMWGDSmBZk4jSE2wOmGO0yKY=;
	b=DzaZ3lPmoA6mkM6BH5mr2ZFmQcFyDofBSGc4FHU8I+wD5ahGZJBijp5zwhcnaB0Jp6
	Pjc8ABI5Q1RUts/BTAMi+AwfLR/vYnriV47Rf9r62RlCYRKS4M+fMpLyUdJxGAT509yG
	XENTkCD10vhbKxZuIWnp6mmHQvbasRv3GzS9PYr3ZlijzcantuoPo6dlUGe6+jyn9LCd
	9qBQ38WxHIYLzpNCunZ15GSFXSMAsXMnQ7UGAeBnbU3U7+bRL6IIdHj3ep8dBFj5AsZX
	FZfndYHYO+Anf/v6t2GZ8zYQ4UOfzSj4BG4RAtqgopHAcNuCbr57wr363hy+HjNhBia1
	W4ag==
X-Gm-Message-State: ANhLgQ1oNUG2D/36Q+iRH2JlA7iuikoGtMDI6KooGa383NWmCituD/sJ
	hhR9C1g0oU80te8UOIoo4njhedJubsE=
X-Google-Smtp-Source: ADFU+vuZ82YHy3P6pMQjKdSgnn3oklv6z5LptRmlZxvuLdUc+ZLGkmg3/CSa3hSLirm58Mzqhys0Gg==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr1358028wmi.140.1584488079406; 
	Tue, 17 Mar 2020 16:34:39 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E8C3838FF9D0BB177A6DE.dip0.t-ipconnect.de.
	[2003:f0:7f0e:8c38:38ff:9d0b:b177:a6de])
	by smtp.gmail.com with ESMTPSA id
	h13sm6620365wrv.39.2020.03.17.16.34.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 16:34:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 00:34:28 +0100
Message-Id: <20200317233429.11356-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200317233429.11356-1-schnitzeltony@gmail.com>
References: <20200317233429.11356-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 2/2] mutter: depend on pipewire-0.2 in PACKAGECONFIG[remote-desktop]
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
X-List-Received-Date: Tue, 17 Mar 2020 23:34:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
index 7979802d2..c90559cae 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
@@ -52,7 +52,7 @@ PACKAGECONFIG[native-backend] = "-Dnative_backend=true -Dudev=true, -Dnative_bac
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=true, virtual/libgl"
 PACKAGECONFIG[glx] = "-Dglx=true, -Dglx=false"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, libwacom"
-PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire"
+PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire-0.2"
 PACKAGECONFIG[sm] = "-Dsm=true, -Dsm=false, libsm"
 PACKAGECONFIG[profiler] = "-Dprofiler=true,-Dprofiler=false,sysprof"
 PACKAGECONFIG[startup-notification] = "-Dstartup_notification=true, -Dstartup_notification=false, startup-notification, startup-notification"
-- 
2.21.1


