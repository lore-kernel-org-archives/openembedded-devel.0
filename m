Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0C0D5B17B
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.1000.1730142294445670514
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDulSZlK;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e377e4aea3so41292687b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142293; x=1730747093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H9W/vnTlnJPDLcvUQJLwlil9wzsiQCFuzoKf0RxX3Lo=;
        b=jDulSZlK145KqI2YSeTB4pR8WK/h1T01wqm7v45i8duahmGTjoWtXweI2yXukoQYFP
         Sn2fBtf4n4sbbcegyXs9yLlMzYhnYO3w40EoxMzR31XHMRbm0zrWKDcQerQgDja9ain5
         LTBgBG1JEaxhZnTL2SqbrYcvLLwfNKwNJvYy41F/6O149s2XMj6WLmlgW11Za5OQRja6
         b296HJfmGufLLyr6pw6iZKx1oylzJStDcuHBByh30JE5C5+ex9q/c8He7seAyAY7K12Q
         8fMO6H/8ZtEzkRSZscMthwDUDCRYTyO/RNy1X6YPY7kG15r9+ytDAp3ihexdkDCKNpvi
         r4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142293; x=1730747093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9W/vnTlnJPDLcvUQJLwlil9wzsiQCFuzoKf0RxX3Lo=;
        b=Vn7+maBOwm+G1XEdT/x5nws7aAjWlYqsO/mzoBhhwM1odmOyVNDS+XDu9nMl0+E2US
         ffy/I41+5AaXkzmHUFvnMMmelipufqcH/1tAO7DMUEIKHWNpyjAM8yYO/pOgGueXLy+c
         W/kwpKRkqN/KCTMtNrBQjvdCjsTynADiZw43GmoahSmgUnws9DE7J2lHZ2XuGu4+um7k
         i1gH85rRzHGLQYZDARrJr6PMbhPELF128KE+mFbaiwWltoEa0llbD+6xf6So08A2c/RN
         3LjbaYjdAVCSqDSSurqA6/rR/4YaV3xCy47nW6VOdj32D8EfrdrYg0DnpbvHiOEx6Njj
         V0yw==
X-Gm-Message-State: AOJu0YxjD4/EXUnbiKSfdfwUu9ErvJZvGuAz/RO8668GqduUXnER7LNS
	104NXZTlaAb5pFvjZkKQv0c8I9CDbeQwZhwdlZiH1LtVmP799eIa2jN/fQ==
X-Google-Smtp-Source: AGHT+IEEtBtpyTK/FW1mxi9usO0srVVTd3ZRXorsrMPRw1qBusAe3V8ISqwE3ShHBtOtlQlQQzdYNQ==
X-Received: by 2002:a05:690c:2b86:b0:6b2:6cd4:7f95 with SMTP id 00721157ae682-6e9d8aff4cbmr67208627b3.38.1730142293163;
        Mon, 28 Oct 2024 12:04:53 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:52 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 0/22] ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:36 -0400
Message-ID: <20241028190444.10522-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113291

http[s]://cpan.metacpan.org  ==> ${CPAN_MIRROR}

The definition for ${CPAN_MIRROR} is found in the global mirrors.bbclass file.

Thanks,
Jason Schonberg 

v2 - fix checkin comments.



