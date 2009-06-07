Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MDJag-0007Pw-AI
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 16:43:18 +0200
Received: from 212-139-89-247.dynamic.dsl.as9105.com ([212.139.89.247]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MDJRa-0003xU-FJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 15:33:54 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244384219.4431.46.camel@utx.utx.cz>
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
Date: Sun, 07 Jun 2009 15:33:53 +0100
Message-Id: <1244385233.4151.27.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: e2fsprogs-libs failed on latest	org.openembedded.dev	branch
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
X-List-Received-Date: Sun, 07 Jun 2009 14:43:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-06-07 at 16:16 +0200, Stanislav Brabec wrote:
> Daniel.Li wrote:
> > Hi List,
> > 
> > What's wrong with this? How can I fix the problem?
> > 
> > $ bitbake e2fsprogs-libs
> > ERROR: 	0048:		basedir = os.path.join(os.path.dirname(root))
> 
> I was hoping that it was fixed by this commit:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3ac37564039127c80eb5cf109fddf23a8e438bf8
> 
> Can you confirm, that you have a newer snapshot?

That commit doesn't obviously look like it would fix anything; it seems
to just be tweaking the names of some local variables.  What was the
intent of that change?

p.




