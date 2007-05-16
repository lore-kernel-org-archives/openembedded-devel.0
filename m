Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HoH0G-0000QM-Rg
	for openembedded-devel@openembedded.org; Wed, 16 May 2007 12:45:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4GAiqZU011951
	for <openembedded-devel@openembedded.org>;
	Wed, 16 May 2007 11:44:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11762-04 for <openembedded-devel@openembedded.org>;
	Wed, 16 May 2007 11:44:49 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4GAik3h011931
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 16 May 2007 11:44:46 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <464A5D37.4030401@whitby.id.au>
References: <200705151322.39110.robin.farine@terminus.org>
	<464A5D37.4030401@whitby.id.au>
Date: Wed, 16 May 2007 11:44:45 +0100
Message-Id: <1179312285.5854.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: machine customized ixp4xx NPE firmware
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
X-List-Received-Date: Wed, 16 May 2007 10:45:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-05-16 at 10:54 +0930, Rod Whitby wrote:
> Robin Farine wrote:
> > Another but somewhat related point is the COMPATIBLE_MACHINE 
> > variable. If
> > my machine's name does not start with nslug or ixp4xx, I am forced 
> > to
> > change many package recipes (I suspect it is a FAQ but I do not seem 
> > to
> > able to access the mailing-list archive at the moment), perhaps a
> > COMPATIBLE_ARCH variable would be help here ?
> 
> Which machine/arch are you using?  We can easily extend that
> compatibility to include any other machines/archs that will use it.

A neat way to handle this might be to define:

IXPMACHINES = "nslu2|ixp4xx|whatever"

and then the ixp specific .bb's check IXPMACHINES rather than a specific
list. The list would then be maintained in one place and is easily
updated if anyone adds a new ixp like machine.

I've not looked at the specifics, its just a random idea I had...

Cheers,

Richard






