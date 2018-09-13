Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 867EE71A0F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 15:22:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8DFMprp027067
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Sep 2018 08:22:51 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 13 Sep 2018 08:22:50 -0700
To: Andrew Bresticker <abrestic@waymo.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180912212255.194513-1-abrestic@waymo.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <2a92e298-73d6-a5b2-4cc9-88cb6e32d1be@windriver.com>
Date: Thu, 13 Sep 2018 23:22:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180912212255.194513-1-abrestic@waymo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] libdevmapper: Install dmsetup
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
X-List-Received-Date: Thu, 13 Sep 2018 15:22:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年09月13日 05:22, Andrew Bresticker wrote:
> Commit 6aa1dd223a140 ("lvm2/libdevmapper: fix invoking lvcreate failed")
> accidentally removed installation of dmsetup as part of the libdevmapper
> recipe. Add it back by explicitly installing it in do_install().

Why? I am afraid your fix will cause `invoking lvcreate failed'

Here is the original log of `Commit 6aa1dd223a140',
I quess the `---' cuased the log truncate in git

Previously, libdevmapper is separated from lvm2 in the following commit:
---
commit 7f17da154372b5ec33947766783444961e8aa67c
Author: Chen Qi<Qi.Chen@windriver.com>
Date:   Mon Apr 24 16:06:41 2017 +0800

     lvm2: separate libdevmapper to avoid circular dependency
---

It caused invoking lvcreate failed:
---
root@qemux86-64:~# lvm pvcreate /dev/sda
   Physical volume "/dev/sda" successfully created.
root@qemux86-64:~# lvm vgcreate -s 4096K wrl /dev/sda
   Volume group "wrl" successfully created
root@qemux86-64:~# lvm lvcreate -n swap -L 2293648K -y --type linear wrl
   Rounding up size to full physical extent 2.19 GiB
   /dev/wrl/swap: not found: device not cleared
   Aborting. Failed to wipe start of new LV.
---

The lvm2 and libdevmapper should use the same PACKAGECONFIG
and EXTRA_OECONF.

And do not manually remove useless files.

Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>

//Hongxu



> Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
> ---
>   meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb | 1 +
>   1 file changed, 1 insertion(+)
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



