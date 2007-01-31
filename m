Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HCCyx-0001ga-PY
	for openembedded-devel@openembedded.org; Wed, 31 Jan 2007 11:46:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0VAkRBl032356
	for <openembedded-devel@openembedded.org>; Wed, 31 Jan 2007 10:46:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32061-04 for <openembedded-devel@openembedded.org>;
	Wed, 31 Jan 2007 10:46:25 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0VAkKnM032347
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 31 Jan 2007 10:46:20 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Wed, 31 Jan 2007 10:46:19 +0000
Message-Id: <1170240380.5809.15.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: RFC: Xorg Version Numbering
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
X-List-Received-Date: Wed, 31 Jan 2007 10:46:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I have some concerns about our current xorg versioning policy. Anyone
watching poky will have noticed I added an xserver compatible with the
Nokia N800. To do this, I needed inputproto 1.4 which whilst its
available as an individual release, it isn't In X11R7.1 or the upcomming
X11R7.2. I therefore faced a dilemma as to what PV to give this .bb
file. Options were:

inputproto_X11R7.0-1.3.2+1.4
inputproto_X11R7.1-1.4
inputproto_1.4

The last option is the only really correct one and the only one that
allows sane package upgrades (at the expense of being incompatible with
the X11R7 numbering). For now I settled on the middle option since it
will give me options when 7.2 comes out. I have since faced this problem
with several other xorg packages.

I also had to make some nasty hacks in the .bb files to convince them to
pull the tarball from somewhere outside for the X11R7.x release. It
would certainly be simpler if we just used the versions from
http://xorg.freedesktop.org/releases/individual/ .

My question is therefore does it make sense to have X11R7.x in PV?

If people want a build compatible with X11R.x, it would be easy to write
a preferred-version-X11R7.1.inc with the appropriate PREFERRED_VERSIONs
set. In fact you could have a script autogenerate that.

I realise removing X11Rx from the PV will break upgrades but I think if
we don't do that, we could be storing up trouble in the long run which
we could change now.

Comments welcome...

Cheers,

Richard




