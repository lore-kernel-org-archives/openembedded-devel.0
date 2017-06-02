Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CCEE271B27
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 14:28:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 07:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,285,1493708400"; d="scan'208";a="1155842552"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2017 07:28:28 -0700
Message-ID: <1496414228.26945.94.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Date: Fri, 02 Jun 2017 09:37:08 -0500
In-Reply-To: <1496366490-28223-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1496366490-28223-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] openvpn: Upgrade 2.3.9 -> 2.4.2
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
X-List-Received-Date: Fri, 02 Jun 2017 14:28:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-02 at 10:21 +0900, Fan Xin wrote:
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  .../recipes-support/openvpn/{openvpn_2.3.9.bb => openvpn_2.4.2.bb}  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-support/openvpn/{openvpn_2.3.9.bb => openvpn_2.4.2.bb} (93%)
> 
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
> similarity index 93%
> rename from meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
> rename to meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
> index db510de..ae72671 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
> @@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
>  HOMEPAGE = "http://openvpn.sourceforge.net"
>  SECTION = "net"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=5aac200199fde47501876cba7263cb0c"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e9b64491ec98eb6c6493ac5e4118f107"

reason for the above chksum change? 

>  DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>  
>  inherit autotools systemd
> @@ -12,8 +12,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
>             file://openvpn@.service \
>             file://openvpn-volatile.conf"
>  
> -SRC_URI[md5sum] = "265755044ae88f9249d509f6d061f7e5"
> -SRC_URI[sha256sum] = "2c12fe9ea641ac1291e70322cc500641c84e5903dd4f40bf2eda7e9f209b2f9c"
> +SRC_URI[md5sum] = "0714019e109a043e858278c9e2ca18e0"
> +SRC_URI[sha256sum] = "b24740c9d44a81eaf2befc4846d51445a520104321e32aaf0c135ed2e098a624"
>  
>  SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
>  SYSTEMD_AUTO_ENABLE = "disable"
> -- 
> 1.9.1
> 



