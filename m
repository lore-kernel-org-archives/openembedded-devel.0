Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>)
	id 1IMsq7-00082j-IQ; Mon, 20 Aug 2007 00:01:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7JM0qPv002695;
	Sun, 19 Aug 2007 23:00:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02609-02; Sun, 19 Aug 2007 23:00:48 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7JM0hO8002689
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 19 Aug 2007 23:00:43 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20070819205605.GA8181@thegnar.org>
References: <44C22A1C-2EC8-41C9-AC47-17C35A1389A2@selfish.org>
	<20070819205605.GA8181@thegnar.org>
Date: Sun, 19 Aug 2007 23:00:43 +0100
Message-Id: <1187560843.5626.12.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-users@openembedded.org
Subject: Re: [ANN] BitBake 1.8.8 available for download
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
X-List-Received-Date: Sun, 19 Aug 2007 22:01:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-08-19 at 13:56 -0700, Mark Gross wrote:
> On Sat, Aug 18, 2007 at 09:12:45PM +0200, Holger Freyther wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > For Your Information,
> > 
> > Version 1.8.8 of BitBake from the stable branch is available for  
> > download [1]. Thanks to the hard labor of Richard this release  
> > contains support for SRCREV, bug fixes and speed improvements. For  
> > more changes please consult the ChangeLog.
> > 
> > This release adds a requirement on pysqlite2 for sqlite3. On most  
> > distributions this package is called python-pysqlite2. It is required  
> > to support concurrent access to persistent data. This is a  
> > requirement of the SRCREV implementation.
>  
>
> version dependencies?

Yes, the key line is:

> self.connection.execute("DROP TABLE IF EXISTS %s;" % domain)

You need sqlite version 3.3.0 or later to support that syntax.

Richard



