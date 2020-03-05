Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2B32F61027
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 22:39:40 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id g21so83344pfb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 14:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RBm+UqQ6dvzKn9u2VDX5GCHrGd6ilGN99pWk8939tWE=;
	b=tm62bJow8JEN5wco6dDEK+eaha5kLZ7rBHE8DnJcyJg2CPeTEXrEz/FCt9vy6S5KYr
	EP66ecBvw2GaHzzRPvdzHc5B67waLDhY7vpZJsxAZ6AnEjmINu7OlTW97JlKG3Jcfbev
	ePrapdX6suIYOYdJEsnnPluQWqSYRiea9nK3jw8W9WcG1ef1XcFhHZqifSZrzbTIRqb0
	/c58YUyxVfd8gdLflagSlgr0bBwTvFlH9DAH4Fa9t+bkRg2KTHm0Q3txt7oea9ryXK1w
	neN6dT09EhZxresRYOk2HuMvGK1EmgMRQPwDEmR1Qu7N5R8w1Q+D73pHBkxsqI53w+vG
	KzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=RBm+UqQ6dvzKn9u2VDX5GCHrGd6ilGN99pWk8939tWE=;
	b=ICwZKezRl4uQS9Ebff6x/2eK6MY8Pq6YcsQZB84kemt364AiXYW6RYhVF/iLLfXcSz
	z0ukVm6yZgX2bhzmqP33p36wgTXJjE5WAbHQDsDbd/ZCN9pAx4ccImDS8fQtWHVbDw+K
	y/1gyMbdNG2/M4fHStyAR2nYF7id1o9qrKL1WgKjm7ix9tQyZPedxaEmmQvZEeXFxv5U
	4dQ2hKergDUbwkkbU7j86WJUlD8+jRGAqiyYdDawD50FK4oQ9UvBA0+uXN4xASwhCqCq
	OefqbWjRANmJm9K8aM2w1jEuDpYMVsJvJAlGuvpEEHVbcHK/yn1GCD1g2BnmySkzfgAY
	6pOw==
X-Gm-Message-State: ANhLgQ2iJA/JK3wYf7Plk4l6vi0kzBKAAxV9K0jyinaLwK3LF2rZGA6y
	nOg9ITyZlOK/nItCBuuXws9p0OMN3tE=
X-Google-Smtp-Source: ADFU+vsBdBrnWRmH53VIGcmsbJGRzTBL0tFg2IgXkZQmiwxZFWiOViZzGThYnu52rDmjtQ5CKnviDw==
X-Received: by 2002:a62:7786:: with SMTP id s128mr629550pfc.34.1583447981563; 
	Thu, 05 Mar 2020 14:39:41 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	l12sm32130790pgj.16.2020.03.05.14.39.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 14:39:40 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id B84532A05DF; Thu,  5 Mar 2020 14:39:39 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2020 14:39:31 -0800
Message-Id: <20200305223937.12418-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/7] quagga: fix reproducibily issue.
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
X-List-Received-Date: Thu, 05 Mar 2020 22:39:41 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

version.h contains the options passed to configure, which includes
the path to the recipe-sysroot on the build host.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 310bc7eef..3494a4398 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -106,6 +106,7 @@ do_install () {
     sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/watchquagga
     sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!' ${D}${sysconfdir}/init.d/*
+    sed -i 's!--with-libtool-sysroot=[^ "]*!!' ${D}${includedir}/quagga/version.h
 
     # For PAM
     for feature in ${DISTRO_FEATURES}; do
-- 
2.20.1


