Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA1E605C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 19:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9086F209D7;
	Mon, 14 Nov 2016 19:09:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id d0x0F_jE6hqi; Mon, 14 Nov 2016 19:09:42 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6FEA6204E0;
	Mon, 14 Nov 2016 19:09:41 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id C1C8C16219E; Mon, 14 Nov 2016 14:09:40 -0500 (EST)
Date: Mon, 14 Nov 2016 14:09:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161114190940.GB22657@denix.org>
References: <1477587755-24666-1-git-send-email-denis@denix.org>
	<271f87f6-ac90-2389-3499-9c3bb8d80fa6@gmail.com>
MIME-Version: 1.0
In-Reply-To: <271f87f6-ac90-2389-3499-9c3bb8d80fa6@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Ian Ray <ian.ray@ge.com>
Subject: Re: [meta-oe][krogoth][PATCH] syslog-ng: expand service file @variables@ earlier
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
X-List-Received-Date: Mon, 14 Nov 2016 19:09:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 03, 2016 at 08:20:53AM -0700, akuster808 wrote:
> 
> 
> On 10/27/2016 10:02 AM, Denys Dmytriyenko wrote:
> > From: Ian Ray <ian.ray@ge.com>
> > 
> > Move variable expansion of @SBINDIR@, @LOCALSTATEDIR@, and @BASEBINDIR@
> > earlier during install, to before the systemd service file is installed
> > by an automake rule.
> > 
> > Signed-off-by: Ian Ray <ian.ray@ge.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> merged to staging.

Armin,

Any updates on this? Also, I don't see it in krogoth-next - what staging you 
are referring to?

-- 
Denys


> >  meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > index 4e0f697..898e9c2 100644
> > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > @@ -60,6 +60,12 @@ do_configure_prepend() {
> >      eval "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
> >  }
> >  
> > +do_install_prepend() {
> > +    sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
> > +    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
> > +    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${S}/contrib/systemd/*.service
> > +}
> > +
> >  do_install_append() {
> >      install -d ${D}/${sysconfdir}/${BPN}
> >      install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${BPN}/${BPN}.conf
> > @@ -70,9 +76,6 @@ do_install_append() {
> >      install -d ${D}/${localstatedir}/lib/${BPN}
> >      # Remove /var/run as it is created on startup
> >      rm -rf ${D}${localstatedir}/run
> > -    sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
> > -    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
> > -    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${S}/contrib/systemd/*.service
> >  }
> >  
> >  FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
> > 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

