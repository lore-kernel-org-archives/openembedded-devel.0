Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.25310.1609683181219829903
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=upMcXUCU;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id u19so24543837edx.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tpsMPQmR8r9TbehSr2qaRNIKnoBquT12GgPR/bXh5ME=;
        b=upMcXUCU9rvfH1CqG8HpxbIgz99h+pXnuGMne1JOvB5N/AvMaZghiDMppk4hGsOAvB
         +F+KYvzVTgh28mxo/97XQu5r1k+6WCPc8Is3Vf8Cdmep/c/xbN70gUhIxftC1Z6Db0Dp
         Rk3unbpcPqwsIHo8me/Cc1Cg7+pVtPRcPHrGFdUY+C9HZvebud34d3Wma7JI394hmgcG
         8+85Db8Fj89XjR7D0m4miHOJEtIN7PlOR4dph53FxYFcS/9S6OVj3ebjgKtzoLS+hqbf
         u+hV+GTI0PSMOrWOAHfBv0XBTAvScgFprEup0H5Y3KOuvWSOkLlRF0axCsxF254zVQ00
         9ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tpsMPQmR8r9TbehSr2qaRNIKnoBquT12GgPR/bXh5ME=;
        b=bgI/GwKVQke+TiDQXe5LXK8m07NWlbqawt8S4eXAjOwJivUU7BHy/SNPAJL5OddZZp
         p5ucTO912pqL99pM4NPtWgsHt34LDxPGe5C2EXVBrgeJ+ykMSi0tTIMJwgwJ/hVa6Yj5
         d8gSt7sr5QZgHE4saQqiZGNmxo0OXd7C7rL95jE0SUtXKl1uUy1vdSWweClmVvb8bHem
         +ltfwf9rgOBImWdboD4aDdupwevbxVR1pjsZRBUBacwI4aIT78bTkKb1+RVUlmnzuxPR
         siAmlgEjYJniGnKYXYJ2Ls+y5aF75Z3PwGomxsEYsb37mAoxbKxiiOiYZN1OHZ6nizpO
         iOoA==
X-Gm-Message-State: AOAM530kutA237ZdOgTZa4BhAp9Y5rUl+Oo5ENEXowa1XGEvdMuda/Aa
	lvDsy0DDRgDENAYgzFo78LYtjDhmt5o=
X-Google-Smtp-Source: ABdhPJzJliPz4PUCVMhLhse6TSCvBknyyO4LGHAIFp6z2VCpig/G3pCEIO2/sxmzGlT3VCV7+qjrMg==
X-Received: by 2002:a50:c209:: with SMTP id n9mr66573290edf.123.1609683179600;
        Sun, 03 Jan 2021 06:12:59 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.12.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:12:58 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 00/16] xfce pre 4.16 batch
Date: Sun,  3 Jan 2021 15:12:31 +0100
Message-Id: <20210103141247.1637618-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade apps and panel-plugins / tested before upgrading XFCE core components to
4.16

V1 -> V2: Remove md5 checksums

Andreas Müller (16):
  xfce4-panel-profiles: upgrade 1.0.10 -> 1.0.12
  xfce4-mount-plugin: upgrade 1.1.3 -> 1.1.5
  mousepad: upgrade 0.4.2 -> 0.5.2
  xfce4-screenshooter: upgrade 1.9.7 -> 1.9.8
  xfce4-taskmanager: upgrade 1.2.3 -> 1.4.0
  xfce4-calculator-plugin: upgrade 0.7.0 -> 0.7.1
  xfce4-cpugraph-plugin: upgrade 1.1.0 -> 1.2.0
  xfce4-datetime-plugin: upgrade 0.8.0 -> 0.8.1
  xfce4-diskperf-plugin: upgrade 2.6.2 -> 2.6.3
  xfce4-fsguard-plugin: upgrade 1.1.1 -> 1.1.2
  xfce4-smartbookmark-plugin: upgrade 0.5.1 -> 0.5.2
  xfce4-systemload-plugin: upgrade 1.2.3 -> 1.2.4
  xfce4-verve-plugin: upgrade 2.0.0 -> 2.0.1
  xfce4-wavelan-plugin: upgrade 0.6.1 -> 0.6.2
  xfce4-whiskermenu-plugin: upgrade 2.4.6 -> 2.5.1
  xfce4-xkb-plugin: upgrade 0.8.1 -> 0.8.2

 .../{mousepad_0.4.2.bb => mousepad_0.5.1.bb}  |  4 +--
 .../not-create-link-to-locale.patch           |  6 ++--
 ...0.10.bb => xfce4-panel-profiles_1.0.12.bb} |  5 ++--
 ..._1.9.7.bb => xfce4-screenshooter_1.9.8.bb} |  3 +-
 ...er_1.2.3.bb => xfce4-taskmanager_1.4.0.bb} |  3 +-
 ....0.bb => xfce4-calculator-plugin_0.7.1.bb} |  3 +-
 ....1.0.bb => xfce4-cpugraph-plugin_1.2.0.bb} |  3 +-
 ....8.0.bb => xfce4-datetime-plugin_0.8.1.bb} |  3 +-
 ....6.2.bb => xfce4-diskperf-plugin_2.6.3.bb} |  3 +-
 ...1.1.1.bb => xfce4-fsguard-plugin_1.1.2.bb} |  3 +-
 ...1-check-for-fstab.h-during-configure.patch | 30 +++++++++----------
 ...n_1.1.3.bb => xfce4-mount-plugin_1.1.5.bb} |  4 +--
 ...bb => xfce4-smartbookmark-plugin_0.5.2.bb} |  3 +-
 ....3.bb => xfce4-systemload-plugin_1.2.4.bb} |  3 +-
 ...n_2.0.0.bb => xfce4-verve-plugin_2.0.1.bb} |  3 +-
 ...0.6.1.bb => xfce4-wavelan-plugin_0.6.2.bb} |  3 +-
 ...6.bb => xfce4-whiskermenu-plugin_2.5.1.bb} |  3 +-
 ...gin_0.8.1.bb => xfce4-xkb-plugin_0.8.2.bb} |  3 +-
 18 files changed, 36 insertions(+), 52 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.4.2.bb => mousepad_0.5.1.bb} (70%)
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.10.bb => xfce4-panel-profiles_1.0.12.bb} (78%)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.7.bb => xfce4-screenshooter_1.9.8.bb} (80%)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.2.3.bb => xfce4-taskmanager_1.4.0.bb} (61%)
 rename meta-xfce/recipes-panel-plugins/calculator/{xfce4-calculator-plugin_0.7.0.bb => xfce4-calculator-plugin_0.7.1.bb} (65%)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.1.0.bb => xfce4-cpugraph-plugin_1.2.0.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/datetime/{xfce4-datetime-plugin_0.8.0.bb => xfce4-datetime-plugin_0.8.1.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.6.2.bb => xfce4-diskperf-plugin_2.6.3.bb} (72%)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.1.1.bb => xfce4-fsguard-plugin_1.1.2.bb} (71%)
 rename meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_1.1.3.bb => xfce4-mount-plugin_1.1.5.bb} (57%)
 rename meta-xfce/recipes-panel-plugins/smartbookmark/{xfce4-smartbookmark-plugin_0.5.1.bb => xfce4-smartbookmark-plugin_0.5.2.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.3.bb => xfce4-systemload-plugin_1.2.4.bb} (71%)
 rename meta-xfce/recipes-panel-plugins/verve/{xfce4-verve-plugin_2.0.0.bb => xfce4-verve-plugin_2.0.1.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.6.1.bb => xfce4-wavelan-plugin_0.6.2.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.4.6.bb => xfce4-whiskermenu-plugin_2.5.1.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.1.bb => xfce4-xkb-plugin_0.8.2.bb} (75%)

-- 
2.26.2

