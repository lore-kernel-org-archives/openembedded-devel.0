Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ob3Yt-0006ie-HR
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 05:32:11 +0200
Received: by pzk2 with SMTP id 2so1772879pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 20:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=h6CrrJwvKBDHGE6q9OURwnWwYGuf3hff1TePNUMZEV4=;
	b=CQljMjCRBte7SCzUDYFatC96aouZs8iJQ78BoagMT9lFX1wHgospfihDNJLWAnnYW4
	lKSSna6nfjhqHK3h0ZeBmScOSFeoevQRjys1j0ivFTSAp7Yje7xI/c1iM9cdSDmXiy29
	QectDv40HNZXp9Kjw+d6ctD51I1efneLxOtAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=id4zhcfRy8c64bpfSIJqmNgApR5eyeDw25hg6QOQopIA3mSFk1ISjgpLnOO7c6Ater
	d0nRXcQu34n/sCWl1dRPd3dbAV6jtFDHfCmL8tyJ8MI23BZ25LN2+il5CMh1GAD13zs3
	TVfTvjV2Z0RsQh0ptvmbVGLSMtJxBKE/R+y7E=
Received: by 10.142.142.12 with SMTP id p12mr7743756wfd.183.1279596348865;
	Mon, 19 Jul 2010 20:25:48 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 21sm7215248wfi.5.2010.07.19.20.25.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 19 Jul 2010 20:25:47 -0700 (PDT)
Date: Mon, 19 Jul 2010 20:26:06 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100720032606.GC7574@gmail.com>
References: <1279551515-19474-1-git-send-email-heinold@inf.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <1279551515-19474-1-git-send-email-heinold@inf.fu-berlin.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: Re: [PATCH] arm-atomic-gcc patches for oe-stable
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
X-List-Received-Date: Tue, 20 Jul 2010 03:32:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/07/10 16:58), heinold@inf.fu-berlin.de wrote:
> From: Henning Heinold <h.heinold@tarent.de>
> 
> Hi,
> 
> this is a backport for the arm-atomic-gcc patches.
> 
> It is the first step to get openjdk into oe-stable.
> 

Acked-by: Khem Raj <raj.khem@gmail.com>

> Bye,
> 
> Henning
> 
> 
> Henning Heinold (1):
>   gcc: backport 4.3.x atomic-patches series from openembedded-dev
> 
>  recipes/gcc/gcc-4.3.1.inc                          |    4 +-
>  .../gcc-4.3.1/debian/armel-atomic-builtins.dpatch  |  350 ++++++++++++++++++++
>  ...90519-arm-eabi-atomic-builtins-unbreak-v2.patch |   52 +++
>  recipes/gcc/gcc-4.3.2.inc                          |    4 +-
>  .../gcc-4.3.2/debian/armel-atomic-builtins.dpatch  |  350 ++++++++++++++++++++
>  ...90519-arm-eabi-atomic-builtins-unbreak-v2.patch |   52 +++
>  recipes/gcc/gcc-4.3.3.inc                          |    2 +
>  .../gcc-4.3.3/debian/armel-atomic-builtins.dpatch  |  350 ++++++++++++++++++++
>  ...90519-arm-eabi-atomic-builtins-unbreak-v2.patch |   52 +++
>  recipes/gcc/gcc-cross-sdk_4.3.1.bb                 |    2 +-
>  recipes/gcc/gcc-cross-sdk_4.3.2.bb                 |    2 +-
>  recipes/gcc/gcc-cross-sdk_4.3.3.bb                 |    2 +-
>  recipes/gcc/gcc-cross_4.3.1.bb                     |    2 +-
>  recipes/gcc/gcc-cross_4.3.2.bb                     |    2 +-
>  recipes/gcc/gcc-cross_4.3.3.bb                     |    2 +-
>  recipes/gcc/gcc_4.3.1.bb                           |    2 +-
>  recipes/gcc/gcc_4.3.2.bb                           |    2 +-
>  recipes/gcc/gcc_4.3.3.bb                           |    2 +-
>  18 files changed, 1223 insertions(+), 11 deletions(-)
>  create mode 100644 recipes/gcc/gcc-4.3.1/debian/armel-atomic-builtins.dpatch
>  create mode 100644 recipes/gcc/gcc-4.3.1/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
>  create mode 100644 recipes/gcc/gcc-4.3.2/debian/armel-atomic-builtins.dpatch
>  create mode 100644 recipes/gcc/gcc-4.3.2/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
>  create mode 100644 recipes/gcc/gcc-4.3.3/debian/armel-atomic-builtins.dpatch
>  create mode 100644 recipes/gcc/gcc-4.3.3/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


