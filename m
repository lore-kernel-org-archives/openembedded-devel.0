Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U9X7R-0006cG-Mc
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Feb 2013 09:39:39 +0100
Received: by mail-da0-f45.google.com with SMTP id v40so1019821dad.32
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2013 00:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=7Q/KzRJfrABtS2HIF5CNL1sX76FyeVEIPYPXnupEjXo=;
	b=WZXb4S+J3vzWrC3m8UJj8Qx5W13miiSKaR6GLnZ3W07Ypalo7L+k/CDuZSqkHxrDpJ
	xnCV3XmaXGjfjdH74009LBpKd3xNpC1MBLn3MdGSker1Xl7YW0yMijP/rWIEdIcXKmCC
	cw4s8XffwjwQNIYQW6gmJhFeqXMje0L7JqBMhV2r2guLYIIhtDForNoKhl1o6SwfizY+
	JqqqdWtmTPPnfIjQ10kSO9HBohHNEya5hC1ToAGanCLWkOO6ibJMaB57NesWhjWKgme2
	SZJZPEAp+gncPP+SXiDVJwoNJemU4liE3T2+lgSbms53yZXqm8lxQsqN3p4jjUGnIg0G
	t7wg==
X-Received: by 10.68.11.35 with SMTP id n3mr11785313pbb.220.1361694200996;
	Sun, 24 Feb 2013 00:23:20 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id tm1sm8608794pbc.11.2013.02.24.00.23.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 24 Feb 2013 00:23:20 -0800 (PST)
Date: Sun, 24 Feb 2013 00:23:16 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130224082315.GE3154@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	"Felipe F. Tonello" <ftonello@cercacor.com>
References: <1361385530-2248-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1361385530-2248-1-git-send-email-ftonello@cercacor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH] gsoap: added gsoap 2.8.12 recipe
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
X-List-Received-Date: Sun, 24 Feb 2013 08:39:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (20/02/13 10:38), eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
> 
> This recipe was inspired on the gsoap recipe in oe-classic.
> 
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  .../recipes-support/gsoap/gsoap-native_2.8.12.bb   |   17 +++++++++++++++
>  meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb      |   17 +++++++++++++++
>  meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc     |   23 ++++++++++++++++++++
>  3 files changed, 57 insertions(+)
>  create mode 100644 meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
>  create mode 100644 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
>  create mode 100644 meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc
> 
> diff --git a/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb b/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
> new file mode 100644
> index 0000000..a83eb26
> --- /dev/null
> +++ b/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
> @@ -0,0 +1,17 @@
> +require gsoap_${PV}.inc
> +
> +DEPENDS = ""
> +
> +EXTRA_OEMAKE = ""
> +
> +inherit native
> +
> +do_install() {
> +    oe_runmake DESTDIR=${D} BINDIR=${D}${bindir} install
> +
> +    install -m 0755 ${S}/gsoap/src/soapcpp2 ${STAGING_BINDIR_NATIVE}/

can you see if you can use BBCLASSEXTEND to generate the native package
?
why is installing to STAGING_BINDIR_NATIVE needed ?


