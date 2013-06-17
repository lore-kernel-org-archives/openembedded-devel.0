Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B0D7360821
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 09:58:19 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Jun 2013 02:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,880,1363158000"; d="scan'208";a="256057403"
Received: from unknown (HELO helios.localnet) ([10.252.122.47])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jun 2013 02:58:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
Date: Mon, 17 Jun 2013 10:58:17 +0100
Message-ID: <1891782.GSdHg1ETcy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1371457230-6773-1-git-send-email-noor_ahsan@mentor.com>
References: <1371457230-6773-1-git-send-email-noor_ahsan@mentor.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH] gvfs: Handle samba dependency based on GPLv3 license.
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
X-List-Received-Date: Mon, 17 Jun 2013 09:58:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 17 June 2013 13:20:30 Noor, Ahsan wrote:
> +PACKAGECONFIG = "${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', '',
> 'samba', d)}" +

This needs to use ?= or ??= so that it can be overridden easily.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

