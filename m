Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 132E96C73F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:29:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2013 02:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="438406609"
Received: from unknown (HELO helios.localnet) ([10.252.121.237])
	by orsmga002.jf.intel.com with ESMTP; 20 Nov 2013 02:29:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Nov 2013 10:29:46 +0000
Message-ID: <1404521.4vplx1e1VT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1384813274-7231-6-git-send-email-Martin.Jansa@gmail.com>
References: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
	<1384813274-7231-6-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 6/6] usb-modeswitch-data: Drop allarch
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
X-List-Received-Date: Wed, 20 Nov 2013 10:29:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Monday 18 November 2013 23:21:14 Martin Jansa wrote:
> * has runtime dependency on TUNE_PKGARCH usb-modeswitch
>   Hash for dependent task usb-modeswitch_1.2.5.bb.do_packagedata changed
> from 5709ee415d286847b58e7b438b5b9f75 to fbef5eee3bb2bacb805a0bead2095b52
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb | 2
> -- 1 file changed, 2 deletions(-)
> 
> diff --git
> a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
> b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
> index fc0fbfb..8b71618 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
> +++
> b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb @@
> -2,8 +2,6 @@ DESCRIPTION = "Data files for usbmodeswitch"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> 
> -inherit allarch
> -
>  SRC_URI =
> "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-${PV}.tar.bz
> 2" SRC_URI[md5sum] = "91feff51deba6e48e78506b8f4db2274"
>  SRC_URI[sha256sum] =
> "a3114e2c1f38eed3ad0067df30e53a96313908a9539a8ea5d94a4d35651699eb"

To be honest I view these in the same way as the corresponding OE-Core patches 
- if the contents of the output package or its metadata does not change 
dependent on the other package, then we should use other means to fix this 
issue rather than the huge hammer of removing allarch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

