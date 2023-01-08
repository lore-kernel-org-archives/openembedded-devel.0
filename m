Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED17C54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:32:22 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.47032.1673191939871412633
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oagT0yse;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id a16so5967320qtw.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOvqb4/oa3rjQKqDnlluPEI6LsK0ielD9ycUlr9NAWE=;
        b=oagT0yseBysvjwBktIYX38UMmMkaWMdAqom7SWAuKN7hDbnktPh/IjVzPBof76+mhY
         STaE5ID6GfZg9yQ2YXau2zMzHERUyjX8bs30bIdR0AdhMjdqUMY/GOSfk4Mbrwcq6/Qu
         +xiyNTNQXoDS7DqGzrcB539OsWDWof84/jrScTA04MYRRRlSbMVDl/Y8i432pXXjRc/L
         kH6BUPWn/EQ0woCmQSBD8l4m+EigNN7dMiDrDRXsXDBZyD0xnClphCVL8g33KPjkbNDY
         O+csOnef9OiqvXGKe/J1SM78f/0tzjWW+tES4+JATfw37LNlunT90l+BujIU5bH3+aTE
         KWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jOvqb4/oa3rjQKqDnlluPEI6LsK0ielD9ycUlr9NAWE=;
        b=TQew00NP7mPM2A0s71aLS1hRZBMpaJisWiAADzRpPgYNfBI70UJRnGdWtjGDuXJ000
         Ce+ek6wucSjJ5euZaM8WOKE1yTKoT7HcBY6zvZgnoTDB1MkE9v0hpAJExfFR/xc4fFOI
         3kEQWNhJ7a5ZNEXB8WKNtLicpMFz3jdbMsvAcaMby84RKU0c8np3lTymsY23Eiko9xHz
         Foj+H3BvGJsdmTC8rjOUhirIPUpkwhj+oysejX6Ii/+zmCCEi0n8KxlYaueks8tCwwDN
         OSn+UKlgXDiyFM5lXu1SwscYYlN0sOKmw2x0YF6RuvBORG/6C/g/cH02z36eJp964/Yb
         ndXw==
X-Gm-Message-State: AFqh2kpeHMaoP3nkv35BTEFoYrHbwJDpIObquGqjMF7ZRszdMwj+d5Mc
	bj2EURaPG2SgkwW7V702L506y/7cJV4=
X-Google-Smtp-Source: AMrXdXvVDtG6avxFtWnbajtCdRfW7Fas8/6DohU8I6HBzk7Ukl/9t2IjUYVEtgJcZl1g1UZHoN+1cQ==
X-Received: by 2002:ac8:549a:0:b0:3ab:5da1:53e1 with SMTP id h26-20020ac8549a000000b003ab5da153e1mr86639627qtq.42.1673191938816;
        Sun, 08 Jan 2023 07:32:18 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:14ca:f21f:f9fe:c54d? ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id x23-20020ac87ed7000000b0039467aadeb8sm3313874qtj.13.2023.01.08.07.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 07:32:18 -0800 (PST)
Message-ID: <48dfc489-5c28-88bf-f714-a3c4b4cf840f@gmail.com>
Date: Sun, 8 Jan 2023 10:32:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Kirkstone merge request: Jan 8th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100472

The following changes since commit a8055484f2829e8dfd03d5c8520b2c611aa7ebd2:

   dool: Add patch to fix rebuild (2022-12-11 16:18:53 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to a9c25bef8882a69fd35ea7dbac3d978ce440fe06:

   mariadb: Upgrade to 10.7.7 (2023-01-04 11:46:45 -0500)

----------------------------------------------------------------
Archana Polampalli (1):
       Nodejs: Fixed python3 DeprecationWarning

Mingli Yu (3):
       php: Upgrade to 8.1.12
       mariadb: not use qemu to run cross-compiled binaries
       mariadb: Upgrade to 10.7.7

Narpat Mali (1):
       Fix collections.abc deprecation warning in downloadutils Warning 
appears as:

Polampalli, Archana (1):
       xfce4-settings: 4.16.2 -> 4.16.5

Siddharth Doshi (1):
       xterm : Fix CVE-2022-45063 code execution via OSC 50 input 
sequences] CVE-2022-45063

Yogita Urade (1):
       multipath-tools:fix CVE-2022-41973

  .../{mariadb-native_10.7.4.bb => mariadb-native_10.7.7.bb} |   4 +-
  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 23 +-
  .../0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch    | 69 +++
  meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch         | 34 ++
  meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch        | 416 
---------------
  .../recipes-dbs/mysql/{mariadb_10.7.4.bb => mariadb_10.7.7.bb} |   6 +-
  .../nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch     | 35 ++
  meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb               | 3 +-
  meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} |   2 +-
  meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch    | 782 
++++++++++++++++++++++++++++
  meta-oe/recipes-graphics/xorg-app/xterm_372.bb                  | 1 +
  .../files/0001-multipath-tools-use-run-instead-of-dev-shm.patch | 159 
++++++
  .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 4 +
  ...1-Fix-collections.abc-deprecation-warning-in-downloadu.patch | 41 ++
  .../recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb  | 5 +-
  .../{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb} |   2 +-
  16 files changed, 1147 insertions(+), 439 deletions(-)
  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.4.bb => 
mariadb-native_10.7.7.bb} (93%)
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
  delete mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.4.bb => 
mariadb_10.7.7.bb} (81%)
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch
  rename meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} (99%)
  create mode 100644 
meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch
  create mode 100644 
meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
  rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb 
=> xfce4-settings_4.16.5.bb} (93%)


