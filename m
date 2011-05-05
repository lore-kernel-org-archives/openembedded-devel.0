Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QHvF0-0005TZ-Hi
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 11:53:02 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QHv87-0001p4-8r
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 11:45:55 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DC18628.40508@gravedo.de>
References: <1304524228-25642-1-git-send-email-morphis@gravedo.de>
	<1304525388.15795.386.camel@phil-desktop> <4DC17C80.3060001@gravedo.de>
	<1304528054.15795.417.camel@phil-desktop> <4DC18628.40508@gravedo.de>
Date: Thu, 05 May 2011 10:50:23 +0100
Message-ID: <1304589023.15795.426.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] cmake.bbclass: set the rpath for binaries build with cmake to ${libdir}
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
X-List-Received-Date: Thu, 05 May 2011 09:53:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-04 at 19:00 +0200, Simon Busch wrote:
> I alreay searched through the cmake documentation and it says that the
> rpath is set with the content of the CMAKE_INSTALL_RPATH variable. The
> default value of CMAKE_INSTALL_RPATH is ""[1]. As currently nothing sets
> it to another value the rpath is never set during the build for the
> resulting binaries. I send another patch which does the solution
> mentioned above the right way.

Oh right, I see.  So cmake is actually stripping the rpaths during the
install step unless you tell it that you want them included?

In that case, yeah, your plan seems reasonable.

p.




