Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CE2C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 17:39:26 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.295.1708364362031988080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 09:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DAjkJBN6;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dbf1fe91fcso9889345ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708364361; x=1708969161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UkYaTW54iXZ75PhDtPRbSmXHkZVbnvPEOVRPcpb7xzg=;
        b=DAjkJBN6pGpWS6rRWXnTIPphNrOj247dSBIAFsuZmv8lKBJxtST0j5Fk2lTVJ4C5I1
         L2n7GvEaqBGUghSnA5XSTaNrlaF+L/RlE67hjOUmS8LvT1ZnNrkmcJo7aCk6pXBeCbQD
         Zy9dIqOtMuLlh5T0axJY3gGTsYZrpNvsud9EIrzpcGYNt7YZyAqN8UvTP2ZkEr5Ww0jP
         j9+fjJ1GVkXDTNTtuMagkI4Fls50H8RAGjmMCZ2OhVZ9fdLJAMzlVJQqudgGyfkWwFae
         Hl7l/bO/FgPhAuUVynW5HZTAy2LNnK5ihQIdFfDnHM565kpQBY/LZOiPtn6N5dyhx5IW
         /zDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708364361; x=1708969161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkYaTW54iXZ75PhDtPRbSmXHkZVbnvPEOVRPcpb7xzg=;
        b=e9KwknqPQSIVfNksAt5j7SgU6XQnmE+V/OMOo+fWEPstBb3V7nxo0WE4in2jJHVXbc
         O+61i9mmyKHTXGcFUxt03gAWZwhIgpDWYTOf0Vw6iExAcJN/lC7cRD9cxwUePaTp3BmV
         cMue7l/7WI7eojV17mO9FfPmm8rc0zDtyHI/I7D8kVmJ8JVWR+zBF5O0siuWTGkM7gzH
         +3k7gDatVIQ44gxHioQRKo24iRuQvkDfEVK75DALIuKk7yGyZNYTj0BvJffGH2ukl1E+
         SVgVlgbrl0vaLj/e06ZybS37spWdT+QKt2i91e13fFMYZ49STO3KV19sprY7GoLH3A+d
         jhJw==
X-Gm-Message-State: AOJu0YyONT+wy91w5OniueGxmFrhntkjiGSY/8glzw4d4TKyqGpBC0c8
	uKXG225lC97R4dP2vQzsMA9ZYxGu2ssDcKqIAxeO1srZNd06AIP1RC46742O
X-Google-Smtp-Source: AGHT+IEZzr+/Kv4VweFFHhELSskFE2SEeTmHfMrXqqJAb8GhWGYWoC1mRuiXSvAixZI3djTCtXwbKA==
X-Received: by 2002:a17:902:d4cc:b0:1dc:93b:8981 with SMTP id o12-20020a170902d4cc00b001dc093b8981mr1893835plg.14.1708364361087;
        Mon, 19 Feb 2024 09:39:21 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id kr7-20020a170903080700b001d739667fc3sm4683455plb.207.2024.02.19.09.39.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 09:39:20 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/2] Move "mesonpy" support to oe-core
Date: Mon, 19 Feb 2024 09:39:02 -0800
Message-Id: <cover.1708364156.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 17:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108872

The "mesonpy" PEP-517 build backend is declared by python3-numpy in pyproject.toml,
so it is time to move this to oe-core.

This should not be build-tested/merged until the move to oe-core is complete:
https://patchwork.yoctoproject.org/project/oe-core/patch/cover.1708363628.git.tim.orling@konsulko.com/

This is part of a larger effort to replace usage of setuptools3.bbclass in favor of the
various python_*.bbclass PEP-517 build backends.

The following changes since commit a6c4624a684f7d5a2dbd21acbe74ecf611f4f839:

  ot-br-posix: Limit vla-cxx-extension option to clang >= 18 (2024-02-10 23:47:57 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/move_python_mesonpy
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/move_python_mesonpy

Tim Orling (2):
  python_mesonpy.bbclass: move to oe-core
  python3-meson-python: move to oe-core

 meta-python/classes/python_mesonpy.bbclass    | 52 -------------------
 .../python/python3-meson-python_0.15.0.bb     | 23 --------
 2 files changed, 75 deletions(-)
 delete mode 100644 meta-python/classes/python_mesonpy.bbclass
 delete mode 100644 meta-python/recipes-devtools/python/python3-meson-python_0.15.0.bb

-- 
2.34.1


