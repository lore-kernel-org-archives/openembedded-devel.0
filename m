Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NuUci-0004mE-Ul
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 18:44:14 +0100
Received: (qmail 8322 invoked by uid 813007); 24 Mar 2010 17:41:00 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 24 Mar 2010 17:41:00 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Mar 2010 18:41:00 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.34-rc2; KDE/4.4.1; x86_64; ; )
References: <201003211505.39554.roman@khimov.ru> <hoddfo$6ql$1@dough.gmane.org>
	<201003242026.22169.roman@khimov.ru>
In-Reply-To: <201003242026.22169.roman@khimov.ru>
MIME-Version: 1.0
Message-Id: <201003241841.01034.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 01/44] cpan-base: add perl version to PR
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
X-List-Received-Date: Wed, 24 Mar 2010 17:44:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia =B6roda, 24 marca 2010 o 18:26:16 Roman I Khimov napisa=B3(a):

> OK. Pushed perl 5.10.1, everybody, have fun!

18:39 hrw@home:angstrom$ bitbake perl
NOTE: Handling BitBake files: - (0975/8143) [11 %]NOTE: <type=20
'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType' objects whi=
le=20
evaluating:
r0${@perl_get_version_suffix(d)}
NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'=
=20
objects while evaluating:
${PN}-${EXTENDPE}${PV}-${PR}
NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'=
=20
objects while evaluating:
${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}
NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'=
=20
objects while evaluating:
${WORKDIR}/callweaver-1.2-${CWRCV}/contrib/ogi-perl/callweaver-perl-0.0.1
NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'=
=20
objects while evaluating:
${S}
ERROR: cannot concatenate 'str' and 'NoneType' objects while parsing=20
/home/hrw/devel/oe/openembedded/recipes/callweaver/callweaver-perl.bb
NOTE: Handling BitBake files: - (3827/8143) [46 %]NOTE: <type=20
'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType' objects whi=
le=20
evaluating:
r2${@perl_get_version_suffix(d)}
NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'=
=20
objects while evaluating:
${PN}-${EXTENDPE}${PV}-${PR}
NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'=
=20
objects while evaluating:
${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}
NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'=
=20
objects while evaluating:
${WORKDIR}/SDL_perl-${PV}
NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'=
=20
objects while evaluating:
${S}
ERROR: cannot concatenate 'str' and 'NoneType' objects while parsing=20
/home/hrw/devel/oe/openembedded/recipes/sdlperl/sdl-perl_1.20.3.bb

And same for lot of perl recipes.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




