Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.144.1631889772159365031
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Sep 2021 07:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l+2dQNBC;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id r2so9816894pgl.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Sep 2021 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=727zJBATvHxiXq/wyN4x9XR7iWUeRQNCR0Y3hyaIb54=;
        b=l+2dQNBClpH7Ai630j2Cjrmc8HzEurQJL2aOk3CcWFarO6VCZeOkJUkifn1NMFZEgT
         5pEwuEP2nPVh17+6/3k2d3p49CYquBJIrhU+Q0zdadFn3XkaSAs+ydaGyo8IpLx4KBqg
         NPrKeIl055t6P5vOlmW5cin7DQ8udInA4uBUysqRaogeMSbcg5JdWA55WhkUnRX7nQia
         4PpShmnUn/FqxCpcUKueoX1yzst2Ouse5Xp9OMq9bN8Wyr7ELxFMYuGcPzMjTt1oT8We
         Ds1vYZNvgIr4mMWqBRoYzYIwvxkli2LTwVj1NvHmhjRtv/Tme0Jlr9WV3Lv1lX8Wwq2j
         Sx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=727zJBATvHxiXq/wyN4x9XR7iWUeRQNCR0Y3hyaIb54=;
        b=VvSsmPdkrCHOTd3S//1I1IaoROSRbE/xuk8k+6jKd/QwPfgmbkswJNqoj93YW+b7gP
         YstW1r9qVRQmDlfZtu/rPjVR7VF2FCI0aXObll1mrgSk+dC6fFYcH0nOGPpZirmqVzt8
         SjtAa8+39oTfpHLBD5AK4w0BpQgwlpYbklSHRrtFb74UGUHhnMViOFqnMFmxf5RSApWC
         V69yI5kbNyn4BBuX1R7g+8TeC1v3H6dtI1gIEGXIV86Kw1CY3Jco8RQKYg+UeuV+08cT
         QYYBBdCOLapTyHarLqpR5Yh06iTAh6JuhhmBJhBt52dZIkvvjyCmyP4BYkIMIsvEeMfW
         2mQQ==
X-Gm-Message-State: AOAM533ZVZvrv2l9FeH7GTjx2eFyjV9dxk13uyz6eJf0B2ZNbb3O5/zg
	aCq+i6c+HcngENUALc2yKkY=
X-Google-Smtp-Source: ABdhPJxH7GIN4HMVbDbdGUOM1YT3y/Dh+HrcLTqps/Y604AkUIE2RbhFeh3TUcqT7LAa2u0q1DRr7Q==
X-Received: by 2002:a63:350:: with SMTP id 77mr10155039pgd.441.1631889771541;
        Fri, 17 Sep 2021 07:42:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8e48:889d:1351:d2d2? ([2601:202:4180:a5c0:8e48:889d:1351:d2d2])
        by smtp.gmail.com with ESMTPSA id r13sm6801605pgl.90.2021.09.17.07.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 07:42:51 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: hardknott merge request Sept 17th
Message-ID: <f4770079-9ac5-cd6b-3251-0ed8647e796b@gmail.com>
Date: Fri, 17 Sep 2021 07:42:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 7bd7e1da9034e72ca4262dba55f70b2b23499aae:

  dlt-daemon: update from 2.18.6 to 2.18.7 (2021-09-04 10:39:29 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to dc262c52b0b10625bf7a2330e1c4e0fe2d8db6aa:

  c-ares: fix CVE-2021-3672 (2021-09-14 07:41:42 -0700)

----------------------------------------------------------------
Changqing Li (1):
      c-ares: fix CVE-2021-3672

Joe Slater (1):
      redis: fix CVE-2021-32761

Khem Raj (1):
      vboxguestdrivers: Remove __divmoddi4 patch

Kristian Klausen (1):
      cryptsetup: Add runtime dependency on lvm2-udevrules for udev

Peter Kjellerstedt (1):
      cryptsetup: Only recommend kernel modules when building for target

Yi Zhao (1):
      krb5: fix CVE-2021-36222

wangmy (1):
      cjson: upgrade 1.7.14 -> 1.7.15

zangrc (1):
      cryptsetup: upgrade 2.3.5 -> 2.3.6

zhengruoqin (1):
      wireshark: upgrade 3.4.7 -> 3.4.8

 .../wireshark/{wireshark_3.4.7.bb => wireshark_3.4.8.bb}        |   2 +-
 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch     | 121
+++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb                |   1 +
 .../cryptsetup/{cryptsetup_2.3.5.bb => cryptsetup_2.3.6.bb}     |  31 ++--
 .../recipes-devtools/cjson/{cjson_1.7.14.bb => cjson_1.7.15.bb} |   2 +-
 meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch       | 257
++++++++++++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb                   |   1 +
 meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch  |  91
++++++++++
 meta-oe/recipes-support/c-ares/c-ares/0002-CVE-2021-3672.patch  | 104
+++++++++++
 meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb                 |   2 +
 .../vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch      |  36 ----
 .../recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb |   1 -
 12 files changed, 595 insertions(+), 54 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.7.bb =>
wireshark_3.4.8.bb} (97%)
 create mode 100644
meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.5.bb =>
cryptsetup_2.3.6.bb} (88%)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.14.bb =>
cjson_1.7.15.bb} (90%)
 create mode 100644
meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
 create mode 100644
meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch
 create mode 100644
meta-oe/recipes-support/c-ares/c-ares/0002-CVE-2021-3672.patch
 delete mode 100644
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch

