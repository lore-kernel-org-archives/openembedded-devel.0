Return-Path: <fw@javox-solutions.com>
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
	[134.119.228.105])
	by mail.openembedded.org (Postfix) with ESMTP id C85AF77CD8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:38:09 +0000 (UTC)
Received: from [87.78.181.177] (helo=[192.168.178.95])
	by smtprelay07.ispgateway.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES128-SHA:128) (Exim 4.84)
	(envelope-from <fw@javox-solutions.com>) id 1cxrJR-0008Sb-HU
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Apr 2017 10:38:09 +0200
To: openembedded-devel@lists.openembedded.org
References: <20170410213119.18504-1-andrej.rode@ettus.com>
From: Florian Wickert <fw@javox-solutions.com>
Message-ID: <13e5962a-41bc-c785-da98-04d46004cf52@javox-solutions.com>
Date: Tue, 11 Apr 2017 10:36:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170410213119.18504-1-andrej.rode@ettus.com>
X-Df-Sender: ZndAamF2b3gtc29sdXRpb25zLmNvbQ==
Subject: Re: [meta-python][PATCH v2] systemd-python: add a new recipe
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
X-List-Received-Date: Tue, 11 Apr 2017 08:38:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I suggest to use DEPENDS += "systemd (<=234)" to enforce version 
checking against systemd for this recipe.
License is LICENSE = "LGPLv2.1+" from what I see on github.
Also, since you are using ${PYTHON_PN} already, it would be good to have 
both python 2 & 3 recipes.


On 04/10/2017 11:31 PM, Andrej Rode wrote:
> Adds new recipe for python-systemd, python bindings for libsystemd
>
> Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> ---
>   meta-python/recipes-devtools/python/python-systemd_234.bb | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python-systemd_234.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-systemd_234.bb b/meta-python/recipes-devtools/python/python-systemd_234.bb
> new file mode 100644
> index 0000000..4eb2170
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-systemd_234.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "Python interface for libsystemd"
> +HOMEPAGE = "https://github.com/systemd/python-systemd"
> +LICENSE = "LGPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
> +
> +PYPI_PACKAGE = "systemd-python"
> +DEPENDS += "systemd"
> +RDEPENDS_${PN} += "systemd"
> +inherit pypi setuptools
> +
> +SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
> +SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"


