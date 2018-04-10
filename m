Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36E7C6011C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:29:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 17:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,429,1517904000"; d="scan'208";a="190145257"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO [10.221.20.111])
	([10.221.20.111])
	by orsmga004.jf.intel.com with ESMTP; 09 Apr 2018 17:29:07 -0700
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
	<1523319756-8431-4-git-send-email-akuster808@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <e944f201-cbc6-41e2-5efe-6c3e430bef92@intel.com>
Date: Tue, 10 Apr 2018 08:29:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523319756-8431-4-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][PATCH 04/10] libreport: add PACKCONFIG for gtk
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
X-List-Received-Date: Tue, 10 Apr 2018 00:29:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/10/2018 08:22 AM, Armin Kuster wrote:
> needed when no X11 in DISTRO_FEATURES
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-extended/libreport/libreport_2.9.2.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
> index 525437b..e963014 100644
> --- a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
> +++ b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "https://abrt.readthedocs.org/"
>  LICENSE = "GPLv2+"
>  DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
>          json-c libtar libnewt libproxy rpm \
> -        augeas satyr systemd gtk+3 \
> +        augeas satyr systemd \
>  "
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> @@ -26,6 +26,9 @@ REQUIRED_DISTRO_FEATURES = "systemd"
>  
>  inherit gettext autotools python3native pkgconfig
>  
> +PACKAGECONFIGS ??= "${@bb.utils.contains('DISTRO_FEATURES','x11','gtk','',d)}"

Typo? Should be PACKAGECONFIG.

