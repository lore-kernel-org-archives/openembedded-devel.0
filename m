Return-Path: <gizero@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1538E77C2A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 17:42:50 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l44so5289001wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MCQ7PWceaZLlE5wnwaTvC7qp80fvdHVHMQ5IBvCLgOE=;
	b=BnnpMONa9iwsScBbjzA1C8vqdthPSvMgyhQ0Em5BQ/xBFGRhuLKKTbejb09w0T6UzO
	I8yPpmRhRWNbqFd7Kog9UwewBZEbFgsN0BPaiB31Ubuad5LHtatp0PPoYavCnUyT9BRI
	6l4zJxfN2TlASAsqBELd/+RV4uA7rdUAcWEYyBmZ8hd0MfEe6Tmxxnq6ZXw6M8BcskWG
	qly/LDHnaMGaa1FVl/T5cEq5UxvRukPR1Q2aitqEuhpV/N7Boc5huaRgyPHHdSjs7fJ2
	q5XsUmQXxkXVmckXImIA6Fgr5ivU3dX8ENjM33vy+sHz3pbqdsBQl/twgzxPLObCUYIQ
	XvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MCQ7PWceaZLlE5wnwaTvC7qp80fvdHVHMQ5IBvCLgOE=;
	b=UK0MPT6fK7KArOwB2E6nwCKhk6VXfeac9xZgvouAFnoKw28FUABDr44okR/ecxxGt5
	4sxxV3vLyreML2/2U96ZU7b4CLb31eTKS4xnMN/6M5lAsrzHj2QN6W6UxGaeIrllbQZq
	HIvGk2hjp3peKxK4CsIl3oZmewQp/kESMgtw7Op2xsc2kz3z8Hdg6sqGhZBjo7UGmESL
	JtAdizJzZmgPiZcXahMqRIGgR46lqrRLa3ePYxqpvHRB9FmEkd7dGhV2v5/LcD8f/quI
	aijjHDpj7w69xHn+4G5q6mdMHCvEnrlATFYMCQLE9OayrYdkZUJTXmzmdCpySZWFrVJZ
	35VQ==
X-Gm-Message-State: AN3rC/7jnK2wBB3AE4aivGVKfoUrsXxo3aVX6TRYgRaRdcTvySkgVnK8CEh8Jned930Z1kNrGqJjpKLtfBBRlg==
X-Received: by 10.223.136.66 with SMTP id e2mr4266829wre.14.1492018971399;
	Wed, 12 Apr 2017 10:42:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.20.20 with HTTP; Wed, 12 Apr 2017 10:42:50 -0700 (PDT)
In-Reply-To: <CAMKF1sqLquD6GkV+4sTxdsL7ccypCdGtcUEnrQDK+y=Nz7JEhg@mail.gmail.com>
References: <1492003558-8647-1-git-send-email-gizero@gmail.com>
	<CAMKF1sqLquD6GkV+4sTxdsL7ccypCdGtcUEnrQDK+y=Nz7JEhg@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 12 Apr 2017 19:42:50 +0200
Message-ID: <CAC+thW24L6C1GUtcCFh0Ge_NQBXSRifcVeYNCvOqtpkkfpGgEg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/3] openvpn: ensure ${sysconfdir}/tmpfiles.d is packaged
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
X-List-Received-Date: Wed, 12 Apr 2017 17:42:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 12, 2017 at 5:28 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Apr 12, 2017 at 6:25 AM, Andrea Galbusera <gizero@gmail.com>
> wrote:
> > The file was installed but never packaged, ending up in no
> systemd-tmpfiles
> > configuration on the final rootfs.
> >
> > Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> > ---
> >  meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
> b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
> > index a3ef765..5fd714a 100644
> > --- a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
> > +++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
> > @@ -61,6 +61,7 @@ RRECOMMENDS_${PN} = "kernel-module-tun"
> >
> >  FILES_${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
> >  FILES_${PN} += "${systemd_unitdir}/system/openvpn@.service \
> > +                ${sysconfdir}/tmpfiles.d \
> >                  /run"
>
> This change is fine but packaging /run seems suspicious to me.
>

To me as well... I'll send a separate patch to get rid of it. Nothing else
seems to reference /run in the recipe


>
> >  FILES_${PN}-sample += "${systemd_unitdir}/system/
> openvpn@loopback-server.service \
> >                         ${systemd_unitdir}/system/
> openvpn@loopback-client.service \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

