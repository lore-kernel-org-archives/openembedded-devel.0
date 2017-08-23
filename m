Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C91B6FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 23:54:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7NNsFbO022849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 16:54:15 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 16:54:14 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20170822142141.9783-1-Martin.Jansa@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <0b21ced3-5976-da19-7329-a3f7945d16f6@windriver.com>
Date: Wed, 23 Aug 2017 19:54:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170822142141.9783-1-Martin.Jansa@gmail.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [meta-systemd][PATCH] meta-systemd: remove this now pretty empty layer
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
X-List-Received-Date: Wed, 23 Aug 2017 23:54:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-22 10:21 AM, Martin Jansa wrote:
> * the upgrade path from original meta-systemd still isn't provided
>    by oe-core, but hopefully there are only a few remaining users
>    of this layer.
> * some BSPs probably still use systemd-machine-units, but they should
>    push it to oe-core instead of depending on this layer just for this
>    one recipe

Martin,

Since you aren't getting much feedback on these removals,
I thought I'd say that this is excellent, albeit brutal, clean-up!

I guess it's good news that no one is objecting.

../Randy

> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta-systemd/README                                | 26 ------------------
>   meta-systemd/conf/layer.conf                       | 32 ----------------------
>   .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |  4 ---
>   .../recipes-connectivity/avahi/avahi_%.bbappend    |  4 ---
>   .../connman/connman_%.bbappend                     |  3 --
>   .../dhcp/dhcp/dhclient.service                     | 13 ---------
>   .../recipes-connectivity/dhcp/dhcp_%.bbappend      | 24 ----------------
>   .../recipes-connectivity/ofono/ofono_%.bbappend    |  5 ----
>   .../openssh/openssh_%.bbappend                     |  3 --
>   .../wpa-supplicant/wpa-supplicant_%.bbappend       |  3 --
>   .../recipes-core/busybox/busybox_%.bbappend        |  3 --
>   .../oe-core/recipes-core/dbus/dbus_%.bbappend      |  3 --
>   .../recipes-core/dropbear/dropbear_%.bbappend      |  4 ---
>   .../recipes-core/systemd/systemd_%.bbappend        |  3 --
>   .../recipes-core/util-linux/util-linux_%.bbappend  |  3 --
>   .../oe-core/recipes-extended/at/at_%.bbappend      |  4 ---
>   .../recipes-extended/cronie/cronie_%.bbappend      |  3 --
>   .../recipes-extended/lighttpd/lighttpd_%.bbappend  |  3 --
>   .../recipes-extended/rpcbind/rpcbind_%.bbappend    |  3 --
>   .../systemd/systemd-machine-units_1.0.bb           | 13 ---------
>   20 files changed, 159 deletions(-)
>   delete mode 100644 meta-systemd/README
>   delete mode 100644 meta-systemd/conf/layer.conf
>   delete mode 100644 meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-connectivity/avahi/avahi_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
>   delete mode 100644 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-connectivity/ofono/ofono_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-core/dbus/dbus_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-core/systemd/systemd_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-extended/at/at_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-extended/cronie/cronie_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_%.bbappend
>   delete mode 100644 meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_%.bbappend
>   delete mode 100644 meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
> 
...

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

