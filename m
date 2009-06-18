Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MHH9n-0003SR-Jm
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 14:55:55 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5ICixU0003119 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 13:44:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 07m3SFY8tB+0 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 13:44:59 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5ICitbx003113
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 13:44:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090617190830.GG15477@smtp.west.cox.net>
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
	<1245261716.27027.18.camel@dax.rpnet.com>
	<20090617190830.GG15477@smtp.west.cox.net>
Date: Thu, 18 Jun 2009 13:43:55 +0100
Message-Id: <1245329035.11257.14.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after	image	creation unless you set a variable
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
X-List-Received-Date: Thu, 18 Jun 2009 12:55:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 12:08 -0700, Tom Rini wrote:
> On Wed, Jun 17, 2009 at 07:01:56PM +0100, Richard Purdie wrote:
> > Something I've been thinking about for a while is moving rootfs into
> > ${WORKDIR}/. That way you can have concurrent image generation for a
> > start and rm_work could be taught to clean it up...
> 
> Isn't the other part of that the need to serialize making the package
> index files?

I thought we'd done that? If not we should, its not difficult as we have
locking functions in bitbake.

-- 
RP





