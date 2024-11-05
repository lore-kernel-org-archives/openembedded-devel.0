Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7E8D40CF8
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.30379.1730838913860613953
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nIdmZ92b;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e33c65d104so49956487b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838913; x=1731443713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjIBxF1fH685H971Jfwsxo9IVHXFbHZqQRT2VEzKPdo=;
        b=nIdmZ92bYnTX/s6kAhX/0sMnZPIJuWii8xxLQqT7V+iqlT5qS4VIG+BtNnfh0lrFEV
         5zy4PdEGxx6TzSxKvfTkjtWJ4aov0S/ubdSXte7i3d/bZnTUEelTfBJAzR5+ohYaTpVm
         8rbRac6isAY+pZvZsq9MXbBt9T34vL//TdqzCSGwIu9wOgDJz6zu2OPmxIEwEjdXc0ht
         fw75rUSE2HTA472bj3m0suPQUm6eKRTBDwJVLSS9h9jZ/c3ROEBWw1NsX3kadXDwcDwc
         ib+rM8YOH+nhZfAR/TXuqxVTpkg6XCYtE5eeygZ4fC4jrMk7dTLDP+uIS2mbGEhOj9Yd
         wFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838913; x=1731443713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjIBxF1fH685H971Jfwsxo9IVHXFbHZqQRT2VEzKPdo=;
        b=XNVA9G1Y9wWVH1QI0e1S5RMImtl++Ec80zRT+J1nqavNy9sOyNgdPKHygS6TeXGGQG
         AaYn7PUL6SU3KUEkd80dxlPhMheYa8FUAkvHrHsgFCgKp5cbQCAu0m7XHT//GPGEUgGv
         dB3HHRKbrfBaNAaXNmE7wCGaOBqwCOwzCO9ZlLUwyDLt2sc0FmkemVCc1EJmzVerwaHZ
         VLJOzdZwJ30DWjW8OOrlkOrhiliyRxPybMdusMMvu7vCc9cJxOlSE6rFNaWZF97uCmKs
         4j0WMKrY06/AYDOlnUg3LX86OqglXFnKoc7LeeOKlYsjKg7bfHKhH8c6G5EszcPWLMTn
         yimw==
X-Gm-Message-State: AOJu0Yy8GeV0bXnu6CowpA9ycmqoqPVBL2t2lu1rBfKSdK/+u7T3QMoa
	1bJm3lGjXBgjqNOLEV8aFRMu80Lpn3/EUtmKZR6UBtZWdXUkn4XLkAb0rx2X
X-Google-Smtp-Source: AGHT+IE8q6QmxQ+dmbXqUv1nS7Iik8D0hYZpO2XISOP1CP2nH0984TwrkzAH0+vwdZDaxsD0/EfD/A==
X-Received: by 2002:a05:690c:4883:b0:6ea:8c14:7bfc with SMTP id 00721157ae682-6ea8c147d28mr100680777b3.34.1730838912336;
        Tue, 05 Nov 2024 12:35:12 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:35:12 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 125/161] gengetopt: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:50 -0500
Message-ID: <20241105202827.3104-125-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113642

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
index 4d97b1a41..2057caff7 100644
--- a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
+++ b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ff95bfe019feaf92f524b73dd79e76eb"
 
 SRC_URI = "${GNU_MIRROR}/gengetopt/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "ea165d618640dbdecb42ae4491337965"
 SRC_URI[sha256sum] = "b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab807584ac"
 
 inherit autotools texinfo
-- 
2.43.0


