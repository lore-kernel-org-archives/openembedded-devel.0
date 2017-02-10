Return-Path: <andreas.kling@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1188B7731A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 09:07:37 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id i10so102888786wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 01:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KrMm4C+euvxPKoHs7UB4sqxDk2fTcfKWnpOwtIRHLzU=;
	b=bNw57AisMPZyHVGKDSp1s0UhlTQiU99C57mj3XtPPiWwDzhF4fdLIhLcEPHBlqIq0X
	gwgDSqydGusRH/otFtz/+eqA5HdqG2FsqAXrCtrurEtasgpUq4vGb9CuAXjCfBVXGxli
	CKHgNZTS9O+aM09QL72fNBlfB2dt5zXHjzJqT383pyrnXBWpmhFyjEDjdLcFgGLkmU1t
	8lQRKVgwohvqeeBN5p31QxXBEMIzbZsBYxmj5oB8X4VmHJeBcKO0+77hY4+r7UEQ6orv
	NwaKnIES/wip7F7/WB5KPTxP/A5esB5L+Mpa1a1VApSGU5vxj3WZGYkImwnPhHxtmnzK
	rKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KrMm4C+euvxPKoHs7UB4sqxDk2fTcfKWnpOwtIRHLzU=;
	b=HYAo5uG7ylsypl1Vuz3npPcbwhtQg25bUZxEhWod+ZoAu8sENsnsr5j8knaNv51uf3
	e/gim1UAr/0NBW8REBazKTUKC8Qv8P/iJ/flxh8HqT8daqJx0FCN+H68hGKmSdGRqYrF
	h6TrSrkn94U2v+LQn1sy05gHXtIZ66x+SSODl9Ky4WQgdrD221OOfp8QWW13saNBSBFb
	KrWX+Ngbh9D4cOKdcYnUqgRmNNEbl30GZKzkA48Ah/OFmyWjKPlqFEeTRFriaqBVsuTS
	EfCaICOJ0ICYX83WohSB3UyKGK2zm46gur1dPBShYDouea/ebw6ZNnf5Xo9wznwgbq3Q
	9wxA==
X-Gm-Message-State: AMke39mFACJMTTJGmdSQXMlHN/4HAHYVnsatoJ8kwc3RS1q6RxWoyhnahTtgFs5rWtYG8w==
X-Received: by 10.223.131.99 with SMTP id 90mr6734541wrd.146.1486717657817;
	Fri, 10 Feb 2017 01:07:37 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id v128sm565618wmv.2.2017.02.10.01.07.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 01:07:36 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Feb 2017 10:07:20 +0100
Message-Id: <20170210090722.11753-2-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170210090722.11753-1-andreas.kling@gmail.com>
References: <CALbNGRQAEX5aBsvsb3rY3CQ1C0V-WFzsJKxnNnLos8LdJJxA9g@mail.gmail.com>
	<20170210090722.11753-1-andreas.kling@gmail.com>
Subject: [meta-gnome][PATCH v03 1/3] dconf: depends on dbus
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
X-List-Received-Date: Fri, 10 Feb 2017 09:07:38 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  configure of dconf requires dbus

  | checking for dbus... no
  | configure: error: Package requirements (dbus-1) were not met:
  |
  | No package 'dbus-1' found
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index f38be880f..2830e717b 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -9,7 +9,7 @@ SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
 SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
 GNOME_COMPRESS_TYPE = "xz"
 
-DEPENDS = "glib-2.0 gtk+3 libxml2 intltool-native"
+DEPENDS = "dbus glib-2.0 gtk+3 libxml2 intltool-native"
 
 inherit vala gtk-doc distro_features_check
 
-- 
2.11.0


