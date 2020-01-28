Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id B73F07F961
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 04:33:53 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 4so5964389pfz.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 20:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=x5LryoI7wqXPgeo/WOEwTZ2p4ZYLjrKLbcAQjvoFji4=;
	b=O+/dIXug17Y16r7qjKznIYtDh5ylULKXd80+XJS9fUNkqLb3uX9glNIjkp9pi5Hz+7
	xh3l/TJGTuUlDbknWTR0kBjQbJwk67WfikzbMnCmeG3W+ByE9XjiScPEqg1mnYDc9Xyc
	fYEXB+EXK6WXvoiohRaq7OmjPSnb16f/bDb+UpBtdnDwL9sALu2rG/0m4em66ftNknRP
	aopx5ieqAg975O0qVAtd5ExbuF/CpBUjA4b6/bsia1Hw/XGUk2wqTl/6PSt3gqR5Nh65
	oGadaKHHiI+HYFugvFDh5lvMYnWOPsACD4pgL8QgEYGdfDWPKysjPK/u0VgtJNa6WCUE
	pgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x5LryoI7wqXPgeo/WOEwTZ2p4ZYLjrKLbcAQjvoFji4=;
	b=PPjq6YCXYvDsZvHSBGzgS+caOx3AoSmlT5MtR0PGCDYRJLQoJL3ysTldbVH2O5hNmF
	lqpEqtiVa6T5mbI+7wLGsgsbd8uOCJzkFVPixN40nDCNM+cnaFVFi9G6JwrcbbYDzM55
	9LnO2WWMw7BLh5BUjzugVrgKR8BMKBR5K9XQHbn/bDSQMnU2Ak+yVQp1onz2B2Bnmnv/
	T3XbcRkbFxrZsSLohvDckm37/gH6rj4ZInwCFv4ogcEBUi561sfOkw4mjd4Wym6mNCFd
	cvxjKVasYcfVquoRfLLizAv7upvWMUznOs4Bk7FE3FsMdeexQEl4BCZYKA7SYpAAjciI
	dICQ==
X-Gm-Message-State: APjAAAW4M4WB4WrlfMjSxLbRIBmEL0HRO7bQlKfUKe0NUflAQSVC/Muh
	ZwvQhNv7QOfwWP/nYVd0Ku+oN4W+isI=
X-Google-Smtp-Source: APXvYqyq5s5Z23/j1HfNPHSRbAARIp2ERdT4pJFaOdH1msd5y7U9vZwNUGTsitno6SOVPyg/YsLyBg==
X-Received: by 2002:a63:3191:: with SMTP id
	x139mr22628928pgx.368.1580186034519; 
	Mon, 27 Jan 2020 20:33:54 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:cc9c:22c5:361e:999a])
	by smtp.gmail.com with ESMTPSA id
	d22sm17204873pfo.187.2020.01.27.20.33.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 20:33:54 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 20:32:59 -0800
Message-Id: <20200128043259.25240-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200128043259.25240-1-ticotimo@gmail.com>
References: <20200128043259.25240-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH 2/2] dnssec-conf: add missing RDEPENDS
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
X-List-Received-Date: Tue, 28 Jan 2020 04:33:53 -0000
Content-Transfer-Encoding: 8bit

Fixes:
"dnssec-configure requires the pyparser package from
http://pyparsing.wikispaces.com
[...]
"

Fixes:
"dnskey-pull requires the python-dns package from
http://www.dnspython.org/
[...]
"

It has dependencies on the split packages from python manifest, but
since it RDEPENDS on "python", all standard lib modules are pulled in.
If someone requires a smaller image, the RDEPENDS could be paired down.

It also requires "curl" as shown in INSTALL and:
https://github.com/xelerance/dnssec-conf/blob/8e799683736b4a7b5e5e78f98fba0a6f48393537/dnskey-pull#L86

It also requires "host" (from bind-utils) as shown in:
https://github.com/xelerance/dnssec-conf/blob/8e799683736b4a7b5e5e78f98fba0a6f48393537/dnskey-pull#L299

It recommends "bind", but another nameserver can be used. That level of
complexity is left up to someone that needs a different configuration.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-support/dnssec-conf/dnssec-conf_2.02.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
index ca59bd21..1b767a39 100644
--- a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
+++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
@@ -32,4 +32,10 @@ do_install () {
     install -m 0644 packaging/fedora/dnssec.sysconfig ${D}${sysconfdir}/sysconfig/dnssec
 }
 
-RDEPENDS_${PN} = "python"
+RDEPENDS_${PN} = "\
+    bind-utils \
+    curl \
+    python \
+    python-dnspython \
+    python-pyparsing \
+"
-- 
2.25.0


