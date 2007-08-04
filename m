Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IHTGB-0004OM-BJ
	for openembedded-devel@openembedded.org; Sun, 05 Aug 2007 01:42:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l74NdxO8029808
	for <openembedded-devel@openembedded.org>;
	Sun, 5 Aug 2007 00:39:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29510-05 for <openembedded-devel@openembedded.org>;
	Sun,  5 Aug 2007 00:39:54 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l74NdpTQ029772
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 5 Aug 2007 00:39:51 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0708040434td836170o858a45aded74c329@mail.gmail.com>
References: <1185839805.7719.103.camel@localhost.localdomain>
	<c384c5ea0708040434td836170o858a45aded74c329@mail.gmail.com>
Date: Sun, 05 Aug 2007 00:39:51 +0100
Message-Id: <1186270791.5700.29.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: The future of "svnnow"
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
X-List-Received-Date: Sat, 04 Aug 2007 23:42:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2007-08-04 at 13:34 +0200, Leon Woestenberg wrote:
> On 7/31/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> > As people know the ability to build the latest head revisions of svn
> > (for example) repositories in OE with bitbake has been limited and less
> > than ideal.
> >
> Yes, exactly the stuff we run into.
> 
> > To solve the problems I have made the following changes:
> >
> ...A very detailed list of changes...
> 
> Could you explain what this means to a not-really-core-developer like
> me, i.e. what is the proposed exposure of your changes?

Just considering svn packages to keep this simple, package versions
change to become:

PV = "x.y.z+svnr${SRCREV}"

eg. "3.6+svnr90" for svn revision 90

You can set

SRCREV_pn-somepackage = "90"

in a .conf file to force a particular revision or it will automatically
increment the revision when svn head changes if its not locked down.

Whilst SRCDATE will still work, use of it will be removed for svn
packages in OE and replaced with SRCREV.

Cheers,

Richard




