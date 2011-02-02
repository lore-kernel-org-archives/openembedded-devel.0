Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Pkm79-0003lC-4p
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 00:27:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 99DDAA5131
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 23:27:00 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id gd8-eJs54ctz
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 23:27:00 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id DDC21A512E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 23:26:59 +0000 (GMT)
Message-ID: <4D49E878.2000703@xora.org.uk>
Date: Wed, 02 Feb 2011 23:27:52 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296688442-22207-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1296688442-22207-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.1.1
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
X-List-Received-Date: Wed, 02 Feb 2011 23:27:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I think we should probably get Andreas tooled up with commit access.

Graeme

On 02/02/2011 23:14, Andreas Mueller wrote:
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



