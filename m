Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 94BAD78A50
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:33 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y8so1230869pgr.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=n79H2C5pLBZZ9XEO/bzoPfiZdGpRKnUMQ9RrejRX50o=;
	b=E/7JH6/jVoJxo3mG/gvd34dBDI3GB20lKZVFx0rrtFS9KwvCq+AOKXgil/aHMth1Y3
	oZz9jnuPLgSaoQ0hXzl/DB1RQ/2DPVGDYdYUpvAR0/bThtAzsdbLfqlYEEvRHmjcCKhH
	bRTsV6sIfrc3K2iej9Df++/K2Iik8h7ukUOyHKPXRjQeirLQZchWI3ZqK/xj2N7eSMeG
	HjPVw20jpDkAyvexT3aJDeOUh+nfvXbwup0kaHVo1F/eCSyS2JZK5Y4RS04ZDYPQq4+/
	hnruYpqiYIULc1tuhpc0t3c4PFkq6zU5ZCxPcFoMbUyoX2THjHS2uK3yAwTFzf8SZeKV
	oNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=n79H2C5pLBZZ9XEO/bzoPfiZdGpRKnUMQ9RrejRX50o=;
	b=KRcPuJUqYfP5Asvy3uAc6Dza2bg1uAJHAHvDM0qS0bL1I8IFw34vPorgft0FS+dNFP
	7K5VFAmG0bM0132u47Hvj+PTVmvqvE66n/tko5lY1KKniRIuavVc9jp/7qUdmXb6qgpi
	o2M6OvfkEzC8W2U6rMzujBCDmS09NYcOsHbUkvY28W1noDz6UAC/7g6EwmkHFx+rDFWr
	8hICC46OYMTk6AgQoi0i6c3pe/ksPcEXsRn6baeORyRO3FvEtNSffAzjUc/coZamlHmX
	Gq8NiJIRbS25tpU6y99T8ACN6ZXTioolVbF57Mn/h6UviLvdTjCQTkSZZvHQ5ldmcnYK
	G8Pw==
X-Gm-Message-State: APf1xPDuZCGa4a+nr3MFmsOqTTeWhmernllaIlDN7TXD5kCWbwn/YkL8
	f16idv+jvXvI4K+wXJv8wXI=
X-Google-Smtp-Source: AG47ELsaUn16LgAXOgY04LMwkX9MNdGNifWf01RjsiHLHXQ5YQSYY2GuKWHlbmQZJODGUb/+KLotnQ==
X-Received: by 10.99.136.195 with SMTP id l186mr18447448pgd.427.1520449294859; 
	Wed, 07 Mar 2018 11:01:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:05 -0800
Message-Id: <1520449275-29492-13-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 13/23] devilspie: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:33 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb
index ae2ec5a..1c7f79f 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb
@@ -14,7 +14,9 @@ SRC_URI = " \
 SRC_URI[md5sum] = "f205409e921aa2d86481f1b8d518da45"
 SRC_URI[sha256sum] = "11f5bc310fba4df404c057461ffb3fadac8ef51d211008c665c48f587a5a3f85"
 
-inherit pkgconfig gettext
+inherit distro_features_check pkgconfig gettext
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_compile() {
     export GTK2=1
-- 
2.7.4


