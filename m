Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.11329.1629036401624071910
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TnJViVX+;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso16650066pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eUMU6+SPzo7JD4qqDngJ3boiTb+HT/JEZ37gEavzQ5w=;
        b=TnJViVX+XcPT8X3ieh5ZVThMgLiLFBi1yyX9JBRXbos4Dj3g3x1ujVKuKxvNYhVQuE
         1WV+27MgsPvLN/NebPtPPZlYEFPqsR0huYPPwrXjbyty5HJtc24THLTou9rlRy8lB6TZ
         buiqD7xZwNIW9+kV9146ZqGCnTBUVMuPUSYV9RB9JxLi95askHxer71ekrCcqKDaLHro
         flLVUetRXwoDrLsQmfu88D6ILWKoITmM83xbgZi/+fTtS29EFJl5pumq0AePyrzNhs32
         CmZhyN5sIF9kUeWXSUUkefK3e3sZn+bgaXm+GRURCMjatU7CXaTsrhlbt52kg5xEmm1o
         XBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eUMU6+SPzo7JD4qqDngJ3boiTb+HT/JEZ37gEavzQ5w=;
        b=rqIfsS2bgSdFh0SKoZF8Ak1TDq9L9eC/feHV00tW6bly2BUU2D4KEvo1KDnwkMS0b5
         soaXpFF+FHLtxanJCX5UYCY3ensjS/GxoXiG0JHrHOi/h7VJkL+xxTKCZ9gdhdWaBb+/
         imQYYSrrIA8YJEi56VuwNgD83VPy0KQqQTZdEDpcivk2aPnxYVqeuZrZyp6E4u1Mz7G9
         Mu6CIm8xebk5ZqFp2SSoP1xacRdYU+xKh9CxBxHRAWJJ3+fhfzl81dZeMCrxc9sA8pJC
         Z7h6ZEk0Ft4a4bm2hOLYH9tJXQNi+zF3fSuSBJxD11kRdpduQ8VsfEeTjN/A/uVkmWpq
         WVJg==
X-Gm-Message-State: AOAM532smef48obSw+LdF3MMWD9fNmOXkJuykoHwBsSLG/H6WHof58Oj
	3GLhA1HEZ7bLax4eLOurIVAgI/jvcwPSrQ==
X-Google-Smtp-Source: ABdhPJw69MfjSEOoDkr6t34T1Pmnf9nFw4g+J6xAOnrbWOKKVaIfB2MnfCes0nR0/oPO4NysvfZBqg==
X-Received: by 2002:a63:682:: with SMTP id 124mr11357021pgg.299.1629036400764;
        Sun, 15 Aug 2021 07:06:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:40 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 00/18] Patch review
Date: Sun, 15 Aug 2021 07:06:12 -0700
Message-Id: <cover.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please have comments back by Tuesday

The following changes since commit 5a4b2ab29d38c02535f24d5308cc40615739f557:

  python3-urllib3: Upgrade 1.26.4 -> 1.26.5 (2021-07-30 16:20:20 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Anastasios Kavoukis (1):
  pm-qa: fix paths for shell scripts

Armin Kuster (1):
  wireshark: update to 3.4.7

Changqing Li (1):
  ndpi: fix CVE-2021-36082

Devendra Tewari (1):
  Suppress eol in functionfs setup scripts (#147)

Gianfranco (1):
  vboxguestdrivers: upgrade 6.1.22 -> 6.1.24

Joe Slater (1):
  php: move to version 7.4.21

Kai Kang (1):
  libdbi-perl: fix CVE-2014-10402

Li Wang (1):
  openlldp: fix segfault

Michael Opdenacker (1):
  bigbuckbunny-1080p: fix sample video URL

Mingli Yu (2):
  mariadb: redefine log-error item
  mariadb: Update SRC_URI

Paulo Neves (1):
  htop: Add ncurses-terminfo-base to RDEPENDS

Tony Battersby (3):
  net-snmp: fix QA Issue after LDFLAGS change
  curlpp: fix QA Issue after LDFLAGS change
  ldns: fix QA Issue after LDFLAGS change

Tony Tascioglu (1):
  redis: fix CVE-2021-32625

wangmy (2):
  nghttp2: upgrade 1.43.0 -> 1.44.0
  libtalloc: upgrade 2.3.2 -> 2.3.3

 .../sample-content/bigbuckbunny-1080p.bb      |   2 +-
 .../net-snmp/net-snmp_5.9.1.bb                |   5 +
 .../lldp_head-remove-all-references.patch     | 331 ++++++++++++++++++
 .../openlldp/openlldp_1.0.1.bb                |   1 +
 .../recipes-support/curlpp/curlpp_0.8.1.bb    |   7 +
 ...{libtalloc_2.3.2.bb => libtalloc_2.3.3.bb} |   6 +-
 .../{nghttp2_1.43.0.bb => nghttp2_1.44.0.bb}  |   2 +-
 .../ntopng/files/CVE-2021-36082.patch         | 116 ++++++
 .../recipes-support/ntopng/ndpi_3.4.bb        |   1 +
 ...{wireshark_3.4.6.bb => wireshark_3.4.7.bb} |   2 +-
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   7 +-
 meta-oe/recipes-dbs/mysql/mariadb/my.cnf      |   2 +-
 .../android-gadget-cleanup                    |   2 +-
 .../android-gadget-setup                      |   4 +-
 .../android-gadget-start                      |   2 +-
 meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb   |   7 +
 .../perl/libdbi-perl/CVE-2014-10402.patch     |  56 +++
 .../perl/libdbi-perl_1.643.bb                 |   4 +-
 .../php/{php_7.4.16.bb => php_7.4.21.bb}      |   3 +-
 .../redis/redis/fix-CVE-2021-32625.patch      |  61 ++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |   1 +
 meta-oe/recipes-support/htop/htop_3.0.5.bb    |   2 +
 .../40-linux-5.13-support.patch               | 276 ---------------
 ...s_6.1.22.bb => vboxguestdrivers_6.1.26.bb} |   6 +-
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb       |   3 +-
 25 files changed, 610 insertions(+), 299 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.2.bb => libtalloc_2.3.3.bb} (91%)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.43.0.bb => nghttp2_1.44.0.bb} (93%)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.6.bb => wireshark_3.4.7.bb} (97%)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} (99%)
 create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.22.bb => vboxguestdrivers_6.1.26.bb} (94%)

-- 
2.25.1

