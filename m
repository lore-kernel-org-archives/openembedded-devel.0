Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.13266.1604936073339469200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 07:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vBm+13bt;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: rosbrookn@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id e5so2515656qvs.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 07:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JbLD/YvFIJJ8NrNMtyPOFUWNsF0NKOh525YY5sx/zMI=;
        b=vBm+13btD0yI4UvtA4bo0nAXRUdbtX+RkCVqEifXmfNbMVna1+lzC4lJ4MlQkcvIyL
         YuNtOiHRPcMePRCYGFH4H4RtFwIDFs445OecjFJEInaJKHDoXZyZFxRWhsUfgq0ti/jE
         94I6bzNxyWlSKgPmglmdlv1pfn9d02qQjbVbFMEFgfg33N5gyyHYis4pYRxQfwdsEwXR
         Hagpxm8ajMqmY/KBiM6T9ulvjYmgGLz5lr1GjWKpC5EloeTRXW8yQdm3QTLdkgGA/qUI
         PkWd0h9q6S44jwqZVpdnqkLoqDqtTmCo3ahstuIr7nXL0enoo71ZG5W2wHUFjSlRvdzD
         /MEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JbLD/YvFIJJ8NrNMtyPOFUWNsF0NKOh525YY5sx/zMI=;
        b=MC3VtACfa8wkA/f4pdBmO5mulaNH2Gfc08S0Q84YUXxIbuVp1LnXNhdYRJaAbdfVzb
         cMA3QQYdny0sd+ykmfJpLuzzB7sEQ5wFXedo+Kz09saePWtSm5Z+ZlxAWA4daSugs22X
         vobb+Nzup+E28Xj1COJ9GeeL+F0TNx8OOmWF6fnrAFbNIoTawCBdZ3DeFr/ggnAKfjls
         uidmuAwLWiHnsr4Q8lDUnLz3JguyCdZowCO4kGIHDCDQ1ZWvMe/QvFMf927f/vjBhVAk
         tXZUdYXWxWccPQupLvjwtaPkBIvdaE8sBbHebCEu4ndCKMm4f6oOO+1O5qFQ2moBfRFI
         R1ng==
X-Gm-Message-State: AOAM531EVawkh1GqCBD2zRv2UWmkBx/5az6G7cmdkpaCAECSzdnygPhF
	/bkEL46XvztIhiKbR+wYCk+4NvoH9m4SbQ==
X-Google-Smtp-Source: ABdhPJwkj34CRu9yaRDcGFQ+oUgSG93NSvg+Sn+dX8h0VvhiFXfjUVOFIZBDJoHpuQkAQWgP2kagUg==
X-Received: by 2002:a0c:8143:: with SMTP id 61mr14597359qvc.6.1604936072118;
        Mon, 09 Nov 2020 07:34:32 -0800 (PST)
Return-Path: <rosbrookn@gmail.com>
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id b3sm5768656qte.85.2020.11.09.07.34.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 07:34:31 -0800 (PST)
From: "Nick Rosbrook" <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: [meta-networking][PATCH v2 0/2] strongswan PACKAGECONFIG
Date: Mon,  9 Nov 2020 10:34:26 -0500
Message-Id: <cover.1604935361.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches add a couple new PACKAGECONFIG options for EAP, and update
the default options to use swanctl, rather than deprecated components.

v2:
  - Make systemd-charon conditional on systemd DISTRO_FEATURE
  - Don't resend "strongswan: add some PACKAGECONFIG options for EAP"
    since it was already committed
  - Add a patch to remove ldap from PACKAGECONFIG by default

Nick Rosbrook (2):
  strongswan: do not use deprecated stroke and starter by default
  strongswan: remove ldap from default PACKAGECONFIG

 .../recipes-support/strongswan/strongswan_5.8.4.bb  | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
2.17.1

