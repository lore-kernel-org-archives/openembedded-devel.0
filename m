Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.23658.1610915771564489371
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 12:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H2BZVo/R;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id g12so20850275ejf.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 12:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C8+aRKvS9DagtcJ8dDWDHM1KoapH4wrQF9lrFN35nyQ=;
        b=H2BZVo/RMh/hjVEuIDyg60ZH3PP5/nHV+nys25aSjQ3QZqKe1YdZPbx5jXPdUB29rv
         Kf+x5kXMXvaNJ3UU7VAEGBP7XqsncmOLVs7Bt2wv/S3CcO/rlfEkrucDTmoB+BxuS/8P
         63EUtBF8l8W+eI+CzYy1upjQhq5ty7Bq0HvBtO2Fu56UwUFMqfpcbm7GP4eKym66bWnA
         zwwQqhWwFY+tBeE5X2eE5giL4KocVzJq3zslpImNthM9r8/bFxc/kLgBbeU1B7ufkVCZ
         hg6K2cV9NRJPQd+Ac1np59wk5y2OeO2gUjlQJMD+2FeeNm5u7D31WkSjSv2Jvn5OaRfp
         pm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C8+aRKvS9DagtcJ8dDWDHM1KoapH4wrQF9lrFN35nyQ=;
        b=TbsTBZ4T0hduKRbIQvESpYCf7SDmL5b4YWBRTU6rLPsIMYIYvQM6OTfh7IvmCznFWQ
         HLLhkKxn1LIMcxpMR6/2953G/53KX6CdfH+ddjDh7gzlhSpej/rmdAtQkHBiCXCwt5cq
         r5dQpsQxw0t38uM270E3pUUUvZGyyyc1Xo/1karYnDnL6/ngFncIW8wL4JnNiFdqx23W
         w3SZcaXtXeJDKFP096Ij0X6D2LNn/zh6/ggQ1lqIMibPPpXUG8wutSCz+SE8A99iHPfR
         /RrP7ReQdfW7kVBI/0brPp5Y8sWdzceQ9kq66RTX+7TGFvvfAladvnFFNBuNPFZYCeD1
         83SQ==
X-Gm-Message-State: AOAM531q4Mm7M1DsMKRgaiPc+I0zI9wgn0qdjcg/PmX9G2tihzEpkiIf
	g46mpTWX8ycI/md+rZuu1qga00vcRCsW+w==
X-Google-Smtp-Source: ABdhPJx/NMpdOv0TxZ7CK/ML4t7De7lWEo2kCpdyWzlUHQQ/ZGorPFA4SaWj4D8fGzR/Z3hjbIB89g==
X-Received: by 2002:a17:906:26ca:: with SMTP id u10mr15509063ejc.165.1610915769943;
        Sun, 17 Jan 2021 12:36:09 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07b38751750a69f7d327ba.dip0.t-ipconnect.de. [2003:f0:7f07:b387:5175:a69:f7d3:27ba])
        by smtp.gmail.com with ESMTPSA id x6sm6922369ejw.69.2021.01.17.12.36.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 12:36:09 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATC][dunfell 0/2] graphviz fix
Date: Sun, 17 Jan 2021 21:35:58 +0100
Message-Id: <20210117203600.2714-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since [1] graphviz is broken - fix it by cherry-picks

| ERROR: graphviz-2.40.1-r0 do_package_qa: QA Issue: graphviz: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol [src-uri-bad]

[1] https://github.com/openembedded/openembedded-core/commit/72f2c45880afbba1745e5e0cbd841d7fd666f374

Christian Eggers (1):
  graphviz: Extend for nativesdk

Khem Raj (1):
  graphviz: Upgrade to 2.44.1 release

 ...o-be-empty-string-if-tcl-is-disabled.patch |  2 +-
 .../graphviz/0001-Use-native-mkdefs.patch     |  9 ++----
 ...-Include-freetype-headers-explicitly.patch |  5 ---
 .../graphviz/graphviz/graphviz-setup.sh       |  6 ++++
 ...{graphviz_2.40.1.bb => graphviz_2.44.1.bb} | 32 ++++++++++++++++---
 5 files changed, 36 insertions(+), 18 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/graphviz-setup.sh
 rename meta-oe/recipes-graphics/graphviz/{graphviz_2.40.1.bb => graphviz_2.44.1.bb} (65%)

-- 
2.26.2

