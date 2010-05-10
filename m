Received: from p3plsmtpa01-03.prod.phx3.secureserver.net ([72.167.82.83])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1OBIeA-0001aR-L3
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 04:23:07 +0200
Received: (qmail 16787 invoked from network); 10 May 2010 02:12:32 -0000
Received: from unknown (209.242.7.154)
	by p3plsmtpa01-03.prod.phx3.secureserver.net (72.167.82.83) with ESMTP;
	10 May 2010 02:12:32 -0000
Message-ID: <4BE76B85.8070500@mwester.net>
Date: Sun, 09 May 2010 21:12:21 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1273368260-12668-1-git-send-email-hvontres@gmail.com>
In-Reply-To: <1273368260-12668-1-git-send-email-hvontres@gmail.com>
X-SA-Exim-Connect-IP: 72.167.82.83
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] slugos-image: fix opkg-cl hanging on installing device	tables
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
X-List-Received-Date: Mon, 10 May 2010 02:23:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Henry von Tresckow wrote:
> opkg-cl was hanging during slugos image builds due to opkg-cl waiting for an answer for overwriting the device tables.
> adding " -force-defaults" to IPKG_ARGS allows the image to build

This is fixing a symptom, not the real problem.  I've just committed a
SlugOS-specific fix that dodges this problem, so I don't recommend we
apply this.  Specifically, we *do* want to know if we're overwriting a
config file while building the rootfs so that we can use a
PREFERRED_PROVIDER or similar mechanism to select the correct one.

The root cause is the original commit a week or two ago that incorrectly
changed the handling of the device_table file.

The "fix" I committed "backs out" one line of that bad commit in a
SlugOS-specific recipe -- which isn't a fix, but at least it gets SlugOS
building again, is no worse than things were originally, and it affects
no other distros.

-Mike (mwester)

> Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
> ---
>  recipes/images/slugos-image.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/images/slugos-image.inc b/recipes/images/slugos-image.inc
> index 6a4b7b9..809459c 100644
> --- a/recipes/images/slugos-image.inc
> +++ b/recipes/images/slugos-image.inc
> @@ -23,3 +23,5 @@ IMAGE_LINGUAS = ""
>  IMAGE_PREPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/?Image*;"
>  
>  inherit image
> +
> +IPKG_ARGS += " -force-default"
> \ No newline at end of file



