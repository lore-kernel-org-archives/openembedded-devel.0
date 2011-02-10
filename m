Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PnevU-0005ZS-Sc
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 23:23:49 +0100
Received: (qmail invoked by alias); 10 Feb 2011 22:22:42 -0000
Received: from p5DE48E6E.dip.t-dialin.net (EHLO localhost.localdomain)
	[93.228.142.110]
	by mail.gmx.net (mp071) with SMTP; 10 Feb 2011 23:22:42 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19q9wcnOWxqtza5ch0+mBuMVFwKrt+rWzR+4mCdn+
	KmC/wK6kLVKckF
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Feb 2011 23:18:26 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1296688442-22207-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1296688442-22207-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201102102318.26832.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] clutter-gst add 1.3.4
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
X-List-Received-Date: Thu, 10 Feb 2011 22:23:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 03 February 2011 00:14:02 Andreas Mueller wrote:
> * clutter 1.4.2 broke clutter-gst and made it necessary to have a recipe from
> * development snapshot sources
> *
> * Build tested with
> * BB_VERSION        = "1.10.2"
> * METADATA_BRANCH   = "master"
> * METADATA_REVISION = "2049a96"
> * TARGET_ARCH       = "arm"
> * TARGET_OS         = "linux-gnueabi"
> * MACHINE           = "overo"
> * DISTRO            = "angstrom"
> * DISTRO_VERSION    = "2010.7-test-20110202"
> * TARGET_FPU        = "hard"
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  recipes/clutter/clutter-gst_1.3.4.bb |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/clutter/clutter-gst_1.3.4.bb
> 
> diff --git a/recipes/clutter/clutter-gst_1.3.4.bb b/recipes/clutter/clutter-gst_1.3.4.bb
> new file mode 100644
> index 0000000..426cae2
> --- /dev/null
> +++ b/recipes/clutter/clutter-gst_1.3.4.bb
> @@ -0,0 +1,9 @@
> +require clutter-gst.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.3/clutter-gst-${PV}.tar.bz2 \
> +          "
> +
> +SRC_URI[md5sum] = "4f74f78df215cba54444dd6256a29bd4"
> +SRC_URI[sha256sum] = "de4ce6d3313be3074c6afc6f20276ef06f1a460b3a6755fc5c6e048685de137a"
> 

ping


