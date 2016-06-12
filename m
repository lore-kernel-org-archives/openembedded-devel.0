Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6B16E688
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jun 2016 09:57:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C9vq41029053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jun 2016 02:57:52 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 02:57:51 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1465287700-18359-1-git-send-email-liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <575D321E.6010308@windriver.com>
Date: Sun, 12 Jun 2016 17:57:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465287700-18359-1-git-send-email-liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/2] nginx: add group www-data
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
X-List-Received-Date: Sun, 12 Jun 2016 09:57:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Sorry, please hold on the two patches, base-passwd does provide
www-data, I should not meet this orror in theory.

// Robert

On 06/07/2016 04:21 PM, Robert Yang wrote:
> Fixed:
> Running useradd commands...
> useradd: group 'www-data' does not exist
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index ebf926a..946db12 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -130,6 +130,7 @@ INITSCRIPT_NAME = "nginx"
>   INITSCRIPT_PARAMS = "defaults 92 20"
>
>   USERADD_PACKAGES = "${PN}"
> +GROUPADD_PARAM_${PN} = "--system www-data"
>   USERADD_PARAM_${PN} = " \
>       --system --no-create-home \
>       --home ${NGINX_WWWDIR} \
>

