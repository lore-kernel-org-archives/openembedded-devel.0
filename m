Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 27F9F6CEDB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:39:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j10so12747875wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2gjIlUKEUuhYI4g5pRMrFelB1ANDa26dfZpojdd8mcs=;
	b=gIP37zPBiL2bM2D3uQX3aT1EqfUHXB4HCyyRcR2Zchvyd05kAITkrbHI0uCs5EqQG4
	llZ72UQwThQAmT8Rn8RDeD9w3OZZ/lc6cO14QVQur++ix3p+YIl8hXNry/EPC3+u8KiL
	o/ussPdO+rQa3WK224BrDtv6QOgFfuFpy2mdiYHRzwiRA2lslfSYmaX+4WV/OfrOn7nq
	pOGmPQZXopTtb3yDGH8dtUj9AWXijXqksUSpT8GTEPK/bVeYI1Rgwxeg3R3NF45UKjva
	Z2ddR+EpWKVwqZ+QjkDjZbBo947bV6MnXw1D8V81Np54zcHo6J6fm31TitnHBHqExNue
	T1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2gjIlUKEUuhYI4g5pRMrFelB1ANDa26dfZpojdd8mcs=;
	b=LLP1OTgwIbW2NboZvkLTfJVS6XBKEmdvhEiKgUE7XeIuRPz8iscZOf44R/9xvFeUnB
	ocS1/eOE4WPbhjTeZak1GD+M/HWhWzsfoFG45P0aL2WFf94a36znhhMX4X3ua0LjN44U
	LI2YTtNFdZoS/k/hNCxfe8dCQgy6wvZHWeJ8OI04zT3leY0kxeh42gnbfCk82kCw6LdS
	W2eKMDPtg92PLUsmyT7GwlPBjf7FPYqKpzocY6UrKapKXgmmJ4ZPsCowa+ufKTYeBohB
	/RzM97Zea6NuQbU0q/+4xZ0oj7vZAY4edXOwcNFvMMl4UGeW+jUWhUzhRsVl9Z+okeaM
	LL2A==
X-Gm-Message-State: AA+aEWZWwajg5pZ65rPlgEFWP/d79nwU41nhVdHgfK4HI/yvMeGUlhog
	e+CeogKQagtEYdzlQ3b3fGEW0ySjmrc=
X-Google-Smtp-Source: AFSGD/URYd7h4cmToe/Pspyv3Uer2WWhY2RJqjU/f59OVBwRqSO2T7dpFOAhC4zRSFMA/55DWjvo9g==
X-Received: by 2002:adf:8544:: with SMTP id 62mr15054895wrh.1.1542987589544;
	Fri, 23 Nov 2018 07:39:49 -0800 (PST)
Received: from debian-brgl.home (lfbn-mar-1-609-89.w90-118.abo.wanadoo.fr.
	[90.118.185.89]) by smtp.gmail.com with ESMTPSA id
	u10sm9983953wrr.33.2018.11.23.07.39.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 07:39:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Nov 2018 16:39:37 +0100
Message-Id: <20181123153941.10186-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123153941.10186-1-brgl@bgdev.pl>
References: <20181123153941.10186-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/6] libserialport: new package
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
X-List-Received-Date: Fri, 23 Nov 2018 15:39:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../libserialport/libserialport_0.1.1.bb             | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb

diff --git a/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb b/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
new file mode 100644
index 000000000..192d4bce6
--- /dev/null
+++ b/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "libserialport is a minimal, cross-platform shared library written in C that is intended to take care of the OS-specific details when writing software that uses serial ports."
+HOMEPAGE = "https://sigrok.org/wiki/Libserialport"
+
+LICENSE = "LGPL-3.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+inherit autotools
+
+SRC_URI = "http://sigrok.org/download/source/libserialport/libserialport-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b93f0325a6157198152b5bd7e8182b51"
+SRC_URI[sha256sum] = "4a2af9d9c3ff488e92fb75b4ba38b35bcf9b8a66df04773eba2a7bbf1fa7529d"
-- 
2.19.1


