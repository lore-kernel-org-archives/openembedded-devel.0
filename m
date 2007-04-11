Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HbWfH-0004Li-Sy
	for openembedded-devel@openembedded.org; Wed, 11 Apr 2007 08:50:48 +0200
Received: (qmail 25021 invoked by uid 813007); 11 Apr 2007 06:50:46 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.local)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 11 Apr 2007 06:50:46 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2007 08:50:47 +0200
User-Agent: KMail/1.9.6
References: <46176E51.2030608@dominion.kabel.utwente.nl>
	<D93C49B4-4326-49E1-981A-C3EA65F49070@selfish.org>
	<1176049069.5844.6.camel@localhost.localdomain>
In-Reply-To: <1176049069.5844.6.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200704110850.48209.openembedded@hrw.one.pl>
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Wed, 11 Apr 2007 06:50:50 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 8 kwietnia 2007, Richard Purdie napisa=B3:

> Even if you do this in bitbake itself, what happens if two tasks want
> to run last before do_build? Which do you choose?

> My thoughts are that we need to improve the way we specify tasks to be
> able to specify this kind of relationship more accurately. Even the
> form:
>
> addtask rm_work before do_build after do_package_write do_deploy
>
> where the tasks might not always exist might be enough to get things
> working?

I wrote rm_work.bbclass few years ago and it was always known as 'you can=20
hit your own foot' solution due to lack of possibility to define WHEN=20
exactly task will be started:

addtask rm_work right_before do_build after all_other_tasks

Maybe rm_work.bbclass should do:

BB_DEFAULT_TASK =3D "rm_work"
addtask rm_work after do_build

But I did not tested it yet (got that idea during Easter).

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                            It is your destiny.
                            		-- Darth Vader




