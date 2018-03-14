Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id 040EB78645
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2018 04:28:01 +0000 (UTC)
Received: from [192.168.4.128] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id 355CA1F49
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2018 00:28:02 -0400 (EDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 355CA1F49
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 355CA1F49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1521001682;
	bh=LFsEVAQUn9v0tCKiCvtGaRN9MsWgHao+Pw/R6yyyPFg=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=t82l3eEb7oNPh+oRAZiy2ykA6sRjMsBfU2ln5BQzfbCqnMBr9FfYDORiHNijBT0/X
	PIbNZ2697PJ7EZGmxW+4ZEqKP/wpfbYtH2yiuxPp43iB5YdnLyNbDo/jDOWRMPSiS8
	uMsMpl54v31E2qe5vW71R3dwqr+v5ESJcuG/sYsE=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.3 at mail.thecshore.com
To: openembedded-devel@lists.openembedded.org
References: <20180314021510.175365-1-joe.slater@windriver.com>
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <04bb9014-399d-5dee-772d-e4bc24b5ad02@thecshore.com>
Date: Wed, 14 Mar 2018 00:28:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180314021510.175365-1-joe.slater@windriver.com>
Subject: Re: [meta-oe][PATCH 1/1] hostapd: not compatible with openssl-no-weak-ciphers
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
X-List-Received-Date: Wed, 14 Mar 2018 04:28:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2018-03-13 10:15 PM, Joe Slater wrote:
> Use CONFLICT_DISTRO_FEATURES to not build if des is not supported.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
> index c3a1ead..54c9e79 100644
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
> @@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://${B}/README;md5=8aa4e8c78b59b12016c4cb2d0a8db350"
>   DEPENDS = "libnl openssl"
>   SUMMARY = "User space daemon for extended IEEE 802.11 management"
>   
> -inherit update-rc.d systemd
> +inherit update-rc.d systemd distro_features_check
> +
> +CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
> +
>   INITSCRIPT_NAME = "hostapd"
>   
>   SYSTEMD_SERVICE_${PN} = "hostapd.service"
> 

Doesn't hostapd have the option of building with an internal encryption 
'library' for at least some parts, so openssl is not necessarily 
required (hence the conflict would be erroneous if a strong openssl were 
used along with internal hostapd)?  At least it seems OpenWrt has an 
option to build at least some hostapd functionality without openssl...

Regards,

Daniel

