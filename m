Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J5eeD-0003pH-8s
	for openembedded-devel@openembedded.org; Fri, 21 Dec 2007 10:58:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBL9rIU9020337
	for <openembedded-devel@openembedded.org>; Fri, 21 Dec 2007 09:53:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20252-02 for <openembedded-devel@openembedded.org>;
	Fri, 21 Dec 2007 09:53:14 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBL9r9XX020326
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 21 Dec 2007 09:53:10 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <476B7A8D.4070603@gmx.net>
References: <476B7A8D.4070603@gmx.net>
Date: Fri, 21 Dec 2007 09:53:09 +0000
Message-Id: <1198230789.4636.25.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: feature request - wrap sources
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
X-List-Received-Date: Fri, 21 Dec 2007 09:58:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-12-21 at 09:34 +0100, Robert Schuster wrote:
> I have a feature request that should help dealing with those source
> tarballs which do not contain a proper top level directory. The idea is
> to allow to add a parameter 'wrap' to the SRC_URI entry denoting the
> source tarball. If it is present (and 1) the unpacker creates a
> directory named ${P} and unpacks the tarball therein.
> 
> This would make it unneccessary to change S for such packages and
> furthermore the work directory is not cluttered with files and folders
> from inside the source tarball.
> 
> Like it? (Any pointer where such code should be put?)

Would it not be simpler just to specify an attribute like unpacksubdir
which you could set to ${PN}-${PV}?

That way you have a generic and simpler solution?

Cheers,

Richard



