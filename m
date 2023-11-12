Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7BBC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:44:24 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.23004.1699821854737960123
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:44:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NF2Wo/wP;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9dd6dc9c00cso589243466b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699821853; x=1700426653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=plKkmWW6kQbiG+/sdq1jMk0TqHGw2YW3MXbM+AtPh+8=;
        b=NF2Wo/wPQP1sZ6BsE2KXyZLIreLbN8jhCgRG6+DUv/JwOHyPEqIHNx03jdEmUquS6w
         q5zjFpFH3pywiGOd4aa0gib0+0US+eb5787yqZJIDao43tpxYzYTT52bkCC0cP6gePsc
         UpP+gST1UmDkR03JjzLP3ODtNUmloG1d7gHcahk2M/WVFfPOiTLtGnjV3nQzi1D0Qo74
         wSg4QXGTEDeIeGDPHYviwWF3JlNt98FQxKDXUKMko23xu3tv7BrunBb4Ukczl92o11A+
         vJDzeSyIJ70srMUID+hU/nMQLh7+tGditwYU7Nku1LfKIIH/2/4WXZcl1HB4dv3+Urlc
         XyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699821853; x=1700426653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plKkmWW6kQbiG+/sdq1jMk0TqHGw2YW3MXbM+AtPh+8=;
        b=FG1lJ1biPCUUFik5tOUpZdJTw4E6BJIqE6Nnp2dNr+pWhMuuGaH9AyE2ADuLaF/s+I
         R2pHvdSqiQDsttA+yuodt7wnaxFpU+4rC6SlLrK/qKund3mM1Kt6dxYD/sCaM7agemf3
         q4n7i+6Nsjoj/qFVqttwX+CVC28RMHNJ4JdfNkNm1aldU78Dj9iAAty4KgpOAJlC9jTq
         HxHPPYe9ZWVcC8opK6HQHEFaCRWqUhge5iT7QNzoOzqJhg9h8U+GgvENCTmdbkg1eUvW
         LS97ZlqfjD5BJZEvJeXSaU/nKazjtLB3v4cjvz7IVgGHJLKYc3C7VxrTh1eHCbL79QfW
         nL+Q==
X-Gm-Message-State: AOJu0YwrAvyQk+h94zxf2NEibii/Woeub54IbxYAhKfz+RCu0gSH4OPl
	71b8Kf2HMTnuo1QRAAQOqPCzlEvqP9Z63g==
X-Google-Smtp-Source: AGHT+IHLNIyFQOE+DvsBREAEg2ynmZT41H9d6KmkxlpIfAJi1W+mNEzXcIBJrl1AgYJ1aLItYNmBqA==
X-Received: by 2002:a17:906:37c7:b0:9a1:f81f:d0d5 with SMTP id o7-20020a17090637c700b009a1f81fd0d5mr3141529ejc.54.1699821852624;
        Sun, 12 Nov 2023 12:44:12 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id z16-20020a170906669000b009dd7097ca22sm2984815ejo.194.2023.11.12.12.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 12:44:12 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] openfortivpn: upgrade 1.20.5 -> 1.21.0
Date: Sun, 12 Nov 2023 23:44:08 +0300
Message-Id: <20231112204408.652490-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106613

Changelog:

* fix "Peer refused to agree to his IP address" message, again
* deprecate option --plugin
* better masking of password in logs
* break on reading 0 from ppp pty, for non-Linux systems

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{openfortivpn_1.20.5.bb => openfortivpn_1.21.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/openfortivpn/{openfortivpn_1.20.5.bb => openfortivpn_1.21.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.20.5.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.21.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.20.5.bb
rename to meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.21.0.bb
index bcfe64691..e6c9a69ee 100644
--- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.20.5.bb
+++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.21.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d575262a651a6f1a17210ce41bf907d"
 
 SRC_URI = "git://github.com/adrienverge/openfortivpn.git;protocol=https;branch=master"
-SRCREV = "1ccb8ee682af255ae85fecd5fcbab6497ccb6b38"
+SRCREV = "26a1fe68cc7a61c58f4f2a98862f6fcf30f9f2dc"
 
 DEPENDS = "openssl"
 
-- 
2.25.1


