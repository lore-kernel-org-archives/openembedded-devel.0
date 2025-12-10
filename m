Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3571CD3C55D
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:27:13 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15338.1765373224690602955
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NiDpRHEm;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2981f9ce15cso89597785ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373224; x=1765978024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=445DvED/3k20nR0XIswKJWPS8/Ss1c/Ss/9UBiuwd+w=;
        b=NiDpRHEm+PzwynhgL5yERXo9a468OoYPzkVKBcjkHF7+SkaucuKlwk12w4PGcBWbw0
         FSRJXdq0OLQgmaDKjwsW6Ticdrek0G6tuHwEENccmTDI5t3Gly+lzMKfKKwzSNweyCk8
         tbOnJsVBfs8FWcgt207USN1go4asMprosbZuNLjxmjKo1yo7ZaI1QmqRpQoXOS79EK8u
         ddMH5XNgF2UhoWRPQfvlbIPaBI6DT6MrEfaiHOC5lxF9aW9anotVEdr4ASlQQKtMIV8R
         JIgOInYvz4yd8jHsmPOuDjbRr9RwMJU5UZ+StoctrcEp/S6o/2I/iImwWR0Th+diNPmX
         qxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373224; x=1765978024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=445DvED/3k20nR0XIswKJWPS8/Ss1c/Ss/9UBiuwd+w=;
        b=G7o6A0nAo+HJasqGI4d9KXg58zNC4od+9YSf+eBftDTqxmkNeLogQPSKu/i99GDdG8
         PwbzhdaEzK3KmaMeDttmLA+lvJvcSvCZeysP5zdzbiQOWlgRMaSY3MzdA/ycMUhk4hlN
         8qjBMUwrpWxVoy0WPL+2kKRjivDGd/LeQ+9Hn4RXWsF8wh11oWL/aLKdGIhYpiPGpzAL
         zJmTmqVg+MuU/HXvfC86p7foMvB9P9X4hmeIl3RCfgeUYJVX3/4fWvL3CvUalx2kZ9/h
         2JR4Rg3Q4B7Dy8MTJVLy085/4WwShvm+t60XSQUpPdQXASNTme9CeKPuerCG+DvEbINi
         PFrw==
X-Gm-Message-State: AOJu0YyLerlv/IBu9G2e863ToSC0V7GLXz083o9ftLxuqB+3rWmHTZuq
	awue5XPysWF14dJaq6+dCXpXSDw7sDdTWl4w741iQ6vUadzjYQW6iP7I45QKyw==
X-Gm-Gg: AY/fxX4g7QFNWy55oBWhv0NqkfNFI7eeC3nmVB/fFzb+VwAFwX+EpHfrFnraEMHPgfh
	yeTQjfyJMzZw9FgbeAETwo8HWTMb2szGoyKXs5n7a0OVDBSeq3gUI5bBCKa80BNn268PjOxrgdR
	x69SMTpWiAg3PK6iP5Llir2XCmaHeTPXyxaQxJ2M76KL7MOzs9RDGv2VbnIdhMOHN/wsnS6GCWw
	7A3J0b+CHOC8gj4mmpoee0jS67f0ikdFlUy50i/RlayMweKLB8mYzKOiGvQBW4Z41OWx4mTX+iL
	MtQNNpLfF5JFPe+BlZQSNPULgL5Iz9z52SQvcgX28O+e78sUZo0O/cOo6qTqEwRrluAvTJ8L8ab
	pzFOL6JBdYCEPdisZaYlsCIpW8/qPj04TAUiCCcJhaReeZMXHJyyggIHLBKFUaxRvxYQqCAotIb
	igIqYFH2sEM1FoeuQiRm5HrmUHKKNbuEQEHg==
X-Google-Smtp-Source: AGHT+IHirv9ofpAf/CUWF6Wzz9M6T/kITzM01kKyogoGDJP/ZKe+88EQRXX1hvoYyI30VXFVJFa7Lg==
X-Received: by 2002:a17:903:298b:b0:295:28a4:f0be with SMTP id d9443c01a7336-29ec2583e9emr21818595ad.10.1765373223862;
        Wed, 10 Dec 2025 05:27:03 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm182972465ad.46.2025.12.10.05.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:27:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 32/43] tmux: upgrade 3.5a -> 3.6
Date: Wed, 10 Dec 2025 18:56:38 +0530
Message-ID: <20251210132641.323679-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
References: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122536

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Change log:
https://raw.githubusercontent.com/tmux/tmux/3.6/CHANGES

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bc2e724246c57a4f8807e197525b68da9b04f43b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/tmux/{tmux_3.5a.bb => tmux_3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/tmux/{tmux_3.5a.bb => tmux_3.6.bb} (90%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.5a.bb b/meta-oe/recipes-extended/tmux/tmux_3.6.bb
similarity index 90%
rename from meta-oe/recipes-extended/tmux/tmux_3.5a.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.6.bb
index 72c84f562e..5daa1b174a 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.5a.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent bison-native"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[sha256sum] = "16216bd0877170dfcc64157085ba9013610b12b082548c7c9542cc0103198951"
+SRC_URI[sha256sum] = "136db80cfbfba617a103401f52874e7c64927986b65b1b700350b6058ad69607"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+[a-z]?)"

