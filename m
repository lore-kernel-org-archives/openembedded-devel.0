Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 25C6371B31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 03:23:26 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i23so3248800pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 20:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bsP6v8FmrOd9LW4UHpz+8zgMGuUX0B0k7/pZSxzfaWg=;
	b=B6JpbjIN9WV6clEycgfHGbJt3OUKovidl+FQeHMFmtE53HANIRFSWt5vwPxSRjNWTV
	AbIOGOVmjj9mWaU44f88AD5KxFqdmqBzt7DWc7QLw16uZ0NkiLHnMewYhdrSwHChlI/j
	LPs1uWtngINgUtpoU5QVzcEdh8kza1A2cOzAIKIx2vagh1A/BgYJ9R5ZRwusR8EEOtRu
	77tMgu2F7mdezQamHiYflkehUUl0lbEzG/CMEMN5HKlB+1IwL0w6C35XMdyBtyfBvOSb
	HceCkPPLLSF0jZNtZinDwAvSrMvBhxUykGjrvasw3kCNp6Ck0BAbEhH+h6+dZ+RmsiU3
	30qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bsP6v8FmrOd9LW4UHpz+8zgMGuUX0B0k7/pZSxzfaWg=;
	b=MTLEJPxCQbLRndoB0HLMBcio7FDdEzFl0AovB67xxb6/UcJauRmJ8s0/6+eWH7VP4k
	9zmt/cFeA4VcCg9n4vuBaIEwqmGf4vExILTP4SaRrk/twa98cYfUJmMWpm7o3mwjUNYm
	yYvJv8Fn0asAYWdRszk+T8zMrxONz2b42YbNkJzn1JeDRRfe5fmxj4JoMF5gPbj/uF2i
	a7rD0Iqrpl4GWmR5YXTNdciOBcGIP8jA+IiHYMaH84vam3FQJCVril6o5Ie57O+mJIjj
	7UX3oYmQh2mh2H1bVVWgoh1we5eS5K0E4VvYMoKVW+ctRFwUvXWr8BTsn66B9JZ5FtNX
	pLCA==
X-Gm-Message-State: AHPjjUhDQ6Wz7+PLOpcz7KdqIUQ83Ox1FY/b4u1DOBinvSSU3YOCZByL
	k65gIOs9aociK9o1qGbd0Hs0jg==
X-Google-Smtp-Source: AOwi7QDCVKUxxlsADpNylKHMBzRidh//62U/8ym3XT9e4GVdTcnotfpX28niXw0AsDmPiUgXSmW7+A==
X-Received: by 10.84.209.228 with SMTP id y91mr7618834plh.130.1506050608041;
	Thu, 21 Sep 2017 20:23:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	o79sm4517921pfi.108.2017.09.21.20.23.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 20:23:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 20:23:12 -0700
Message-Id: <20170922032316.18616-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922032316.18616-1-raj.khem@gmail.com>
References: <20170922032316.18616-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/7] network-manager-applet: Disable gobject-introspection on musl
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
X-List-Received-Date: Fri, 22 Sep 2017 03:23:27 -0000

It segfaults qemu

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../network-manager-applet/network-manager-applet_1.4.4.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
index 8cec305ef..14b336a1e 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
@@ -17,6 +17,8 @@ SRC_URI[archive.sha256sum] = "693846eeae0986e79eb1cedfbc499f132f27a9976ef189a0f1
 PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
 PACKAGECONFIG ??= ""
 
+GI_DATA_ENABLED_libc-musl = "False"
+
 do_configure_append() {
     # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
     for i in $(find ${B} -name "Makefile") ; do
-- 
2.14.1


