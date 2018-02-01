Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB7C7865A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 15:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 041E731C5F1D;
	Thu,  1 Feb 2018 16:58:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id fbbIrSt5DUhC; Thu,  1 Feb 2018 16:57:58 +0100 (CET)
Received: from t460p (p4FE9ACAE.dip0.t-ipconnect.de [79.233.172.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0A29531C4F5B;
	Thu,  1 Feb 2018 16:57:58 +0100 (CET)
Date: Thu, 1 Feb 2018 16:57:56 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180201165756.0f54c7bc@t460p>
In-Reply-To: <20180201142340.11083-2-Martin.Jansa@gmail.com>
References: <20180201142340.11083-1-Martin.Jansa@gmail.com>
	<20180201142340.11083-2-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-pam, smbnetfs: require pam in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 01 Feb 2018 15:57:59 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Martin,

On Thu,  1 Feb 2018 14:23:40 +0000
Martin Jansa <martin.jansa@gmail.com> wrote:

> * there is explicit dependency on libpam without respecting pam in DISTRO_FEATURES
>   so add the check to prevent people building it against broken libpam

[...]
 
> --- a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> @@ -40,9 +40,10 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
>  # remove default added RDEPENDS on perl
>  RDEPENDS_${PN}_remove = "perl"
>  
> -#DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libbsd libaio libpam"
> -DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libbsd libaio libpam"
> -DEPENDS += "libldb"
> +DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libbsd libaio libpam"
> +
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES = "pam"

AFAIR, Samba doesn't build without libpam, but runs fine without a PAM
installation. Which problem you're trying to solve? I guess it's fair
to expect a dysfunctional PAM library without the 'pam' distro feature.

Regards,
Andreas

