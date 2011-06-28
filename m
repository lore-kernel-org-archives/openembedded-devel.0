Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QbbXA-0003Qg-1f for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 18:53:08 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QbbTc-0004Ay-NX for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 18:49:28 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 18:49:28 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 18:49:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Jun 2011 18:49:12 +0200
Message-ID: <iud0mc$e52$1@dough.gmane.org>
References: <cover.1309272010.git.otavio@ossystems.com.br>	<iucpq7$uav$1@dough.gmane.org>	<BANLkTinqwZhxLGtp997dgKh9BmAD02LU-A@mail.gmail.com>	<iucsbb$gp2$1@dough.gmane.org>
	<BANLkTimmBeR1COc-BRuASQf3O3g20uhkxg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTimmBeR1COc-BRuASQf3O3g20uhkxg@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 0/2] Fix parse errors
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
X-List-Received-Date: Tue, 28 Jun 2011 16:53:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-06-11 18:25, Otavio Salvador wrote:
> On Tue, Jun 28, 2011 at 12:35, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> It makes it easier to deploy updates for the main packages (e.g.
>> sysvinit, systemd) to all the targets without having to build it for all
>> targets. It's a weird optimization, but makes life a lot easier for
>> people needing to support a ton of machines :)
> 
> I didn't follow it; for example if you change PR of the recipe  it
> will be rebuild n times (being n the number of machines) and each of
> it will *overwrite* the non-machine packages. This seems wrong for me.
> 
> Can you describe a use case?

Rolling out a fix for the generic package without having to rebuild it N
times.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOCgYIMkyGM64RGpERAoFEAJ9O58mXspRM3IAljyCO3Udrh1G40gCgrMza
Qmh+JOLkLvq6qUCbrnIcKSU=
=/YG8
-----END PGP SIGNATURE-----



