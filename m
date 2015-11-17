Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD4A606A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 21:29:57 +0000 (UTC)
Received: by wmww144 with SMTP id w144so45154125wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 13:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=oIagsgqAAl2WLs2SF8+F4JSIGjRrSdPTe3PVzIZEKFU=;
	b=dOwrjkQmDOWrnjDoNxbtl9nhzTioBG3ETs11BQacAkaW70jDeLHIcKYoCI/0YKLvAl
	s5tYmjvQ5tfuG7r//J88WubVfxoJk/wbMDF1guBKY4/qkP7Sbw1dhr7CbEn9enpg6OEs
	D23JQDdy9DWAA9lV2OJ2pnCkmZ/Bp6zt91ltV/ubmoShYqfPwIZNOlT8KK4ENWlrz0OT
	nJSiU48Y53xDZSVX7l6H8NcZFACedsast4DfHnaqSEEW+7UIfZf19JklfBD4EmySkC/g
	DGhdCEZ1fCNS5rHoQ94lY2IKbuqOXU8On8bU3SiGMfD9zdmKq+qyN93RMKYRhGiRPA81
	6H+g==
X-Received: by 10.194.235.230 with SMTP id up6mr1937951wjc.178.1447795797909; 
	Tue, 17 Nov 2015 13:29:57 -0800 (PST)
Received: from chl500346 (c-82-192-248-24.customer.ggaweb.ch. [82.192.248.24])
	by smtp.gmail.com with ESMTPSA id
	s2sm25870593wmd.13.2015.11.17.13.29.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 13:29:57 -0800 (PST)
Message-ID: <1447795796.2296.11.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Nov 2015 22:29:56 +0100
In-Reply-To: <20151116212323.GE2240@jama>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
	<1447271300-4153-4-git-send-email-adrian.freihofer@gmail.com>
	<20151116212323.GE2240@jama>
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH V2 03/17] modemmanager: Add PACKAGECONFIGs
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
X-List-Received-Date: Tue, 17 Nov 2015 21:29:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Martin
Thank you for fixing the patches. After reading your comments I found another mistake. May I ask you to apply the
following fixup to this patch. It's true, bitbake does not consider versions for depends. But the recipe builds.


index a479072..f305bde 100644
@@ -24,9 +24,9 @@ PACKAGECONFIG ??= "mbim qmi polkit \
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
 PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
 # Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
-PACKAGECONFIG[mbim] = "--with-mbim,--enable-mbim=no,libmbim,libmbim"
+PACKAGECONFIG[mbim] = "--with-mbim,--enable-mbim=no,libmbim"
 # Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
-PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi (>=1.12.4),libqmi (>=1.12.4)"
+PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
 
 FILES_${PN} += " \
     ${datadir}/icons \



On Mon, 2015-11-16 at 22:23 +0100, Martin Jansa wrote:
> On Wed, Nov 11, 2015 at 08:48:06PM +0100, Adrian Freihofer wrote:
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> > ---
> >  .../modemmanager/modemmanager_1.4.12.bb                 | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb b/meta-oe/recipes
> > -connectivity/modemmanager/modemmanager_1.4.12.bb
> > index db7a28d..b1768ca 100644
> > --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
> > +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
> >  
> >  inherit gnomebase gettext systemd
> >  
> > -DEPENDS = "glib-2.0 libmbim libqmi (>=1.12.4) polkit libgudev dbus-glib"
> > +DEPENDS = "glib-2.0 libgudev dbus-glib" 
> >  
> >  SRC_URI = "${GNOME_MIRROR}/ModemManager/ModemManager-${PV}.tar.xz"
> >  SRC_URI[md5sum] = "66cc7266b15525cb366253e6639fc564"
> > @@ -17,6 +17,21 @@ SRC_URI[sha256sum] = "7ef5035375a953b285a742591df0a65fd442f4641ce4d8f4392a41d6d6
> >  
> >  S = "${WORKDIR}/ModemManager-${PV}"
> >  
> > +# If you need a different configuration for modemmanager, add a statement
> > +# similar to the following example to your local.conf or distro config
> > +# PACKAGECONFIG_remove_pn-modemmanager = "polkit"
> > +PACKAGECONFIG ??= "mbim qmi polkit"
> > +
> > +EXTRA_OECONF = " \
> > +  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '',
> > d)} \
> > +"
> 
> I've changed this to PACKAGECONFIG when cherry-picking to master-next
> 
> > +PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
> > +# Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
> > +PACKAGECONFIG[mbim] = "--with-mbim,--enable-mbim=no,libmbim,libmbim"
> > +# Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
> > +PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi (>=1.12.4),libqmi (>=1.12.4)"
> > +
> > +
> >  FILES_${PN} += " \
> >      ${datadir}/icons \
> >      ${datadir}/polkit-1 \
> > -- 
> > 2.4.3
> > 
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

