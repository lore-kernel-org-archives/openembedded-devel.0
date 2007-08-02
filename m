Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IGYKL-0001Dw-BV
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 12:54:45 +0200
Received: from pd9538c5f.dip0.t-ipconnect.de ([217.83.140.95]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IGYIN-0008Jb-MJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 12:52:44 +0200
Message-ID: <46B1B6DB.6020603@klever.net>
Date: Thu, 02 Aug 2007 12:50:03 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.5 (X11/20070731)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
In-Reply-To: <46B1753D.1090507@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.1
Subject: Re: Gstreamer and rpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2007 10:54:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


I don't know much about gstreamer, but being inventor of
OE_LT_RPATH_ALLOW I felt obliged to look into gst-plugins.inc and I'm
guessing it should be:

OE_LT_RPATH_ALLOW=":${libdir}/gstreamer-${LIBV}:"

instead of "any".

Love,
H

Koen Kooi wrote:
> Hi,
> 
> There were some report about gstreamer not finding plugins and Cliff Brake reported that
> frobbing OE_LT_RPATH_ALLOW helped:
> 
> ============================================================
> --- packages/gstreamer/gst-common.inc   27ceb74f764523f7d0708087bd16ae8a3627c39e
> +++ packages/gstreamer/gst-common.inc   860249c91df6da7ad81a6dffba9d5529cc114c67
> @@ -7,6 +7,9 @@ inherit autotools pkgconfig
> 
>  inherit autotools pkgconfig
> 
> +OE_LT_RPATH_ALLOW = "any"
> +OE_LT_RPATH_ALLOW[export]="1"
> +
>  do_stage() {
>      rm -rf ${STAGE_TEMP}
>      mkdir -p ${STAGE_TEMP}
> ============================================================
> --- packages/gstreamer/gst-plugins.inc  6293327f294676ab88b8ec6b36906d0113b3566a
> +++ packages/gstreamer/gst-plugins.inc  5dc5a74a21bc2ea4d9870acdac9615b821137cec
> @@ -10,6 +10,9 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
> 
>  acpaths = "-I ${S}/common/m4 -I ${S}/m4"
> 
> +OE_LT_RPATH_ALLOW = "any"
> +OE_LT_RPATH_ALLOW[export]="1"
> +
>  LIBV = "0.10"
> 
>  python populate_packages_prepend () {
> 
> 
> Could someone more familiar with gstreamer and/or the OE_LT_RPATH_ALLOW syntax make this
> more finegrained?
> 
> regards,
> 
> Koen

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


