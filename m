Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96F9471B69
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Feb 2018 02:29:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1C2Th1v024228
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 11 Feb 2018 18:29:44 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.240) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 11 Feb 2018 18:29:33 -0800
To: Joshua Watt <jpewhacker@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180211215129.9564-1-JPEWhacker@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <cec3c422-d010-3292-aafd-94e77f1ac44d@windriver.com>
Date: Mon, 12 Feb 2018 10:30:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180211215129.9564-1-JPEWhacker@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-networking][PATCH] waf-samba.bbclass: No longer inherit waf.bbclass
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
X-List-Received-Date: Mon, 12 Feb 2018 02:29:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 02/12/2018 05:51 AM, Joshua Watt wrote:
> waf-samba.bbclass uses waf in a very different way than the "standard"
> method that waf.bbclass targets and ends getting very little useful
> functionality from that class.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta-networking/classes/waf-samba.bbclass | 29 +++++++++++++++++++++++++++--
>   1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
> index e49017624..4b1499fd4 100644
> --- a/meta-networking/classes/waf-samba.bbclass
> +++ b/meta-networking/classes/waf-samba.bbclass
> @@ -1,7 +1,7 @@
>   # waf is a build system which is used by samba related project.
>   # Obtain details from https://wiki.samba.org/index.php/Waf
> -#
> -inherit qemu pythonnative waf
> +#
> +inherit qemu pythonnative
>   
>   DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python"
>   
> @@ -21,6 +21,31 @@ CONFIGUREOPTS = " --prefix=${prefix} \
>                     ${PACKAGECONFIG_CONFARGS} \
>                   "
>   
> +# avoids build breaks when using no-static-libs.inc
> +DISABLE_STATIC = ""
> +
> +def get_waf_parallel_make(d):
> +    pm = d.getVar('PARALLEL_MAKE')
> +    if pm:
> +        # look for '-j' and throw other options (e.g. '-l') away
> +        # because they might have different meaning in bjam
> +        pm = pm.split()
> +        while pm:
> +            v = None
> +            opt = pm.pop(0)
> +            if opt == '-j':
> +                v = pm.pop(0)
> +            elif opt.startswith('-j'):
> +                v = opt[2:].strip()
> +            else:
> +                v = None

The "else:" block isn't needed ? The first line already set v to None.

// Robert

> +
> +            if v:
> +                v = min(64, int(v))
> +                return '-j' + str(v)
> +
> +    return ""
> +
>   # Three methods for waf cross compile:
>   # 1. answers:
>   #    Only --cross-answers - try the cross-answers file, and if
> 

