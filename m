Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.1067.1607733190947680558
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Dec 2020 16:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XjnWLzlf;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id n10so280638pgl.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Dec 2020 16:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=PzIclK7RYi5ETFV+Ifgu610FLq/djzMLl8RqjhQptw8=;
        b=XjnWLzlfFVCkpJg/Ldmm3r/H17wkXXR5H7KqlBNvYyBiS2UZeEWTv50J+i/ecIrGzz
         4vjZg6KjYJoAP5BSBSgW4nYhItXutKwyTx4NTisx1UiV+EXM/75COlO6aDAPbeqMFEZ9
         0PebnDcvy/5InfBl7Qc0voZDe6tAqzPP8rI9iN5M7IMgWe2utm+hpg0DOUgNoFLkz212
         qBENaRJESmDrL30t3yfqAjGoMx2gNB73bQtW/lwb3OmWgi3MH0k4z9zhaBcB3W1r9K5a
         JuRaJlr/cSN+4oW5rAq0ZbmHlPdKp2xLsIQ3mQWmYOH9EWNJoMiGv634S4DvVepbBYDH
         1Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=PzIclK7RYi5ETFV+Ifgu610FLq/djzMLl8RqjhQptw8=;
        b=baIs2uMJEeF4rA4CgJd4s14+QdFc761iLU9GWBfRet4Im28I9iz8UwQcs9Q/X+NTUf
         WF7drkMlv9VKf1g5ILNqk7iVhqXzwmDNAtoqVhUbr9HR4rmKX+v7nZ8icysbRDaAd7h5
         hMptaNLfHgptrAiqWsPtiR83chGOmZm5rgJE79pU+AmsR7usu82NacooYWZXg8SOOU2a
         B8HaL1hws4VuJ5rfiaaAiuy/ff4nEXek1dahdcPj6OgsRCn70u1grhfg1LWbLOAC2KgE
         MTyb248GaryjCg0OFNz6JQcVQn8eckN4+CpZrraEX5/kNN8qGSaumRTYGpa/VpNYKAJ5
         b6sQ==
X-Gm-Message-State: AOAM530VGOPs9HzbD3PPiwbZuBd4vfRaUFAheUpHx6besncigtsymKnQ
	a1I8dwjlnROxIL7hVj7ypIso1xogKnG4SA==
X-Google-Smtp-Source: ABdhPJyXY7FbZ0/oJTk8UgS4r2fqyYMqTKmtKs7noO35gwt+m1Ng2hyoSA/iQ/g9RNcsdnkaK1OawQ==
X-Received: by 2002:a62:3582:0:b029:19e:4935:bea2 with SMTP id c124-20020a6235820000b029019e4935bea2mr13783795pfa.34.1607733190198;
        Fri, 11 Dec 2020 16:33:10 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:159e:b7b3:814a:a500])
        by smtp.gmail.com with ESMTPSA id 3sm11671295pfv.92.2020.12.11.16.33.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 16:33:09 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][gatesgarth][PATCH 0/1] Fix build failure
Date: Fri, 11 Dec 2020 16:33:07 -0800
Message-Id: <20201212003308.10862-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

I am seeing a world build failure on meta-openembedded. Reverting the below patch made early corrects the issue.  I am a bit confuse on how this worked in Gatesgarth so if someone can point out how to build the gnome-calendar recipe  out-of-the-box with core, please let me know.  I plan on reverting this change unless otherwise informed on how to get this building.

Armin Kuster (1):
  Revert "gnome-calendar: update to 3.38.1, add libhandy 1.x support"

 ...61b6ce8f0f8053e1609decbdbdc164ec8448.patch | 242 ------------------
 ...dar_3.38.1.bb => gnome-calendar_3.36.2.bb} |   3 +-
 2 files changed, 1 insertion(+), 244 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-calendar/files/8be361b6ce8f0f8053e1609decbdbdc164ec8448.patch
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_3.38.1.bb => gnome-calendar_3.36.2.bb} (78%)

-- 
2.17.1

