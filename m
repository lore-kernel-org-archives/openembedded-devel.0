Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7608F7DD6A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 11:25:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2019 03:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,331,1571727600"; d="scan'208";a="298687078"
Received: from brzodkie-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.172])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2019 03:25:41 -0800
To: openembedded-devel@lists.openembedded.org
References: <20191218201337.78070-1-peter.kolbus@garmin.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c7378418-7972-1ef4-a52f-735e02ee2851@intel.com>
Date: Thu, 19 Dec 2019 11:25:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218201337.78070-1-peter.kolbus@garmin.com>
Subject: Re: [meta-python][PATCH] python(3)-requests: add DEPENDS_class-native
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
X-List-Received-Date: Thu, 19 Dec 2019 11:25:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 18/12/2019 20:13, Peter Kolbus wrote:
> Change-Id: Ie8bd80d56da599b29430da65b303d69bba43fdda
> ---
>   .../recipes-devtools/python/python-requests.inc        | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
> index 5fe5dc21f..ea2983821 100644
> --- a/meta-python/recipes-devtools/python/python-requests.inc
> +++ b/meta-python/recipes-devtools/python/python-requests.inc
> @@ -23,6 +23,16 @@ RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-idna \
>   "
>   
> +DEPENDS_class-native += " \
> +    ${PYTHON_PN}-ndg-httpsclient-native \
> +    ${PYTHON_PN}-pyasn1-native \
> +    ${PYTHON_PN}-pyopenssl-native \
> +    ${PYTHON_PN}-pysocks-native \
> +    ${PYTHON_PN}-urllib3-native \
> +    ${PYTHON_PN}-chardet-native \
> +    ${PYTHON_PN}-idna-native \

Why would you ned to do this?

Ross

