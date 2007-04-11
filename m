Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HbWjs-0004TA-RR
	for openembedded-devel@openembedded.org; Wed, 11 Apr 2007 08:55:32 +0200
Received: (qmail 28102 invoked by uid 813007); 11 Apr 2007 06:55:32 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.local)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 11 Apr 2007 06:55:32 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2007 08:55:33 +0200
User-Agent: KMail/1.9.6
References: <46176E51.2030608@dominion.kabel.utwente.nl>
	<1176049069.5844.6.camel@localhost.localdomain>
	<200704110850.48209.openembedded@hrw.one.pl>
In-Reply-To: <200704110850.48209.openembedded@hrw.one.pl>
MIME-Version: 1.0
Message-Id: <200704110855.34007.openembedded@hrw.one.pl>
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
X-List-Received-Date: Wed, 11 Apr 2007 06:55:33 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 11 kwietnia 2007, Marcin Juszkiewicz napisa=B3:

> Maybe rm_work.bbclass should do:
>
> BB_DEFAULT_TASK =3D "rm_work"
> addtask rm_work after do_build
>
> But I did not tested it yet (got that idea during Easter).

Looks like it is a way - atleast it works in Poky:

08:52 hrw@home:build$ bitbake base-files
NOTE: package base-files-3.0.14: started
NOTE: package base-files-3.0.14-r55: task do_fetch: started
NOTE: package base-files-3.0.14-r55: task do_fetch: completed
NOTE: package base-files-3.0.14-r55: task do_unpack: started
NOTE: package base-files-3.0.14-r55: task do_unpack: completed
NOTE: package base-files-3.0.14-r55: task do_patch: started
NOTE: package base-files-3.0.14-r55: task do_patch: completed
NOTE: package base-files-3.0.14-r55: task do_configure: started
NOTE: package base-files-3.0.14-r55: task do_configure: completed
NOTE: package base-files-3.0.14-r55: task do_compile: started
NOTE: package base-files-3.0.14-r55: task do_compile: completed
NOTE: package base-files-3.0.14-r55: task do_install: started
NOTE: package base-files-3.0.14-r55: task do_install: completed
NOTE: package base-files-3.0.14-r55: task do_package: started
NOTE: package base-files-3.0.14-r55: task do_package: completed
NOTE: package base-files-3.0.14-r55: task do_package_write: started
NOTE: package base-files-3.0.14-r55: task do_package_write: completed
NOTE: package base-files-3.0.14-r55: task do_populate_staging: started
NOTE: package base-files-3.0.14-r55: task do_populate_staging: completed
NOTE: package base-files-3.0.14-r55: task do_build: started
NOTE: package base-files-3.0.14-r55: task do_build: completed
NOTE: package base-files-3.0.14-r55: task do_rm_work: started
NOTE: package base-files-3.0.14-r55: task do_rm_work: completed
NOTE: package base-files-3.0.14: completed
NOTE: Tasks Summary: Attempted 204 tasks of which 193 didn't need to be rer=
un and 0 failed.
NOTE: build 200704110852: completed
08:53 hrw@home:build$                                                      =
=20

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                        If it works, don't fix it.
                        		-- Sam Rayburn




