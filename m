Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.1953.1621710380742405383
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 12:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tb7YCVPv;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 6so16944753pgk.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=mXw4QvyrlcmmOSO2g4INnX9eqz6sZiJ46FwkGlSkcG8=;
        b=tb7YCVPv8WYWZA8pedckXwnMgLjmlmag+1yp/ri6L2ZRNDUNZHaHLBiVZ4zqnghKyk
         +0dc55xXjlBEsl1Gx7acdonP/1s5UBtqfMFE5hkl54bqSuyqTyC+B0Z4Inv+UU22LcHk
         dmrLsn65wLcJkEm4dNTd+wwAgNjbYDzpHq7+Zp5NU0nxr2QUR7rzYenfAqwtzDP/EwtN
         HcT6+Cg4H1ecNfmAYNyNXuD9bKKLD7JLb15kid4DKQPEx9n46fwX8GiRG+Vy60di9ooQ
         Ps+VU+jbEf+Ii3iqgwUpGAM1fzPeYO0SMgLz2iUzzc72refqxqXq8oxdbvKaMmiDhscJ
         fuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=mXw4QvyrlcmmOSO2g4INnX9eqz6sZiJ46FwkGlSkcG8=;
        b=Vqeeougb681kRmwKCLg2FFarP8/Vi3oVdsLgHy7A7g38SH8vZiap8RuyaBT/XTsP7E
         uv0uZfechco1oItTK2DDcOX41FwA9RhP/pBun/rivm5jqQRtUZ3owWGlHfqvtbtOh9jh
         xTJyGtdon3sqAbD9RvhBjOI3QO2+HM4IEmzO5I9oXWRtnHoAVaORd8Uo1MQi/Cqo4q2j
         Lb9Bz/U4oXtxFmjrgDQkt6zwY46Pfs3LZzRVcLV6q4RmvlLZqL9v/LpPwAAX3a9cvhCq
         rCaTlBdSTkFSiruWtnBOKGJOX9DP2wC/6gDLGGY2hLaH3ZQqCBz9QxIjrYvdxoV5HZ56
         fnxw==
X-Gm-Message-State: AOAM530qI6Tkr8uACMOb2DTvif84maOJL2M1XGMbWfH+5hFG6PtPupOq
	IV660m7MiCDWiSIpkQCUiTE=
X-Google-Smtp-Source: ABdhPJxYbAocjOnMO/MyVP4Eq0T3VPc+illTIHTFWXLfabhgv47FOcncfoI993tlegKrgzQ4Cryocw==
X-Received: by 2002:a63:f510:: with SMTP id w16mr5327517pgh.262.1621710380312;
        Sat, 22 May 2021 12:06:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2c86:80f7:821f:a12a? ([2601:202:4180:a5c0:2c86:80f7:821f:a12a])
        by smtp.gmail.com with ESMTPSA id 63sm7102474pfz.26.2021.05.22.12.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 May 2021 12:06:19 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Dunfell merge request May 22nd
Message-ID: <21dba787-e5dd-bdac-bcf0-1b0ec84e1e77@gmail.com>
Date: Sat, 22 May 2021 12:06:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 2915810edbb6599051e30efb3b7f805665ddcc23:

  ostree: switch from default master branch to main to fix do_fetch
failure (2021-05-13 21:52:34 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 11eae114522a6befa06c7f4021a83bc016133543:

  linuxptp: Fix cross build (2021-05-14 10:03:51 -0700)

----------------------------------------------------------------
Armin Kuster (2):
      nostromo: Blacklist and exclude from world builds
      packagegroup-meta-webserver: remove nostromo from pkg grp

Clément Péron (1):
      nodejs: 12.20.2 -> 12.21.0

Khem Raj (1):
      linuxptp: Fix cross build

Saloni Jain (1):
      fuse: Whitelisted CVE-2019-14860

Sean Nyekjaer (1):
      nodejs: 12.20.1 -> 12.20.2

 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb             |  5 +++++
 .../linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch            | 26
++++++++++++++++++++++++++
 .../linuxptp/linuxptp/no-incdefs-using-host-headers.patch       | 29
-----------------------------
 meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb           |  7
++++---
 .../nodejs/{nodejs_12.20.1.bb => nodejs_12.21.0.bb}             |  2 +-
 .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb  |  2 +-
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb         |  3 +++
 7 files changed, 40 insertions(+), 34 deletions(-)
 create mode 100644
meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
 delete mode 100644
meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb =>
nodejs_12.21.0.bb} (98%)

