Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JghnX-0005pm-0e
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 16:49:15 +0200
Received: from [212.23.103.130] (helo=[10.129.1.14])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JghnW-0005bf-8O
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 16:49:14 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Apr 2008 16:48:57 +0200
User-Agent: KMail/1.9.9
References: <200803311438.09825.e.robertson.svg@gmail.com>
	<200803312307.51210.zecke@selfish.org>
	<200804010807.38670.e.robertson.svg@gmail.com>
In-Reply-To: <200804010807.38670.e.robertson.svg@gmail.com>
MIME-Version: 1.0
Message-Id: <200804011648.57903.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.130
Subject: Re: stable branch checksum missmatch for quilt-0.45
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
X-List-Received-Date: Tue, 01 Apr 2008 14:49:15 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 01 April 2008 15:07:34 E Robertson wrote:
> You must be the funny one.

Sometimes, I have many faces and don't hide them :)




> Since it was already built by the dev branch and I use the same local file
> to build the stable branch, would it / should it skip the build and use the
> built binary? Or would it just rebuild the binary?
> What is the command to a clean build?

Ah you build stable and dev from the same directory and have a dev built 
there? No this does not work. We recently changed the layout of staging 
directory so dev and stable are not compatible. The only bug we have there is 
we warn about 'upgrading' but not about 'downgrading' of the ABI in the 
staging directory.



> In your last point above, what is a "dep graph"?

With OE/BitBake we have tasks (e.g. do bitbake -clisttasks nano). These are 
like fetch, unpack, configure, compile, install, stage, package. E.g. to 
configure nano you will need a C library for your target, this is where 
dependencies between tasks get added. This ends up in a dep(endency) graph.


>
> Thanks.




