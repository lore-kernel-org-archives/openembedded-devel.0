Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.5895.1586252404827864634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 02:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nSqTH2ph;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: andrey.z@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id 31so3084881wre.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2020 02:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=APMLVq3FhIL3x2gJl0o2X94r/z/+L2mAc8xSeyI1QGE=;
        b=nSqTH2phHK6g2HVdHNlcstp84Mx8nrJvo5EggaSOPjmhrrEHMQyAzrlaJ9Bg0T5zPG
         6pAY1u1p6H7KMZt4aoQuEhob1CnRC42Rb1TdZenSFBEMboXROg7KdDk5+cioxH2Ev0gw
         QqrE4FVMV3Bz+uz1Cq1rdfd/JmmFMzDoUpRN9SkdruOTOAxWu3UC2DVFd6c9O1slIYoz
         uC12U1uXS+dC9sD2rSFNmAYe1CaxpkjNuI+mvw4rwq85UlQfQ2W5aOtITLdhgXTu3XwO
         e4rpwla1auBBeFpIcXLTN/kGr6gaHizhJd3BmR8J0RbZYMggeOYHOvDb/LKX3C3GilnJ
         OXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=APMLVq3FhIL3x2gJl0o2X94r/z/+L2mAc8xSeyI1QGE=;
        b=f13wvg/qvTv5dAzKjZ5rNBKQGAZk0FME5xeWtME2TyNOx8WAd6K7y8tU0A1vuGoHrv
         xETdgq6nmeMJhRhalfsQXrn/qTatv/JEbhgZCac11oulRDUs0Gswxkr8W3UDX/X0Peb6
         pQzqPs4EolQy5SMrFw+SvnoHHHX7uAXhap/PAEKl+T+Vx0uM0y7iaiFDPDBYkdxqXaKB
         An+hFomzgz2Q6PjelKc8Dh6ffbvxWs2BIQRKhwrNNR6ytq+VK7tTXNEEX7rjXy4yTUDY
         ailEjHyfzyJW5cgUJUVqmPRrB/voeXEZ83jzhOcVxOCP08D2ST8CLGN6lDMv2gxqgT/d
         3IgQ==
X-Gm-Message-State: AGi0PuY3wFfDtTWi73KY+WlSgLujLB1uvdNLSkGTq+59heB7mtoKssTD
	7SDGQwFIBgL5Y+R04+ZIXT8ocuAqPKA=
X-Google-Smtp-Source: APiQypLqxWYhb7J3dHvZmufZajHIdOE10gd7NiL0G+13l023zqZTzH8YJWzQmgZxLBWgXg00OFnMfA==
X-Received: by 2002:a5d:6605:: with SMTP id n5mr1735312wru.303.1586252403195;
        Tue, 07 Apr 2020 02:40:03 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch. [146.185.2.7])
        by smtp.gmail.com with ESMTPSA id f25sm1582720wml.11.2020.04.07.02.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 02:40:02 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: [meta-python][PATCH] python3-pyscaffold: move recipe to proper location
Date: Tue,  7 Apr 2020 09:39:52 +0000
Message-Id: <20200407093952.8056-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>

Initial submission was performed on incorrect path, move the recipe
under [meta-python] folder.

Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
---
 .../recipes-devtools}/python/python3-pyscaffold_3.2.3.bb          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {recipes-devtools => meta-python/recipes-devtools}/python/python3-pyscaffold_3.2.3.bb (100%)

diff --git a/recipes-devtools/python/python3-pyscaffold_3.2.3.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb
similarity index 100%
rename from recipes-devtools/python/python3-pyscaffold_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb
-- 
2.17.1

