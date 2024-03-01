Return-Path: <matthias.schmitz@port4949.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF0CC5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 07:05:13 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.161])
 by mx.groups.io with SMTP id smtpd.web11.17431.1709276703696650767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 23:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@port4949.net header.s=strato-dkim-0002 header.b=LWDAKrCX;
 dkim=pass header.i=@port4949.net header.s=strato-dkim-0003 header.b=dI9Q2czx;
 spf=none, err=permanent DNS error (domain: port4949.net, ip: 81.169.146.161, mailfrom: matthias.schmitz@port4949.net)
ARC-Seal: i=1; a=rsa-sha256; t=1709276700; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=AzfkyZ67nFDtax6i5gpBQu49X2442ZQsGdcY+YamK4B1gtC4kJWqivVDDwbIQcPXjk
    qPTsMaQQQOMuEAsVKZPjC7KvFT6vuzV0FvOpZhg/l9IGU4++X2Gmk/SXZGexLHUSGC2X
    Fv4fPI+E1I56GCvpRMeepY0o1dJBAwOzrxKwEc02Ch9xrLAVfxLA+M38WFoIGm95Fe9s
    cneutF7squGDI6ciNM5sKctED5GWTISxjZCiDhNdFtzKGlhMh+jTPNmFk+4l4xsiyzY2
    slBxLY2M+xmCvVVovTc/msu1gXxKYzAkvuluNByHlKwLNo1McX5Bd730kVcguN3H2mQe
    ugxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1709276700;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wADlj72ShMTxvRUYpkmJeow+ZWvxVWeJ6kbn9/Rl+eA=;
    b=RD533y0hswhzna5oCi8seEh9kwWt/lOfvwpM8isX+Yo/kXLqphBgpYapfrPHpaGHwU
    2EQqGZ+ugxjpb83TCCOPHZtvYZHr8Hkm6Hc5o2jOIMqHnd4jGYdRcs3yX7fv44wD1llh
    aanFDN9Cb7CArp7vnXFuZAcZM9sRypCcIs6eBqql+6LYSLogEYCxIJtPOdFG+6fhfJ7I
    /UoBeMsE8ywBdP/NRbfAvXiB8MTZR6f6CSNbvWq9uzBNEu5kWBXGRym7t9hh89Yl8P6g
    PZ2AducMPUW14wvrad95zeeQTrp9IUWsz6RZUHziOz5K/QA3grTJaEnLnI+0gqGRanKM
    wnwQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1709276700;
    s=strato-dkim-0002; d=port4949.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wADlj72ShMTxvRUYpkmJeow+ZWvxVWeJ6kbn9/Rl+eA=;
    b=LWDAKrCXtVh5g+HKmngTYbxcwpt3nvuqM11UVlyHPz5biU0lkPWOyb/MTqPEbqbqHT
    3qzRGYjY+zluX38i3BbJF4bWpskI+WlkygGFEfWPq9E00HrdfaIhPhgKrVo3bypYd5kN
    NfeyQmWPEhBF4vuq4wOAUpK+Yn1Hk9b8Hf4HbAkRnMJtEWvhThOmpHZmeNP8nOwGxyOp
    wEJPqIfKO6zLnz3ysTW5wYAbkjNrzKYbIqn+va23k6e61b2onlcC9jgCYN/lAtGVVO+o
    exZXUbwGDBEkMQuhv7K1dPkM2VOjwmTa47ZFBysrfviIb4DTyGv7mKAedAa7O9wKezNz
    CwCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1709276700;
    s=strato-dkim-0003; d=port4949.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wADlj72ShMTxvRUYpkmJeow+ZWvxVWeJ6kbn9/Rl+eA=;
    b=dI9Q2czxj2Qjy0JKzBXppZYkC/ChKjBYhLLe7nNOhmePxzpLiceuyDWW/rCuM6JiyN
    pHs8Onqg9Y08ce3o0CBw==
X-RZG-AUTH: ":IW0QYUiheuw51NL377CQpY9rhOdPqiHaDnWOhAa9lXFFHfc5g8vslsXPKF6BYyhIB0y6HVSUMgeUe3uopATY0OfWoA=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 50.2.0 AUTH)
    with ESMTPSA id 08d5f50217506Gl
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 1 Mar 2024 08:05:00 +0100 (CET)
From: Matthias Schmitz <matthias.schmitz@port4949.net>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Schmitz <matthias.schmitz@port4949.net>
Subject: [meta-oe][dunfell][PATCH] postgresql: Update to 12.18
Date: Fri,  1 Mar 2024 07:04:52 +0000
Message-Id: <20240301070452.878836-1-matthias.schmitz@port4949.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 07:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109072

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


