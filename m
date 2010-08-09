Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OiQHt-0003BX-Md
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 13:13:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o79BCqkN019683
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Aug 2010 12:12:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19373-04 for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Aug 2010 12:12:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o79BCgLr019677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Aug 2010 12:12:43 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1281336254-11566-1-git-send-email-raj.khem@gmail.com>
References: <1281336254-11566-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 09 Aug 2010 12:12:40 +0100
Message-ID: <1281352360.16235.525.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cross.bbclass: Override STAGING_* paths to match cross installation
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
X-List-Received-Date: Mon, 09 Aug 2010 11:13:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

On Sun, 2010-08-08 at 23:44 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  classes/cross.bbclass |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/cross.bbclass b/classes/cross.bbclass
> index cf14db1..64f7902 100644
> --- a/classes/cross.bbclass
> +++ b/classes/cross.bbclass
> @@ -50,6 +50,14 @@ exec_prefix = "${prefix}"
>  base_sbindir = "${base_prefix}/bin"
>  sbindir = "${exec_prefix}/bin"
>  
> +# staging should be special for cross
> +STAGING_BINDIR = "${bindir}"
> +STAGING_LIBDIR = "${libdir}"
> +STAGING_INCDIR = "${includedir}"
> +STAGING_ETCDIR = "${sysconfdir}"
> +STAGING_DATADIR = "${datadir}"
> +STAGING_SBINDIR = "${sbindir}"
> +
>  do_install () {
>  	oe_runmake 'DESTDIR=${D}' install
>  }

Can you explain a bit more about why is this needed?

Cheers,

Richard



