Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 091827CF1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 22:45:53 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id h126so5315741lfh.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tgxcNGCQtBEIRV1U4BeroZRCPPq6oypFdkcq335ddXw=;
	b=PtC2EMlT/2cJ60XdT97uyJacSpP+Dd+zO0XLKdx+dZj8ZxCx/dDpzBTVhjd/jGcyXa
	YfJIt5583OjWaJVtyBvIITWUgdbfPOpYj7J6R23Nv+tLmo7nZdI9ijVyMzJIJPeC7QoS
	H20U82ktXlh7+GSJl2aW1p609NfBn6WsCTtPFV6jnbxxGZME5F6T9qbm4E4FG06SQT32
	uDLLjpkWSGq1K8x21NHzCTliZLWPuGqiRT/9hrKsNCpXp8hn1ybPfjKFpOghYXD65mOr
	TdJvIqYXmmBh/FJVjHkxwLnu2XGJvDk8qF5BnMw3G4CXS8+TLmKtwCxY6QWW6d6VwebA
	luag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tgxcNGCQtBEIRV1U4BeroZRCPPq6oypFdkcq335ddXw=;
	b=BSe212U/cZ7XNm+Vw3bv+g1MqcXedolVkSDxpqZ3DaV2MfQIc/HApGITP5LmgTBUw5
	frnF5Qo6zIm6ffjcKrDjDv2BGZkIXCDvl49BmU4I6JiJ3onrDuq3kVncG+59TR5zkw49
	Be2k7zmRgT8+Pl6/jS56hSjCfrXv+x8laDuLD0ITHeNYhWyTZ3AG08b+UvDPExt9nO5U
	1xvcgDBAZ1XnO99w2zgqeje6gw/252CWrz+5fAYylDTtv5Aai0W/3m4kmKpYbxbVTfih
	2aJCk2hlbzgrFUa+QvOaqoDbDdeNDocSoeATytrwuXfQLcp8epJ/zqe6rZ5Nsdu54SZ0
	0DeQ==
X-Gm-Message-State: APjAAAXvPmy0NGbvHX6LVbNpY+pfL0681dyDB+OxZ0tZTEFZ5kl7Fw2f
	iDcvmFTvUPQce1S5q+gS1qDFcdCeep0=
X-Google-Smtp-Source: APXvYqyM6Um3/980R6wSAN4oYyTvWjbknVRHF91QTisixYEkSb5D3JuGU2AbGzInwUuGYICpuoP1Rw==
X-Received: by 2002:a19:751a:: with SMTP id y26mr5694462lfe.47.1556145953986; 
	Wed, 24 Apr 2019 15:45:53 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	a28sm5745941lfk.54.2019.04.24.15.45.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 15:45:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Apr 2019 00:45:50 +0200
Message-Id: <20190424224550.22731-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] libnetfilter-queue: update to 1.0.3
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
X-List-Received-Date: Wed, 24 Apr 2019 22:45:54 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libnetfilter-queue_1.0.2.bb => libnetfilter-queue_1.0.3.bb}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-queue_1.0.2.bb => libnetfilter-queue_1.0.3.bb} (100%)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.3.bb
similarity index 100%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.3.bb
-- 
2.17.1


