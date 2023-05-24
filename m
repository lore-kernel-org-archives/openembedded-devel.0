Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C78C7EE2C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.3703.1684914789516578822
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P92Hnzax;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-510b7b6ef59so1523381a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914788; x=1687506788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWwZq+I9ejONAFo+NhLQkePHXr9XKN83msFn+WPaa74=;
        b=P92HnzaxPq8ByyMaVEAgreceHC1yIoljlmYD+RBRD9X88Jut9RT9tB6G6SjC0ow2NY
         PNY83LmUEDx88dk7Ey6CULCujF0DEj4FNvIPsduf0/XhWSB3ze15h1WU/bXuTeFrJeji
         S+jbmfFPMHOvXM/dNiJFEdsQSMjS1XoRdodbClqEsP5/ceC0+3R0ItHdoNXjewGuxIOX
         D70Ft+0HzBOdphVpjVy/YDdS+O1ThhVarHcdGyKjv9TnPpUlMXWQtTPFd8gt397IjalT
         fSBgoKjqO83NjxxbVqpexj/C5/4Y12dGFu2OM6wDhF4saIw9HGartYFRbupkkSq5ISky
         zNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914788; x=1687506788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWwZq+I9ejONAFo+NhLQkePHXr9XKN83msFn+WPaa74=;
        b=AUQ3DV4uwTscKnrxx6l/I/sWNd6fuABbzxTxd7gBAcQzNFD3PPzAr2WnJGvj+OmRP8
         C05HNprrgFe2oXkXJJtss1ZDGVyu1+wHEfLjx6zq6ge5QNcEQjiD9Ciq0GBnp0gX6iaw
         U3dFSXugtD9VVv1CAl0nbqO5Ry97joTFwkEov2kKuj4v/KMu2tIiYZEA9i65DorsqBYY
         4TRj4XhK/Y3I84037ljdakLaLgRaRegQP9K/fnCv8cef9gTwECj+JyiHtONcoQUE8Q+V
         32ZDfm2DPO+8fEsSRfBNOmb53NXsY8ArF2a9RBJvtryRmNoJtfSaS9m58cdP/3jFHdGo
         L/bw==
X-Gm-Message-State: AC+VfDzKE5/WWCDD81SIQt3LM48tvREm5fSMRKhFH3sbTs6MruYk6WKh
	ZJ8H0IoktZAn4w4SY3aYGEySYdcwxWg=
X-Google-Smtp-Source: ACHHUZ6/FuDYAWnfVcjS3HuK8BoB2cOUFEc154z1qtbWNH3+R2dJv4Z2u6V0anSCIFySxEIoc1xRBQ==
X-Received: by 2002:aa7:cd79:0:b0:50c:160d:f652 with SMTP id ca25-20020aa7cd79000000b0050c160df652mr1238026edb.8.1684914787870;
        Wed, 24 May 2023 00:53:07 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p6-20020a056402074600b0050da1edb2e4sm4861412edy.31.2023.05.24.00.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/20] cyrus-sasl: remove unused patch file
Date: Wed, 24 May 2023 09:52:43 +0200
Message-Id: <20230524075253.1033593-10-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102764

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=edd8bd0f2443bbf1acc794df981cd05f1dbd6778

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../cyrus-sasl/Fix-hardcoded-libdir.patch     | 26 -------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch

diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
deleted file mode 100644
index f172362f4e..0000000000
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 188ad4497947259811ad32faeee95c20f9a44046 Mon Sep 17 00:00:00 2001
-From: "Roy.Li" <rongqing.li@windriver.com>
-Date: Fri, 19 Jul 2013 14:29:31 +0800
-Subject: [PATCH] Fix hardcoded libdir.
-
-Upstream-Status: Pending
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-
----
- plugins/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/plugins/Makefile.am b/plugins/Makefile.am
-index 2b02a52..929f6a4 100644
---- a/plugins/Makefile.am
-+++ b/plugins/Makefile.am
-@@ -65,7 +65,7 @@ LIB_MYSQL = @LIB_MYSQL@
- 
- plugindir = @plugindir@
- 
--sasldir = $(prefix)/lib/sasl2
-+sasldir = $(libdir)/sasl2
- sasl_LTLIBRARIES = @SASL_MECHS@
- EXTRA_LTLIBRARIES = libplain.la libanonymous.la libkerberos4.la libcrammd5.la \
- 	libgs2.la libgssapiv2.la libdigestmd5.la liblogin.la libsrp.la libotp.la \
-- 
2.40.1


