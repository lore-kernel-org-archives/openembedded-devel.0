Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OSUBE-0003ja-9R
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 14:08:17 +0200
Received: by fxm1 with SMTP id 1so2841483fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=d+E6SVipdpHvwcZ9+IYThAYwHsicbTIvVhzwG+1Y03I=;
	b=bXdrnxN8ZIRc1UK+/ZqKcb0sg/uEPlpjjIaX2QywyW+7HcPNDUC5gKoI8uWc4Acdb5
	ojehvXiJ7fDCAjvKHBIC+nm/H0Ad3nqd6lV3AhVQXnvdLorU345sB8XUzvOQ3VDL0pHx
	TEKDEPNlctsDCHe4nSYMFv4mNBxqWItTAkLwc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=WdKj0m7gkr+RJi6n9CkzQBliKlZ0Mx8w/p3UHSoNYntzWyQ97kxLr0RVVvn1T+oesR
	4AhNxNYntot2nZRijLUs05dAS1UWunsgz0OifESZDolV/9HpQDrxzY3jvUbObl3TZK4H
	n3qX9dRqqhLt4+0GbkBTyFjFMJuSJpAR2JLT4=
Received: by 10.223.5.81 with SMTP id 17mr1647747fau.42.1277553816930;
	Sat, 26 Jun 2010 05:03:36 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d9sm11174027fav.18.2010.06.26.05.03.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 26 Jun 2010 05:03:36 -0700 (PDT)
Date: Sat, 26 Jun 2010 14:03:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100626120314.GL17650@jama>
References: <20100625171600.GG17650@jama>
 <i02s5v$j7s$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i02s5v$j7s$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: What is preferred matchbox-keyboard provider nowadays?
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
X-List-Received-Date: Sat, 26 Jun 2010 12:08:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 25, 2010 at 08:22:55PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 25-06-10 19:16, Martin Jansa wrote:
> > Image build is showing some strange NOTEs when it finds multiple runtime providers (IIRC before it was only about buildtime providers)
> > 
> > NOTE: multiple providers are available for runtime matchbox-keyboard (matchbox-keyboard, matchbox-keyboard-inputmethod)
> > NOTE: consider defining a PREFERRED_PROVIDER entry to match matchbox-keyboard
> > NOTE: multiple providers are available for runtime matchbox-keyboard-inputmethod (matchbox-keyboard-inputmethod, matchbox-keyboard)
> > NOTE: consider defining a PREFERRED_PROVIDER entry to match matchbox-keyboard-inputmethod
> > 
> > git grep shows it used here:
> > recipes/angstrom/angstrom-gpe-task-base.bb:    matchbox-keyboard \
> > recipes/images/x11-sato-image.bb:       matchbox-keyboard matchbox-keyboard-applet matchbox-keyboard-im \
> > recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:RCONFLICTS_${PN} = "matchbox-keyboard"
> > recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:RPROVIDES_${PN} = "matchbox-keyboard"
> > recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:PACKAGES += "matchbox-keyboard-im matchbox-keyboard-im-dbg \
> > recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:             matchbox-keyboard-applet matchbox-keyboard-applet-dbg"
> > recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-im = "${libdir}/gtk-2.0/*/immodules/*.so"
> > recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-im-dbg += "${libdir}/gtk-2.0/*/immodules/.debug"
> > recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-applet = "${libdir}/matchbox-panel/*.so"
> > recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-applet-dbg += "${libdir}/matchbox-panel/.debug"
> > recipes/matchbox-keyboard/matchbox-keyboard_svn.bb:RCONFLICTS_${PN} = matchbox-keyboard-inputmethod
> > recipes/matchbox-keyboard/matchbox-keyboard_svn.bb:RPROVIDES_${PN} = matchbox-keyboard-inputmethod
> > recipes/multitap-pad/multitap-pad_svn.bb:RCONFLICTS_${PN} = matchbox-keyboard-inputmethod
> > recipes/tasks/task-mamona.bb:    matchbox-keyboard \
> > recipes/tasks/task-openmoko-base.bb:#  matchbox-keyboard-inputmethod \
> > recipes/tasks/task-openmoko-base.bb:#  matchbox-keyboard-im \
> > recipes/tasks/task-openmoko-base.bb:#  matchbox-keyboard-applet \
> > recipes/tasks/task-shr-minimal.bb:  matchbox-keyboard-im \
> > 
> > do we need RPROVIDES_${PN} here or can we replace 
> > recipes/angstrom/angstrom-gpe-task-base.bb:    matchbox-keyboard \
> > recipes/tasks/task-mamona.bb:    matchbox-keyboard \
> > if they are not expecting to pull recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
> > 
> > IIRC runtime providers are not handled correctly in this case anyways, right?
> 
> It has been some years since I last looked that this, but at that time,
> angstrom wanted 'matchbox-keyboard'. Dunno what those -om and -applet
> are about.

I tried to compare the output and matchbox-keyboard_svn.bb provides the same 
as matchbox-keyboard-inputmethod package, but matchbox-keyboard-inputmethod has
extra Xsession.d script and builds also matchbox-keyboard-im (used in SHR to propagate
virtual keyboard clicks to gtk apps) and matchbox-keyboard-applet (I guess applet with 
keybard itself?).

So I think that RPROVIDES_${PN} removal should be OK and RCONFLICTS between matchbox-keyboard 
and matchbox-keyboard-inputmethod is enough to block conflicting files on target.

I'll send patch for this.

BTW: I can confirm that those multiple runtime providers are NOTEd 
only with bitbake master and 1.10 doesn't show them.

bitbake@jama ~/tmpdir-dev-shr/work/armv4t-oe-linux-gnueabi/matchbox-keyboard-inputmethod-0.0+svnr1910-r11/packages-split $ find
.
./matchbox-keyboard-inputmethod-static
./matchbox-keyboard-inputmethod.shlibdeps
./matchbox-keyboard-applet-dbg
./matchbox-keyboard-im
./matchbox-keyboard-im/usr
./matchbox-keyboard-im/usr/lib
./matchbox-keyboard-im/usr/lib/gtk-2.0
./matchbox-keyboard-im/usr/lib/gtk-2.0/2.10.0
./matchbox-keyboard-im/usr/lib/gtk-2.0/2.10.0/immodules
./matchbox-keyboard-im/usr/lib/gtk-2.0/2.10.0/immodules/libmb-im-invoker.so
./matchbox-keyboard-inputmethod
./matchbox-keyboard-inputmethod/etc
./matchbox-keyboard-inputmethod/etc/X11
./matchbox-keyboard-inputmethod/etc/X11/Xsession.d
./matchbox-keyboard-inputmethod/etc/X11/Xsession.d/80matchboxkeyboard
./matchbox-keyboard-inputmethod/usr
./matchbox-keyboard-inputmethod/usr/bin
./matchbox-keyboard-inputmethod/usr/bin/matchbox-keyboard
./matchbox-keyboard-inputmethod/usr/share
./matchbox-keyboard-inputmethod/usr/share/matchbox-keyboard
./matchbox-keyboard-inputmethod/usr/share/matchbox-keyboard/keyboard.xml
./matchbox-keyboard-inputmethod/usr/share/matchbox-keyboard/keyboard-ru.xml
./matchbox-keyboard-inputmethod/usr/share/matchbox-keyboard/keyboard-numpad.xml
./matchbox-keyboard-inputmethod/usr/share/matchbox-keyboard/keyboard-us.xml
./matchbox-keyboard-inputmethod/usr/share/matchbox-keyboard/keyboard-extended.xml
./matchbox-keyboard-inputmethod/usr/share/matchbox-keyboard/keyboard-dvorak.xml
./matchbox-keyboard-inputmethod/usr/share/matchbox-keyboard/keyboard-fi.xml
./matchbox-keyboard-inputmethod/usr/share/applications
./matchbox-keyboard-inputmethod/usr/share/applications/inputmethods
./matchbox-keyboard-inputmethod/usr/share/applications/inputmethods/matchbox-keyboard.desktop
./matchbox-keyboard-inputmethod/usr/share/pixmaps
./matchbox-keyboard-inputmethod/usr/share/pixmaps/matchbox-keyboard.png
./matchbox-keyboard-im.shlibdeps
./matchbox-keyboard-applet.shlibdeps
./matchbox-keyboard-inputmethod-dbg
./matchbox-keyboard-inputmethod-dbg/usr
./matchbox-keyboard-inputmethod-dbg/usr/bin
./matchbox-keyboard-inputmethod-dbg/usr/bin/.debug
./matchbox-keyboard-inputmethod-dbg/usr/bin/.debug/matchbox-keyboard
./matchbox-keyboard-inputmethod-dbg/usr/lib
./matchbox-keyboard-inputmethod-dbg/usr/lib/matchbox-panel
./matchbox-keyboard-inputmethod-dbg/usr/lib/matchbox-panel/.debug
./matchbox-keyboard-inputmethod-dbg/usr/lib/matchbox-panel/.debug/libkeyboard.so
./matchbox-keyboard-inputmethod-dev
./matchbox-keyboard-inputmethod-doc
./matchbox-keyboard-applet
./matchbox-keyboard-applet/usr
./matchbox-keyboard-applet/usr/lib
./matchbox-keyboard-applet/usr/lib/matchbox-panel
./matchbox-keyboard-applet/usr/lib/matchbox-panel/libkeyboard.so
./matchbox-keyboard-im-dbg
./matchbox-keyboard-im-dbg/usr
./matchbox-keyboard-im-dbg/usr/lib
./matchbox-keyboard-im-dbg/usr/lib/gtk-2.0
./matchbox-keyboard-im-dbg/usr/lib/gtk-2.0/2.10.0
./matchbox-keyboard-im-dbg/usr/lib/gtk-2.0/2.10.0/immodules
./matchbox-keyboard-im-dbg/usr/lib/gtk-2.0/2.10.0/immodules/.debug
./matchbox-keyboard-im-dbg/usr/lib/gtk-2.0/2.10.0/immodules/.debug/libmb-im-invoker.so
./matchbox-keyboard-inputmethod-locale

bitbake@jama ~/tmpdir-dev-shr/work/armv4t-oe-linux-gnueabi/matchbox-keyboard-0.0+svnr1910-r8/packages-split $ find
.
./matchbox-keyboard.shlibdeps
./matchbox-keyboard
./matchbox-keyboard/usr
./matchbox-keyboard/usr/bin
./matchbox-keyboard/usr/bin/matchbox-keyboard
./matchbox-keyboard/usr/share
./matchbox-keyboard/usr/share/matchbox-keyboard
./matchbox-keyboard/usr/share/matchbox-keyboard/keyboard.xml
./matchbox-keyboard/usr/share/matchbox-keyboard/keyboard-ru.xml
./matchbox-keyboard/usr/share/matchbox-keyboard/keyboard-numpad.xml
./matchbox-keyboard/usr/share/matchbox-keyboard/keyboard-us.xml
./matchbox-keyboard/usr/share/matchbox-keyboard/keyboard-extended.xml
./matchbox-keyboard/usr/share/matchbox-keyboard/keyboard-dvorak.xml
./matchbox-keyboard/usr/share/matchbox-keyboard/keyboard-fi.xml
./matchbox-keyboard/usr/share/applications
./matchbox-keyboard/usr/share/applications/inputmethods
./matchbox-keyboard/usr/share/applications/inputmethods/matchbox-keyboard.desktop
./matchbox-keyboard/usr/share/pixmaps
./matchbox-keyboard/usr/share/pixmaps/matchbox-keyboard.png
./matchbox-keyboard-dbg
./matchbox-keyboard-dbg/usr
./matchbox-keyboard-dbg/usr/bin
./matchbox-keyboard-dbg/usr/bin/.debug
./matchbox-keyboard-dbg/usr/bin/.debug/matchbox-keyboard
./matchbox-keyboard-dev
./matchbox-keyboard-doc
./matchbox-keyboard-locale
./matchbox-keyboard-static

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


