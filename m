Received: from ey-out-1920.google.com ([74.125.78.144])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@dominion.thruhere.net>) id 1NstzG-0003Mv-BP
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Mar 2010 09:24:56 +0100
Received: by ey-out-1920.google.com with SMTP id 26so70920eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Mar 2010 01:21:46 -0700 (PDT)
Received: by 10.213.39.66 with SMTP id f2mr3259634ebe.77.1269073306143;
	Sat, 20 Mar 2010 01:21:46 -0700 (PDT)
Received: from [172.20.1.12] (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 15sm1435787ewy.12.2010.03.20.01.21.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 20 Mar 2010 01:21:44 -0700 (PDT)
References: <20100319225408.8511.74339.stgit@icarus>
Message-Id: <596CA0F5-91C1-47AD-987E-E81DAA7F9E94@dominion.thruhere.net>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Martyn Welch <martyn@welchs.me.uk>
In-Reply-To: <20100319225408.8511.74339.stgit@icarus>
X-Mailer: iPhone Mail (7E18)
Mime-Version: 1.0 (iPhone Mail 7E18)
Date: Sat, 20 Mar 2010 09:21:07 +0100
X-SA-Exim-Connect-IP: 74.125.78.144
X-SA-Exim-Mail-From: koen@dominion.thruhere.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "koen@openembedded.org" <koen@openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] gypsy: Add version 0.7, remove broken svn recipe
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
X-List-Received-Date: Sat, 20 Mar 2010 08:24:56 -0000
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

Op 19 mrt 2010 om 23:54 heeft Martyn Welch <martyn@welchs.me.uk> het  
volgende geschreven:\

> Svn package no longer provided at o-hand. Remove it and replace with
> version 0.7 from the projects website.
>
> Signed-off-by: Martyn Welch <martyn@welchs.me.uk>
> ---
>
> recipes/gypsy/gypsy_0.7.bb |   10 ++++++++++
> recipes/gypsy/gypsy_svn.bb |   10 ----------
> 2 files changed, 10 insertions(+), 10 deletions(-)
> create mode 100644 recipes/gypsy/gypsy_0.7.bb
> delete mode 100644 recipes/gypsy/gypsy_svn.bb
>
> diff --git a/recipes/gypsy/gypsy_0.7.bb b/recipes/gypsy/gypsy_0.7.bb
> new file mode 100644
> index 0000000..9c1fb41
> --- /dev/null
> +++ b/recipes/gypsy/gypsy_0.7.bb
> @@ -0,0 +1,10 @@
> +require gypsy.inc
> +
> +SRC_URI = "http://gypsy.freedesktop.org/gypsy-releases/gypsy-0.7.tar.gz;name=gypsy 
>  \
> +           file://docs-reference-am.patch;patch=1 \
> +           file://remove-werror.patch;patch=1 \
> +"
> +
> +SRC_URI[gypsy.md5sum] = "cde52c121693014efa75d9098fd7de22"
> +SRC_URI[gypsy.sha256sum] =  
> "60d9f9ada77c832899df4a164718895addc5015fa48f45fd58dc4bc8a983f205"
> +
> diff --git a/recipes/gypsy/gypsy_svn.bb b/recipes/gypsy/gypsy_svn.bb
> deleted file mode 100644
> index 0245a95..0000000
> --- a/recipes/gypsy/gypsy_svn.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require gypsy.inc
> -
> -SRC_URI = "svn://svn.o-hand.com/repos/${PN}/trunk;module=$ 
> {PN};proto=http \
> -           file://fixups.patch;patch=1;maxrev=107 \
> -           file://docs-reference-am.patch;patch=1;minrev=134 \
> -           file://remove-werror.patch;patch=1"
> -S = "${WORKDIR}/${PN}"
> -
> -PV = "0.0+svnr${SRCPV}"
> -PR = "r1"
>
>


