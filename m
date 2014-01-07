Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 57A666C741
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 15:17:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 07 Jan 2014 07:13:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,619,1384329600"; d="scan'208";a="454887104"
Received: from williams-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.116])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2014 07:17:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 07 Jan 2014 15:17:05 +0000
Message-ID: <5325049.QYQsnbR4iu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-35-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1389107004-6822-1-git-send-email-koen@dominion.thruhere.net>
References: <1389107004-6822-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv3] irssi: add 0.8.16-rc1
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
X-List-Received-Date: Tue, 07 Jan 2014 15:17:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 07 January 2014 16:03:24 Koen Kooi wrote:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> 
> irssi is a text mode IRC client.
> 
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> 
> * Fixed PV
> * Added SSL support
> 
> I'm open for suggestions where to put it, meta-networking might not be the
> best place - koen
> 
>  .../recipes-protocols/irssi/irssi_0.8.16-rc1.bb      | 20
> ++++++++++++++++++++ 1 file changed, 20 insertions(+)
>  create mode 100644
> meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb
> 
> diff --git a/meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb
> b/meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb new file mode
> 100644
> index 0000000..bd3ad85
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Irssi is ncurses IRC client"

Could we have:

SUMMARY = "ncurses IRC client"

Also I was thinking earlier since this is more of a client utility than 
something for a network appliance (which meta-networking was originally 
focused upon) then would this be better in meta-oe?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

