Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63F7E7958F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2018 07:36:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8F7a3PQ019339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 15 Sep 2018 00:36:03 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 15 Sep 2018 00:36:02 -0700
To: Andrew Bresticker <abrestic@waymo.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180914235727.182478-1-abrestic@waymo.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <bb67cb93-a2ab-6750-c60e-2495f950dfc2@windriver.com>
Date: Sat, 15 Sep 2018 15:36:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180914235727.182478-1-abrestic@waymo.com>
Subject: Re: [meta-oe][PATCH v2] libdevmapper: Install dmsetup
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
X-List-Received-Date: Sat, 15 Sep 2018 07:36:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

It is fine to me

//Hongxu

On 2018年09月15日 07:57, Andrew Bresticker wrote:
> Commit 6aa1dd223a140 ("lvm2/libdevmapper: fix invoking lvcreate failed")
> moved installation of dmsetup back to lvm2 from libdevmapper, but dmsetup
> had intentionally been moved to libdevmapper in commit 269d009a81d4
> ("lvm2: libdevicemapper package needs udev rules and dmsetup"). Add it back
> to libdevmapper by explicitly installing it in do_install(), and refresh
> explicitly-do-not-install-libdm.patch so that we also explicitly do not
> install dmsetup as part of lvm2.
>
> Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
> ---
>   .../lvm2/libdevmapper_2.02.180.bb             |  1 +
>   ...0001-explicitly-do-not-install-libdm.patch | 28 +++++++++++++++----
>   2 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
> index f3f11ef64..26af3275d 100644
> --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
> +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
> @@ -9,6 +9,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>   
>   do_install() {
>       oe_runmake 'DESTDIR=${D}' -C libdm install
> +    oe_runmake 'DESTDIR=${D}' -C tools install_device-mapper
>   }
>   
>   RRECOMMENDS_${PN}_append_class-target = " lvm2-udevrules"
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
> index e85818dbd..7f5dd9334 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
> +++ b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
> @@ -1,4 +1,4 @@
> -From 0a8e466fcf99622896e070c5133165e4278e8cfb Mon Sep 17 00:00:00 2001
> +From 5a3e13ae94318c2bed60f875bb3852c45ce0113c Mon Sep 17 00:00:00 2001
>   From: Hongxu Jia <hongxu.jia@windriver.com>
>   Date: Thu, 25 May 2017 05:27:11 -0400
>   Subject: [PATCH] explicitly do not install libdm
> @@ -9,12 +9,14 @@ explicitly do not do the installation here.
>   Upstream-Status: Inappropriate [meta-oe specific]
>   
>   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
>   ---
>    libdm/Makefile.in | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> + tools/Makefile.in | 3 ++-
> + 2 files changed, 6 insertions(+), 3 deletions(-)
>   
>   diff --git a/libdm/Makefile.in b/libdm/Makefile.in
> -index 3c9a4ce..45c91c6 100644
> +index 66ec39513..c779c9d86 100644
>   --- a/libdm/Makefile.in
>   +++ b/libdm/Makefile.in
>   @@ -77,9 +77,11 @@ ifeq ("@PKGCONFIG@", "yes")
> @@ -23,14 +25,28 @@ index 3c9a4ce..45c91c6 100644
>    
>   -install: $(INSTALL_TYPE) install_include
>   +install:
> -+	echo "Do not install device mappler in lvm2"
> ++	echo "Do not install device mapper in lvm2"
>    
>   -install_device-mapper: install
>   +install_device-mapper:
> -+	echo "Do not install device mappler in lvm2"
> ++	echo "Do not install device mapper in lvm2"
>    
>    install_include: $(srcdir)/libdevmapper.h
>    	$(INSTALL_DATA) -D $< $(includedir)/$(<F)
> +diff --git a/tools/Makefile.in b/tools/Makefile.in
> +index 103b76732..63ba7fc04 100644
> +--- a/tools/Makefile.in
> ++++ b/tools/Makefile.in
> +@@ -267,7 +267,8 @@ install_dmsetup_static: dmsetup.static
> + 	$(Q) $(INSTALL_PROGRAM) -D $< $(staticdir)/$(<F)
> + 	$(Q) $(LN_S) -f $(<F) $(staticdir)/dmstats
> +
> +-install_device-mapper: $(INSTALL_DMSETUP_TARGETS)
> ++install_device-mapper:
> ++	echo "Do not install device mapper in lvm2"
> +
> + install_lvm2: $(INSTALL_LVM_TARGETS)
> +
>   --
> -2.8.1
> +2.19.0.397.gdd90340f6a-goog
>   



