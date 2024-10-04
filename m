Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8173CFA76A
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 10:59:53 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.13995.1728009600049606449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 19:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NXaDCgn+;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2b1b10103so13935847b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 19:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728009599; x=1728614399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bEwtysekiVKhqlMLuUrDRb9bf26dZw6WtUQnewoBqkI=;
        b=NXaDCgn+3JePpWWYZAYZYHmvcmD8hrQcb4cINrjuQU8ubNJtB4KUJf294bjLT51LPj
         6mOIWkgaK2YofxoM8IRC6AlVEK9QeKcNtvE7cFGhR3jAvqJNqvVvKmRRf+94IQ/jlL7a
         C1wWoTNeKP4SI+gZL0hwxRH7o7iUFhHMLPHJTGS/joc3jQYWBir2ATNNyQYyd69eb/QJ
         m2bKVhYqrd4canAl3nCBSQebyIcri54aFMslJQz2rdbq0cYJpaMsCbB1soQRHdWWxTj5
         rwH6sDTonV2v/oDLezfbOlzVd83MMdGqYPLdSJkAWmXv5S2rVOumV+3H0J57mvC1t3PQ
         Vvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728009599; x=1728614399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bEwtysekiVKhqlMLuUrDRb9bf26dZw6WtUQnewoBqkI=;
        b=sjpaYrOtIGn4cBmh10m0csk1ld9VXXbR+dR5gUo/rg9JvK8cruFNUP4NLhNgG/gEQ/
         a4i/g9168Neroi13rrlnecubEbHuiygOfyr44A0UgB0eZsyF9pCHUkOVr87jyOlVVIGa
         U/f4DLUiHxv0OzLp7a0MBth+olEaqBfeFGo8/ogvz3KBbG4mdJbs4mwEIriwdCKhNWb4
         c+rB52OltDfgWkVFXgtWqE3GRvjZ3qaN0OrUgxkGtZsmNutJlSgS0Mk5I/cioCar/MTP
         hXeewPzbIYk/fFNi46/7kf4SVQ2sAU0KNbx9cTg07I3/uQ+8qSbk3+45G54IyAZkb1/Q
         UMMw==
X-Gm-Message-State: AOJu0YwWYzf47TASMSfZnqxBH45GYAKz8ApL+2Oi3ym3jpSo9l5w2e6U
	IUKiBinQbVl7tONbXsbdYzZwgkmEnYxZpD6nSoErpYsK4L7mvejIu8bEBg==
X-Google-Smtp-Source: AGHT+IHtSfaZ6ucnqAPMndxl6Wep9C5GxJQxfAM7zg30xG5TLMHubheEttrm7w3mNZhgUri06rOQLA==
X-Received: by 2002:a05:690c:360e:b0:6db:d221:b7df with SMTP id 00721157ae682-6e2c723affcmr13883647b3.25.1728009598472;
        Thu, 03 Oct 2024 19:39:58 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bc2d1bf3sm4908547b3.74.2024.10.03.19.39.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 19:39:58 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 0/5]
Date: Thu,  3 Oct 2024 22:33:03 -0400
Message-ID: <20241004023842.14172-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 10:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112658

In keeping with the suggestion found in the note in section 5.5 of the documentation here:
https://docs.yoctoproject.org/dev-manual/new-recipe.html?highlight=src_uri+md5sum#fetching-code
that the use of SRC_URI[md5sum] is deprecated - drop it from the recipes where SRC_URI[sha256sum]
is already in use.


[meta-xfce][PATCH 1/5] openzone: Drop unnecessary SRC_URI[md5sum]
[meta-xfce][PATCH 2/5] rodent-icon-theme: Drop unnecessary SRC_URI[md5sum]
[meta-xfce][PATCH 3/5] xfce-dusk-gtk3: Drop unnecessary SRC_URI[md5sum]
[meta-xfce][PATCH 4/5] xfwm4-themes: Drop unnecessary SRC_URI[md5sum]
[meta-xfce][PATCH 5/5] xfce4-vala: Drop unnecessary SRC_URI[md5sum]

