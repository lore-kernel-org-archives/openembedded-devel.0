Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.1602.1604605798595173449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 11:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m6sYctbq;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: rosbrookn@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id f93so1978370qtb.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2020 11:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4lLQCa/JhYkcdohXx+tWnUmNY7MmaCErH1ikKzzsV70=;
        b=m6sYctbqPQLB2is6/OfBA7T/qKUFKgImE+3satmse2E+2//j9CscS0dbF1j0AuTfBy
         UKQWm6TImXV0WqFR366S3J81Yv4NvD5rH7mVdwiE5hx48xrxSkqdB1Ep4SALJCwFsh6h
         fhHmnhGRM9/5H8HoAkly2XZyaLn4TS7mwwVsVSzj53L7Hnj48h/KQipAZp01k6i9RQjO
         q8XaT8OavBznhwTTnuteRrYfl0xud3EVdtzU69urs9Yi58j6rDB8fn03dYawRqmhL4Fr
         2Ue4IqRUkWjVpIOHGoj8AmpCGj5XY4Cwp0EZb2SO4Rdvc4Jsbl85213uR+CIct5oXq4n
         17Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4lLQCa/JhYkcdohXx+tWnUmNY7MmaCErH1ikKzzsV70=;
        b=inkuvf/ffRFonZmpa25ErTdEWMSy6+YAQKYQBMnDXyB7DPVpcJ+i9QjKtYU3jQmKYE
         kRf/22JqogKK8K4PSlq9FU/mK8j+/YUy8vT9/L7AUVL9JGfCzmsqqggNRdu+MdotO4CV
         TdUfR7oYsMeClte2A+V8b9vzWTx7e7Gg+HMLPQIBESouwQy/87rXuBi7kl9chnBalxus
         8fMySMcC3WE5YJTupjy4IDnARO6VOY7KSK77+SttgmNsgEcMDDehHrAUMNAkJNp6BTii
         /zgWYLdHOuH1SYZpChynQiToQuCW8B9l4e8EVANFvFy6KzS6xvyQrsgcNLy9KX1/MgZj
         kP1w==
X-Gm-Message-State: AOAM5332GGeMTyvl3FjrykQA7+cjFOpGpryL6+Oyu1/JtgrIqKg1BnSC
	dlP9rEqXZO6CwDKa0s9ZTFY2PU+YlqsnlQ==
X-Google-Smtp-Source: ABdhPJxIQCOrigVRhuYSIeO8+QPSjv/C3zpo6NAoZRvxiFLyRQw5q4dfq2/oUL7RJJZzmNZpHMmIEQ==
X-Received: by 2002:ac8:3805:: with SMTP id q5mr3654070qtb.53.1604605797378;
        Thu, 05 Nov 2020 11:49:57 -0800 (PST)
Return-Path: <rosbrookn@gmail.com>
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id q27sm1694224qki.60.2020.11.05.11.49.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 11:49:56 -0800 (PST)
From: rosbrookn@gmail.com
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: [meta-networking][PATCH 0/2] strongswan PACKAGECONFIG options
Date: Thu,  5 Nov 2020 14:49:51 -0500
Message-Id: <cover.1604605168.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches add a couple new PACKAGECONFIG options for EAP, and update
the default options to use swanctl, rather than deprecated components.

Nick Rosbrook (2):
  strongswan: do not use deprecated stroke and starter by default
  strongswan: add some PACKAGECONFIG options for EAP

 .../recipes-support/strongswan/strongswan_5.8.4.bb  | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

-- 
2.17.1

