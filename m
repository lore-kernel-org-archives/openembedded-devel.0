Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H3yhh-0002Pn-Oy
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 18:54:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l08Hqurb022492
	for <openembedded-devel@openembedded.org>; Mon, 8 Jan 2007 17:52:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22377-02 for <openembedded-devel@openembedded.org>;
	Mon,  8 Jan 2007 17:52:54 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l08Hqrub022484
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 8 Jan 2007 17:52:53 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45A26FE1.9050705@dominion.kabel.utwente.nl>
References: <200701081618.46665.openembedded@hrw.one.pl>
	<f96d234e0701080819q7a8017d3q922b055670163c54@mail.gmail.com>
	<45A26FE1.9050705@dominion.kabel.utwente.nl>
Date: Mon, 08 Jan 2007 17:52:53 +0000
Message-Id: <1168278774.5605.127.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Status of ARM machines in OE
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
X-List-Received-Date: Mon, 08 Jan 2007 17:54:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-01-08 at 17:22 +0100, Koen Kooi wrote:
> only (soft)fpa, not (soft)vfp.
> 
> > I recently added a note in the kernel bb.  Softfloat is
> > working fine.  Is there any easy way in angstrom to specify oabi?
> 
> DISTRO="angstrom-2007.1-oabi"

Perhaps its time to introduce some kind of marking in the machine.conf
files like:

COMPATIBLE_ARM_ABI = "(oabi|eabi)" which angstrom can then error on
accordingly?

Richard




