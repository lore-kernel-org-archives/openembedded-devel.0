Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFB4787B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 22:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 04E2E20AA4;
	Tue, 23 Jan 2018 22:39:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LDyhCZtrkCWz; Tue, 23 Jan 2018 22:39:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D681A20151;
	Tue, 23 Jan 2018 22:39:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 57F5B163270; Tue, 23 Jan 2018 17:39:13 -0500 (EST)
Date: Tue, 23 Jan 2018 17:39:13 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180123223913.GA2786@denix.org>
References: <1516085015-89929-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1516085015-89929-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-networking][PATCH] ndisc6: need to set USE_NLS="yes" to use gettext.h
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jan 2018 22:39:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping.


On Tue, Jan 16, 2018 at 01:43:35AM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Otherwise we can get gettext-minimal-native dependency instead, which does not
> provide gettext.h header.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> index 48a83b8..58f1230 100644
> --- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> +++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> @@ -22,6 +22,8 @@ EXTRA_OECONF += "PERL=${USRBINPATH}/perl"
>  LDFLAGS += "-fuse-ld=gold"
>  TOOLCHAIN = "gcc"
>  
> +USE_NLS = "yes"
> +
>  do_configure_prepend() {
>      cp ${STAGING_DATADIR_NATIVE}/gettext/gettext.h ${S}/include
>      ${S}/autogen.sh
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

