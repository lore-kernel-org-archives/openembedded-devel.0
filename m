Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MDF7e-0008LZ-D6
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 11:57:02 +0200
Received: from 212-139-89-247.dynamic.dsl.as9105.com ([212.139.89.247]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1MDEx2-0006os-Ej; Sun, 07 Jun 2009 10:46:07 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
References: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
Date: Sun, 07 Jun 2009 10:46:03 +0100
Message-Id: <1244367963.4151.5.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: linux-omap3_git.bb doesn't work when copied to	user.collection
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
X-List-Received-Date: Sun, 07 Jun 2009 09:57:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-06-07 at 07:24 +0400, Elvis Dowson wrote:
> Hi,
> 	I've been faced with a problem for the past day, where I'm trying to  
> use linux-omap3_git.bb, after it has been copied to my user.collection/ 
> recipes/linux folder, I set the DEFAULT_PREFERENCE =  "1"
> 
> but it gives me a fatal: not a git repository error. I have even  
> deleted the entire org.openembedded.dev and synchronize the repository  
> as of Sunday, to pull in Steve's latest changes.
> 
> What could be causing this?

It seems that bitbake is trying to run "git fetch" without having
previously cloned.  That must mean that either bitbake is under the
erroneous impression that clone has already been run, or that it has
indeed been run but that it failed without bitbake noticing.

Have you tried cleaning out your ${GITDIR}?

p.




