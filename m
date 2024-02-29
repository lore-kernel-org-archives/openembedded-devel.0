Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AE3C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 20:56:26 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
 by mx.groups.io with SMTP id smtpd.web10.6358.1709239895564275898
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 12:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@port4949.net header.s=strato-dkim-0002 header.b=LZcgtrxM;
 dkim=pass header.i=@port4949.net header.s=strato-dkim-0003 header.b=BSwyando;
 spf=none, err=permanent DNS error (domain: port4949.net, ip: 81.169.146.221, mailfrom: matthias.schmitz@port4949.net)
ARC-Seal: i=1; a=rsa-sha256; t=1709239893; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qBXiAOXB9HJVnN+9J32MsAadyTCErSrib04wrwWNU71m5fwTqDaf+GmPFItxELlgUs
    QYgg+vaA900K6YiXBM15XerLYMhGQKuDQv63E3/5+4Ay3P1JyRpwoqVwNZUbPoc49H6e
    nUeENzJI3Zr6gOV16q061wNp9p4OcDOaWNSvV5gSAxNuMOM50F5j3U6QnfVOYtYgmDfa
    LH9iTO3X9z7d+Hniwjjszel8GaVe25A4W9jujCjp1M2iQF6c5ipIdz7D4sLrO4eYYaoS
    PizPTmR8fA5LygeQ2vzAq+d9wMvDJLaEGeexlgdAf4DbELmaUcz9z8qXrhDUSovbC2ce
    OZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1709239893;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wADlj72ShMTxvRUYpkmJeow+ZWvxVWeJ6kbn9/Rl+eA=;
    b=gdTfPG+u8p5uuDk1OuFDHk+S1x2LlC8w6HMOFNrFXrB3uCexL6qf4cLY+RQ95BRfZQ
    TJTI3ztggOFDMjMabPraK1Hc1Fbb2TVT+rMN18SxbXgo6sbdL5+YHKdLaPjdHVnTpv2M
    wU3xmR6gdT6DD5Ml9XJ3E/EygkhF4+luGz7rGx+bOsJrj5NV57eMfGAIepOwNdBk7MjC
    PVpyGSzXdbE113aV0jcPtw8m2DZ15Dv9KMMEetsVZHhbzuuOCWuhqip9h742YpQ5xjry
    v9PuO9nKtwaMsGZ8TiMo1DAeje70gRFYE+86Mn6oNesdSgsE29H8CMlTaSwZ2CV/78cb
    LS4g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1709239893;
    s=strato-dkim-0002; d=port4949.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wADlj72ShMTxvRUYpkmJeow+ZWvxVWeJ6kbn9/Rl+eA=;
    b=LZcgtrxMiag+07sODBFtG54pPEk0VSR+Q7Sl2qVj2OQ2zVdgHhnV8VN/BhLqkUQMEa
    AvX5g1BjgOZ/ErGR1aBheEA86zAONOlBRZyPaPRJygI22+vso8TMLe0CazVLRkdiPFXP
    NSu2iYM9Jg3w59WtxYmiJWzNTNbtG8BDpIA6sTQpKbod5vKZfHX4Pge8ijDuoimZX9C3
    u/s7rEgKm3ogo4HjeA5QarWYvtq5LXalsbGo+od/ZynP2U1nZYc7sOZT5+pS20Pr52pZ
    rspMDVv6ibUbAuCg+XqhsU3K2yyUW0gDapFHRQQqUS/OhFkY1NdCdrFaswkxuV07shbP
    ERKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1709239893;
    s=strato-dkim-0003; d=port4949.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wADlj72ShMTxvRUYpkmJeow+ZWvxVWeJ6kbn9/Rl+eA=;
    b=BSwyando99fEnJsFFkFMjn/WgG74P/3xHirZEuYynULEEX4fV830vr+oocCf5yM3ro
    d/ch4z/jTefsCDmRZ2BQ==
X-RZG-AUTH: ":IW0QYUiheuw51NL377CQpY9rhOdPqiHaDnWOhAa9lXFFHfc5g8vslsXPKF6BYyhIB0y6HVSUMgeUe3uopATY0OfWoA=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 50.2.0 AUTH)
    with ESMTPSA id 08d5f501TKpX1vG
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 29 Feb 2024 21:51:33 +0100 (CET)
From: "Matthias Schmitz" <matthias.schmitz@port4949.net>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Schmitz <matthias.schmitz@port4949.net>
Subject: [meta-oe][dunfell][PATCH] postgresql: Update to 12.18
Date: Thu, 29 Feb 2024 20:51:29 +0000
Message-Id: <20240229205129.877872-1-matthias.schmitz@port4949.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 20:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109083

Minor security and bugfix release. Fixes

CVE-2024-0985: PostgreSQL non-owner REFRESH MATERIALIZED VIEW
               CONCURRENTLY executes arbitrary SQL

Additional information is available in the release notes:
https://www.postgresql.org/docs/release/12.18/

Signed-off-by: Matthias Schmitz <matthias.schmitz@port4949.net>
---
 .../postgresql/{postgresql_12.17.bb => postgresql_12.18.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.17.bb => postgresql_12.18.bb} (51%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.17.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.18.bb
similarity index 51%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.17.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.18.bb
index e9f9f50a2..44074a233 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.17.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.18.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c31f662bb2bfb3b4187fe9a53e0ffe7c"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=89afbb2d7716371015101c2b2cb4297a"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -8,4 +8,4 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[sha256sum] = "93e8e1b23981d5f03c6c5763f77b28184c1ce4db7194fa466e2edb65d9c1c5f6"
+SRC_URI[sha256sum] = "4f9919725d941ce9868e07fe1ed1d3a86748599b483386547583928b74c3918a"
-- 
2.39.2


