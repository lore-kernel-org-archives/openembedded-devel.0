Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PYABi-0004lT-Ts
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 05:32:30 +0100
Received: by fxm17 with SMTP id 17so10121877fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Dec 2010 20:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=t57Fcuc4kbB16VOzRMglzwtJUzjiZMBrFutWoNEE6i0=;
	b=LnEyUAAuj6izpgRyCphTBq1M4oLoNZy+lPdppf2VDFtyDlglYQzubBVslC5gYZoFRP
	zToL1LKfRWUSWKSj4SDqhEQQ67YYTCS2BJan1ITq5HUcFWbFoJxZnmCNfWkgnscJNy3P
	Xvv4mNFGRvAsPBYa1f2G//v5h4QHo+nmD7+E0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=hHbPNIOdCmr7oQcHYG4wuzIPDwztG/fj0gsxauCSY3/d3LMya2eSpwxYr08c9pQpWY
	JePRT68THkhRQIMSeGR5xziUB3FWOe+K13EvfKAXqDJNmSbFJ0ZnX5YaC2EzXVRsHeMi
	5u+jOT+m3D+q+lQOnTbmslgiD7K/34nyLQWi0=
Received: by 10.223.72.197 with SMTP id n5mr1481487faj.8.1293683519759;
	Wed, 29 Dec 2010 20:31:59 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l14sm3699909fan.33.2010.12.29.20.31.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 29 Dec 2010 20:31:58 -0800 (PST)
Date: Thu, 30 Dec 2010 05:32:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101230043200.GA10141@jama>
References: <1293644563.4238.7.camel@mattotaupa>
	<1293651953-2998-1-git-send-email-eric@eukrea.com>
	<AANLkTimdAyrfzSq1zvFf1Nyg2xfrXZO2N-3a04=EKYpD@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimdAyrfzSq1zvFf1Nyg2xfrXZO2N-3a04=EKYpD@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] glib 2.26.1: fix compilation failure
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
X-List-Received-Date: Thu, 30 Dec 2010 04:32:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Dec 29, 2010 at 01:19:21PM -0800, Khem Raj wrote:
> On Wed, Dec 29, 2010 at 11:45 AM, Eric Bénard <eric@eukrea.com> wrote:
> > during configure, pkgconfig detects dbus-1.pc which was installed
> > by dbus-native and thus the compilation fails because it can't
> > find dbus/dbus.h which is not yet installed for in the target's
> > sysroot.
> >
> > This patch workaround this problem by not compiling the test program
> > which depends on dbus's headers.
> >
> > Signed-off-by: Eric Bénard <eric@eukrea.com>
> 
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> 
> > ---
> >  recipes/glib-2.0/glib-2.0_2.26.1.bb |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/glib-2.0/glib-2.0_2.26.1.bb b/recipes/glib-2.0/glib-2.0_2.26.1.bb
> > index d95f894..e19fb9f 100644
> > --- a/recipes/glib-2.0/glib-2.0_2.26.1.bb
> > +++ b/recipes/glib-2.0/glib-2.0_2.26.1.bb
> > @@ -10,7 +10,7 @@ DEPENDS = "glib-2.0-native gtk-doc zlib"
> >  DEPENDS_virtclass-native = "gettext-native gtk-doc-native \
> >                             pkgconfig-native"
> >
> > -PR = "r0"
> > +PR = "r1"
> >
> >  SRC_URI = "\
> >   http://ftp.gnome.org/pub/GNOME/sources/glib/2.26/glib-${PV}.tar.bz2;name=archive \
> > @@ -38,6 +38,7 @@ EXTRA_OECONF_append_glibc_arm = "  --enable-included-printf=no "
> >
> >  do_configure_prepend () {
> >        install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h .
> > +       sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
> >  }
> >
> >  do_install_append() {
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


