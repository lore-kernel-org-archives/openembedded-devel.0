Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HNoAc-0003OV-9b
	for openembedded-devel@openembedded.org; Sun, 04 Mar 2007 11:42:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l24AgQTe009214
	for <openembedded-devel@openembedded.org>; Sun, 4 Mar 2007 10:42:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08529-04 for <openembedded-devel@openembedded.org>;
	Sun,  4 Mar 2007 10:42:23 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l24AgKfG009206
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 4 Mar 2007 10:42:20 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1172966900.11398.124.camel@localhost.localdomain>
References: <HOECLKEKOHLAMMGDLLBHIEJEKEAA.skoroneos@digital-opsis.com>
	<45E7ED77.2090103@whitby.id.au>
	<45E7F5C9.2000507@dominion.kabel.utwente.nl>
	<1172942376.11398.107.camel@localhost.localdomain>
	<1172962072.5942.68.camel@localhost.localdomain>
	<1172966900.11398.124.camel@localhost.localdomain>
Date: Sun, 04 Mar 2007 10:42:19 +0000
Message-Id: <1173004939.5832.4.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
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
X-List-Received-Date: Sun, 04 Mar 2007 10:42:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-03-04 at 01:08 +0100, Matthias Hentges wrote:
> Using a very large ipk feed does indeed work nicely to generate images.
> However, generating Packages can take ages ( and so do image rebuilds
> because of this ). That's about the only problem I see w/ One Giant Feed

We speeded that up quite a bit and there is another speedup planned
which should remove that obstacle. Its been discussed here in the past.

> > My personal experience says multimachine works well and I use if for
> > everything as standard these days. Have you any specific examples or
> > problems? I have been dealing with them as and when I've seen them but I
> > haven't seen any in quite a whiie... 
> 
> I wasn't exactly running into real ipkg bugs. I had problems with
> packages using machine-specific stuff for some models ( say all
> sl-c3x00) and hence having their ARCH set as $MACHINE, but not for other
> models ( like collie, poodle ) having their ARCH set as $ARCH. 
> 
> It's a packaging bug, not an ipkg bug but annoying in any case ;)

Some packages work like this as a feature, ts-conf now being one of
them. The standard one can be overridden by a machine specific package.
It should just require that the ipkg Architectures are in the right
order. There could also be an issue for ipkg deciding whether it should
use an  arch specific package or latest version in a case where packages
that used to be machine specific no longer are. If ipkg can't handle
that, I'd say ipkg needs fixing.

Cheers,

Richard



