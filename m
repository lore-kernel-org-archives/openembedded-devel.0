Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@openbossa.org>) id 1Ld8Sk-0002pT-7t
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 20:33:35 +0100
Received: by yx-out-1718.google.com with SMTP id 36so910123yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2009 11:30:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.166.9 with SMTP id o9mr3016106ane.59.1235763003821; Fri, 
	27 Feb 2009 11:30:03 -0800 (PST)
In-Reply-To: <49A6938E.4070707@opensimpad.org>
References: <49A4EAFC.3080806@dls.net> <go2tlk$akt$2@ger.gmane.org>
	<1235550209.2621.28.camel@andromeda> <49A5606D.3050507@dls.net>
	<go3oup$b6r$1@ger.gmane.org> <49A6938E.4070707@opensimpad.org>
Date: Fri, 27 Feb 2009 16:30:03 -0300
Message-ID: <156d82ae0902271130o3b851d1l63ec02e87cd1b3e2@mail.gmail.com>
From: Rodrigo Vivi <rodrigo.vivi@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Fri, 27 Feb 2009 19:33:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> We maybe can add a tested on foo machines with git revision bar and distro x
> in version y to every commit.

Unfortunately it is so difficult to really test automatically every
commit because OE are receiving almost (more than?)  50 (please
correct if I'm wrong) commits by day and the right and more reliable
way to do that is every build from scratch to avoid have missing
dependencies that had already been built before.

> I think most developers are testing their commits but no one can test them
> in every possible combination.

Yes, it is difficult to test all combinations mainly because we work
with lots of machines and distros.

To do that we could maybe have a kind of distributed applicatioin
(scripts?) to build some distro for some machine spread all over the
world.

Let me explain (maunder?):

In the OE server we would have some kind of way to register the
machine that will do the tests for given distro and machine

i.e:

[koen-ip, angstrom, beagleboard]
[my-ip, mamona, nokia800]

Then, when a commit was received it would send notifications giving
the hash number to all remote clients that would put this commit in a
queue that would be built...
Maybe it is not necessary build from scrach everytime but once in a week (day?)
And the result would be sent back to the server to generate a report...

Well, but this test procedure would take so much time and maybe it by
itself doesn't prove anything because the commit has already been
done.
But maybe the reports could be used to guide the person that would
maintain the stable branch...

Anyway we can also deviate back this discussion to the commits and
change the commits policy. Have you already thought about to adopt a
commit policy like the linux kernel one?

Well don't take me bad (or serious) I'm just causing entropy to
generate a brainstorm where we can get ideas to make our life easier
and more "stable" ;)

-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


