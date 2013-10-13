Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C23696CD1B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 12:27:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Oct 2013 05:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,485,1378882800"; d="scan'208";a="418460881"
Received: from junemccl-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.196])
	by orsmga002.jf.intel.com with ESMTP; 13 Oct 2013 05:28:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 13:27:59 +0100
Message-ID: <4670414.X53MPtpl5C@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1381618825-18766-1-git-send-email-andrea.adami@gmail.com>
References: <1381618825-18766-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 1/3] meta-handheld: remove TARGET_ARCH from machine configurations
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
X-List-Received-Date: Sun, 13 Oct 2013 12:28:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 13 October 2013 01:00:23 Andrea Adami wrote:
> --- a/conf/machine/jornada6xx.conf
> +++ b/conf/machine/jornada6xx.conf
> @@ -2,8 +2,6 @@
>  #@NAME: HP Jornada 680
>  #@DESCRIPTION: Machine configuration for the HITACHI SH3 based HP Jornada
> 6xx palmtop computer
> 
> -TARGET_ARCH = "sh3"
> -
>  require conf/machine/include/tune-sh3.inc

Not that this machine probably works currently anyway, but I noticed we had a 
copy of tune-sh3.inc in meta-handheld; I've removed this when applying this 
patch since OE-Core has had a proper version of this inc file for a long time.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

