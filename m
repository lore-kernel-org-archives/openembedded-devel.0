Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5038D611C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 17:19:18 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d9so1297040pgu.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 09:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NglKJahbBGDshxtNO7sLC0zqV28KnevbtZR3l+0xJZE=;
	b=UwAORgRSi+EvAKlD9svAc6CKWjyadJXCPOUNzsPQkPb5/DDlH8oHCeF8U++AHj4Ydy
	EYuJXWJkfqfFtBl+Gpg4ZZd0FLCxVe8C3KgKTCB5m/7r5wo1I5TK7UhN1HvzxRVz4p2j
	Nld4WjvQCeI9NnvfvUhf3hTT37RcKCpJCnmy9rTxs6Ed3vbPcSI5zu+a0qF6cDufkrZK
	pNS2IN+nxhoCw/PT1ySivdyv710bBpHQLa8aPMY1e6RsR3Q4B4UlDMDXQWhnEC5tVpw1
	twcrOVAdusRlDe5/LRknI/4oUSPoTXUg7VQuc4Z75w/cc1WcCHoXHP+1dzO7C20BS9pI
	JXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NglKJahbBGDshxtNO7sLC0zqV28KnevbtZR3l+0xJZE=;
	b=P+tFwcptat/wCzI9tQn/DL3zdoZhIV4IASrJCbK2VpH7WSkUzIOYQ4xjrJypHnW1tY
	AOVihk0mdH/bVykAYB09InYSyH4SvM1Y5R+SdbN2cYnvudFdysor2NHiXpSv/OUU0PoS
	JXu3XVKmHxaq+dKtd+iE3eERqIhFHQRAwaysY60zSHlcANRsXk8blkJCsBLeP80cpxQ4
	mPOKNIS5vz1QsjeCqkkegG3a940BR3uV9tcV7tna4GgrolLvVlzgTayS9X6c6q1+gIwE
	8+xMnXKRDVhxFJtcw/yAS2ZjBectyRi7a+AsslFlg41yB5YZPzobdgN7JE1OMmUGMOXF
	6lwQ==
X-Gm-Message-State: ANhLgQ3FjkzlXtsmEfgLxebJfl3Da8RcxwmVt+eCGFvbgBqGuZ4acHqa
	ft2ToUtaGzMdad11YvM89OyoIONNYnM=
X-Google-Smtp-Source: ADFU+vtXPGahONXHucHRknCcRV8mpAGsMqSMdJ8nWhocFIsHy0IT8cB8XTsdyqokSMWsdHwyIKjzdw==
X-Received: by 2002:aa7:8582:: with SMTP id w2mr3903468pfn.89.1583342358942;
	Wed, 04 Mar 2020 09:19:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8ce3])
	by smtp.gmail.com with ESMTPSA id
	g10sm29343645pfo.166.2020.03.04.09.19.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 09:19:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2020 09:19:25 -0800
Message-Id: <20200304171927.2068660-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304171927.2068660-1-raj.khem@gmail.com>
References: <20200304171927.2068660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 3/5] minidlna: Retarget gettext patch to gettex version 0.20
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
X-List-Received-Date: Wed, 04 Mar 2020 17:19:18 -0000
Content-Transfer-Encoding: 8bit

This fixes
*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.19 but the autoconf macros are from gettext version 0.20

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../minidlna/minidlna/0001-Update-Gettext-version.patch     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
index c18095d42c..6100da3581 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
@@ -10,8 +10,6 @@ Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index f343d21..a556b33 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -14,7 +14,7 @@
@@ -23,12 +21,12 @@ index f343d21..a556b33 100644
  #LT_INIT
  
  AC_CANONICAL_TARGET
-@@ -28,7 +28,7 @@ m4_ifdef([AC_USE_SYSTEM_EXTENSIONS], [AC_USE_SYSTEM_EXTENSIONS])
+@@ -28,7 +28,7 @@ m4_ifdef([AC_USE_SYSTEM_EXTENSIONS], [AC
  
  AM_ICONV
  AM_GNU_GETTEXT([external])
 -AM_GNU_GETTEXT_VERSION(0.18)
-+AM_GNU_GETTEXT_VERSION(0.19)
++AM_GNU_GETTEXT_VERSION(0.20)
  
  # Checks for programs.
  AC_PROG_AWK
-- 
2.25.1


