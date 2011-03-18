Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0XJp-00012X-Aa
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 11:54:09 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0XIA-0003J5-9N
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 11:52:26 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5145@GSX300A.mxchg.m.corp>
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<1300360258.2132.14668.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5144@GSX300A.mxchg.m.corp>
	<201103171654.31619.pgsellmann@portner-elektronik.at>
	<0C757E680E33864AB113392C7E83F910BE5145@GSX300A.mxchg.m.corp>
Date: Fri, 18 Mar 2011 10:56:17 +0000
Message-ID: <1300445777.9054.66.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Fri, 18 Mar 2011 10:54:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-18 at 09:59 +0100, Hauser, Wolfgang (external) wrote:
> As I experienced, opkg exits with an error code if a config file already
> exists, so if you want to create an image, the process will break at
> that error.
> It wasn't possible to create an image automatically then.

I don't think that situation should ever arise during image
construction.  If there are two packages which ship the same conffile
and don't Conflict: with each other then that seems like it must be a
packaging bug.

What were the circumstances that caused this to happen for you?

p.




