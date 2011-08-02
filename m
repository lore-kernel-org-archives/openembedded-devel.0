Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qo4tP-0000IB-1o
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 04:39:39 +0200
Received: by pzk1 with SMTP id 1so12406942pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Aug 2011 19:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=H1DZnXGrzKZYzXuRciAJdZ7fnrmsCU9v/R1PiIt+DSw=;
	b=mJGO58H2IJBOSmONUQigA2/PCpvuJQMliVruVphPq1HlH6dwp6KCd5C/+tYZzE7kWv
	qxOZ3Bm8z2LUzB7eOwBts2IC7CeCZnb38dCNEdJI8157eKwRpAWCng9WFGhPAt8gyBwm
	VZKLjpHagAFZToT/lO0LvF5l9rsjtEakrouqo=
Received: by 10.68.13.135 with SMTP id h7mr8996134pbc.326.1312252517539;
	Mon, 01 Aug 2011 19:35:17 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v2sm5983631pbi.3.2011.08.01.19.35.16
	(version=SSLv3 cipher=OTHER); Mon, 01 Aug 2011 19:35:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 01 Aug 2011 19:35:15 -0700
Message-ID: <2217747.GCqkKhOu6O@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <1312232577-7948-2-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
	<1312232577-7948-2-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
Subject: Re: [meta-oe 01/19] meta-xfce: Add layer information
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
X-List-Received-Date: Tue, 02 Aug 2011 02:39:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 01, 2011 11:02:39 PM Andreas Mueller wrote:
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  meta-xfce/conf/layer.conf |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>  create mode 100644 meta-xfce/conf/layer.conf
> 
> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> new file mode 100644
> index 0000000..d669e4e
> --- /dev/null
> +++ b/meta-xfce/conf/layer.conf
> @@ -0,0 +1,9 @@
> +# We have a conf and classes directory, append to BBPATH
> +BBPATH .= ":${LAYERDIR}"
> +
> +# We have a recipes directory, add to BBFILES
> +BBFILES += "${LAYERDIR}/recipes-*/*/*.bb
> ${LAYERDIR}/recipes-*/*/*.bbappend" +
> +BBFILE_COLLECTIONS += "xfce-layer"
> +BBFILE_PATTERN_xfce-layer := "^${LAYERDIR}/"
> +BBFILE_PRIORITY_xfce-layer = "7"

it would be nice if there was also a README
explaining the dependencies of this layer or any other
information that user of this layer needs to know

-- 
Khem Raj


