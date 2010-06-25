Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OSDcy-0005Dh-7f for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 20:27:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OSDYS-0001B8-Ud for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 20:23:08 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 20:23:08 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 20:23:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 25 Jun 2010 20:22:55 +0200
Message-ID: <i02s5v$j7s$1@dough.gmane.org>
References: <20100625171600.GG17650@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <20100625171600.GG17650@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Fri, 25 Jun 2010 18:27:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-06-10 19:16, Martin Jansa wrote:
> Image build is showing some strange NOTEs when it finds multiple runtime providers (IIRC before it was only about buildtime providers)
> 
> NOTE: multiple providers are available for runtime matchbox-keyboard (matchbox-keyboard, matchbox-keyboard-inputmethod)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match matchbox-keyboard
> NOTE: multiple providers are available for runtime matchbox-keyboard-inputmethod (matchbox-keyboard-inputmethod, matchbox-keyboard)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match matchbox-keyboard-inputmethod
> 
> git grep shows it used here:
> recipes/angstrom/angstrom-gpe-task-base.bb:    matchbox-keyboard \
> recipes/images/x11-sato-image.bb:       matchbox-keyboard matchbox-keyboard-applet matchbox-keyboard-im \
> recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:RCONFLICTS_${PN} = "matchbox-keyboard"
> recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:RPROVIDES_${PN} = "matchbox-keyboard"
> recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:PACKAGES += "matchbox-keyboard-im matchbox-keyboard-im-dbg \
> recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:             matchbox-keyboard-applet matchbox-keyboard-applet-dbg"
> recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-im = "${libdir}/gtk-2.0/*/immodules/*.so"
> recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-im-dbg += "${libdir}/gtk-2.0/*/immodules/.debug"
> recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-applet = "${libdir}/matchbox-panel/*.so"
> recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb:FILES_matchbox-keyboard-applet-dbg += "${libdir}/matchbox-panel/.debug"
> recipes/matchbox-keyboard/matchbox-keyboard_svn.bb:RCONFLICTS_${PN} = matchbox-keyboard-inputmethod
> recipes/matchbox-keyboard/matchbox-keyboard_svn.bb:RPROVIDES_${PN} = matchbox-keyboard-inputmethod
> recipes/multitap-pad/multitap-pad_svn.bb:RCONFLICTS_${PN} = matchbox-keyboard-inputmethod
> recipes/tasks/task-mamona.bb:    matchbox-keyboard \
> recipes/tasks/task-openmoko-base.bb:#  matchbox-keyboard-inputmethod \
> recipes/tasks/task-openmoko-base.bb:#  matchbox-keyboard-im \
> recipes/tasks/task-openmoko-base.bb:#  matchbox-keyboard-applet \
> recipes/tasks/task-shr-minimal.bb:  matchbox-keyboard-im \
> 
> do we need RPROVIDES_${PN} here or can we replace 
> recipes/angstrom/angstrom-gpe-task-base.bb:    matchbox-keyboard \
> recipes/tasks/task-mamona.bb:    matchbox-keyboard \
> if they are not expecting to pull recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
> 
> IIRC runtime providers are not handled correctly in this case anyways, right?

It has been some years since I last looked that this, but at that time,
angstrom wanted 'matchbox-keyboard'. Dunno what those -om and -applet
are about.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMJPP/MkyGM64RGpERArreAJ96RuSvS7uN4oS2t1oY9YFxA3LEDgCfSd2L
64oWJRWEmfpyYSN3L9ClgBs=
=pzlB
-----END PGP SIGNATURE-----



