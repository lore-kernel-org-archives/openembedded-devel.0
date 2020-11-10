Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.29402.1605022187789183704
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2020 07:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h1Dk6UcY;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: rosbrookn@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id 3so8808992qtx.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2020 07:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Etg3smY/WVPcBX/eUSkAOVXPXJ5qKrb0VM8QsQGfQIs=;
        b=h1Dk6UcYfJigG87hnOh2IKyLxTYAuo42Zc9i3MxjzVMSTQBoa6r04MGzeKIvywue+N
         4djQrIX/mW2N7YLXww7Y0CY7vFMzTJK4wh6b4jmO68l5nRacCodMkhiiv1nDDiKZHbpt
         DVFtpTV58LUQTGEScwCNV3o0vndZVSmBc8Mf36UMwkhhneB1FaIlzkAhty61yXU59IOw
         Zk9YZHDhEY7i5lOylupDb0zRlSNz9iSJInIMf/8ZC2bXUv82nLclZ4drcMG3eOVBvkBX
         rrq4TCQ6n6AT5KJpLHHfX/TfaW/86KKQXaHBE4VtOTajrXq0smjlHTCguyA7RwghjR8P
         nPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Etg3smY/WVPcBX/eUSkAOVXPXJ5qKrb0VM8QsQGfQIs=;
        b=IaOwZT7ozVL2VICitsax5b8XusxePHz3uZ+u8Ww0ukvbOKfAOoF6sT6V2ejfoJJUCR
         oaqKIsRAql14TgMDdUWGe3s6OTXdZ6QcqNm3mHXZZvVk3uD0A4kjFsyiFs7sdLvtSA1h
         EPO/tvEA8yMRmUuUJkBVtGnPpwNeCGJhhjW0CpRhJHXqCR1j1BQFq6/wcr4/QplPIOx8
         AQA0CQe9LeX+486wG+b1Aqdx0U8T7J7RbwVqymoqWERzDcDOek9AZa6hANqYNZN8vVwm
         AA7RwG+uvyOnHKQ5V2yuawknRmupVtkXpKQFdcKBJZcSTax3Hw8rKnz2ypjcs1ibjsNl
         3Fug==
X-Gm-Message-State: AOAM530wcfF/frn8tuwBMJoqVLMwLLSuAwDL7+f8D4M/FKR1JMxeLoxG
	SKz2Vo0KDGeuxZgAu9PlugOWRbJFtwCeSA==
X-Google-Smtp-Source: ABdhPJzUBnj2lx0u7fAHhNewADuHoRYHNaMx8Od0cAZrKhB2rmUJP+DwlYP4G1Hlys6YwozVuekN1A==
X-Received: by 2002:a05:622a:206:: with SMTP id b6mr7152551qtx.285.1605022186053;
        Tue, 10 Nov 2020 07:29:46 -0800 (PST)
Return-Path: <rosbrookn@gmail.com>
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id z13sm8680549qkl.2.2020.11.10.07.29.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 07:29:44 -0800 (PST)
From: "Nick Rosbrook" <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: [meta-networking][PATCH v3 0/2] strongswan PACKAGECONFIG
Date: Tue, 10 Nov 2020 10:29:39 -0500
Message-Id: <cover.1605021370.git.rosbrookn@ainfosec.com>
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

v3:
  - Use 'charon' as the false value in the DISTRO_FEATURES contains
    systemd check 
  - Update ldap patch

Nick Rosbrook (2):
  strongswan: do not use deprecated stroke and starter by default
  strongswan: remove ldap from default PACKAGECONFIG

 .../recipes-support/strongswan/strongswan_5.8.4.bb  | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
2.17.1

