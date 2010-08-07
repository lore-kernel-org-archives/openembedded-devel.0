Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OhYOn-0005We-W2
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Aug 2010 03:40:34 +0200
Received: by iwn38 with SMTP id 38so1753004iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 18:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wFCXlobASDHJG0mwmI8sTYR5DaU2199NJmXlMyjibTI=;
	b=V2emG723XytaqnMxy8LiVyZhsn4ZIrC39X4jrxPD2HEJyNFYBZ2Q+Bc2CVLQZD1Ord
	ng/yH/Siz66YuD0E09BKzl4UiJ2snsACXYIDHHQPJxVZOSqCbfT+/XiUJeWkAk8SIrOs
	BftcLab9iHzacQuC6vYdAbx2lobpwyyGddPm0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=CIjWA8WYXQfy1um9SncPG5v3kyj6rFlkODEJVP3R2F1wHWVmgt3wL+idlmpB12nFYa
	pFy7zm4stKzzb3yhswtoAPvfyftj98Bz2CcukoaxtpaNYTgJwVg9CkZDkoJHob0Hs9yc
	KH9wRIyAjx8X7hwiirokXo2Ys0ERMM5Nk+mJI=
MIME-Version: 1.0
Received: by 10.231.157.212 with SMTP id c20mr14518329ibx.186.1281145228293; 
	Fri, 06 Aug 2010 18:40:28 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Fri, 6 Aug 2010 18:40:28 -0700 (PDT)
In-Reply-To: <AANLkTim14Nqs6SJvda5YsD883HZxTp0jiRTbReM4QXGd@mail.gmail.com>
References: <4C5A612E.9040702@gmail.com>
	<AANLkTik-B0=_JyGLe1dpz9x+h-HE+H8AWd22uO8ioeaG@mail.gmail.com>
	<AANLkTimGYvMxV0MfaVZ8qRFCoFus8NMcUnJyBVHO8NB5@mail.gmail.com>
	<AANLkTim14Nqs6SJvda5YsD883HZxTp0jiRTbReM4QXGd@mail.gmail.com>
Date: Sat, 7 Aug 2010 11:10:28 +0930
Message-ID: <AANLkTi=9p+EKTU43J39_d-SW2gzz30=1NSKu64xKoQRk@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Remove redundant dependencies upon opkg and opkg-collateral.
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
X-List-Received-Date: Sat, 07 Aug 2010 01:40:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

PS: looks like I missed a couple of locations where opkg is pulled in
unconditionally with DISTRO_EXTRA_RDEPENDS
conf/distro/kaeilos.conf
conf/distro/include/angstrom-2007-for-openmoko.inc


