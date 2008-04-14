Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JlLjJ-0004ja-Q7
	for openembedded-devel@openembedded.org; Mon, 14 Apr 2008 12:16:05 +0200
Received: (qmail 29913 invoked by uid 813007); 14 Apr 2008 10:16:02 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 14 Apr 2008 10:16:02 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Apr 2008 12:15:56 +0200
User-Agent: KMail/1.9.9
References: <E1JlKdS-0003do-UZ@daffy.sipo.nl>
In-Reply-To: <E1JlKdS-0003do-UZ@daffy.sipo.nl>
MIME-Version: 1.0
Message-Id: <200804141215.59255.openembedded@haerwu.biz>
Subject: Re: task configuration not evaluated?
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
X-List-Received-Date: Mon, 14 Apr 2008 10:16:06 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Monday 14 of April 2008, RvP napisa=B3:

> I modified the packages/tasks/task-slugos.bb file after building the
> SlugOS image and did a bb slugos-image'. A new image was built, but the
> changes I put in the task-slugos.bb were not taken into account. More
> specifically: I removed the via-velocity kernel module from the
> SLUGOS_STANDARD_RRECOMMENDS and added another (fs) module.=20

> What should I do to make changes in the task file effective (except for
> rebuiling everyting...)?

If recipe change affect build then PR value needs to be bumped.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

  Think for yourselves and let others enjoy the privilege to do so, too.
  -- Voltaire




