Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoiDn-0001l2-C9
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 21:34:48 +0200
Received: by iwn2 with SMTP id 2so1752625iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 12:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bkb15MT4vH0QatJLz+7ClaWIaB7vq9EOjGcdmslUbWg=;
	b=C2SKql+7u8Zhwi5H3IeJ0OnMjpijmHHq4Nokz87D3Sv8Agbd8SUl7UPsC12sYKEdgi
	ayhfnh3ECh5z+/yNUyb5s27WZ6ULmq0vMRZ40XdMB8XcL0qLsE59qAzo4i3PdJoOuv8u
	qC+RcZ394tWHX43gCaDugeh58IKK+ZzlSbTo4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Z0GkseAADlJzTGTuGbP68GvQJTO6l5HRJct0a90Eogics/+so93K+rBIVhiwH+ymxZ
	4OpQ53wTzvUZz0rV9886mxyP3iCBsMrb4ahmYMJ6jULmFYp8ghOO9tTM5wxmzEb7NfBf
	o6HB0+5zoxEbHgkQXSjZ+t4/6PjBVwoQcSx1I=
MIME-Version: 1.0
Received: by 10.231.182.196 with SMTP id cd4mr12441714ibb.191.1282851256370;
	Thu, 26 Aug 2010 12:34:16 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 26 Aug 2010 12:34:16 -0700 (PDT)
In-Reply-To: <AANLkTinGpZfVnPea6ZCcs+UxePXkRAkT6BDpxaNQezGU@mail.gmail.com>
References: <AANLkTinGpZfVnPea6ZCcs+UxePXkRAkT6BDpxaNQezGU@mail.gmail.com>
Date: Thu, 26 Aug 2010 21:34:16 +0200
Message-ID: <AANLkTi=TUw1VshDF5Gg0Ki_WDQGR3iy+QOAu4W3jeRhy@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: hildon-lgpl in nonworking but appears in DEPENDS in recipes
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
X-List-Received-Date: Thu, 26 Aug 2010 19:34:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/26 Khem Raj <raj.khem@gmail.com>:
> Hi,
>
> hildon was moved to nonworking recipes but there are recipes which
> DEPEND on this.
>
> gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb:DEPENDS =A0 =A0 =A0=3D
> "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
> gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb:DEPENDS =A0 =A0 =A0=3D
> "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
> gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb:DEPENDS =A0 =A0 =A0=3D
> "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
> libgpepimc/libgpepimc-hildon_0.5.bb:DEPENDS =A0 =A0 =3D "libgpewidget-hil=
don
> gtk+ sqlite hildon-lgpl"
> maemo/hildon-status-bar_0.8.11-1.bb:DEPENDS =3D "hildon-lgpl libosso hild=
on-libs"
> maemo/hildon-control-panel_0.9.1-1.2.bb:DEPENDS =3D "hildon-lgpl
> hildon-base-lib osso-af-settings libosso hildon-libs osso-af-settings
> libosso-help"
> maemo/libosso-help_1.0.01.bb:DEPENDS =3D =A0"libosso hildon-lgpl
> hildon-base-lib hildon-libs"
> maemo/osso-application-installer_1.0.03-1.bb:DEPENDS =3D "hildon-lgpl
> hildon-base-lib libosso hildon-libs hildon-control-panel
> shared-mime-info"
> tasks/task-maemo.bb: =A0 =A0hildon-lgpl
>
> I am tempted to move them to nonworking as well. opinions ?

I agree that it is pointless to keep them if they do not build so
moving them to nonworking is imho quite logical and therefore has my
blessing.

However, while you're at it there is more to be moved as there are
recipes which depend on the ones you propose to move:
dependencies on libgpepimc-hildon
gpe-todo/gpe-todo-hildon_0.54.bb:DEPENDS     =3D "libgpewidget-hildon
libgpepimc-hildon libtododb sdk-default-icons libosso"
gpe-todo/gpe-todo-hildon_0.55.bb:DEPENDS     =3D "libgpewidget-hildon
libgpepimc-hildon libtododb sdk-default-icons libosso"
:
dependencies on libosso-help:
maemo-mapper/maemo-mapper_svn.bb:DEPENDS =3D "gdbm libconic sqlite3 gtk+
libhildonfm libosso osso-ic-oss libosso-help gnome-vfs dbus
bluez-libs"
maemo/hildon-control-panel_0.9.1-1.2.bb:DEPENDS =3D "hildon-lgpl
hildon-base-lib osso-af-settings libosso hildon-libs osso-af-settings
libosso-help"

I haven't checked for the non-lib recipes, might be some additonal deps too=
.

Frans


