Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.25940.1618187644237764177
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Apr 2021 17:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rM8CXtps;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id r12so17416346ejr.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Apr 2021 17:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fdDHrNWvupLujIZAIvKM0xfA18NPWcBUoCsfDcBGcY4=;
        b=rM8CXtps0BXkah+lPf4tl9QVcsTO2rAt+k9o/0pI1fzRCTGDYfxmYbvDO+E/+eW7Sr
         SI4oAbmVrMVUDjL/kdcn7kQDFt98vPV5um3Fe10rW4erhWCzAWhmu/hhLqhwnMaJ3vQr
         14DRywL8vUKNieSYuVseP+es+TZDT2XzZu9b/mLOfpqldEhM9kxLFYXWvX4rcVZJdLBC
         goHi4o2LI/04qHAknivfrE4lo4FwWDKW677OO+4oO+BT90ElyqMcNGK4VOjCt7BJuhaW
         WX1pOOwMWId3GawDx7Nw/PGfrRY1M1PPWZ2CqqEPjmH1ctfm5ymEJigQOffh2ltw9qG1
         Y31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdDHrNWvupLujIZAIvKM0xfA18NPWcBUoCsfDcBGcY4=;
        b=Ba8iA+qs5oE3WTPjkQFNcrw3gUG1JaTM233ZYdq4sjzdUzKSgDyUVyZWYxoiaJABAj
         hjHCchyYw3Y6HwYR04TmXzIGdX6Q8OsCwvnKhPN/Ips6t2pAFZpSTIANhGGhSEfgp6x5
         uwTRFT76J4zbGHnPm+FipYySdWFyakrw/6iwJytYOtrHBojITPpbd5fvQrgNunS+qcN5
         PzS/W634D1JKevNGTzS3evVvru0BSFYDqqmTtocK545NgC/ERE1N9TAIC/N/vZnGQui3
         lP1RKTzVoGCUP0JNFEqxY0cLt+RhbEXhy7wf7Kt/mbjZlnuYMeaYIJQGmIPFy3p3WRRy
         fQFQ==
X-Gm-Message-State: AOAM53120fjgN+P+2QCCHzbFHcPaxz60SOhvzbZFdnlWUvTUH3H6rXYx
	2E/iyjOWsXQ440N1Wh4nUsAY+JF1mFI=
X-Google-Smtp-Source: ABdhPJz3q2ox4dK87igOKZ3YVX7cL8gfiHsT+QjghcRdNrt/orCgh+uAKaqTIi90QA63CJ6ykX2dkA==
X-Received: by 2002:a17:906:2710:: with SMTP id z16mr25330537ejc.176.1618187642915;
        Sun, 11 Apr 2021 17:34:02 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f04dc492d0bd779440c396b.dip0.t-ipconnect.de. [2003:f0:7f04:dc49:2d0b:d779:440c:396b])
        by smtp.gmail.com with ESMTPSA id h15sm4703762ejs.72.2021.04.11.17.34.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 17:34:02 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] catfish: add python3-dbus to RDEPENDS
Date: Mon, 12 Apr 2021 02:33:53 +0200
Message-Id: <20210412003353.1888691-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210412003353.1888691-1-schnitzeltony@gmail.com>
References: <20210412003353.1888691-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Otherwise it complains for missing import and won't start

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb
index f0391cb23..44a052488 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "1f6facee57a659af560f06024ca6f98aa4d638bf57a8bcfb613b4dc70f
 
 FILES_${PN} += "${datadir}/metainfo"
 
-RDEPENDS_${PN} += "python3-pygobject"
+RDEPENDS_${PN} += "python3-pygobject python3-dbus"
-- 
2.26.2

