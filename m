Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JZlf7-0003eg-75
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 12:31:59 +0100
Received: (qmail 32197 invoked by uid 813007); 13 Mar 2008 11:29:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Mar 2008 11:29:43 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Mar 2008 12:29:36 +0100
User-Agent: KMail/1.9.9
References: <200803110807.11368.zecke@selfish.org>
	<c384c5ea0803121507j60b949dtc704c316b561a5ac@mail.gmail.com>
	<20080313003228.6a4c8ad4@widy.localdomain>
In-Reply-To: <20080313003228.6a4c8ad4@widy.localdomain>
MIME-Version: 1.0
Message-Id: <200803131229.38083.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: openembedded@haerwu.biz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Thu, 13 Mar 2008 11:31:59 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Wednesday 12 of March 2008, Paul Sokolovsky napisa=B3:
> "Leon Woestenberg" <leon.woestenberg@gmail.com> wrote:

> > Multiple heads and lightweight branches are two different things.
>
> Probably also because of different numbers of hexadecimal digits?
>
> > A branch has a name/tag that tells me what is happening in that
> > branch or who is making it happen.
>
> And heads have head revision and change logs too!

And gets automerged by our monotone server.

> Well, but the talk was about mirroring and syncing potentially
> incompatible changes. Do lightweight branches help with this?

They do. After Poky release I pushed lot of stuff which I had ready on my=20
harddisk (unversioned). With GIT I would just do 'poky-after-3.1-release'=20
branch which would die after merging with 'trunk'.

=46or making experiments with Poky I can create branch (via git-svn for now=
)=20
which will have few days of work inside which will then be merged and=20
pushed.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 We are the Knights who say: MOVE.L USP,A1




