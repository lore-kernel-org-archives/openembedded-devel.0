Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E60136A984
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 09:45:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2013 02:45:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,851,1363158000"; d="scan'208";a="328153957"
Received: from unknown (HELO helios.localnet) ([10.252.122.12])
	by orsmga001.jf.intel.com with ESMTP; 12 Jun 2013 02:45:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Fahad Usman <fahad_usman@mentor.com>
Date: Wed, 12 Jun 2013 10:45:43 +0100
Message-ID: <3639423.KAoAmRbK6q@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1371020915-14924-1-git-send-email-fahad_usman@mentor.com>
References: <1371020915-14924-1-git-send-email-fahad_usman@mentor.com>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][dylan][PATCH] libmtp: add new recipe
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
X-List-Received-Date: Wed, 12 Jun 2013 09:45:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Fahad,

On Wednesday 12 June 2013 12:08:35 Fahad Usman wrote:
> this was initially written by 'Christopher Larson'
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>  .../libmtp/libmtp-1.1.5/69-libmtp.rules            | 1000

It looks like this recipe is not in master so it would need to go there first. 
I'm also not sure if this is really suitable for meta-networking; MTP is 
indeed a protocol but it's more something for communicating with cameras and 
media players, so I'd suggest the meta-oe layer for this where we have other 
similar components (gphoto2, libimobiledevice, etc...)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

