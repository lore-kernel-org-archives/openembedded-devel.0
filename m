Received: from smtpauth12.prod.mesa1.secureserver.net ([64.202.165.35])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Q8vme-00066T-6p
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 16:38:36 +0200
Received: (qmail 14807 invoked from network); 10 Apr 2011 14:29:43 -0000
Received: from unknown (209.242.7.132)
	by smtpauth12.prod.mesa1.secureserver.net (64.202.165.35) with ESMTP;
	10 Apr 2011 14:29:43 -0000
Message-ID: <4DA1BED3.1040205@mwester.net>
Date: Sun, 10 Apr 2011 09:29:39 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ilt2d9$sr2$1@dough.gmane.org>	<1302106343-5331-1-git-send-email-Martin.Jansa@gmail.com>
	<1302106343-5331-3-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1302106343-5331-3-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv2 3/3] generate-packages-dynamic-list: contrib script to generate disjunctive PACKAGES_DYNAMIC for each pack	base/good/bad/ugly
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
X-List-Received-Date: Sun, 10 Apr 2011 14:38:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 4/6/2011 11:12 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  .../gstreamer/generate-packages-dynamic-list.sh    |   60 ++++++++++++++++++++
>  1 files changed, 60 insertions(+), 0 deletions(-)
>  create mode 100755 contrib/gstreamer/generate-packages-dynamic-list.sh
> 
> diff --git a/contrib/gstreamer/generate-packages-dynamic-list.sh b/contrib/gstreamer/generate-packages-dynamic-list.sh
> new file mode 100755
> index 0000000..932aca4
> --- /dev/null
> +++ b/contrib/gstreamer/generate-packages-dynamic-list.sh
> @@ -0,0 +1,60 @@
> +#!/bin/sh
> +
> +# PATH to tmpdir
> +TMPDIR=tmp
> +
> +if [ $# -lt 1 ] ; then
> +  echo "Usage: $0 path/to/recipe.bb"
> +  exit 1
> +fi
> +
> +if [ $# -eq 2 ] ; then
> +  TMPDIR=$2
> +fi
> +
> +if [ ! -d ${TMPDIR} ] ; then
> +  echo "TMPDIR '${TMPDIR}' does not exist, update TMPDIR in script or use 2nd parameter"
> +  exit 2
> +fi
> +
> +RECIPE=$1
> +
> +if grep PACKAGES_DYNAMIC ${RECIPE} >/dev/null; then
> +  echo "${RECIPE} already has PACKAGES_DYNAMIC defined, please remove it first"
> +  exit 3
> +fi
> +
> +# force old behavior spliting all
> +echo 'PACKAGES_DYNAMIC = "gst-plugin-*"' >> ${RECIPE}
> +
> +echo "Cleaning ${RECIPE}"
> +# don't know better way to get right WORKDIR from shell, we need to clean it anyways
> +WORKDIR=`bitbake -c clean -v -b ${RECIPE} | grep "NOTE: removing work" | sed 's/NOTE: removing //g'`
> +
> +TMPDIR_PKGS=${TMPDIR}/${WORKDIR}/packages-split/
> +echo "Packages are expected in ${TMPDIR_PKGS}"
> +
> +echo "Building ${RECIPE}"
> +# -c build because some people use rm_work
> +bitbake -c build -b ${RECIPE}
> +
> +if [ $? -ne 0 ] ; then
> +  echo "${RECIPE} build failed, fix build first"
> +  sed -i '/^PACKAGES_DYNAMIC = "gst-plugin-\*"$/d' ${RECIPE}
> +  exit 4
> +fi
> +
> +
> +if ls -1d ${TMPDIR_PKGS}/gst-plugin-*-dev | grep gst-plugin-.*-dev >/dev/null; then
> +  # replace temporary PACKAGES_DYNAMIC spliting all with list of created packages
> +  sed -i '/^PACKAGES_DYNAMIC = "gst-plugin-\*"$/d' ${RECIPE}
> +  echo '' >> ${RECIPE}
> +  echo 'PACKAGES_DYNAMIC = "\' >> ${RECIPE}
> +  ls -1d ${TMPDIR_PKGS}/gst-plugin-*-dev | grep gst-plugin-.*-dev| sed "s#${TMPDIR_PKGS}/\(.*\)-dev#\1* \\\#g" >> ${RECIPE}
> +  echo '"' >> ${RECIPE}
> +  echo "${RECIPE} PACKAGES_DYNAMIC were hopefully updated"
> +else
> +  echo "No directories found ${TMPDIR_PKGS}/gst-plugin-*-dev"
> +  exit 5
> +fi
> +



