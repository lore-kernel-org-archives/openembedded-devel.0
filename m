Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBDA7CE6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 08:53:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44FPYc5vCSz5p;
	Thu,  7 Mar 2019 09:53:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551948821;
	bh=x0XCHzsBDbeX+3TDHykl3q5V1CeaELNwql+fOFTlh74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IS/Vfr67FejCSJZ0v3P8hnhPO+fRoPmhwJGpAJak+kzfnqrqjRTN22OnFFmmPWUww
	5pC3ycssijdWkI1aRbjLWgrMv/9cPdCHTAPq0exnVEf7CY0S6XItJjq0nTyTpkCc5r
	2mm6eU/qDR0NRVpylumOtPnDOOtd9OR1OUkG39mdyns/ycZ+latYc9L93SE1SJ3z49
	0nvgCyLf/lWa7i3IHe3W0H0/Kb3KCrGvzIKn1PCMCbShOYv2Shk+55cBuJ7CaYhpy2
	O8JQuitQ1cBCDWpvJLRYim8e7ITbUxjSSByEjobQ2qVqXi6p8dh3ZjkQ9DONTZf8UC
	PD8esn6bcrElXhTusr5WWIvjDBjOZOvo8Q2yIgkHUcRatGE+Dba4sowlHXcZk33X41
	3I9L92welfSdMe0n02prUFZk0WtRzr/K792bGDhpBAirmkFC/JOffmDpiN2y8lGV4O
	QypTG6qr7x/HwyMmKMFLvCpcQgBUDLjkLt/HSs+Asy3Q3SpEoqYZEDCrALnOyYZVA3
	I2LwO4aiEZsaIWB6eDDTei0AphjHxQfg0Mut0YNapwryXBIx9RBC7uQr6BkW/r9P5d
	+lk5+UVC7nSvtcgv/7bqzJDMy308sNOWPW8ktfsv7+OR+ALZAIwFdClvlPjL0Y6yIb
	wqyP7BU+FEoAsObAbKhtb550=
Date: Thu, 7 Mar 2019 10:53:38 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20190307085338.GA28605@localhost>
References: <20190307082917.18118-1-sean@geanix.com>
MIME-Version: 1.0
In-Reply-To: <20190307082917.18118-1-sean@geanix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] asio: add PACKAGECONFIG boost
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
X-List-Received-Date: Thu, 07 Mar 2019 08:53:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 07, 2019 at 09:29:17AM +0100, Sean Nyekjaer wrote:
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta-oe/recipes-support/asio/asio_1.12.2.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/asio/asio_1.12.2.bb b/meta-oe/recipes-support/asio/asio_1.12.2.bb
> index ee548fd3a..ec705c275 100644
> --- a/meta-oe/recipes-support/asio/asio_1.12.2.bb
> +++ b/meta-oe/recipes-support/asio/asio_1.12.2.bb
> @@ -20,3 +20,7 @@ SRC_URI[md5sum] = "312e53385e2daad10f08d57f91ad3431"
>  SRC_URI[sha256sum] = "4e27dcb37456ba707570334b91f4798721111ed67b69915685eac141895779aa"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
> +
> +PACKAGECONFIG ??= "boost"
> +
> +PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost,boost"

Adding an RDEPENDS in the PACKAGECONFIG looks wrong.
boost should also be removed from the DEPENDS above when it is disabled.

This would be on top of your patch:
-DEPENDS = "boost openssl"
+DEPENDS = "openssl"
-PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost,boost"
+PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


