Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.2820.1614140778509196396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 20:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ha45IKb6;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id j12so483864pfj.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 20:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=eg7TdgHQ9RQYVchscgwZphFLr+HT9NaMDMutMwq/5HI=;
        b=ha45IKb6akwR0P5O9O9WBBL4XvQHv5wXrYmSqtteD56Vw+W39OdnQEFDaR8oQYBsrp
         Di/qXBD/heXzD31qQWiuRDmzqSsdpv4+ldaIti3dPCDl78c36hm3j5X7AIv8Kn/WgJxV
         4tkrvlli7NCMuljmYhVlbbXJKS8OSEnPvQOZkNqLJQiW4BzSTqpb4z9Zd2IlduYrF1lx
         mn7E34FRIhgT1fXi9WENhGamF7beCus4Rw2mOfHIuVdVA9Mu+vqyRMpoKLiZvjB+8S4A
         HT224lbW/NNYvMMuYkxKhpj3DZ2z1LmU47KLGaQwvDWeTK8DskShMGYGVMDJQn4dKVrH
         BhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=eg7TdgHQ9RQYVchscgwZphFLr+HT9NaMDMutMwq/5HI=;
        b=flRDUPu26TtLEz64NmWXqjocgcFdXgWnh1pdpmZbkMgmwvUd3xSOxx1/zBQaYlfG69
         quttLQDKXkaAMnBc42VsQbsTjvMfkyuN/ePkkzCAkOBBk4CAZfvb8BDvMQpAwXaFBMCJ
         mN9N0TAIQtsDe/GzsQimuzVQHEjKPILPKTX71d7OC4AmpQW4HuXD1KUrMuuhV4qlNrhm
         FDkdrrpigbY2zCy+JCWUtrS6T/9uWRkHUkWzE1qEKXZWj81LuW44DXKWe8fFP98yvLEF
         OpUmfkDZmOxc3GxFrmV3cyB+buI/O796WORWmM3L9iqDTGhcUwclFALLPPExKSl13s78
         /1Bw==
X-Gm-Message-State: AOAM531A5lz9viPzliMYc/lnJGhCkwjVDc261HE8t/kZRPc/07oL3O1z
	yzv+JzSj56Fk85tMUX0lcKE=
X-Google-Smtp-Source: ABdhPJwnPEtr0v4yfyuofggpdW8U+YYzLZ1dEcPed7VL8nRSW/JYq/XZFkIxG1xL0vtb2o73T+adIA==
X-Received: by 2002:aa7:848b:0:b029:1ed:5cb9:9e61 with SMTP id u11-20020aa7848b0000b02901ed5cb99e61mr20682010pfn.41.1614140777854;
        Tue, 23 Feb 2021 20:26:17 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8cb5:e0e1:ba5f:6619? ([2601:202:4180:a5c0:8cb5:e0e1:ba5f:6619])
        by smtp.gmail.com with ESMTPSA id c4sm796227pfo.32.2021.02.23.20.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 20:26:17 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: dunfell merge request Feb 23rd
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <3516026c-5f35-a4c0-5c7c-bf7dc87922c2@gmail.com>
Date: Tue, 23 Feb 2021 20:26:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit de37512b25c1f8c6bb6ab2b3782ac0fe01443483:

  gpsd: mark CLEANBROKEN (2021-01-31 09:42:35 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 346681e7bf9c78008a845fc89031be4fd4ceb3a1:

  python3-pykwalify: Do not unset _PYTHON_SYSCONFIGDATA_NAME (2021-02-19
07:17:12 -0800)

----------------------------------------------------------------
Andrej Kozemcak (1):
      libuv: fix CVE-2020-8252

Haiqing Bai (1):
      python-urllib3/python3-urllib3: fix CVE-2020-7212

Khem Raj (6):
      python-grpcio-tools: Add missing space for append
      gedit: Inherit python3targetconfig
      openipmi: Inherit python3targetconfig
      libplist: Inherit python3targetconfig
      postgresql: Inherit python3targetconfig
      python3-pykwalify: Do not unset _PYTHON_SYSCONFIGDATA_NAME

Mario Schuknecht (1):
      dnsmasq: Fix systemd service

Martin Jansa (2):
      wireguard-module: remove PKG assignment
      graphviz: use git fetcher instead of gitlab archives

Vyacheslav Yurkov (1):
      python3-aiohttp: added missing RDEPENDs

Zang Ruochen (1):
      openldap: upgrade 2.4.50 -> 2.4.51

akuster (2):
      enca: Fix SRC_URI
      meta-oe/README: add Ubuntu prerequisite information

changqing.li@windriver.com (1):
      celt051: update SRC_URI

zangrc (1):
      openldap: upgrade 2.4.51 -> 2.4.56

zhengruoqin (1):
      openldap: upgrade 2.4.56 -> 2.4.57

 meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb     |  2 +-
 .../wireguard/wireguard-module_1.0.20200401.bb     |  7 ---
 .../recipes-support/celt051/celt051_git.bb         |  2 +-
 .../dnsmasq/files/dnsmasq-resolvconf.service       |  2 +-
 .../recipes-support/openipmi/openipmi_2.0.29.bb    |  2 +-
 meta-oe/README                                     |  3 ++
 .../libuv/libuv/CVE-2020-8252.patch                | 41 ++++++++++++++++
 meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb |  3 +-
 meta-oe/recipes-dbs/postgresql/postgresql.inc      |  2 +-
 .../libimobiledevice/libplist_2.1.0.bb             |  2 +-
 .../recipes-graphics/graphviz/graphviz_2.40.1.bb   | 18 +++----
 meta-oe/recipes-support/enca/enca_1.9.bb           |  7 ++-
 .../{openldap_2.4.50.bb => openldap_2.4.57.bb}     |  6 +--
 .../python/python-grpcio-tools.inc                 |  2 +-
 .../python/python3-aiohttp_3.6.2.bb                |  4 +-
 .../python/python3-pykwalify_1.7.0.bb              |  2 +-
 .../python/python3-urllib3/CVE-2020-7212.patch     | 55
++++++++++++++++++++++
 .../python/python3-urllib3_1.25.7.bb               |  2 +
 18 files changed, 127 insertions(+), 35 deletions(-)
 create mode 100644
meta-oe/recipes-connectivity/libuv/libuv/CVE-2020-8252.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.50.bb =>
openldap_2.4.57.bb} (97%)

