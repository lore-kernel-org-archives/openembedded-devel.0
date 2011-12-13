Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RabQ2-0005GR-N9
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 00:05:54 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Dec 2011 14:58:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="86236943"
Received: from unknown (HELO helios.localnet) ([10.252.122.62])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2011 14:58:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 13 Dec 2011 22:58:55 +0000
Message-ID: <1963512.neekAovJTQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
References: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie 0/6] Fix SDK generation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 23:05:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 13 December 2011 20:44:37 Dmitry Eremin-Solenikov wrote:
> The following changes since commit ad8e8dc745831e2f8523757d790294906500b0ad:
> 
>   Fix LIC_FILES_CHKSUM for change to common LGPL-2.0 license file
> (2011-12-09 12:18:49 +0000)
> 
> are available in the git repository at:
>   https://github.com/lumag/meta-opie master
> 
> Dmitry Eremin-Solenikov (6):
>       uicmoc: do also provide nativesdk variant
>       qmake: do also provide nativesdk variant
>       task-opie, task-opie-16mb: make whole recipe a machine-only
>       opie-button-settings: make whole recipe a machine-only
>       libopie2: make libopie2-dev package installable
>       opie: fix SDK generation
> 
>  recipes-opie/libopie/libopie2.inc                  |    6 ++-
>  recipes-opie/meta/meta-toolchain-opie.bb           |   30
> ++++++++++++++++--- .../opie-button-settings/opie-button-settings.inc  |   
> 2 +-
>  recipes-opie/tasks/task-opie-16mb.bb               |    5 +--
>  .../tasks/task-opie-toolchain-host-nativesdk.bb    |    8 +++++
>  recipes-opie/tasks/task-opie-toolchain-target.bb   |   16 ++++++++++
>  recipes-opie/tasks/task-opie.bb                    |    9 +----
>  .../{qmake-native_1.07a.bb => qmake_1.07a.bb}      |    8 ++---
>  .../64bit-cleanup.patch                            |    0
>  .../fix-makefile.patch                             |    0
>  .../gcc3_4.patch                                   |    0
>  .../gcc4.patch                                     |    0
>  .../gcc4_1.patch                                   |    0
>  .../kernel-asm-page.patch                          |    0
>  .../{uicmoc-native_2.3.10.bb => uicmoc_2.3.10.bb}  |   11 +++++--
>  15 files changed, 69 insertions(+), 26 deletions(-)
>  create mode 100644 recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
> create mode 100644 recipes-opie/tasks/task-opie-toolchain-target.bb rename
> recipes-qt/qmake/{qmake-native_1.07a.bb => qmake_1.07a.bb} (92%) rename
> recipes-qt/uicmoc/{uicmoc-native-2.3.10 =>
> uicmoc-2.3.10}/64bit-cleanup.patch (100%) rename
> recipes-qt/uicmoc/{uicmoc-native-2.3.10 =>
> uicmoc-2.3.10}/fix-makefile.patch (100%) rename
> recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/gcc3_4.patch
> (100%) rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 =>
> uicmoc-2.3.10}/gcc4.patch (100%) rename
> recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/gcc4_1.patch
> (100%) rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 =>
> uicmoc-2.3.10}/kernel-asm-page.patch (100%) rename
> recipes-qt/uicmoc/{uicmoc-native_2.3.10.bb => uicmoc_2.3.10.bb} (81%)

Merged to meta-opie, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


