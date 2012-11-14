Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TYdw6-0004v8-8f
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Nov 2012 15:27:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Nov 2012 06:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,250,1352102400"; d="scan'208";a="248971361"
Received: from unknown (HELO helios.localnet) ([10.252.122.165])
	by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2012 06:13:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Wed, 14 Nov 2012 14:13:27 +0000
Message-ID: <1383108.LZ7QnazmmD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1352896618-26003-3-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1352896618-26003-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1352896618-26003-3-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 10/10] obex: move to meta-gnome due to libical
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
X-List-Received-Date: Wed, 14 Nov 2012 14:27:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 November 2012 13:36:58 Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../recipes-connectivity/obex/obex-data-server_0.4.6.bb                   |
> 0 {meta-oe => meta-gnome}/recipes-connectivity/obex/obexd_0.44.bb          
> | 0 .../recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch    
>   | 0 .../obex/openobex-1.5/libusb_crosscompile_check.patch                
>     | 0 {meta-oe => meta-gnome}/recipes-connectivity/obex/openobex_1.5.bb  
>       | 0 5 files changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-oe =>
> meta-gnome}/recipes-connectivity/obex/obex-data-server_0.4.6.bb (100%)
> rename {meta-oe => meta-gnome}/recipes-connectivity/obex/obexd_0.44.bb
> (100%) rename {meta-oe =>
> meta-gnome}/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
> (100%) rename {meta-oe =>
> meta-gnome}/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_chec
> k.patch (100%) rename {meta-oe =>
> meta-gnome}/recipes-connectivity/obex/openobex_1.5.bb (100%)
> 
> diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> b/meta-gnome/recipes-connectivity/obex/obex-data-server_0.4.6.bb similarity
> index 100%
> rename from meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> rename to meta-gnome/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> diff --git a/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
> b/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb similarity index 100%
> rename from meta-oe/recipes-connectivity/obex/obexd_0.44.bb
> rename to meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
> diff --git
> a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
> b/meta-gnome/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patc
> h similarity index 100%
> rename from
> meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
> rename to
> meta-gnome/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
> diff --git
> a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.
> patch
> b/meta-gnome/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_che
> ck.patch similarity index 100%
> rename from
> meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.pa
> tch rename to
> meta-gnome/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check
> .patch diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> b/meta-gnome/recipes-connectivity/obex/openobex_1.5.bb similarity index
> 100%
> rename from meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> rename to meta-gnome/recipes-connectivity/obex/openobex_1.5.bb

Only obexd actually depends on libical, why doees openobex have to move as 
well?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


