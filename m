Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8Juc-0007pH-JS
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 21:35:35 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8JtK-0003Hw-Lk
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 20:34:11 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b10911110937u4607a2c8w9e63c9df738d8fe8@mail.gmail.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257949048.29038.388.camel@dax.rpnet.com>
	<1257954353.25369.304.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110801q308a2d80g916a0271757fedd5@mail.gmail.com>
	<1257955603.25369.325.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110937u4607a2c8w9e63c9df738d8fe8@mail.gmail.com>
Date: Wed, 11 Nov 2009 20:34:01 +0000
Message-ID: <1257971641.25369.426.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Wed, 11 Nov 2009 20:35:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 18:37 +0100, Frans Meulenbroeks wrote:
> 2009/11/11 Phil Blundell <pb@reciva.com>:
> > On Wed, 2009-11-11 at 17:01 +0100, Frans Meulenbroeks wrote:
> >> 2009/11/11 Phil Blundell <philb@gnu.org>:
> >> > On Wed, 2009-11-11 at 14:17 +0000, Richard Purdie wrote:
> >> >> SCR_URI = "xyz://abc.com/efg.tgz;name=bar"
> >> >>
> >> >> MD5SUM_bar = ""
> >> >>
> >> >> or maybe :
> >> >>
> >> >> MD5SUM[bar] = ""
> >> >
> >> > The labelling is a good idea, although I am not especially keen on
> >> > either of those notations.  How about:
> >> >
> >> > SRC_URI = "xyz://abc.com/efg.tgz;name=bar"
> >> > SRC_URI[md5sum:bar] = "..."
> >> > SRC_URI[sha256sum:bar] = "..."
> >> >
> >> Would we still be able to use PN and PV in the md5sum:bar etc?
> >
> > Not directly, though it isn't entirely obvious to me why this would be a
> > useful thing to do.  Did you have a situation in mind where this would
> > be desirable?
> >
> I am somewhat lazy so if a new version of a recipe has to be made I'd
> like to touch as little as possible.
> (the less I have to do the less chance of an error occurring)
> So preferably I would use PV an PN in the url and not copy it from
> somewhere (as that is more error prone too.

That should still work fine.  The purpose of the "name=bar" thing is to
decouple the checksum from the exact URI in use.  So, you can write:

SRC_URI = "${MIRROR}/somedir/${PN}-${PV}.tar.gz;name=mytarball \
           ${OTHERMIRROR}/${PN}-${PV}-extra-files.tar.gz;name=extrafiles"

and then, in another file if you prefer, add:

SRC_URI[md5sum:mytarball] = "d3b07384d113edec49eaa6238ad5ff00"
SRC_URI[md5sum:extrafiles] = "c157a79031e1c40f85931829bc5fc552"

p.




