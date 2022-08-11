Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFECC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 09:06:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.4360.1660208792282507019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 02:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y0yeVO4P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id p10so20573649wru.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=Hy6V8/vmCN1oxQx9fVuTdDFc75lX83deqbXv0SBOylk=;
        b=Y0yeVO4PIb+W3mKuwARTdGPLQOCZ3ZHA4HYJsH5pz5IGWskIeEQXMHoNjl85RLzLWa
         2EziLib7t21nKYWXskhLQUcg2tmOvAqdBP2TyXpHOq3gqr8BlvKdM7PuhWJvGsCJ+g4Y
         BWV/PLVirhUCmBw4qR8R1tvCxjFCtxDgmCCKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=Hy6V8/vmCN1oxQx9fVuTdDFc75lX83deqbXv0SBOylk=;
        b=vPK4xBNFlgsR54rbdHjNYKT6x+U7g5yZ3R+52kWDnGs/BNmvT/Zb5XZknfZ80znxIZ
         LnRzQiUhJS+Vijo6vkxfPOL4m01mF//RVStSWjpE9K1XtQDayUZaZsM0YWV+MGARFABG
         rHloF9Q24D+N7wfD3gk89WSD+qYPXkY9rGXIDNUjtIxsfnUadvQOJWYN+Wuws++dM8aR
         nIqxxKRFJQkrvIvTX3tGmruiTMjmAEkJNobMvHu1NOd+4FCsJ0OGmIM3zb9jq6U8C5ar
         ptgK6KWglA11+hZEO9xaoBazJFCvOIXBbIk140k/AiCCxGqJ7AFXwUbGuQR+V0oqC6cL
         8dow==
X-Gm-Message-State: ACgBeo3D43NWEU8y+oNHwvI6WX//fgvMfJF6xOSMdVOB2Gb6AN5F0OWa
	+xPuTsdYukl6/Ck0aWB8SNz/b+c7/JiNTQ==
X-Google-Smtp-Source: 
 AA6agR4F+nc6xOwoeAT9Hyu9195s588nNO8ORltt+0XfakuflPVE0cchr7WMs1XDFD+0vRAmvG4vWA==
X-Received: by 2002:adf:fb10:0:b0:207:af88:1eb9 with SMTP id
 c16-20020adffb10000000b00207af881eb9mr19521451wrr.238.1660208790060;
        Thu, 11 Aug 2022 02:06:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7])
        by smtp.gmail.com with ESMTPSA id
 t188-20020a1c46c5000000b003a327f19bf9sm5213062wma.14.2022.08.11.02.06.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 02:06:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH] lmdb: Don't inherit base
Date: Thu, 11 Aug 2022 10:06:29 +0100
Message-Id: <20220811090629.585231-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Aug 2022 09:06:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98191

base is always inherited so remove this code which will soon cause an error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
index b58a36c44..0590ce008 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
 
 SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
 
-inherit base ptest
+inherit ptest
 
 S = "${WORKDIR}/git/libraries/liblmdb"
 
-- 
2.34.1


