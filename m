Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UO0qw-0004jt-6n
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 09:14:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Apr 2013 23:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,413,1363158000"; d="scan'208";a="313993735"
Received: from unknown (HELO helios.localnet) ([10.255.13.157])
	by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2013 23:57:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Apelete Seketeli <apelete@seketeli.net>
Date: Fri, 05 Apr 2013 07:57:08 +0100
Message-ID: <1569197.3RlpYsjGQj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <001217b18cb77bef28e080695cac129da1800937.1365116038.git.apelete@seketeli.net>
References: <cover.1365116038.git.apelete@seketeli.net>
	<001217b18cb77bef28e080695cac129da1800937.1365116038.git.apelete@seketeli.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 2/2] ben-nanonote: add DEFAULTTUNE to machine configuration
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
X-List-Received-Date: Fri, 05 Apr 2013 07:14:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Apelete,

On Friday 05 April 2013 07:37:55 Apelete Seketeli wrote:
> Add DEFAULTTUNE to machine configuration to ensure that the correct
> tune features are selected by default.
> 
> Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> ---
>  conf/machine/ben-nanonote.conf |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/ben-nanonote.conf b/conf/machine/ben-nanonote.conf
> index 1ce5815..275dff9 100644
> --- a/conf/machine/ben-nanonote.conf
> +++ b/conf/machine/ben-nanonote.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the Qi-Hardware's Ben Nanonote
> 
>  require conf/machine/include/tune-mips32.inc
> +DEFAULTTUNE = "mips32el-nf"
> 
>  PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-ben-nanonote"

There was a discussion just the other day on this mailing list; setting 
DEFAULTTUNE is considered the province of distro configuration and thus 
shouldn't be in the machine config:

http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-April/044719.html

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


