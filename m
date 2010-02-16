Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NhLyi-0001bs-JV
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 12:52:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1GBnsSV023853
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 11:49:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23277-10 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 11:49:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1GBnmLC023847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 11:49:48 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11002160258m2ddee8absd0510adad4179c6d@mail.gmail.com>
References: <1266316492.6436.127.camel@rex>
	<ac9c93b11002160258m2ddee8absd0510adad4179c6d@mail.gmail.com>
Date: Tue, 16 Feb 2010 11:49:47 +0000
Message-ID: <1266320987.6436.135.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Tue, 16 Feb 2010 11:52:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-02-16 at 11:58 +0100, Frans Meulenbroeks wrote:
> Sounds quite nice.
> Didn't study the class code, but it would be nice if within layer.conf
> I could use a relative path, which then is turned into an absolute
> path when the layer.conf file is read

This is what the LAYERDIR variable gives us. 

Having relative paths would lose all context outside the layer.conf
file. We could hardcode a list of variables that needed to be processed
and so on but LAYERDIR removes all that complexity whilst still letting
you move things around.

> That means layer.conf can become very standard wrt BBPATH etc. and you
> can even move layers around.

You should be able to do that with my proposal, the only file that would
need changing is bblayers.conf, not the layers themselves.

Cheers,

Richard



