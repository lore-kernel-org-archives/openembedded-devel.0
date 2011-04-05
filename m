Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q72cg-00028I-AU
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 11:32:32 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q72ag-00070d-RS
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 11:30:26 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <A24792C8-9E84-41EA-B52F-04A54FCECDF0@vanille-media.de>
References: <4D99D609.8020800@mlbassoc.com> <4D99D689.9050705@mlbassoc.com>
	<79CF2877-D36A-412A-AF90-6FF538AACF9C@gmail.com>
	<4D99D92F.6080609@mlbassoc.com>
	<A24792C8-9E84-41EA-B52F-04A54FCECDF0@vanille-media.de>
Date: Tue, 05 Apr 2011 10:30:24 +0100
Message-ID: <1301995824.14449.291.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Master broken?
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
X-List-Received-Date: Tue, 05 Apr 2011 09:32:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-04-05 at 11:22 +0200, Dr. Michael Lauer wrote:
> Take a look at bitbake.conf The DISTRO configuration is included via the
> 'include' directive, which is a permissive include =E2=80=93 in contrast =
to 'require',
> which is a mandatory include.
>=20
> I don't recall our reasons for keeping it like that, but I remember that =
'require'
> wasn't present at the time we wrote bitbake.conf. Perhaps we should recon=
sider
> that 'include'.

Partly because, as you say, bitbake didn't support "require" at the
time; and also partly because, when that part of bitbake.conf was
originally written, both DISTRO and MACHINE were much more optional than
they are today.  (In fact, the sample local.conf still implies that it's
legitimate to not select a MACHINE or DISTRO, though in practice I'm not
sure that it's feasible to get any useful results if you don't.)

I agree, it seems reasonable to change that include to a require.
Anybody who genuinely doesn't want a distro configuration is presumably
going to be savvy enough to create a dummy file in order to keep bitbake
happy.

p.




