Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id ED62D7F3F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 16:32:53 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 4so3764040pgm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 09:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=unrOJTjEn57r9Rv1dbI736MdOZ+vF/c6gWbNrb3ql9Y=;
	b=TI3HoC2utTBs+o0o/pNB9Xlmng0daO27BWNjm2bZ1rrVZtFSSyW5M2II2UI+0VSg3W
	5C7zoVkhHC7QGBo5QB7LjYgbunoMEpZYyzW8dtf/Iwh2sZxKaFHmUXQGW+tjTiXdkM+4
	YpIE92JClq9w79dNbkRW1GAMbjXQbaBmz3hMl6NTWfbhzxIoRNhZcsh4h5+tzFsT/C4j
	/JZGyqu5qzJku33xbA4Q6bPnJzqS+ozjfchuJkMOtmwhkKdn2RBIWSf82fTyZwzys64I
	0ETSjmNLTZQbvHwByonLWU+HOxglBmH7CEeczLMFpTxe4zFK0/SByXOUFypVEQsyA16Y
	PDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=unrOJTjEn57r9Rv1dbI736MdOZ+vF/c6gWbNrb3ql9Y=;
	b=k9Bokmfl+rwH6PcDHZhyuxz1nZEds+zdTq5L7/DQW2h9c+VcGYaQUB9BhwB4X4FOHq
	gwk+ilVjeDMzUmzWIUid7Ug3pAYMUmqMP6XM2Rz4Y0mde/bVap/tx+3puL6RCDyeviMl
	Dn6/RC5tinDPLYQa+WqM6ylmpLndzX1XqPDLCSBAqdev71iJc95R0vzPi7p0v9t8u6io
	otQEG2UCei56ausQGzlNGa1qJPw36fZmApUdGi9tM0IhR0AqkB0KsTPgHDYgwOGLa3jH
	eTd1vQpU3Up+FjBSQs9R0NAWaRvzMhbNRnjYwX7+KS7/eLuuQUyAwO9md6VCjThAFl7t
	gPrA==
X-Gm-Message-State: APjAAAXROUrC5GX5S8fH9qoDWQEU3q3LSqSnwF4bU9dhzUgTWLBtLkzM
	MfKsn21vB0sE5thb+qN/r4m2hygN8S0=
X-Google-Smtp-Source: APXvYqxozkY4iuE99RV6c372mQTEUsYhV5vu7Go2z95WL0fD+3/6pCMax89+pedUdtZtBbqbBHLhLA==
X-Received: by 2002:a62:1511:: with SMTP id 17mr11186948pfv.119.1567787574523; 
	Fri, 06 Sep 2019 09:32:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id t8sm2218205pjq.30.2019.09.06.09.32.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 09:32:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 09:32:41 -0700
Message-Id: <20190906163242.4770-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906163242.4770-1-raj.khem@gmail.com>
References: <20190906163242.4770-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] remmina: Link with libexecinfo explicitly on musl
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
X-List-Received-Date: Fri, 06 Sep 2019 16:32:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
index a14a2592cd..a86deccc8f 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -5,6 +5,9 @@ LICENSE = "GPLv2 & openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
 DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver spice spice-protocol libsecret"
 
+DEPENDS_append_libc-musl = "libexecinfo"
+LDFLAGS_append_libc-musl = " -lexecinfo"
+
 SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
 "
 SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
-- 
2.23.0


