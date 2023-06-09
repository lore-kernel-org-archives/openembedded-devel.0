Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287F1C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:48:19 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.15285.1686322088878624790
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jun 2023 07:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PYcze70L;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-977d55ac17bso334477166b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686322087; x=1688914087;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NsNj4Trygn+dsUhmfHkPjseb2vNstl4dLq9ZhqpkLBc=;
        b=PYcze70L4zdTxzcsdl4Rm38MUXK0xMSiK178xnLlMllSv5PKPoScfKoWsIZocngmUW
         Tys48EqgFis5LBoea3/3R1hxKUqrWGJee0ej0TG+D0rkdablzgI73gpr87AUR73ezzEV
         bCgPEjSCkzcuACXX07q0nEQmahOnCLO14L97GmgU3IMN90KO+KBMpTl1Nd1bmX1zcchC
         gKQBv6kEBm6J9PDR9laRiPdXkeFisDiRW1f2lbMLuLIeVNfSeu4sWwW0oMAxCSAFnAyS
         +f2LPFnD6+R5mBrDwKTwhQshoFNK9Xpsa/3sO6IuLWgPJ3AQkbe/cIBf1NNRBmVsCmSn
         Bs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322087; x=1688914087;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsNj4Trygn+dsUhmfHkPjseb2vNstl4dLq9ZhqpkLBc=;
        b=lzreHCCyx3LoyEWZ+Kb7ukITwYeAxjo0LaIsCI6vzpkIBImwH668jtaLFWph1i+YNg
         jePBKVGlJSusiG8Uve6HhUIpHgHm1qz3lR333cj2bm0/op18dkEM49YVT+z2gOKkLBsm
         zogg971PVzdVvTHJkNbdltchWs4VB9iP0qyH/yfAbbTl8o0YR3b/PUyZIeDZiNCUuzug
         8sDo2X9QnHWI5B9q+RLEAO84PYOL5v4KqF5hEWHTJ1nN4sh2abdpA2Tp33bju6GOcL5F
         3L16gbUljIK+d8t9TugmTKT405N3BhD4TSzE7etReGu6i88bUmeQchRofQLU7q+cB/g2
         d2ww==
X-Gm-Message-State: AC+VfDzzFiHAAr8x1fOeKzPpoVui8QJBsltZc9B3KE7nUI94gj7+MSkY
	Goo2BTOfXOClfjS95cQe33DkQFYRihA=
X-Google-Smtp-Source: ACHHUZ48EJrb5KQmvPoSIuET5/IT7fow7mT700RGu1AmxpOyp8eYEM4LQnM9Es95SfcSgDBNFAGTgQ==
X-Received: by 2002:a17:906:7951:b0:94e:e97b:c65 with SMTP id l17-20020a170906795100b0094ee97b0c65mr2418748ejo.60.1686322087082;
        Fri, 09 Jun 2023 07:48:07 -0700 (PDT)
Received: from NVC4181.nedap.local (159-210-178-143.ftth.glasoperator.nl. [143.178.210.159])
        by smtp.gmail.com with ESMTPSA id gv11-20020a170906f10b00b00947ed087a2csm1377097ejb.154.2023.06.09.07.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:48:06 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH 2/3] javasqlite: Remove obsolete rename of libtool
Date: Fri,  9 Jun 2023 16:46:45 +0200
Message-Id: <20230609144646.1977-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.39.2.windows.1
In-Reply-To: <20230609144646.1977-1-jermain.horsman@nedap.com>
References: <20230609144646.1977-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 14:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103202

From: Jermain Horsman <jermain.horsman@nedap.com>

Autoconf no longer generates libtool with a host alias prefix,
this causes do_configure to fail as it is unable to copy the
prefixed libtool since it no longer exists.

Since the rename is no longer needed the entire append can be
removed.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-core/javasqlite/javasqlite_20150419.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/recipes-core/javasqlite/javasqlite_20150419.bb b/recipes-core/javasqlite/javasqlite_20150419.bb
index 71e9676..45262e2 100644
--- a/recipes-core/javasqlite/javasqlite_20150419.bb
+++ b/recipes-core/javasqlite/javasqlite_20150419.bb
@@ -37,10 +37,6 @@ EXTRA_OEMAKE = "DESTDIR=${D}"
 # This dev package contains an '.so' file used for JNI development
 INSANE_SKIP:${PN}-dev = "dev-elf"
 
-do_configure:append (){
-	cp ${S}/*-libtool ${S}/libtool
-}
-
 do_compile:prepend (){
 	echo '#!/bin/sh' > ${STAGING_BINDIR_NATIVE}/cc
 	echo '${BUILD_CC} $@' >> ${STAGING_BINDIR_NATIVE}/cc
-- 
2.39.2.windows.1


