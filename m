Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.46227.1617565599304118601
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Apr 2021 12:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZbMPrTVM;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id nh5so2820102pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Apr 2021 12:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:autocrypt:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=UAtIqFrYzXqP8T2hPurPgF4qZWy/KK0hgAnuJ8KP2HE=;
        b=ZbMPrTVMgZtBui9nwNu+mYzMwt/Vv710EchyyrFWtffmFIEUJxIlTymguBcMqsvSX6
         7/AKHAYLw8RMEfd8Lj4a2BLcOmf4gk4ahBSGjA8U61vKWaqiiMwKn2BdXLN2g9oOAnJh
         Sbq7Gwv++UZLxayd8+hpTcfvbrn+DBigZAHwDMig5ZHCRV0/4MZ4knGGHM0aMP0nD6nt
         xhHsYgmfIrlwV5vWyzD6E41IgjDHcnd2cr79eQ7xZiHjb3LQj4b62KLVYXgdvwqpPuD5
         DRVzihEw5HnYVN4IsENkJs2rWMwD6PZ6hhIUVEZmngg0uY4fNFKkG8l7TGRRwdJvnFEB
         019Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=UAtIqFrYzXqP8T2hPurPgF4qZWy/KK0hgAnuJ8KP2HE=;
        b=kaWatmeAOAPo/+oaNBdqWQGrL5o6sYUBWif5EZ2Xoc6DVYbMOTiotUU+TLPNZn6nbN
         NWaQdZqNsZswsu4gfWWK/EL2kR6W3hFMlkIPTTZCK48VpyUJl0txIGrd0tgb95usTkeB
         km9QoU9Vgd6DwDm4/cTQuIfTf0Di92evo7EaCnyJzwd5F9AINBAfBYsm7cmkmmF+Pld3
         vJkdNqkqH1LHKxMmkTnRpBGVHe/dICWFhXR29UgJn2WhNx6KP0EFF9DxhK0+MLqzwvB4
         nKORJ1wqwe2+2C4A//6uYjayfxUgRsDclPW9CH2lYUnfL0pnrkjpXchleZdj+EhN0jTO
         MBtw==
X-Gm-Message-State: AOAM532XL+c5JH6CIGSwnD85aVpoI3IdhC4Ye9kEYU6MZTbidlhAkkPD
	cTTHLeab181xTJ9Fua8F46o=
X-Google-Smtp-Source: ABdhPJwrvQnvce/6Gyy8WpBKGu8m8o/HtaVSxB/MrDlaCaoO3NLHCqo7gOYaTI/pzZFol9gIii52hw==
X-Received: by 2002:a17:90a:9385:: with SMTP id q5mr23301885pjo.121.1617565598887;
        Sun, 04 Apr 2021 12:46:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9025:25df:a21:bcfb? ([2601:202:4180:a5c0:9025:25df:a21:bcfb])
        by smtp.gmail.com with ESMTPSA id r1sm12951124pjo.26.2021.04.04.12.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Apr 2021 12:46:38 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: Gatesgarth pull request April 4th
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <339f7164-3061-3d96-17c7-ca6e79fc8fcf@gmail.com>
Date: Sun, 4 Apr 2021 12:46:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 945f062ff098dc9c8ba8d22c5eef88adec60730d:

  meta-oe/README: add Ubuntu prerequisite information (2021-02-15
08:19:35 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded gatesgarth-next

for you to fetch changes up to 317c2dd540c84556127ad07739c0c930a0741b50:

  packagegroup-meta-multimedia: include projucer only with x11 in
DISTRO_FEATURES (2021-04-04 12:39:22 -0700)

----------------------------------------------------------------
Aditya.Tayade (1):
      neon: Add ptest

Andrei Gherzan (1):
      nss: Fix warnings generated by getcwd

Harpritkaur Bhandari (2):
      rapidjson: Upgrade SRCREV to latest
      rapidjson: Remove unwanted patches

Martin Jansa (5):
      ceres-solver: prevent fetching git hook during do_configure
      packagegroup-meta-oe: include nodejs without meta-python2 conditional
      packagegroup-meta-oe: move the packages depending on meta-python2
to separate packages
      packagegroup-meta-oe: include glfw, icewm, geis only with x11 in
DISTRO_FEATURES
      packagegroup-meta-multimedia: include projucer only with x11 in
DISTRO_FEATURES

Mingli Yu (5):
      quagga: Update SRC_URI
      geoip: Switch to use the main branch
      geoip-perl: Switch to use the main branch
      bridge-utils: Switch to use the main branch
      netkit-telnet: Update SRC_URI

Sana Kazi (1):
      mdns: Whitelisted CVE-2007-0613 for mdns

 .../packagegroups/packagegroup-meta-multimedia.bb  |  2 +-
 .../netkit-telnet/netkit-telnet_0.17.bb            |  2 +-
 .../recipes-protocols/mdns/mdns_1096.40.7.bb       | 13 +++++++
 .../recipes-protocols/quagga/quagga.inc            |  2 +-
 .../bridge-utils/bridge-utils_1.6.bb               |  2 +-
 .../recipes-support/geoip/geoip-perl_1.51.bb       |  2 +-
 .../recipes-support/geoip/geoip_1.6.12.bb          |  2 +-
 .../packagegroups/packagegroup-meta-oe.bb          | 36 ++++++++++++++-----
 ...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36 -------------------
 .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 40
----------------------
 .../recipes-devtools/rapidjson/rapidjson_git.bb    |  5 ++-
 .../ceres-solver/ceres-solver_1.14.0.bb            |  8 +++++
 meta-oe/recipes-support/neon/neon/run-ptest        | 25 ++++++++++++++
 meta-oe/recipes-support/neon/neon_0.30.2.bb        | 15 +++++++-
 meta-oe/recipes-support/nss/nss_3.57.bb            |  5 ++-
 15 files changed, 100 insertions(+), 95 deletions(-)
 delete mode 100644
meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
 delete mode 100644
meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
 create mode 100644 meta-oe/recipes-support/neon/neon/run-ptest
~                                                                    
