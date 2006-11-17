Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GkrCO-0000No-N7
	for openembedded-devel@openembedded.org; Fri, 17 Nov 2006 01:03:16 +0100
Received: (qmail 24110 invoked by uid 813007); 17 Nov 2006 00:00:58 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 17 Nov 2006 00:00:58 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2006 01:01:05 +0100
User-Agent: KMail/1.9.5
References: <200610291528.40663.openembedded@hrw.one.pl>
In-Reply-To: <200610291528.40663.openembedded@hrw.one.pl>
MIME-Version: 1.0
Message-Id: <200611170101.06186.openembedded@hrw.one.pl>
Subject: Re: RFC: handling of machine/distro features stuff
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Nov 2006 00:03:17 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 29 pa=BCdziernika 2006 15:28, Marcin Juszkiewicz napisa=B3:
> Currently OpenEmbedded use overrides based on DISTRO, MACHINE,
> TARGET_ARCH and few others. I want to suggest start of using also
> {MACHINE,DISTRO}_FEATURES because we have some stuff in metadata which
> make sense only on some targets only - for example madwifi is limited
> to PCI devices only.

Holger 'zecke' Freyther pointed me to MacPorts and their 'variants'. After=
=20
looking at them I think that those are other kind of our overrides.

Which points me to this idea: how about adding COMBINED_FEATURES into=20
overrides? I do not know will it slow down BitBake or make metadata bit=20
more ugly but it is kind of solution.

do_configure() {
	do something
}

do_configure_pci() {
	do something
	do something PCI related
}

would solve wpa-supplicant example.=20

What do you think?

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

        "To be or not to be that is the question.":
         every programmer knows the answer $2b or (not $2b) is $ff.




