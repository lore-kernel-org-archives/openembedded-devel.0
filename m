Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D23636FFA1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 09:30:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1S9Un55029652
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 01:30:49 -0800 (PST)
Received: from [128.224.163.132] (128.224.163.132) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 28 Feb 2018 01:30:23 -0800
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: ZhangXiao <xiao.zhang@windriver.com>
Message-ID: <5A9676C2.9030208@windriver.com>
Date: Wed, 28 Feb 2018 17:30:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: multilib SDK issue
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
X-List-Received-Date: Wed, 28 Feb 2018 09:30:49 -0000
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit

Hi All,

With below settings on my local.conf, I get several errors when
extracting SDK:

Modify local.conf as the example of section 4.10.2.2 of
http://www.yoctoproject.org/docs/2.4.1/mega-manual/mega-manual.html#combining-multiple-versions-library-files-into-one-image

...
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
IMAGE_INSTALL_append = " lib32-glib-2.0"
..

# bitbake core-image-minimal -c populate_sdk

...
Transaction Summary
================================================================================
Install  416 Packages

Total size: 57 M
Installed size: 276 M
Downloading Packages:
Running transaction check
Transaction check succeeded.
Running transaction test
Error: Transaction check error:
  file /usr/include/gmp.h conflicts between attempted installs of
libgmp-dev-6.1.2-r0.core2_64 and lib32-libgmp-dev-6.1.2-r0.x86
  file /usr/bin/python3.5m-config conflicts between attempted installs
of python3-dev-3.5.4-r1.0.core2_64 and lib32-python3-dev-3.5.4-r1.0.x86
  file /usr/share/pkgconfig/xtrans.pc conflicts between attempted
installs of lib32-xtrans-dev-1:1.3.5-r0.x86 and
xtrans-dev-1:1.3.5-r0.core2_64

Error Summary
-------------

Any advices?

Thanks a lot!
Xiao

