Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3A374C94
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 May 2018 16:09:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w44G8EBJ029725
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 May 2018 09:08:30 -0700
Received: from yow-masselst-lx1.localnet (128.224.20.60) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 4 May 2018 09:08:04 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Fri, 4 May 2018 12:08:03 -0400
Message-ID: <2263485.aMBz1r57FB@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <62171c6d294a43d886500350bfa26bd5@XBOX02.axis.com>
References: <1525371114-30249-1-git-send-email-mark.asselstine@windriver.com>
	<62171c6d294a43d886500350bfa26bd5@XBOX02.axis.com>
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: fix "installed-vs-shipped" QA issue
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
X-List-Received-Date: Fri, 04 May 2018 16:09:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, May 4, 2018 12:02:25 PM EDT Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Mark Asselstine
> > Sent: den 3 maj 2018 20:12
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-networking][PATCH] networkmanager: fix "installed-
> > vs-shipped" QA issue
> > 
> > When building we can see the following QA issue:
> >   QA Issue: networkmanager: Files/directories were installed but
> >   
> >     not shipped in any package:
> >   [2018-05-02 23:01:40.442528079-07:00]   /usr/lib/NetworkManager
> >   [2018-05-02 23:01:40.450990449-07:00]
> > 
> > /usr/lib/NetworkManager/conf.d
> > 
> >   [2018-05-02 23:01:40.456642738-07:00]   /usr/lib/NetworkManager/VPN
> > 
> > The upstream project moved these to $prefix/lib as part of upstream
> > commit 74818b155c32 [build: fix $nmlibdir to be
> > "/usr/lib/NetworkManager"] and here we adapt the recipe to take this
> > change into effect.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> >  .../recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
> >  
> > | 4 ++--
> >  
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-networking/recipes-
> > connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-
> > networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
> > index d90b782..91636ec 100644
> > --- a/meta-networking/recipes-
> > connectivity/networkmanager/networkmanager_1.10.6.bb
> > +++ b/meta-networking/recipes-
> > connectivity/networkmanager/networkmanager_1.10.6.bb
> > @@ -100,8 +100,8 @@ FILES_${PN} += " \
> > 
> >      ${libexecdir} \
> >      ${libdir}/pppd/*/nm-pppd-plugin.so \
> >      ${libdir}/NetworkManager/*.so \
> > 
> > -    ${libdir}/NetworkManager/VPN \
> > -    ${libdir}/NetworkManager/conf.d \
> > +    ${prefix}/lib/NetworkManager/VPN \
> > +    ${prefix}/lib/NetworkManager/conf.d \
> 
> There is a variable for ${prefix}/lib: nonarch_libdir, i.e.:
> 
>     ${nonarch_libdir}/NetworkManager/VPN \
>     ${nonarch_libdir}/NetworkManager/conf.d \

I opted to use ${prefix}/lib as I liked how it matched upstream's syntax in 
configure.ac, making searching a bit more logical. But I am not fuss and will 
send a V2 with this change.

MarkA

> 
> >      ${datadir}/polkit-1 \
> >      ${datadir}/dbus-1 \
> >      ${base_libdir}/udev/* \
> > 
> > --
> > 2.7.4
> 
> //Peter





