Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1T4rn3-0005O5-MV
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 13:11:01 +0200
Received: by iaky10 with SMTP id y10so3116688iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 03:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4Loc5NDGtx+jGd+3LlR0bhC+X/EBtkUuAW2BHg/A1ZA=;
	b=rZZX6cp1kUEZYkqm7DoHif73LRp5nVgTp5MFRK29Dzyzpc67G6IqTjsclBW0UGJhsa
	vsujr0NCrfa1y3rG7L0Di+zgi7LqooV1bO61qSC3dKbTsvBm+OCtiGYATLkK69DRJzpy
	uabxCO3eU01X8+2Axmf5KXipV+PIqEeTd1RdpK+Vmm3KCIlztdl3qmSDlKPYdp0I339h
	hWzRNQ3+dBOa7I4vMaAWahq7nAcIRlf11wGTZd8jZ1Fgg8leHFtaLBjlDiuJVR8sWEWs
	EIBHsrpANET9LshzqIb2Ig56dsrDMf09tw7pZ9aWjLeWOaGORH5aOLMw4fV58yN/bb44
	KMTA==
MIME-Version: 1.0
Received: by 10.50.189.134 with SMTP id gi6mr1630961igc.55.1345805933785; Fri,
	24 Aug 2012 03:58:53 -0700 (PDT)
Received: by 10.64.49.45 with HTTP; Fri, 24 Aug 2012 03:58:53 -0700 (PDT)
In-Reply-To: <1345805787-6819-1-git-send-email-s.stirtzel@googlemail.com>
References: <1345805787-6819-1-git-send-email-s.stirtzel@googlemail.com>
Date: Fri, 24 Aug 2012 12:58:53 +0200
Message-ID: <CAGiJk9dMmqnSSXoy-Nx8P11YW41qze5amHubbLgMeQsqHvGyRA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Fri, 24 Aug 2012 11:11:01 -0000
Content-Type: text/plain; charset=UTF-8

2012/8/24 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> This fixes "ERROR: Multiple .bb files are due to be built which each provide jpeg"
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> index dd81606..ec25874 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> @@ -15,6 +15,7 @@ S = "${WORKDIR}/trunk"
>
>  # Drop-in replacement for jpeg
>  PROVIDES = "jpeg"
> +RPROVIDES_${PN} = "jpeg"
>
>  inherit autotools pkgconfig
>
> --
> 1.7.9.5
>

Seems like the meta-oe prefix got lost...? Will resend it.

-- 
Regards
Samuel


