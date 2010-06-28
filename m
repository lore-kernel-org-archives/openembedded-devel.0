Received: from woodbine.london.02.net ([87.194.255.145])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1OTMNK-0006Hq-Th
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 00:00:27 +0200
Received: from shodan.localnet (93.96.131.185) by woodbine.london.02.net
	(8.5.124.03)
	id 4C1F9803002B0FAF for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 22:55:33 +0100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jun 2010 22:55:32 +0100
User-Agent: KMail/1.13.3 (Linux/2.6.32-22-generic; KDE/4.4.4; i686; ; )
References: <1277675827.4745.311.camel@lenovo.internal.reciva.com>
	<1277677032-20016-2-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1277677032-20016-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Message-Id: <201006282255.32860.bluelightning@bluelightning.org>
X-SA-Exim-Connect-IP: 87.194.255.145
X-SA-Exim-Mail-From: bluelightning@bluelightning.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] opie-taskbar-images: fix RPROVIDES
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
X-List-Received-Date: Mon, 28 Jun 2010 22:00:27 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Acked-by: Paul Eggleton <bluelightning@bluelightning.org>

On Sun, 27 Jun 2010, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes/opie-taskbar/opie-taskbar-images.inc |   10 +++++++++-
>  1 files changed, 9 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/opie-taskbar/opie-taskbar-images.inc
> b/recipes/opie-taskbar/opie-taskbar-images.inc index 9f73d31..3e1a8c8
> 100644
> --- a/recipes/opie-taskbar/opie-taskbar-images.inc
> +++ b/recipes/opie-taskbar/opie-taskbar-images.inc
> @@ -2,7 +2,6 @@ DESCRIPTION = "Opie Launcher and Taskbar"
>  SECTION = "opie/base"
>  PRIORITY = "optional"
>  LICENSE = "GPL"
> -RPROVIDES_${PN} = "${PN}"
>  APPNAME = "qpe"
> 
>  S = "${WORKDIR}/pics"
> @@ -61,3 +60,12 @@ python do_package_prepend () {
> 
>  PACKAGE_ARCH = "all"
>  PACKAGES = "${PN}-dbg ${PN}-320x480 ${PN}-480x320 ${PN}-480x640
> ${PN}-640x480 ${PN}-800x600 ${PN}-600x800 ${PN}-320x240 ${PN}-240x320
> ${PN}-320x320" +RPROVIDES_${PN}-320x480 = "opie-taskbar-images"
> +RPROVIDES_${PN}-480x320 = "opie-taskbar-images"
> +RPROVIDES_${PN}-480x640 = "opie-taskbar-images"
> +RPROVIDES_${PN}-640x480 = "opie-taskbar-images"
> +RPROVIDES_${PN}-800x600 = "opie-taskbar-images"
> +RPROVIDES_${PN}-600x800 = "opie-taskbar-images"
> +RPROVIDES_${PN}-320x240 = "opie-taskbar-images"
> +RPROVIDES_${PN}-240x320 = "opie-taskbar-images"
> +RPROVIDES_${PN}-320x320 = "opie-taskbar-images"



