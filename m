Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id C43506011C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Feb 2020 07:08:18 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id h62so4261175edd.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 23:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version;
	bh=ttzvUWb3pEB4w9OBr69adCdGYjXmyVcS0pzKLSqSOTc=;
	b=hqEpsB6KKQW9hDSCuOy4Bl6Ychq60gN3c6WVnURS7yoM3mghSTdyL8ALn1UeZ3uhxJ
	uhvv+AvYbc4x89PqZ3CUdH2eaI3px7DUhAbh0UsB5m6e4EFSiGpeoqeZkvOC/FtNdclp
	z3iZDMzrDN+4lS0ga66vTTdtuvNUu7e5TdGq9jutlQLqJHxGNh8p4yrr3GuTEK0dwLeV
	4Uqi2auxVjCN90r+c0QSWjRu/1LMwaZCEOGsVeYB2P6/vPA1sdfKzwtSA/Pemx+ClSlk
	/etrt8i93y9tNaO8KEf3RAl03dhC39BDEhsCmyL7r3Dep4kLy85oyKhORzcjtcIPwSyf
	OmXA==
X-Gm-Message-State: APjAAAVIomP4DACliBBhiAzMcbU4tyxGqP3toCU5FpTVuDRGHOVWmV5H
	JY5pKxsY/TYgf3Jr3RoMnqN46BG8
X-Google-Smtp-Source: APXvYqwsSYeUTwS8w57FvLmyAYUk8vZ4xZQecipIcNufFLORj3FWpG1200ltfXrE6xXDx8y20RzbPw==
X-Received: by 2002:aa7:dad0:: with SMTP id x16mr7676040eds.307.1582960099305; 
	Fri, 28 Feb 2020 23:08:19 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id b20sm52253edy.54.2020.02.28.23.08.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 23:08:18 -0800 (PST)
Message-ID: <3c14fbe1d2b373efc17de48dcf6d7eecc0ae51cc.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 29 Feb 2020 07:08:17 +0000
In-Reply-To: <7bc1a555a6b845899219c29be5723ce7@XBOX03.axis.com>
References: <20200227164219.24229-1-git@andred.net>
	<7bc1a555a6b845899219c29be5723ce7@XBOX03.axis.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] meta-networking: s|${COREBASE}/meta/files/common-licenses|${COMMON_LICENSE_DIR}
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
X-List-Received-Date: Sat, 29 Feb 2020 07:08:19 -0000
X-Groupsio-MsgNum: 83123
Content-Type: multipart/mixed; boundary="=-xxbZHoswn5s15/xEDo8R"

--=-xxbZHoswn5s15/xEDo8R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-02-28 at 19:55 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel-bounces@lists.openembedded.org> On
> > Behalf Of André Draszik
> > Sent: den 27 februari 2020 17:42
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-networking][PATCH] meta-networking: s|${COREBASE}/meta/files/common-
> > licenses|${COMMON_LICENSE_DIR}
> > 
> > Signed-off-by: André Draszik <git@andred.net>
> > ---
> >  meta-networking/recipes-connectivity/samba/samba_4.10.13.bb | 4 ++--
> >  meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb        | 2 +-
> >  meta-networking/recipes-support/arptables/arptables_git.bb  | 2 +-
> >  meta-networking/recipes-support/ncp/ncp_1.2.4.bb            | 2 +-
> >  4 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb b/meta-networking/recipes-
> > connectivity/samba/samba_4.10.13.bb
> > index 71d8fa2f8..4d57255f1 100644
> > --- a/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
> > +++ b/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
> > @@ -3,8 +3,8 @@ SECTION = "console/network"
> > 
> >  LICENSE = "GPL-3.0+ & LGPL-3.0+ & GPL-2.0+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> > -                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
> > -                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 "
> > +                    file://${COMMON_LICENSE_DIR}/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
> > +                    file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 "
> 
> These two are pointless since there is a provided COPYING file. 
> Just remove them.
> 
> >  SAMBA_MIRROR = "http://samba.org/samba/ftp"
> >  MIRRORS += "\
> > diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb b/meta-networking/recipes-
> > daemons/lldpd/lldpd_1.0.4.bb
> > index 8fdaf848f..21b02687f 100644
> > --- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
> > +++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "A 802.1ab implementation (LLDP) to help you locate neighbors of all your equipments"
> >  SECTION = "net/misc"
> >  LICENSE = "ISC"
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/ISC;md5=f3b90e78ea0cffb20bf5cca7947a896d"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/ISC;md5=f3b90e78ea0cffb20bf5cca7947a896d"
> 
> There is a LICENSE file in the tar ball. Please use it instead.
> 
> >  DEPENDS = "libbsd libevent"
> > 
> > diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-
> > support/arptables/arptables_git.bb
> > index cec1d1f77..e88631e08 100644
> > --- a/meta-networking/recipes-support/arptables/arptables_git.bb
> > +++ b/meta-networking/recipes-support/arptables/arptables_git.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "Administration tool for arp packet filtering"
> >  SECTION = "net"
> >  LICENSE = "GPL-2.0"
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> 
> There is a COPYING file in the Git repository. Please use it instead.
> 
> >  SRCREV = "f4ab8f63f11a72f14687a6646d04ae1bae3fa45f"
> >  PV = "0.0.4+git${SRCPV}"
> > 
> > diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > index f42223b1f..ba6e23e86 100644
> > --- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > +++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > @@ -4,7 +4,7 @@ security or integrity checking, no throttling, no features, except \
> >  one: you don't have to type the coordinates of your peer."
> >  HOMEPAGE = "http://www.fefe.de/ncp"
> >  LICENSE = "GPLv2"
> 
> I can find no information about license either in the code or at 
> http://www.fefe.de/ncp. How do you know this license is correct?

Please see attached email.

Cheers,
Andre'

> 
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> >  DEPENDS = "libowfat"
> > 
> >  SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
> > --
> > 2.23.0.rc1
> > 
> > --
> 
> //Peter
> 

--=-xxbZHoswn5s15/xEDo8R
Content-Disposition: inline
Content-Description: Attached message - Re: ncp Lizenz
Content-Type: message/rfc822

Delivered-To: andre.draszik@gmail.com
Received: by 10.64.220.1 with SMTP id ps1csp1631210iec;
        Tue, 15 Nov 2016 06:22:51 -0800 (PST)
X-Received: by 10.28.1.135 with SMTP id 129mr4488282wmb.108.1479219771227;
        Tue, 15 Nov 2016 06:22:51 -0800 (PST)
Return-Path: <SRS0+OrVR=XA=fefe.de=felix@mailforward.dd24.net>
Received: from mailfw-02.dd24.net (mailfw-02.dd24.net. [193.46.215.52]) by
 mx.google.com with ESMTPS id k8si14975684wjv.25.2016.11.15.06.22.51 for
 <andre.draszik@gmail.com> (version=TLS1_2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Tue, 15 Nov 2016 06:22:51
 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of
 srs0+orvr=xa=fefe.de=felix@mailforward.dd24.net designates 193.46.215.52 as
 permitted sender) client-ip=193.46.215.52;
Authentication-Results: mx.google.com; spf=pass (google.com: best guess
 record for domain of srs0+orvr=xa=fefe.de=felix@mailforward.dd24.net
 designates 193.46.215.52 as permitted sender)
 smtp.mailfrom=SRS0+OrVR=XA=fefe.de=felix@mailforward.dd24.net
X-policyd-weight: NOT_IN_SBL_XBL_SPAMHAUS=-1.5 NOT_IN_SPAMCOP=-1.5
 DSBL_ORG=ERR(0) CL_IP_EQ_FROM_MX=-3.1; rate: -6.1
Received: from a.mx.fefe.de (qarx.de [31.15.64.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mailfw-02.dd24.net (Postfix) with ESMTPS id D51CE60175
	for <git@andred.net>; Tue, 15 Nov 2016 14:22:44 +0000 (UTC)
Received: (qmail 311 invoked by uid 638); 15 Nov 2016 14:22:37 -0000
Date: Tue, 15 Nov 2016 15:22:37 +0100
From: Felix von Leitner <felix@fefe.de>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Subject: Re: ncp Lizenz
Message-ID: <20161115142237.GA28800@qarx.de>
References: <1479213895.3131.2.camel@andred.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1479213895.3131.2.camel@andred.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Evolution-Source: 1458725645.5855.23@tfsielt31850
Content-Transfer-Encoding: quoted-printable

Thus spake Andr=E9 Draszik (git@andred.net):
> Kannst du bitte ein LICENCE oder COPYING oder so in das ncp archiv packen=
?
> Ich wuerde das gern in OpenEmbedded integrieren nur leider ist gibt es
> nirgends eine Lizenzinformation...

Nee, ich fass das jetzt nicht mehr an.

Du hast hiermit offiziell die Distributionserlaubnis f=FCr ncp. GPL, MIT, W=
hatever ihr da braucht.
Rock Linux konnte es auch einbauen.

Felix

--=-xxbZHoswn5s15/xEDo8R--
