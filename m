Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.217.1611700749281506112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 14:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uO7ajb53;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id s24so2277222wmj.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Jan 2021 14:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dNac+PwfCabi+wHODbblXuGBV2DKK6nZHULLKRnEJWg=;
        b=uO7ajb535jNekqVgnhISLfBmG0ktoHxQUgjWKlXlV040jLxMT0bhBeyN3rmzTOqZ/V
         F92ZGQMWP10ftIQqt9FtJlCfdby+DWfTg4pOmtYWfdrdl/rgRLU4fwmxluhy9+TbbUYy
         n1Ibjk39J2qrkKkxVuVFMe4QZDr1vfROfx16UK1wfShTei7zZ/9z0oRZeKPeyUgkUlBR
         /IgBfKVN/KQi/yzweG9kT/eGk/obGJORAkEXVDb1DaRFzM0sRWKQIfOv252/lRPD1Pxp
         BiUT7CmJuuPbU/32vjUluIlIbuSPGJ6fCbGVs2opzq7iBl0J0iJcdmogf2FEFOeeVHJ/
         vWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dNac+PwfCabi+wHODbblXuGBV2DKK6nZHULLKRnEJWg=;
        b=dc3XZwr6saRmsM2OyHD3Djyn20F9DQQl5CsYmM1NezmGxjo7na/gt48W519b3FX8y6
         v7pqWgbwj8o22Tzd7as+gms3gbNHr+YtQPIFkBhKDTKzR6Q6h7BV9bbjNeHOjkzuTfE+
         FpEeKfbvvTeuQzYlwO3dJ6z1O4IRajKgMWyjpeJPc5yHNYXNLH9qZbq9ILXbILXQ0Gy+
         c7fhqahfpdbTDoGYn1oXlQLx95/JJNwgusTez6MOHsePvubLdzZWsgjQnzaO73uDT/Eq
         +SCmAZFlMZ/AmbCunNkQlbA/85PP/52+R9/EuuiPty7Hf1EO1CrO53m89uwjN4CsQkn5
         BuMQ==
X-Gm-Message-State: AOAM5320eofdPvNHhlc26Hp+fNAV93iDM8G2HJ6fLeRniTxe3HJ5I5av
	zjATbvGIWwteA6QHrM+LoGNbcd3LwjYoQQ==
X-Google-Smtp-Source: ABdhPJwAv3WWeKoY5eRst6xIaIAfSHPkycgEdd50RTBzrImHohh1xY3DaW2dKA6LVCqYvBNPKbqV+g==
X-Received: by 2002:a7b:c10e:: with SMTP id w14mr1506764wmi.56.1611700747459;
        Tue, 26 Jan 2021 14:39:07 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id u16sm198886wrn.68.2021.01.26.14.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 14:39:06 -0800 (PST)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [oe][meta-networking][PATCH v3 0/1] networkmanager: add missing readline depends
Date: Tue, 26 Jan 2021 23:38:55 +0100
Message-Id: <20210126223856.264908-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- makes nmcli a build-time option as suggested by Andreas
- Fixes also bash-completion for all different build variants
- removes the empty packages again as suggested by Martin

Adrian Freihofer (1):
  networkmanager: add missing readline depends

 .../networkmanager/networkmanager_1.28.0.bb               | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.26.2

