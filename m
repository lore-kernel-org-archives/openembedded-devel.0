Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OjnoU-0006cH-1D
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 08:32:23 +0200
Received: by yxd39 with SMTP id 39so241274yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 23:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pnEfd66eimZ8zsKvh3AMQq2Egu3FzE5C3K4tQ26mVT0=;
	b=Iauy9QP+lRwNDd/a9hjw3dMtzzkB0g+XA9xa0r1gx23CEAtN9wsEggmi7JYUle1wBb
	JPb8rSSCEUEhAZR4EhkP/OJlYRsYPokE4IEWXG2SWMQJZVq77Y2dwcOBIfTbJrRh4O8O
	u0ut8ADh8vyoY/qPYa0ZhoN2zpR3zwnSSMNMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bIEKTKXw0KSx2uxZkInVHPA7F+ykq9iPE39fDr1iOHq/x8vb7yk0+gXPAgOvkRIZHg
	GYqgd4d62rqvUJiHIgmydSK1oMCrCh74eu35B0Oak2uq0ntoXNtslH0eYP6mYI9Ssm5N
	B5XUsan9LAzvUDQCxYC/j0c8mXzKz7bLeb5Fs=
MIME-Version: 1.0
Received: by 10.231.19.3 with SMTP id y3mr1031227iba.156.1281681122384; Thu,
	12 Aug 2010 23:32:02 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 12 Aug 2010 23:32:02 -0700 (PDT)
In-Reply-To: <1281677417-15063-3-git-send-email-vjensen@gmx.de>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<1281677417-15063-3-git-send-email-vjensen@gmx.de>
Date: Fri, 13 Aug 2010 08:32:02 +0200
Message-ID: <AANLkTinbcYcVuBxMF=9cU1dKUGNunWStao3TR=vVnLbr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] libsocketcan: remove old version 0.0.7
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
X-List-Received-Date: Fri, 13 Aug 2010 06:32:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/13 Vitus Jensen <vjensen@gmx.de>:
>
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
> =A0recipes/socketcan/libsocketcan_0.0.7.bb | =A0 =A07 -------
> =A01 files changed, 0 insertions(+), 7 deletions(-)
> =A0delete mode 100644 recipes/socketcan/libsocketcan_0.0.7.bb
>
> diff --git a/recipes/socketcan/libsocketcan_0.0.7.bb b/recipes/socketcan/=
libsocketcan_0.0.7.bb
> deleted file mode 100644
> index 18f607e..0000000
> --- a/recipes/socketcan/libsocketcan_0.0.7.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -TAG =3D "v${PV}"
> -require libsocketcan.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://install-can_netlink.h.patch;apply=3Dyes \
> - =A0 =A0 =A0 "
> --
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


