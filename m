Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.420.1617833920471584374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q+ayT660;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id a4so2619517wrr.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8RAQw75fkWLIlub7HWdM4QzBmVm58qQ2aFjPZkXkG3o=;
        b=Q+ayT660TFqAT/hWHs9DZc7XPgjuCr75La7KjckMZsipc4Eji5Ci6UDWroDRLcKC07
         Tg5NCJp0BCnsrtgQjmHO9QavBVzv/d9Cy5kvGJjt2VjjzKd0lWxG7xy1xg5QoPu8zXLU
         I1YBCdJW+iD97Urp1ZcN4RuaVGmfk9BnUbhC0oX5MYlobPcHchHSPZdRV2UOfbjwV5St
         8jmWyTAA8GAJ5SrJVGvFzYVM5tptwYp6dWToYXNGxxVMCBCvnef1blNGsOoTWFF99LGU
         7eRQcJkPM28Cbik1/UAErEKdg5hGluNKkSctCRYcgalA4vAffExiI+xZw0FXJmROR8ex
         jdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8RAQw75fkWLIlub7HWdM4QzBmVm58qQ2aFjPZkXkG3o=;
        b=n6rqkfakj83JxOm7dpoBI7jRrsoVhbLMe4/zPuQkRnv+H0N+IQodrG7BROrgi8Hd7f
         QrG2GuOzJ6ooFEpKYieLxNWJk/EsRHFcJ8LBsOqu5EzUG//VpmcWV+sE9G+Vib7MLNIt
         YbMbXYXLAY4x+LlifqncWiTwbwN6EB7uFvLePUDB2iKvviu4k28K2QogzZfedFmm9YSR
         Oa0UHzz6SRJIxv6vx4xh/2XZx+0rU33bX7ZsKrf9aOJ6wOktNXcoMUsy7B1mDMDG6jT6
         BkCjp2Hj+d8hX63N3W2fQwUsfJcapv+UvNFpMM/arGmIj+SUEEf0KfjI9F4BV36AqN6W
         TOrA==
X-Gm-Message-State: AOAM531Y6gMoKDlLFtU/SvHWTMjuIqW0FVAlhopMlcEL8hEkI/014S+B
	w30zRQczxyFbUCG0OI6/WkFTmzkTRFw=
X-Google-Smtp-Source: ABdhPJy3BBsso51cKB6k/07Ji6T1OhfWenQxIGhAUUor/DWhHqLrzbcI+O0Wko35HFH+Qsh6NOpN9A==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr7074567wrr.118.1617833919071;
        Wed, 07 Apr 2021 15:18:39 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f1192521410777e3304dd72.dip0.t-ipconnect.de. [2003:f0:7f11:9252:1410:777e:3304:dd72])
        by smtp.gmail.com with ESMTPSA id e9sm27462434wrv.92.2021.04.07.15.18.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:18:38 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] networkmanager-openvpn: Fix packageing
Date: Thu,  8 Apr 2021 00:18:24 +0200
Message-Id: <20210407221829.606871-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210407221829.606871-1-schnitzeltony@gmail.com>
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recent upgrade introduced:
| ERROR: networkmanager-openvpn-1.8.14-r0 do_package: QA Issue: networkmanager-openvpn: Files/directories were installed but not shipped in any package:
|  /usr/share/metainfo
|  /usr/share/metainfo/network-manager-openvpn.metainfo.xml

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../networkmanager/networkmanager-openvpn_1.8.14.bb              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
index a1a61bed1..1f76d8ab5 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
@@ -38,6 +38,7 @@ USERADD_PARAM_${PN} = "--system nm-openvpn"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
     ${libdir}/NetworkManager/*.so \
     ${nonarch_libdir}/NetworkManager/VPN/nm-openvpn-service.name \
 "
-- 
2.26.2

