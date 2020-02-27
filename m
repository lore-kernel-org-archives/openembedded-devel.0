Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB8261294
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:37:42 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id f15so3833547wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xQWGVL14vPPj221sPvUquCSI6zctmu2PKICYbSUm1kU=;
	b=XdhHxFw2J/PRTunFoSSRvfOrvbVyafCkAKDHyRwKq1ooAl5kCrpGNp1v0WpzcFN7tX
	hHGWfci0f6M5Z8aizCNmv9QY7VoC29bkzzwnSl9TdPkgqV4OwUbVjdUwBQgUqy5652l2
	b0cZmZWi2CVGqVe4kho1Zd0eGNUSFJzjGHlzzwB2ug5OeddJy4O4hv1husLSd3oExPvz
	znUWv0IOzavowHIq6WA3Y+F0PsHI07HOihcMUr/2OZAhlZqnbciNqz0s50lm3NC0/T5N
	q5R8CkwclmjPqXvCr8QZJkCS60Nr2OFXDolMDJi53p9002PrcQiTiPAFsPojCQjUEV0C
	9VqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xQWGVL14vPPj221sPvUquCSI6zctmu2PKICYbSUm1kU=;
	b=ZH2JiGzOt8A/f+m5aBsP/WKhhPzejZqIpuigVpjGEf7bfJ4BD6G5waQd33Cxcvvje2
	64q4JnQgvTMGblXE9vfELEWOOPZEXB88IVOIeN82WWmjOnnPVZhNASWj/0H3jviXm2zf
	jwyPyVOWfwthKAjijuINZyJAPzJLAhfUTFVlSBOh3gJ9vMGx48ZfP0SmE6/8zrx8m2ua
	QzworhavLLsZYYShHwasWfWCSmDxrI/zDg9C49sicQIntI7u+iBeLZvuSWDoBIj6eblw
	C/B5ZNhmEP7UJ8u5dAg+r0Ws94MXhAI6d9jsYidgJmUX+yn6d7IfseV7NecAaca2Kq2w
	X5Rw==
X-Gm-Message-State: APjAAAU9qmuwHeDlMv4ktN40ddf5GNRQiPsYea+ikI+ulIj2Nw1QBGJD
	xp3R07wE1e7sQ8W0atR5JKPZhffr
X-Google-Smtp-Source: APXvYqzkWiL2lq89V+FljmdE8UynSjS2sxzbQf0e/f0e1XSDiu+N1wNHM+nXEIeHx5Zk/6KQQvifjA==
X-Received: by 2002:a1c:e28a:: with SMTP id z132mr5438069wmg.157.1582814262668;
	Thu, 27 Feb 2020 06:37:42 -0800 (PST)
Received: from localhost.localdomain ([5.171.136.238])
	by smtp.gmail.com with ESMTPSA id o9sm8697392wrw.20.2020.02.27.06.37.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 06:37:42 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 15:37:26 +0100
Message-Id: <20200227143726.28835-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227143726.28835-1-costamagnagianfranco@yahoo.it>
References: <20200227143726.28835-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] boinc: update recipe to version 7.16.5
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
X-List-Received-Date: Thu, 27 Feb 2020 14:37:42 -0000

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
index c52828018..db90f06f4 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
@@ -29,7 +29,7 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
-SRCREV = "bc3269f77f570ea0ffd31766ed83846ebb043938"
+SRCREV = "e0e033af9fca3cca84a3417ea6531ae25be73a7a"
 BRANCH = "client_release/7/${PV}"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
-- 
2.17.1


