Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA22788B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 09:53:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBM9r9q4016080
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Dec 2017 01:53:10 -0800 (PST)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 22 Dec 2017 01:53:08 -0800
To: Derek Straka <derek@asterius.io>,
	<openembedded-devel@lists.openembedded.org>
References: <1509554484-22352-1-git-send-email-derek@asterius.io>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <cd040284-bf17-756a-3243-a59ecd609ffd@windriver.com>
Date: Fri, 22 Dec 2017 17:54:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1509554484-22352-1-git-send-email-derek@asterius.io>
X-Originating-IP: [128.224.162.167]
Subject: Re: [meta-python][PATCH] python-automat: add an initial recipe for version 0.6.0
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
X-List-Received-Date: Fri, 22 Dec 2017 09:53:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Derek,

I noticed in Automat's setup.py script:

     setup_requires=[
         'setuptools-scm',
         'm2r',
     ],
     install_requires=[
         "attrs",
         "six",
     ],

Now the installed_requires entry is handled by the RDEPENDS meta data in 
recipe.
How about the setup_requires entry? Do you know how to handle it in recipe?

I'm asking this because when I build python-automat on my host, I met 
do_compile error because of being able to download the m2r and 
setuptools-scm.

Ideally, we should be able to compile a recipe out without reaching out 
to the Internet, as long as the recipe's tarball is available in the DL_DIR.

Best Regards,
Chen Qi


On 11/02/2017 12:41 AM, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   meta-python/recipes-devtools/python/python-automat.inc   | 16 ++++++++++++++++
>   .../recipes-devtools/python/python-automat_0.6.0.bb      |  2 ++
>   .../recipes-devtools/python/python3-automat_0.6.0.bb     |  4 ++++
>   3 files changed, 22 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python-automat.inc
>   create mode 100644 meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-automat.inc b/meta-python/recipes-devtools/python/python-automat.inc
> new file mode 100644
> index 0000000..1ac5d3b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-automat.inc
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Self-service finite-state machines for the programmer on the go"
> +HOMEPAGE = "https://github.com/glyph/Automat"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
> +
> +SRC_URI[md5sum] = "ad7bba58d262d8956d732330cb5ef53d"
> +SRC_URI[sha256sum] = "3c1fd04ecf08ac87b4dd3feae409542e9bf7827257097b2b6ed5692f69d6f6a8"
> +
> +PYPI_PACKAGE = "Automat"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "\
> +   ${PYTHON_PN}-attrs \
> +   ${PYTHON_PN}-six \
> +"
> diff --git a/meta-python/recipes-devtools/python/python-automat_0.6.0.bb b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
> new file mode 100644
> index 0000000..8ac8c9c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools
> +require python-automat.inc
> diff --git a/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
> new file mode 100644
> index 0000000..0469e61
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
> @@ -0,0 +1,4 @@
> +inherit setuptools3
> +require python-automat.inc
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-enum "



