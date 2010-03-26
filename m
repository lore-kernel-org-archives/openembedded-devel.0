Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NvHa9-0001gW-3H
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 23:00:45 +0100
Received: from p5b036e7d.dip.t-dialin.net ([91.3.110.125] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NvHX2-0001Wu-RM by authid <stefan@sostec.de> with cram_md5;
	Fri, 26 Mar 2010 22:57:35 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>)
	id 1NvHX1-0005ZC-Nb; Fri, 26 Mar 2010 22:57:31 +0100
Date: Fri, 26 Mar 2010 22:57:31 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100326215731.GE18337@excalibur.local>
References: <n> <1266857650-5557-1-git-send-email-michael.lippautz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1266857650-5557-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael Lauer <mickey@vanille-media.de>
Subject: Re: [PATCH] python-setuptools: Version bump to 0.6c11
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
X-List-Received-Date: Fri, 26 Mar 2010 22:00:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Mickey, do you have a moment to review and comment on this python related patch?

regards
Stefan Schmidt

On Mon, 2010-02-22 at 17:54, Michael Lippautz wrote:
> * Adds python module 'pkg_resources'.
> 
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  .../python-setuptools/fix-log-usage-0.6c11.patch   |   18 ++++++++++++++++
>  recipes/python/python-setuptools_0.6c11.bb         |   22 ++++++++++++++++++++
>  2 files changed, 40 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/python/python-setuptools/fix-log-usage-0.6c11.patch
>  create mode 100644 recipes/python/python-setuptools_0.6c11.bb
> 
> diff --git a/recipes/python/python-setuptools/fix-log-usage-0.6c11.patch b/recipes/python/python-setuptools/fix-log-usage-0.6c11.patch
> new file mode 100644
> index 0000000..b860700
> --- /dev/null
> +++ b/recipes/python/python-setuptools/fix-log-usage-0.6c11.patch
> @@ -0,0 +1,18 @@
> +--- a/setuptools/command/sdist.py	2010-02-22 14:57:56.000000000 +0100
> ++++ b/setuptools/command/sdist.py	2010-02-22 14:57:31.000000000 +0100
> +@@ -1,6 +1,5 @@
> + from distutils.command.sdist import sdist as _sdist
> + from distutils.util import convert_path
> +-from distutils import log
> + from glob import glob
> + import os, re, sys, pkg_resources
> + 
> +@@ -94,7 +93,7 @@
> +         try: svnver = int(data.splitlines()[0])
> +         except: pass
> +         if svnver<8:
> +-            log.warn("unrecognized .svn/entries format in %s", dirname)
> ++            print("unrecognized .svn/entries format in %s", dirname)
> +             return           
> +         for record in map(str.splitlines, data.split('\n\x0c\n')[1:]):
> +             if not record or len(record)>=6 and record[5]=="delete":
> diff --git a/recipes/python/python-setuptools_0.6c11.bb b/recipes/python/python-setuptools_0.6c11.bb
> new file mode 100644
> index 0000000..bccafa4
> --- /dev/null
> +++ b/recipes/python/python-setuptools_0.6c11.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
> +HOMEPAGE = "http://cheeseshop.python.org/pypi/setuptools"
> +SECTION = "devel/python"
> +PRIORITY = "optional"
> +LICENSE = "MIT"
> +DEPENDS_${PN}-native = "python-native"
> +RDEPENDS_${PN} = "python-distutils python-compression"
> +PR = "ml3"
> +
> +SRC_URI = "\
> +  http://cheeseshop.python.org/packages/source/s/setuptools/${SRCNAME}-${PV}.tar.gz;name=setuptools \
> +  file://fix-log-usage-0.6c11.patch;patch=1 \
> +"
> +SRC_URI[setuptools.md5sum] = "7df2a529a074f613b509fb44feefe74e"
> +SRC_URI[setuptools.sha256sum] = "630fea9b726320b73ee3ca6ff61732cb32675b0389be658080fe46383b87a1d3"
> +
> +SRCNAME = "setuptools"
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit distutils
> +
> +BBCLASSEXTEND = "native"
> -- 
> 1.6.4.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


