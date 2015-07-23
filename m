Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 300AC75972
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 08:30:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6N8UOl0029002
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 01:30:24 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 23 Jul 2015 01:30:15 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1437102603-25983-1-git-send-email-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55B0A623.1030204@windriver.com>
Date: Thu, 23 Jul 2015 16:30:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1437102603-25983-1-git-send-email-kai.kang@windriver.com>
Subject: Re: [meta-oe][PATCH 0/4] Upgrade 4 packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jul 2015 08:30:25 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年07月17日 11:09, Kai Kang wrote:
> Kai Kang (4):
>    crash: upgrade from 7.0.9 to 7.1.2
>    liblockfile: add patch of version 1.09-6 from debian
>    lvm2: upgrade from 2.02.97 to 2.02.125
>    multipath-tools: upgrade git rev

Ping?


>
>   .../liblockfile-fix-install-so-to-man-dir.patch    | 20 +++++++
>   .../liblockfile/liblockfile_1.09.bb                |  5 ++
>   .../0001-cross_add_configure_option.patch          | 34 ------------
>   .../7001force_define_architecture.patch            | 13 -----
>   .../crash/crash-7.0.9/7003cross_ranlib.patch       | 10 ----
>   .../crash/crash-7.0.9/config-site.crash-7.0.9      |  1 -
>   .../crash/0001-cross_add_configure_option.patch    | 34 ++++++++++++
>   .../crash/7001force_define_architecture.patch      | 13 +++++
>   .../crash/crash/7003cross_ranlib.patch             | 10 ++++
>   .../crash/crash/config-site.crash-7.0.9            |  1 +
>   meta-oe/recipes-kernel/crash/crash_7.0.9.bb        | 63 ----------------------
>   meta-oe/recipes-kernel/crash/crash_7.1.2.bb        | 63 ++++++++++++++++++++++
>   meta-oe/recipes-support/lvm2/lvm2.inc              |  6 +--
>   ...ace-CPPFunction-with-rl_completion_func_t.patch | 33 ------------
>   .../lvm2/0001-snapshot-check-snapshot-exists.patch | 29 ----------
>   .../lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch  | 31 -----------
>   meta-oe/recipes-support/lvm2/lvm2_2.02.125.bb      |  4 ++
>   meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb       |  6 ---
>   .../multipath-tools/files/makefile_inc.patch       | 11 ++--
>   .../multipath-tools/multipath-tools_git.bb         |  8 ++-
>   20 files changed, 164 insertions(+), 231 deletions(-)
>   create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-install-so-to-man-dir.patch
>   delete mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch
>   delete mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch
>   delete mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
>   delete mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
>   create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
>   create mode 100644 meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch
>   create mode 100644 meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
>   create mode 100644 meta-oe/recipes-kernel/crash/crash/config-site.crash-7.0.9
>   delete mode 100644 meta-oe/recipes-kernel/crash/crash_7.0.9.bb
>   create mode 100644 meta-oe/recipes-kernel/crash/crash_7.1.2.bb
>   delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
>   delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-snapshot-check-snapshot-exists.patch
>   delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch
>   create mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.125.bb
>   delete mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb
>


-- 
Regards,
Neil | Kai Kang


