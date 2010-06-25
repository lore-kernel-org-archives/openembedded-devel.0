Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OSCaG-0004Xe-JZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 19:20:57 +0200
Received: by fxm1 with SMTP id 1so2563391fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=FUmfz/sKo7YgONRJLNQvA274gwrq/d62XMrffx53p1E=;
	b=L7VrRFrJq7eso9kI+IBn9WzH53hRnpSWAswy0f1hN7a7vkd24bqzWK9Nktxme4185U
	XvJMr5Sd9tSbd3lVZf80EylvAApqTtdu9U8cVzfjK4tL89uFgdScbAxd6B0aVfIhIcVT
	dVw8ezpStM84ML3Tefizt79Ud1RjSzZGAMTNE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=DHQrM0QYr8Ex9CIZFI1Brw//sPn5vD9hBQ08GDmDfOo3adquZfed8xMjwoEN13PFBB
	QstQtOPBo90QRfzM8I/9xR4oG8Of2mFYZDZqSxrAbC2lLTjg3P0gpbaUi+V7FkTL1Lh4
	mJXD2pkaJpY1wYZ18a9ElT/34Ts2HEcEHjLwg=
Received: by 10.223.103.69 with SMTP id j5mr841340fao.60.1277486177926;
	Fri, 25 Jun 2010 10:16:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e10sm38379259fak.14.2010.06.25.10.16.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jun 2010 10:16:17 -0700 (PDT)
Date: Fri, 25 Jun 2010 19:16:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100625171600.GG17650@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: What is preferred matchbox-keyboard provider nowadays?
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
X-List-Received-Date: Fri, 25 Jun 2010 17:20:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Image build is showing some strange NOTEs when it finds multiple runtime providers (IIRC before it was only about buildtime providers)

NOTE: multiple providers are available for runtime matchbox-keyboard (matchbox-keyboard, matchbox-keyboard-inputmethod)
NOTE: consider defining a PREFERRED_PROVIDER entry to match matchbox-keyboard
NOTE: multiple providers are available for runtime matchbox-keyboard-inputmethod (matchbox-keyboard-inputmethod, matchbox-keyboard)
NOTE: consider defining a PREFERRED_PROVIDER entry to match matchbox-keyboard-inputmethod

git grep shows it used here:
recipes/angstrom/angstrom-gpe-task-base.bb:    matchbox-keyboard \
recipes/images/x11-sato-image.bb:       matchbox-keyboard matchbox-keyboard-applet matchbox-keyboard-im \
recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:RCONFLICTS_${PN} = "matchbox-keyboard"
recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:RPROVIDES_${PN} = "matchbox-keyboard"
recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:PACKAGES += "matchbox-keyboard-im matchbox-keyboard-im-dbg \
recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:             matchbox-keyboard-applet matchbox-keyboard-applet-dbg"
recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-im = "${libdir}/gtk-2.0/*/immodules/*.so"
recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-im-dbg += "${libdir}/gtk-2.0/*/immodules/.debug"
recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-applet = "${libdir}/matchbox-panel/*.so"
recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-applet-dbg += "${libdir}/matchbox-panel/.debug"
recipes/matchbox-keyboard/matchbox-keyboard_svn.bb:RCONFLICTS_${PN} = matchbox-keyboard-inputmethod
recipes/matchbox-keyboard/matchbox-keyboard_svn.bb:RPROVIDES_${PN} = matchbox-keyboard-inputmethod
recipes/multitap-pad/multitap-pad_svn.bb:RCONFLICTS_${PN} = matchbox-keyboard-inputmethod
recipes/tasks/task-mamona.bb:    matchbox-keyboard \
recipes/tasks/task-openmoko-base.bb:#  matchbox-keyboard-inputmethod \
recipes/tasks/task-openmoko-base.bb:#  matchbox-keyboard-im \
recipes/tasks/task-openmoko-base.bb:#  matchbox-keyboard-applet \
recipes/tasks/task-shr-minimal.bb:  matchbox-keyboard-im \

do we need RPROVIDES_${PN} here or can we replace 
recipes/angstrom/angstrom-gpe-task-base.bb:    matchbox-keyboard \
recipes/tasks/task-mamona.bb:    matchbox-keyboard \
if they are not expecting to pull recipes/matchbox-keyboard/matchbox-keyboard_svn.bb

IIRC runtime providers are not handled correctly in this case anyways, right?

Regards,

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


