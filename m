Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OLjgj-0006V1-Qd
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 23:16:55 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L3N00JVXXKF2669@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	07 Jun 2010 16:12:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3569914AF60; Mon,
	07 Jun 2010 17:12:15 -0400 (EDT)
Date: Mon, 07 Jun 2010 17:12:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100607211215.GB10985@denix.org>
References: <1275771871-5163-1-git-send-email-matgnt@gmail.com>
	<1275771871-5163-2-git-send-email-matgnt@gmail.com>
MIME-version: 1.0
In-reply-to: <1275771871-5163-2-git-send-email-matgnt@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] qt4: Add qt4-tools-native_4.7.0-beta1
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
X-List-Received-Date: Mon, 07 Jun 2010 21:16:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Jun 05, 2010 at 11:04:30PM +0200, Matthias G??nther wrote:
> ---

Please add your own Signed-off-by line...

Acked-by: Denys Dmytriyenko <denis@denix.org>

>  recipes/qt4/qt4-tools-native_4.7.0-beta1.bb |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
> 
> diff --git a/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
> new file mode 100644
> index 0000000..5d3f55c
> --- /dev/null
> +++ b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
> @@ -0,0 +1,12 @@
> +DEFAULT_PREFERENCE = "-1"
> +
> +require qt4-tools-native.inc
> +LICENSE = "LGPLv2.1 GPLv3"
> +PR = "${INC_PR}.0"
> +
> +EXTRA_OECONF += " -no-fast -silent -no-rpath"
> +
> +TOBUILD := "src/tools/bootstrap ${TOBUILD}"
> +
> +SRC_URI[md5sum] = "128dae41b23bb427b735548c7864703a"
> +SRC_URI[sha256sum] = "1107de986e4dda7795d094a2a3b5d85027d780b9b63e9860957cb1d6c56c8929"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


