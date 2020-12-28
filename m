Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.40790.1609122857690536454
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OttXwjDY;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id b26so20950752lff.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Dec 2020 18:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5YRd372Tomfwbix6FsjbzsVWxF7yncCKgVhwM7yb1I=;
        b=OttXwjDYZQB6RLHR7Aw8AMmG3BwQU3IfEmHd3L2FEYafaGzwmra8XpyPbxi/QqC9Zw
         LBhHSBouOmMsDesoRtc0cVUl5ECzbscggsuab46FvTlUwP1jdVUt3rXRI74L15HwE0E6
         ccSkUsVVV1YcAXFRxRI9XFUgCZ4FovTIJqu9cT5wXE+ZGdDc1uB4N44Dw2N1vynA+yJg
         ct0+n0A+16pbBqoibfWzpFy5e4Xzl04INBTK1FlNR1/d6N1p7yWMWbqleDBNkhogpxKU
         +VmE95O0tgdbQoh+fMQ3URBnv5oX6lkvq0h63SnmURANAQUuRE0AvzFuJIB4MSCVoWN/
         mvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5YRd372Tomfwbix6FsjbzsVWxF7yncCKgVhwM7yb1I=;
        b=mDZuY1paf1Q7KJNt7U/b3Tb8VK4v2UFQDSLJkknGt0nQ1wp9MtpB2sspDmOQ+CPpbE
         CD+RAnzJeUvR4b3s912FvXKtB2+YQRvLsaRGBvufUjLQPiFAq2cCE+XtFO29DRIOPjXJ
         79ctDHNqE1OC0bvRhY9SB8c5fNlEow6uyqHTkzZE1s86crfeXMKYZzptLUuZJvaBCKln
         d3sR1jA7ukaY4W48j4Yc+c259vXO3GsznduBT9vhdGWYHIQ1VLven+DaXXPtCHZJURT/
         hn3dVpyDjN+9JIyCsfYWdJNg7nCnJsgz2/t4S6YhJXP/8vRVWS68VIeL4qUETmlBHepf
         5oWA==
X-Gm-Message-State: AOAM53380m/CDYa4G98KWxCppdQiQ/UrxCr1y5OgU5sPgKQ0PvZDK7yP
	bOa+90ggcmKRN18SbhLVIcvWn4jxMtzASHsg
X-Google-Smtp-Source: ABdhPJyfUAy80AWPTEL0Qzy9JIONG05XLebkRstnKUrfDlPwTtKiYisbb0p1y/ISLMRv731X2rQ4EQ==
X-Received: by 2002:a05:651c:1063:: with SMTP id y3mr569584ljm.431.1609122855122;
        Sun, 27 Dec 2020 18:34:15 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id t15sm5194248lfl.33.2020.12.27.18.34.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 18:34:14 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 0/8] several packages and xterm update
Date: Mon, 28 Dec 2020 05:33:59 +0300
Message-Id: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
 - Incorporate and split between individual patches the
   packagegroup-meta-oe patch.
 - Move openbox-xdgmenu to gnome-layer -specific dynamic directory, as
   it depends on meta-gnome's library gnome-menus3.
 - Add features_checks where necessary to skip these recipes if x11 is
   not enabled. Imlib2 doesn't need to be skipped as it supports
   x11-less configuration.


