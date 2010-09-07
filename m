Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OsyhG-0006DH-F8
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 15:59:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o87DwATK004284;
	Tue, 7 Sep 2010 14:58:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04263-01; Tue,  7 Sep 2010 14:58:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o87Dw5kQ004268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Sep 2010 14:58:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100906201144.GA8176@rhein.zuhause.netz>
References: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
	<AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
	<AANLkTikSBQOi6aC0W8QzfEOk6skMcBmbaJdmE4K+Auwd@mail.gmail.com>
	<20100906035002.GB5320@gmail.com>
	<AANLkTinvnAhcr63sm=O+s+iyZw8tKfspjzhR__XOb5mU@mail.gmail.com>
	<AANLkTi=zkn=Ns7MgcakxC8F61O9it3FTYb8XgtHRmcrD@mail.gmail.com>
	<AANLkTimNk1mKqHBsfW6S-KuQkbVyT8f4ajz1d8adDFcc@mail.gmail.com>
	<20100906201144.GA8176@rhein.zuhause.netz>
Date: Tue, 07 Sep 2010 14:57:58 +0100
Message-ID: <1283867878.26335.305.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: virtclass_install prepend
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
X-List-Received-Date: Tue, 07 Sep 2010 13:59:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-09-06 at 22:11 +0200, Henning Heinold wrote:
> > >> The code is:
> > >> do_install_virtclass-native_prepend() {
> > >>         install -d ${D}${datadir}/dbus
> > >>        install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/dbus
> > >> }
> > >>
> > >> Actually if the standard do_install needs to be changed, it generally
> > >> raises some alarms with me.
> > >> Why would we need to install something that the package normally does
> > >> not install?
> > >> (of course this could be a bug in the package, but then I would prefer
> > >> a patch that we also try to push upstream).
> > >>
> > >
> > > Agreed, that is odd.  If it's something that dbus using things might need,
> > > why is it only prepended for the native version, and as you say, why is it
> > > not installed by the upstream install target.  I'd do a git blame and figure
> > > out who added that and ask them :)
> > > --
> > 
> > Henning,
> > Git blame gives your name as the person who created those lines.
> > Care to comment?
> > 
> > Frans
>
> if I remember correctly this file is generated in the build process. But somehow
> in the later versions of dbus-glib there is somehow an error so this file gets not installed
> at all in the native variant. So I did it per hand.

I suspect that code could well have come from Poky. In this case the
native recipe generates a file which is then used by the target builds.
It can't be generated in the target recipe as that would mean running
target binaries.

So it is in fact a perfectly valid thing to do in this case.

Cheers,

Richard



