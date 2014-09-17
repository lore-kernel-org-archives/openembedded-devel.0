Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF007107F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 14:51:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 17 Sep 2014 07:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="387429299"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.123])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Sep 2014 07:45:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Sep 2014 15:50:44 +0100
Message-ID: <16603650.5MPWL2djnF@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <b670f5b2000ab1a7b31f124deff0cdf31be0572d.1410964797.git.paul.eggleton@linux.intel.com>
References: <cover.1410964797.git.paul.eggleton@linux.intel.com>
	<b670f5b2000ab1a7b31f124deff0cdf31be0572d.1410964797.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [meta-systemd][PATCH 2/4] dhcp: remove parts now merged into OE-Core recipe
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
X-List-Received-Date: Wed, 17 Sep 2014 14:51:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 17 September 2014 15:41:24 Paul Eggleton wrote:
> --- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
> +++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
> @@ -1,35 +1,18 @@
>  # look for files in the layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -inherit systemd
> -
> -SYSTEMD_PACKAGES = "dhcp-server dhcp-relay dhcp-client"
> -SYSTEMD_SERVICE_dhcp-server = "dhcpd.service"
> -SYSTEMD_SERVICE_dhcp-relay = "dhcrelay.service"
> +SYSTEMD_PACKAGES += "dhcp-client"
>  SYSTEMD_SERVICE_dhcp-client = "dhclient.service"
>  SYSTEMD_AUTO_ENABLE_dhcp-client = "disable"
>  
> -FILES_dhcp-server += "${systemd_unitdir}/system/dhcpd.service"
> -FILES_dhcp-relay += "${systemd_unitdir}/system/dhrelay.service"
>  FILES_dhcp-client += "${systemd_unitdir}/system/dhclient.service"
> -RPROVIDES_dhcp-server += "dhcp-server-systemd"
> -RREPLACES_dhcp-server += "dhcp-server-systemd"
> -RCONFLICTS_dhcp-server += "dhcp-server-systemd"
> -RPROVIDES_dhcp-relay += "dhcp-relay-systemd"
> -RREPLACES_dhcp-relay += "dhcp-relay-systemd"
> -RCONFLICTS_dhcp-relay += "dhcp-relay-systemd"

Oops, I got a bit carried away, the RPROVIDES/RREPLACES/RCONFLICTS lines 
should not be removed. I have updated this commit on the branch to leave them 
in.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

