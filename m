Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.7424.1586164843758737114
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ScpSCGwq;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id d77so13914253wmd.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jguGEBT95g1+rb32DlQd0BS4g4OwsoPg0T8hSacRTNA=;
        b=ScpSCGwq4zg3C1QtfalVCpP26Ym/RHsH8qnJVCU2Fz2X3FCnSZqBfCH78j6xKXkDyq
         qG3d8BQXAzITtiieD4TqpLvE/WnHKPOkN6jEcNhismlqmxfTPTejaEHUwvTp4k9rhAGw
         lPEq+9rCr6tr2u1D+FseD7B+oOT0SBUnm55YF9sCsDkE1KDNnxiYiRFqaakCE0ImzEM0
         7jqitQ5In1uofLkURo4u+eWfEXwTR3hZT6ug+KYZ2htp0Q20+kO0cA5uePVhE/ZmJ6W5
         S7EN1MlsGbhg5EKWjJ6E05lGKhFWcn74i5Fn552+7P6CjJXNbx0FFHlHVW2XVE2Rdkq7
         zRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jguGEBT95g1+rb32DlQd0BS4g4OwsoPg0T8hSacRTNA=;
        b=TRcSnsmWgVDz2xA96xYT9my61aPEYH2wvVjFlGC2bIEe2XHwlNPTu2aJHdkaI6iBOd
         NHNYNBa0PzkBQAN7vLoTuG479oLoCn4Ks+6C9uL0xrEw2kAjwMevscgucwSgYacHOyFe
         apYCpW2kQzLNviD/Q52i/cNi+Ccu6S00FSLxBC79RvoBIa7qMYYlxMRtXcwJPe4zwjZv
         aL7v9bswBRr9w0mx3xUs8SP6nf6+XYiugHTAA/ijClXgBaZSBj/YGi/+vNRloAFfsrbl
         1kJ0scRsyzGUWOg3WPqejNW1m7vVSyMVu6z6eV9yoMDCazsptP+Z2RfLfJe8reFIKutG
         wWnQ==
X-Gm-Message-State: AGi0PuaNirCjxpwpDqpNxpKFUrD5y4QroeUBGtUYs6/5f4h7bEuigmR/
	+Oj1Md4Er+fHomZzSgFC96Nzaov9I7M=
X-Google-Smtp-Source: APiQypLz611o0AMAkKWuuJ2bEOF0V9jni/P6vYKIlOjYe41kkFKbyGjfMJaqtjp1RvOhAeZvTT2Yqw==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr6610922wmh.120.1586164841849;
        Mon, 06 Apr 2020 02:20:41 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:41 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/14] GNOME 3.34.5 upgrades
Date: Mon,  6 Apr 2020 11:20:18 +0200
Message-Id: <20200406092032.3574-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am aware that GNOME released 3.36 but

* we are close to dunfell
* GNOME 3.36 - more specific gjs - requires mozjs-68 which we don't have yet
  (and is yet another challenge)

Andreas Müller (14):
  gnome-desktop3: 3.34.4 upgrade 3.34.5
  mutter: upgrade 3.34.4 -> 3.34.5
  gnome-shell: upgrade 3.34.4 -> 3.34.5
  gnome-control-center: upgrade 3.34.4 -> 3.34.5
  gjs: upgrade 1.58.5 -> 1.58.6
  libsigc++-2.0: upgrade 2.10.2 -> 2.10.3
  libsigc++-3: upgrade 3.0.2 -> 3.0.3
  libgsf: upgrade 1.14.46 -> 1.14.47
  pangomm; upgrade 2.42.0 -> 2.42.1
  tracker: upgrade 2.3.1 -> 2.3.4
  tracker-miners: upgrade 2.3.1 -> 2.3.3
  geocode-glib: upgrade 3.26.1 -> 3.26.2
  gnome-bluetooth: upgrade 3.34.0 -> 3.34.1
  libgdata: upgrade 0.17.11 -> 0.17.12

 .../{geocode-glib_3.26.1.bb => geocode-glib_3.26.2.bb}        | 4 ++--
 meta-gnome/recipes-gnome/gjs/{gjs_1.58.5.bb => gjs_1.58.6.bb} | 4 ++--
 .../{gnome-bluetooth_3.34.0.bb => gnome-bluetooth_3.34.1.bb}  | 4 ++--
 ...ontrol-center_3.34.4.bb => gnome-control-center_3.34.5.bb} | 4 ++--
 .../{gnome-desktop3_3.34.4.bb => gnome-desktop3_3.34.5.bb}    | 4 ++--
 .../{gnome-shell_3.34.4.bb => gnome-shell_3.34.5.bb}          | 4 ++--
 .../libgdata/{libgdata_0.17.11.bb => libgdata_0.17.12.bb}     | 4 ++--
 .../libgsf/{libgsf_1.14.46.bb => libgsf_1.14.47.bb}           | 4 ++--
 .../mutter/{mutter_3.34.4.bb => mutter_3.34.5.bb}             | 4 ++--
 .../{tracker-miners_2.3.1.bb => tracker-miners_2.3.3.bb}      | 4 ++--
 .../tracker/{tracker_2.3.1.bb => tracker_2.3.4.bb}            | 4 ++--
 .../{libsigc++-2.0_2.10.2.bb => libsigc++-2.0_2.10.3.bb}      | 4 ++--
 .../{libsigc++-3_3.0.2.bb => libsigc++-3_3.0.3.bb}            | 4 ++--
 .../pango/{pangomm_2.42.0.bb => pangomm_2.42.1.bb}            | 4 ++--
 14 files changed, 28 insertions(+), 28 deletions(-)
 rename meta-gnome/recipes-gnome/geocode-glib/{geocode-glib_3.26.1.bb => geocode-glib_3.26.2.bb} (73%)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.58.5.bb => gjs_1.58.6.bb} (87%)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_3.34.0.bb => gnome-bluetooth_3.34.1.bb} (78%)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_3.34.4.bb => gnome-control-center_3.34.5.bb} (89%)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.34.4.bb => gnome-desktop3_3.34.5.bb} (88%)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_3.34.4.bb => gnome-shell_3.34.5.bb} (91%)
 rename meta-gnome/recipes-gnome/libgdata/{libgdata_0.17.11.bb => libgdata_0.17.12.bb} (87%)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.46.bb => libgsf_1.14.47.bb} (79%)
 rename meta-gnome/recipes-gnome/mutter/{mutter_3.34.4.bb => mutter_3.34.5.bb} (95%)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_2.3.1.bb => tracker-miners_2.3.3.bb} (93%)
 rename meta-gnome/recipes-gnome/tracker/{tracker_2.3.1.bb => tracker_2.3.4.bb} (90%)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.10.2.bb => libsigc++-2.0_2.10.3.bb} (77%)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-3_3.0.2.bb => libsigc++-3_3.0.3.bb} (77%)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.42.0.bb => pangomm_2.42.1.bb} (82%)

-- 
2.21.1

