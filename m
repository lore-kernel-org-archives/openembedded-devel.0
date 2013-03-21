Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UInxv-0003M2-0g
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 23:28:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2LMBClh023448
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 15:11:13 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 21 Mar 2013 15:11:12 -0700
Message-ID: <514B857F.2000400@windriver.com>
Date: Thu, 21 Mar 2013 17:11:11 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1363902391-29945-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1363902391-29945-1-git-send-email-kergoth@gmail.com>
Subject: Re: [meta-networking][danny][PATCH] layer.conf: Use .= for adding to BBPATH and += to BBFILES
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
X-List-Received-Date: Thu, 21 Mar 2013 22:28:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/21/13 4:46 PM, Christopher Larson wrote:
> From: Andrei Gherzan <andrei.gherzan@windriver.com>
>
> Fixes parsing errors which is appearing after this commit to
> meta-openembedded
>
> http://cgit.openembedded.org/meta-openembedded/commit/?id=3c21a46020bd0816579648f684c41dbd6333583e
>
> This triggers
> exception NameError: name 'base_contains' is not defined
> without this change
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   meta-networking/conf/layer.conf | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
> index f26a172..1ea2bc2 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -1,9 +1,9 @@
>   # We have a conf and classes directory, add to BBPATH
> -BBPATH := "${BBPATH}:${LAYERDIR}"
> +BBPATH .= ":${LAYERDIR}"
>
>   # We have a packages directory, add to BBFILES
> -BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
> - ${LAYERDIR}/recipes-*/*/*.bbappend"
> +BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
> +            ${LAYERDIR}/recipes-*/*/*.bbappend"
>
>   BBFILE_COLLECTIONS += "networking"
>   BBFILE_PATTERN_networking := "^${LAYERDIR}/"
>

Don't those two have to be ":=" so that 'LAYERDIR' is immediately evaluated? 
LAYERDIR changes depending on which layer is currently being processed.

--Mark


