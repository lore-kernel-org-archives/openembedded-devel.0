Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B3CEB28D9
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 07:33:00 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6411.1770363170207151495
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 23:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nhGByvoG;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b884a84e655so268694766b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 23:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770363168; x=1770967968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEwptagqlhHReuzmj2wHretMbApKBXUbqEHNENL2l2c=;
        b=nhGByvoG64WySr6Vq5TfNx2yh2hEqSyAVhIPLGntilLBqQh06/LE5AL7bQbA4RzOKY
         zPPOxDF31fG5SQmEr3zLA8U61UqaN9FwbZYpFFCnCZ0/MrkMWzSZ06ecR1hoFMdQUZCD
         2qR48etefSeoSLe2Rbsz9/XnUSoFwnKHXWQ/uPeZF6ax4C/nKkyQyGEHKwujuS6XnC8F
         Jw4fkon1Fkpi/tgA4imh5Dhf7c0EJV/GTjmiVj+VLAouqX5cy4MlQjmvyK/shLUdWOeI
         9ufZ4Ck0DIiKHhiBO3aTaMg4wh2BjSatjwfcUnZ0mXaJXhG6JcEU/twKGyP5bP8WozGh
         tFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770363168; x=1770967968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WEwptagqlhHReuzmj2wHretMbApKBXUbqEHNENL2l2c=;
        b=n86AXQA6aYUc+kKIjLM8xbO/cg0PPlhJkwN5LxtbeTwdT+ahznunPK4wZ20eiVrqKF
         w7tN4MjEvnBC5ebsqrtgUIvcxxrQXDZI5vY7fw1Jz108f0hLGEeBCe24GWRXgAjaIvJN
         Q0KgEvbWUXKhQBxmtsTnHpyvXsZY3daOnckfr8H5n0LPBkUw/f+Thg42d1gt126ZrGbl
         WfMz6EHN66PnaGKlVI2KyvUn6iHWopGwgaeO226IEdERALwukuwv4SIydKEX0fDLvRot
         rYRg4TDGQDijwoRUBcMWeC0aJN7DY1nhrDfOBwKQZIS9bLtiZi7Euz3a6WpwO62X65/T
         /LTw==
X-Gm-Message-State: AOJu0YwEmHmTgSEP7hEAQX3Eg9ykit3717ptii+EKIWt0GCUF2eYHD0r
	RFvzpJwZYiitOpDuVpLD7fQhj9q4PGShsxzyy9+zshbQt6f3zuDnxtJMdn11WSWk
X-Gm-Gg: AZuq6aI+96MY/oHa7WAchmEdHedsG3xH/Gw0COqj65U36GKipaIRLVBhMberBmPAUHH
	ks5CZbPHNbxS14Pp093Owd1+721nCMzU4jRkxIGwZhD3JcvqFQhLLKOwTJrnUPm/iC07kt3bg8Q
	VBUO2oGjfv4cdU95FmKU4Dg5lyw1/1jQqM48HSjpnpQqHiZ1AN/6UBPA7UaQhmX9S8UiegDWv4T
	MafYAcDedBhUpexnVeKivoYjOPqFTsOr5kKpeeGCEDGByYAN8m2tIRqWJRAGnwcEYcmk2b3bMjV
	bNHrbUD2/HQu1bSvXb1GYqnoof/GMsenGcB2m3+Sb+9uzf/Kqupdf6AzhMO7D1bkCgcQ6TXki/K
	qc6nTA204YbBpvmC3rKIesCwtM6M2dc8rulgGU0AqQjCKMdrzBNIZwd3QuprD66+NPq/vNxXWMP
	i8TPm2gTAA7VeA4ZkP+Zc9V8MD2saNnjLyPoslh6qgIxKhU0MDFBuFLoooUR0=
X-Received: by 2002:a17:907:3cc7:b0:b87:4c74:b316 with SMTP id a640c23a62f3a-b8edf3dc68cmr91475966b.50.1770363168099;
        Thu, 05 Feb 2026 23:32:48 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.128.38.mobile.3.dk. [77.241.128.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb18aesm59346366b.41.2026.02.05.23.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:32:47 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe/v[PATCH v2 0/1] include glaze cmake files
Date: Fri,  6 Feb 2026 08:32:08 +0100
Message-ID: <20260206073208.340688-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <DB5PR02MB10213DB563D39B743A315F251EF99A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <DB5PR02MB10213DB563D39B743A315F251EF99A@DB5PR02MB10213.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 07:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124227

v1 moved cmake files to where glaze originally installs cmake files
(/usr/share/glaze/*.cmake)

v2 reverts v1 and adds the cmake files to FILES:${PN}-dev

Thanks to Peter Kjellerstedt for his insights here

Frede Hoey Braendstrup (1):
  glaze: include cmake files in glaze-dev package

 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 


