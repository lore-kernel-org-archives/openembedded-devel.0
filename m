Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MDwAq-0002Mv-4f
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 09:55:12 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1MDw1Y-000160-Kd; Tue, 09 Jun 2009 08:45:36 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244522737-19251-1-git-send-email-no2spam@nospam.arcornews.de>
References: <1244522737-19251-1-git-send-email-no2spam@nospam.arcornews.de>
Date: Tue, 09 Jun 2009 08:45:34 +0100
Message-Id: <1244533534.4151.46.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Subject: Re: [PATCH] rootfs_ipk.bbclass: use force-defaults (Bug 5133)
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
X-List-Received-Date: Tue, 09 Jun 2009 07:55:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-06-09 at 13:45 +0900, Rolf Leggewie wrote:
> From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
> 
> Without -force-defaults, I currently cannot build any image because opkg hangs, waiting for
> user input that of course never comes.
> 
> I'm explicitly not sure if this is the right way to fix this, but we should we fix it soon.

In theory this patch oughtn't to be necessary, in that opkg shouldn't be
asking for user input unless there is something wrong with the packages
it's trying to install (i.e. overlapping contents).  So, the "right" way
to fix the underlying issue is to address whatever is wrong with the
packages.  

However, no matter how broken the packages are, it clearly isn't
desirable for opkg to hang indefinitely and your patch seems like it
should indeed stop that from happening.  So yes, please go ahead and
check it in.

p.




