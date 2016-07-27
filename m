Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0386FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 05:46:33 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id AE57468A01C; Wed, 27 Jul 2016 06:46:32 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 3E7D668A019;
	Wed, 27 Jul 2016 06:46:30 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id DF2DE6740075;
	Wed, 27 Jul 2016 07:46:29 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <20160727030338.15620-1-Qi.Chen@windriver.com>
	<20160727030338.15620-2-Qi.Chen@windriver.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57984AB5.6060105@mlbassoc.com>
Date: Wed, 27 Jul 2016 07:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160727030338.15620-2-Qi.Chen@windriver.com>
Subject: Re: [meta-python][PATCH 2/3] python3-pip: add recipe
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
X-List-Received-Date: Wed, 27 Jul 2016 05:46:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-27 05:03, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pip_8.1.2.bb | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pip_8.1.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pip_8.1.2.bb b/meta-python/recipes-devtools/python/python3-pip_8.1.2.bb
> new file mode 100644
> index 0000000..612ba7d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pip_8.1.2.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "PIP is a tool for installing and managing Python packages"
> +LICENSE = "MIT & LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
> +
> +SRC_URI[md5sum] = "87083c0b9867963b29f7aba3613e8f4a"
> +SRC_URI[sha256sum] = "4d24b03ffa67638a3fa931c09fd9e0273ffa904e95ebebe7d4b1a54c93d7b732"
> +
> +inherit pypi setuptools3
> +
> +# Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
> +RDEPENDS_${PN} = "python3-modules python3-setuptools"
> +
> +BBCLASSEXTEND = "nativesdk"
>

Why is this here, since it is already in OE-core?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

