Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IkeIv-0004d2-5R
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2007 13:21:41 +0200
Received: from pd9538432.dip0.t-ipconnect.de ([217.83.132.50]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1Ikdm0-0002xo-Ey
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2007 12:47:41 +0200
Message-ID: <471F22BC.1080504@klever.net>
Date: Wed, 24 Oct 2007 12:47:24 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.6 (X11/20070815)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071024095844.GA9952@lenovo>
In-Reply-To: <20071024095844.GA9952@lenovo>
Subject: Re: [doc] defining OpenEmbedded
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
X-List-Received-Date: Wed, 24 Oct 2007 11:21:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> 
> In the first case, the term local.conf implies a configuration file
> that makes a program work correctly on a local machine.  OE uses the
> file local.conf to define the top level build parameters for a bitbake
> build.  That is pretty confusing.  It would be more clear if
> local.conf was called build.conf.
> 

The whole OE is about *building* stuff, so calling it 'build.conf' is 
redundant, while 'local.conf' is quite explanatory because it contains 
the data local to this particular build.

> In the second case referring to OE as a collection of metadata is
> confusing.  Metadata is data about the data.  OE is actually a
> collection of patches, task lists, and configuration files.  I was
> wondering if it would be more clear to refer to oe as either a ruleset
> or task lists.

Well, the "data" are packages themselves, so
OE actually contains metadata, that is the information on where to 
retrieve the data from and how to handle it to produce code. I'm not 
sure if it's the perfect term, though, but is there real need to change it?

Love,
H


