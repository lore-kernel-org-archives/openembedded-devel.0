Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 179846013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 11:51:55 +0000 (UTC)
Received: by wgiu9 with SMTP id u9so125586263wgi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=KXTFmrREEy+8EDcW6g1msvwsFywYcGarfPk9HSRPb8E=;
	b=yP0/mAA8dRTrHnG/ahtemhTnAJjAcLxKHi9WEyzwKZM+0dx2+niqE8HYqyXPvaQJnx
	mN+YRGl2EcvoIhZD97QO/nMbw6mS1v1EioWywCYaRWaDXIc6O3Y8k5c2GrW3e2mZLaYF
	baXRc8c1GEwNMPE6DopNlMDaRDT4Hp9EPwKihcfalQ1e2N6BI7fktK6+lTwCVpqIZga5
	pN8Uqhf9fbpUwurHM+TW9zHXFWkSQggG81RkiSmCxJY9xo2WWMwteR6uB4fOaX03Ptem
	9BmED1MF5JWw8z/CPkQckUR7M+m9QDDC0GJqtnIUJtEy0inKk7jG8NODBjOzPZ8ywvsD
	Homw==
X-Received: by 10.194.189.148 with SMTP id gi20mr20054665wjc.22.1431345116445; 
	Mon, 11 May 2015 04:51:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	fb3sm10037601wib.21.2015.05.11.04.51.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 04:51:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 May 2015 13:52:27 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150511115227.GI2400@jama>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
	<1431070955-7100-7-git-send-email-yi.zhao@windriver.com>
	<5550972A.7000709@balister.org>
MIME-Version: 1.0
In-Reply-To: <5550972A.7000709@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 07/20] gpsd: fix PN -> BPN for multilib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 May 2015 11:51:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2015 at 07:48:58AM -0400, Philip Balister wrote:
> I've alos got an update in flight for gpsd. We are having trouble with
> it, because the update brkoe navit. Now the bluez4 - 5 updte broke
> another of the packages navit needs.
>=20
> Martin, any chance we can combine this patch with my update and
> blacklist navit?

Yes, I've already did that in master-next.

>=20
> Philip
>=20
> On 05/08/2015 03:42 AM, Yi Zhao wrote:
> > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > ---
> >  meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb b/meta-oe/rec=
ipes-navigation/gpsd/gpsd_3.10.bb
> > index 93cf1ae..b37fc15 100644
> > --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
> > +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
> > @@ -85,8 +85,8 @@ do_install_append() {
> > =20
> >      #support for systemd
> >      install -d ${D}${systemd_unitdir}/system/
> > -    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/sy=
stem/${PN}.service
> > -    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/s=
ystem/${PN}.socket
> > +    install -m 0644 ${WORKDIR}/${BPN}.service ${D}${systemd_unitdir}/s=
ystem/${BPN}.service
> > +    install -m 0644 ${S}/systemd/${BPN}.socket ${D}${systemd_unitdir}/=
system/${BPN}.socket
> >  }
> > =20
> >  pkg_postinst_${PN}-conf() {
> >=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

