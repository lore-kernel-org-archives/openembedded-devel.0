Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.16820.1608945664076344838
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WhQxhql3;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id l11so12348095lfg.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IBcnE/EFhBBz9OmMig1GNd9gVIP92eMjwTB7k2LmFtg=;
        b=WhQxhql3pSOKGjxU8j6yAEOjtTcTgzgjZpvHxyFR8And+jJWJUdoWCGuk7H0HO4eU5
         k8wY937H9LmCey1rQsTspPyMx6AxozNJSQ92tgIqYsNw1JwIpDmX3Mdga/umBmFrgoDz
         /888nUicSjpUn2vjl6N2TA5YsyWK6gn7NOFv5QIK9ukrFSjLlfUg/WDLlJ2bpJO1L56K
         KeieHskrlKY1+TzMPSF1glBmIdscxs18sTTGS7bhN1+H6PMlnmYYkzu5qy6GvqQXAPWP
         ORWrzCJlZNcL32WqxrdJH1qhgbTmpBeJkVQeybq+dpGja8IJIsBOL+i41osKI73yvCEP
         znJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IBcnE/EFhBBz9OmMig1GNd9gVIP92eMjwTB7k2LmFtg=;
        b=mXk1KGQWdeoAKacmehBb2vBj91XsViYnaCFUYqGfpsq7vwpBmDDwUNL6hBgXZKdRf2
         tRmRa08gZ/rZYwlEaFSC8FQj1w4ROjV5YBEdBqM5HjNqPGhme3WD6OSORq9D3CmzltSV
         d6N4Cef4T/RrIPwqHrlB6fj5gjYwF+xJpEdPukyTQAe3fH/feBhA5ObnYQp1PfsBCuo3
         R++jd2SR/Q0wFnf0gi+r6UYaINNeIHNWTYa6cLhez3DOkcrobRKqZfO713xrC6nqT0Ix
         iCcrYuqZUNmkAZS1DadXpPe0R626+0eLWOIpR5ler3KXEp2n9/Du9tDqXbfdM5TKxpvh
         fgsw==
X-Gm-Message-State: AOAM532Ort+55oKwOhaAe7tF+Dhk4bRSAjOgPaEAJW4ylitOed6v1xV5
	2vBuUlZG8MN35sDeVIKD+d193UzZV9rQfg==
X-Google-Smtp-Source: ABdhPJyKDVRP8w5fuGGB64LSSQt1WfOjB58DWy5cyQuLXEIvx2SH1lQ7BRb/m70Xn0OW2th0BKwC6g==
X-Received: by 2002:a05:6512:3321:: with SMTP id l1mr14229701lfe.473.1608945662102;
        Fri, 25 Dec 2020 17:21:02 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.59])
        by smtp.gmail.com with ESMTPSA id a15sm4306317lfg.27.2020.12.25.17.21.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 17:21:01 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/7] xterm: provide virtual/x-terminal-emulator
Date: Sat, 26 Dec 2020 04:20:53 +0300
Message-Id: <20201226012054.3689086-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
References: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-graphics/xorg-app/xterm_353.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
index 6376388c2757..d1885988054c 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
@@ -37,7 +37,10 @@ do_install_append() {
     oe_runmake install-desktop DESTDIR="${D}" DESKTOP_FLAGS="--dir=${D}${DESKTOPDIR}"
 }
 
+PROVIDES = "virtual/x-terminal-emulator"
+
 # busybox can supply resize too
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "resize"
+ALTERNATIVE_${PN} = "resize x-terminal-emulator"
+ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/xterm"
-- 
2.29.2

