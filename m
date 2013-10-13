Return-Path: <heinold@inf.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE656CD1B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 18:42:34 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1) with esmtp
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1VVQcb-002jtQ-VG>; Sun, 13 Oct 2013 20:42:34 +0200
Received: from f052065049.adsl.alicedsl.de ([78.52.65.49]
	helo=mail.zedat.fu-berlin.de)
	by inpost2.zedat.fu-berlin.de (Exim 4.80.1) with esmtpsa
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1VVQcb-0043dF-Mb>; Sun, 13 Oct 2013 20:42:33 +0200
Date: Sun, 13 Oct 2013 20:42:28 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131013184228.GA24278@mail.zedat.fu-berlin.de>
References: <1381683834-9439-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1381683834-9439-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: 78.52.65.49
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] python-pip: add 1.3.1
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
X-List-Received-Date: Sun, 13 Oct 2013 18:42:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 13, 2013 at 07:03:54PM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-devtools/python/python-pip_1.3.1.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> 
> diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> new file mode 100644
> index 0000000..7ab3bd8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hi,

isn't pip

A tool for installing and managing Python packages.

instead of a webserver?


Bye Henning
> +LICENSE = "MIT & GPL"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd00425a3465a0e4c81929b94241d3de"
> +
> +SRC_URI = "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar.gz"
> +SRC_URI[md5sum] = "cbb27a191cebc58997c4da8513863153"
> +SRC_URI[sha256sum] = "145eaa5d1ea1b062663da1f3a97780d7edea4c63c68a37c463b1deedf7bb4957"
> +
> +S = "${WORKDIR}/pip-${PV}"
> +
> +inherit setuptools
> +
> +# Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
> +RDEPENDS_${PN} = "python-modules"
> -- 
> 1.8.3.1
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

