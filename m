Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD917F944
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 02:45:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,249,1569254400"; d="scan'208";a="77717238"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 10:45:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C61E34CE1510
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:37:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.439.0; Thu, 31 Oct 2019 10:45:25 +0800
From: zangrc <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
References: <20191031024158.14123-1-zangrc.fnst@cn.fujitsu.com>
Message-ID: <803afae6-a6b4-63e7-1554-c562099bb740@cn.fujitsu.com>
Date: Thu, 31 Oct 2019 10:45:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191031024158.14123-1-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: C61E34CE1510.A6A9F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-python] [PATCH] python-simplejson: enable native and nativesdk
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
X-List-Received-Date: Thu, 31 Oct 2019 02:45:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I found that native and nativesdk are enabled in the bb file in the 
meta-python/recipe-devtools directory, but some do not. I want to unify 
them to enable native and nativesdk. Do you think this is okay?

On 10/31/19 10:41 AM, Zang Ruochen wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>   meta-python/recipes-devtools/python/python-simplejson.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
> index 3d36f9608..5592eaf3d 100644
> --- a/meta-python/recipes-devtools/python/python-simplejson.inc
> +++ b/meta-python/recipes-devtools/python/python-simplejson.inc
> @@ -21,3 +21,5 @@ FILES_${PN}-tests+= " \
>       ${PYTHON_SITEPACKAGES_DIR}/simplejson/tests \
>       ${PYTHON_SITEPACKAGES_DIR}/simplejson/tool.py* \
>   "
> +
> +BBCLASSEXTEND = "native nativesdk"



