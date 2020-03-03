Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 817A9619CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:45:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g134so1908426wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 05:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=X38Z2Uu99NVlc5JZ1bhpMztDnbRGQ0VvHd4e3qpjN+Q=;
	b=QF0KptmKVJhERqwPCiHDRA5jK1Nsaqtn221EMTq9kRc/en5Bmyg+Nk0wls0LyLjt0k
	yRSSfz1z71kUZFaKvieROCPm5Oz8W+5DVixZrm1K51MAdfpyCMevpOfmfKT7Mgh7ouPZ
	f91VhRaA9HlwrCubsjwUOrCUbAXGSM/VkzwmfIFJ8VWQNe7PtD6y2BZSRfN4AYGRRBGZ
	f/pP6IOMHkM8uzt3kS0UgvFk79BzDP2d/j0EMGELHHGMmP2VN35YS09+JaqRhFmfTP78
	ZiSpmrQa1wjkoxV0E2LSKrp83zsh5HggN2vfzWv7xNBxwwvbbeBsKVL6ZNQ/XgRHEOE8
	yhNQ==
X-Gm-Message-State: ANhLgQ0S7lBjnSVDXW5OYj4nHMuC2537byr/JlHWtHwanOvn+KZmxk8L
	ZB4swhpZiNFuqbi4ULnhmhJpgKPe
X-Google-Smtp-Source: ADFU+vsisEWaRSfbBQfkT7ECyULIluiqFNQE1W/L+Lr5inH6s19rkfc9WcKi+iRGJHHUrrlkoUGncw==
X-Received: by 2002:a7b:ca55:: with SMTP id m21mr4400462wml.162.1583243138061; 
	Tue, 03 Mar 2020 05:45:38 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id k2sm2411251wrn.57.2020.03.03.05.45.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 05:45:36 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Mar 2020 13:45:33 +0000
Message-Id: <20200303134534.36509-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200303134534.36509-1-git@andred.net>
References: <20200303134534.36509-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] brotli: allow building a -native version
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
X-List-Received-Date: Tue, 03 Mar 2020 13:45:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

nodejs (-native) can be built against a system-installed version of
the brotli libraries. Allow doing that by provide a -native version
of brotli.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-oe/recipes-extended/brotli/brotli_1.0.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb b/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
index e4e454bda..70dbcaffb 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
@@ -18,3 +18,5 @@ do_install_append () {
 		mv -v "${lib}" "$(echo ${lib} | sed s/-static//)"
 	done
 }
+
+BBCLASSEXTEND = "native"
-- 
2.23.0.rc1


