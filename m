Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 51E8465CCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:04:06 +0000 (UTC)
Received: (qmail 20894 invoked by uid 1003); 20 Aug 2015 14:04:05 -0000
Received: from unknown (HELO ?192.168.10.72?)
	(philip@opensdr.com@64.134.178.169)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	20 Aug 2015 14:04:04 -0000
To: openembedded-devel@lists.openembedded.org
References: <1438690323-23783-1-git-send-email-philip@balister.org>
From: Philip Balister <philip@balister.org>
Message-ID: <55D5DE52.7000400@balister.org>
Date: Thu, 20 Aug 2015 10:04:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1438690323-23783-1-git-send-email-philip@balister.org>
Subject: Re: [meta-python][PATCH] python-pyro4: Add new recipe.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Aug 2015 14:04:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Any news on this? I just updated my copy of meta-oe and didn't see it.

Philip

On 08/04/2015 08:12 AM, Philip Balister wrote:
> Pyro4 allows remote execution of objects over the network.
> 
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../python-pyro4/python-pyro4_4.39.bb                    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
> 
> diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
> new file mode 100644
> index 0000000..aed0c9c
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Python Remote Objects"
> +HOMEPAGE = "https://pypi.python.org/pypi/Pyro4/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b48b62dd270c4691fabaa85be3236030"
> +
> +SRCNAME = "Pyro4"
> +
> +SRC_URI = "https://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "75ed5cd142803b0a8d587dc8b6bb51ed"
> +SRC_URI[sha256sum] = "39c6ca7f86b0f0bebfeada687a5a8b99f66470a52b0f815195ae63c683266f24"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> 

