Return-Path: <mickey.happygolucky@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id C362F70018
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 00:59:32 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u185so1780619pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Aug 2017 17:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2BNUM8CRAzA3HNIKWDX/H+dV8dUAMbCWBlhRxScasfs=;
	b=W4CbD46DnH51VnwKKgE8MgAKOL4n+grtLVtrNp2yilRlqh7q1OqVuqXA/t+tp4Vbkd
	zDPnLxj3EcqtU8l6KHjb49Bd59lD1IMIIv79DyH5f5CEQu7GpeW92DTc9GQ3vSVodSSa
	ZfjPgGLLjmTJpfO+uy2A3YPTYxeTQoiqZgzDydgfV6Ll8f0Je9HNMrK1S6suk0uQegtd
	46Itdp3L0dYHy7qYFb/oAsaWRUXzCFs0Z1A3Mx5wqKw12Yw4oDD8SCcxGv6McdqObhua
	2vt4E1lACLwoTfTK88r5e8bQL/l3fMAWgPGAyJHpQoyMGGFLD8zDS35c6apcG9XoSKAG
	iUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2BNUM8CRAzA3HNIKWDX/H+dV8dUAMbCWBlhRxScasfs=;
	b=oEMun1y/H50E74rk7QUW74W5lHyISEz2LrpeosgDkbfisjus/WF30rfQhlkK1IXIX5
	x3ZLiOptirL5ejC0q1OVg6r0ZSv1a9Q60Q/wuhGxX3mpUqxeYoapF0xXI0QU4Ui6Zbl9
	celjY5XLb/NYlLfrgXeXqYDCMsTcKSacsuRCGXPtOix9DMoUj5mREXGzY35LjMlLqlyC
	47xApWfG9dEKiUbOcEOpgERFkNSK1aaHKpdz0rC6h7h7l+C3aKGjen0SrP8d4EeorbPu
	+9kh9bWCMguQgklpp70nrLAqJBqaTfRECe0wahqZbuG/GeFCyluLL7Oh3XqTVMkR+Srg
	whJw==
X-Gm-Message-State: AHYfb5hzvZzm1Dp+Kb82f/XzsIy9pEiO2nAJDl8t6xM5uvb4kBistws/
	M+C+uaIqTAAwEzfszHw=
X-Received: by 10.98.15.217 with SMTP id 86mr2477401pfp.23.1502153973698;
	Mon, 07 Aug 2017 17:59:33 -0700 (PDT)
Received: from localhost.localdomain
	([2400:2411:21c1:9d00:b8cb:4f3b:9c01:c505])
	by smtp.gmail.com with ESMTPSA id x25sm89484pfk.80.2017.08.07.17.59.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Aug 2017 17:59:33 -0700 (PDT)
From: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 09:59:10 +0900
Message-Id: <1502153954-2796-3-git-send-email-mickey.happygolucky@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
Subject: [PATCH 2/6] uim: Modified the order of package definition.
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
X-List-Received-Date: Tue, 08 Aug 2017 00:59:32 -0000

The uim-anthy package is created that empty.
To avoid this problem by defining a packages with a rough PATH list after the uim-anthy package.

Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 4cb7b62..9e7b45c 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -43,7 +43,7 @@ do_install_append() {
     rm -rf ${D}/${datadir}/applications
 }
 
-PACKAGES += "uim-xim uim-utils uim-skk uim-gtk2.0 uim-gtk3 uim-fep uim-common uim-anthy libuim0 libuim-dev"
+PACKAGES =+ "uim-xim uim-utils uim-skk uim-gtk2.0 uim-gtk3 uim-fep uim-anthy uim-common libuim0 libuim-dev"
 
 FILES_${PN} = "${bindir}/uim-help \
     ${libdir}/uim/plugin/libuim-* \
-- 
2.7.4


