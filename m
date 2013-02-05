Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1U2hVP-0003dF-Lb
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 13:20:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r15C4F8E016610
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Feb 2013 04:04:15 -0800 (PST)
Received: from windriver.com (128.224.169.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 5 Feb 2013 04:04:14 -0800
Date: Tue, 5 Feb 2013 14:04:16 +0200
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20130205120416.GC8509@windriver.com>
References: <1360062139-10894-1-git-send-email-andrei.gherzan@windriver.com>
	<20130205112251.GO3271@jama>
	<CALbNGRSpp0mq7e7ZUR-+yDpaq8XWSsfRiMMUyt1QAJwY13VYQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSpp0mq7e7ZUR-+yDpaq8XWSsfRiMMUyt1QAJwY13VYQQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r15C4F8E016610
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-systemd][PATCH] wpa-supplicant: Add bbappend to package systemd service in a -systemd package
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
X-List-Received-Date: Tue, 05 Feb 2013 12:20:12 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2013 at 12:49:43PM +0100, Andreas M=FCller wrote:
> On Tue, Feb 5, 2013 at 12:22 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > On Tue, Feb 05, 2013 at 01:02:19PM +0200, Andrei Gherzan wrote:
> >> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> >> ---
> >>  .../wpa-supplicant/wpa-supplicant_2.0.bbappend     |    7 +++++++
> >>  1 files changed, 7 insertions(+), 0 deletions(-)
> >>  create mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-su=
pplicant/wpa-supplicant_2.0.bbappend
> >
> > oe-core wpa-supplicant now installs wpa_supplicant.service to PN, is
> > this SYSTEMD_PACKAGES correct now?
> >

Hmm... don't really understand your question. I know the service is insta=
lled in
PN and by using SYSTEMD_PACKAGES=3D"${PN}-systemd" I actually move that
service in ${PN}-systemd.

> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/=
043675.html
> >
> > --
> oe-core has set facts. The decision systemd or not is made by
> DISTRO_FEATURE. I think we have to follow that (=3Dlet meta-systemd die=
)
> to avoid two concurrent systemd enable mechanisms.

I understand this and makes sense. But still, systemd services should be =
in a
systemd package. Will resend this to oe-core.

--
Andrei Gherzan | Wind River Systems
m: +40 734 450 615 | p: +40 236 320 307



