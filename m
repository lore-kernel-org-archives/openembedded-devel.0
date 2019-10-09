Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id A79227F4CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 18:43:38 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 23so1988130pgk.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2019 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=JUixiXrO0s22RzKTZYR8B7jCtqighEUd0h5UmvzcGDA=;
	b=DLKTJjb6iOzeNa+1Fx/HHLWZZWXGzTMUU4kWDQh8yxvWp3s8ZJPTIGUs0ePjjMjIqm
	6BC43gSFzI1tkwj2RcXr0kWr/6XMunzP4rVAsGPjwPRd+wzjlOcHrgCL2euqSnadsXTg
	x90V1Mt7RSkKzN3Vnx6ni3thXIH4Pj94ZfipIEdVqoBjZ87kiJ8r2MSfexqzCKRsRDN+
	XMjtKDOKmiyhJUtWUSnINefGEda4D/IwLD5z6zPOHXDVTf6mi+ojhUJ4NGv69V+Nj263
	CggHels1LUIvLEbSWVKTjLF+Ttsp3l5ZAnwbNaALFwbI/ktgd40Wktvzrd0yPRdr8BLg
	ZTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=JUixiXrO0s22RzKTZYR8B7jCtqighEUd0h5UmvzcGDA=;
	b=b+GFlMlfpzO63K7lknyA2D1h3AZ9JtHJdSxilys7cbDH5LFaTk/3wntmwWXIwtyfPy
	97smbXqe+4AKNVLBVfyB3HdkE2QVbaXgKZ7TPhHEBE2uYS+4U0wbX3vYPf0RelINEdlZ
	7TBEqQquM9UoZT/i6fXlnXQNMcyP2FVuYrZ/gH0erEjNckmUnj35y1oha+MRsfdqLB4E
	Gb1Yu5KxAGbgEnJ3wz0NK2Bt2jbc6drZ5TvzjE3f6a9UgI4U6e2O3pcXf/D8zIw91WEQ
	/BP52Ex06+xFnzfreZ3agpLfeU7N8LLK2HYC3sThGqvIdNZhW+lqVU80DSYAr062TgXb
	PjFg==
X-Gm-Message-State: APjAAAXhwe+9VIBpFM3dIMGHosDW4+h9zOdmrJm6b3aBhYXSxvJfZ1L0
	sTE2dqoUS4OHosrgdk5fetLI3O+I
X-Google-Smtp-Source: APXvYqw1XGJgmMWibnvDv157VSRa5SVB4vBoFE0fGL0FaxnMMd9Gk9jF8zRzHMMJ1BotTCs4YWovvw==
X-Received: by 2002:aa7:9e88:: with SMTP id p8mr5559764pfq.10.1570646619317;
	Wed, 09 Oct 2019 11:43:39 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:3474:1cc:c6fb:432b?
	([2601:202:4180:a5c0:3474:1cc:c6fb:432b])
	by smtp.gmail.com with ESMTPSA id 2sm5342780pfa.43.2019.10.09.11.43.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Oct 2019 11:43:38 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <27e08393-58f2-d1e9-865b-1ca8cc31a1aa@gmail.com>
Date: Wed, 9 Oct 2019 11:43:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: warrior pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2019 18:43:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 3bdbf72e3a4bf18a4a2c7afbde4f7ab773aeded9:

  oprofile: drop kernel-vmlinux from RRECOMMENDS (2019-09-07 15:30:50 -0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded f4ccdf2

for you to fetch changes up to f4ccdf2bc3fe4f00778629088baab840c868e36b:

  mariadb: update SRC_URI to use archive.mariadb.org (2019-10-09
11:26:58 -0700)

----------------------------------------------------------------
Dan Tran (1):
      polkit: Fix CVE-2018-19788

Denys Dmytriyenko (1):
      mariadb: update SRC_URI to use archive.mariadb.org

Kai Kang (1):
      apache2: fix multilib file conflicts

Khem Raj (4):
      redis: Fix build with clang/x86
      klibc: Pass -fno-builtin-bcmp with musl/clang combo
      klibc: Disable bcmp builtin for clang on glibc as well
      bpftool.bb: Disable SECURITY_CFLAGS

Peiran Hong (1):
      tcpdump: Fix CVE-2017-16808

Trevor Gamblin (1):
      gd: fix CVE-2019-6978

 meta-initramfs/recipes-devtools/klibc/klibc.inc                 |   5 +-
 .../0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch    |  61
++++++
 meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb        |   1 +
 meta-oe/recipes-dbs/mysql/mariadb.inc                           |   2 +-
 meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch  | 194
++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p2.patch  | 153
++++++++++++++
 meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p3.patch  |  53 +++++
 meta-oe/recipes-extended/polkit/polkit_0.115.bb                 |  12 +-
 .../redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch          |  32 +++
 meta-oe/recipes-extended/redis/redis_4.0.14.bb                  |   5 +-
 meta-oe/recipes-kernel/bpftool/bpftool.bb                       |   4 +-
 meta-oe/recipes-support/gd/gd/CVE-2019-6978.patch               | 299
++++++++++++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.2.5.bb                          |   1 +
 meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb          |   6 +-
 14 files changed, 817 insertions(+), 11 deletions(-)
 create mode 100644
meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
 create mode 100644
meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch
 create mode 100644
meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p2.patch
 create mode 100644
meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p3.patch
 create mode 100644
meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2019-6978.patch


