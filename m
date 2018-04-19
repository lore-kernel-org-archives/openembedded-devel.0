Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E09C2745E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 12:30:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2018 05:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,469,1517904000"; d="scan'208";a="217798480"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO [10.255.139.75])
	([10.255.139.75])
	by orsmga005.jf.intel.com with ESMTP; 19 Apr 2018 05:30:34 -0700
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180419120430.1834-1-costamagnagianfranco@yahoo.it>
	<20180419120430.1834-2-costamagnagianfranco@yahoo.it>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <6c0b43f4-ecd7-3eb3-d927-1cefaefe31bd@intel.com>
Date: Thu, 19 Apr 2018 20:30:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180419120430.1834-2-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: Re: [meta-oe][PATCH 2/2] cpprest: add new recipe based on Debian packaging
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
X-List-Received-Date: Thu, 19 Apr 2018 12:30:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/19/2018 08:04 PM, Gianfranco Costamagna wrote:
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
> ---
>  meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> 
> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> new file mode 100644
> index 000000000..2f5cc6ae6
> --- /dev/null
> +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
> +SECTION = "libs/network"
> +HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${S}/../license.txt;md5=a2e15b954769218ff912468eecd6a02f"
> +DEPENDS = "openssl websocketpp zlib boost"
> +
> +SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master"
> +
> +# tag 2.10.2
> +SRCREV= "fea848e2a77563cf2a6f28f8eab396fd6e787fbf"
> +
> +S = "${WORKDIR}/git/Release"
> +
> +inherit cmake
> +
> +FILES_${PN}-dev += "/usr/lib/cpprestsdk"

This should be ${libdir} instead of /usr/lib.

Thanks,
Anuj

