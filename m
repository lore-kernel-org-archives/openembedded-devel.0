Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4317E6AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:40:55 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id m13so4063252ljj.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=TDbEtqd1Xh/5vyWriMnApWoi88cfFx2lrcLU61z5KBc=;
	b=AZWoFdBXVw4MASZAuanb3X1TajSR6344S1wQGTtppuD2HIz2VkuBOa2hDnIsShudkG
	KYkNJA706dXnlxMCRVZkTDeyChe58Gt3dlpCpfeAhUXc//4xzxbErrPJv2ApiuIc7ZrB
	oNb9Hz1sJljpAOPjrWOHAbbOaqfHabMF1a3S5rKYWFAu4Gz9pocYrSlB37RdKE8TNNif
	3mOsxjru6w8lsdduytjHhMsj9gh9u5ta9sx9Aclppv1Nbxx/F/MhCQ92YYkP3a78/RqB
	JQFX+7NHGKr3IH44JZKnXvCQ3crbgf41vUI5dZeSNXw0Q2LcsIpYKuZYPisswbP+yZwe
	wPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TDbEtqd1Xh/5vyWriMnApWoi88cfFx2lrcLU61z5KBc=;
	b=kULHb151YdlkfCkxW1X1Q1EOgkpSLfW1YBiOb42zUK7tge17L9gqtzhZw+6YDhoi5+
	N/OnE8oCWEWxxv46vTaJl+Vp61sK+ZRUwF1B202xHUI3RYlfHt67G0wYC/592n/Vjt5D
	Lv2qiQ+KekxVbjkH40kJzePI8LyW1vkkkiU0CAeEN20HBGSjkFP27AlhIb+k0/ysKkHS
	+51Zsq1kIno0fURQ8aj9qgqrV360r4KRJWhrleBqSP2vJOiY214WUnkP36EcsqFeR0bT
	3emrfxqMRlqMIJVqlivCS0Pa1lvVFHfTZChuIOpxpRLsX5dAOputAXxoODI5UrBRVcb6
	/Kbw==
X-Gm-Message-State: APjAAAV6jOrZ3QdIhUOGZUuGseVIjqJ5ngwoZ+1vdB7X7h4himqllwqa
	1s1L/khtWT4A4dKrgy3J3ovni2tgX5A=
X-Google-Smtp-Source: APXvYqwdIzRdHyiBcYycDSdc3a7nGpesMKK4gH+mKyjVRttSLRYdR9qkdswp4FRDCOdHQK4n+eovbA==
X-Received: by 2002:a2e:6804:: with SMTP id c4mr5817275lja.120.1568590855628; 
	Sun, 15 Sep 2019 16:40:55 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	t24sm8483853lfq.13.2019.09.15.16.40.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:40:55 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:40:49 +0200
Message-Id: <20190915234049.11590-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] znc: update to 1.7.4
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
X-List-Received-Date: Sun, 15 Sep 2019 23:40:55 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-irc/znc/{znc_1.7.3.bb => znc_1.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/znc/{znc_1.7.3.bb => znc_1.7.4.bb} (94%)

diff --git a/meta-networking/recipes-irc/znc/znc_1.7.3.bb b/meta-networking/recipes-irc/znc/znc_1.7.4.bb
similarity index 94%
rename from meta-networking/recipes-irc/znc/znc_1.7.3.bb
rename to meta-networking/recipes-irc/znc/znc_1.7.4.bb
index b7d46af6f..75860073a 100644
--- a/meta-networking/recipes-irc/znc/znc_1.7.3.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.7.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "openssl zlib icu"
 SRC_URI = "git://github.com/znc/znc.git;name=znc \
            git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
           "
-SRCREV_znc = "be1b6bcd4cafbc57ebc298d89a5402ae7df55a8a"
+SRCREV_znc = "e661cdf9a394e2afd1b97517efa21fa2fa757e22"
 SRCREV_Csocket = "e8d9e0bb248c521c2c7fa01e1c6a116d929c41b4"
 
 # This constructs a composite revision based on multiple SRCREV's.
-- 
2.17.1


