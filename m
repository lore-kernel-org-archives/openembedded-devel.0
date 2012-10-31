Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1TTX4s-0007rB-O4
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:07:22 +0100
Received: from localhost (193.41.119.134) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.279.1; Wed, 31 Oct 2012
	12:52:32 +0100
Date: Wed, 31 Oct 2012 12:52:40 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121031115239.GA7040@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com>
MIME-Version: 1.0
In-Reply-To: <50910EFB.7010804@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:07:22 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Martin Erts=E5s <martiert@gmail.com> [121031 12:48]:

> For this you should also have a look at the ntpdate.service and
> ntp.service files. There was a discussion about this earlier:
> http://patches.openembedded.org/patch/38575/

Sure, that patch is also nice to have. However, it's more important to
get Otavio's update in, as currently meta-oe (meta-networkig) doesn't
build together with meta-systemd... As there is a version conflict
between the bb and bbappend.

> Also, what is not on that discussion, is that pool.ntp.org is not really
> the way to do it. What we would like is to register something like
> pool.yocto.ntp.org, but for
> now I guess we can just use pool.ntp.org and then change it when someone
> have registered it. Kind of feel someone officially related to the
> project should register it.

The same reasoning apply here. Hopefully, someone in the Yocto Project
can register a pool, after which we can update the recipe again.

Cheers,
Anders


> On 10/31/12 12:08, Otavio Salvador wrote:
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >  .../recipes-support/ntp/ntp/ntpd.service           |    0
> >  .../recipes-support/ntp/ntp/ntpdate.service        |    0
> >  .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |    0
> >  3 files changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-systemd/{meta-oe =3D> meta-networking}/recipes-support/ntp=
/ntp/ntpd.service (100%)
> >  rename meta-systemd/{meta-oe =3D> meta-networking}/recipes-support/ntp=
/ntp/ntpdate.service (100%)
> >  rename meta-systemd/{meta-oe =3D> meta-networking}/recipes-support/ntp=
/ntp_4.2.6p3.bbappend (100%)
> >

--=20
Anders Darander
ChargeStorm AB / eStorm AB


