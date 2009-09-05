Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Mk1q8-00051N-3n
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 22:26:28 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mk1XZ-00030E-Qs
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 21:07:18 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90909051050s382dcbf1of5aed8482cfd25aa@mail.gmail.com>
References: <27c25bc40909050924o3632ba7dp8dd84e950a689617@mail.gmail.com>
	<19c1b8a90909051050s382dcbf1of5aed8482cfd25aa@mail.gmail.com>
Date: Sat, 05 Sep 2009 21:07:11 +0100
Message-Id: <1252181231.4490.148.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: unable to bitbake ortp
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
X-List-Received-Date: Sat, 05 Sep 2009 20:26:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-09-05 at 10:50 -0700, Khem Raj wrote:
> If you are using .dev then there is ortp-0.13 which I built here
> without any problem
> on a sidenote it says DEPENDS = "glibc " which I think should be
> changed to virtual/libc
> but as long as you are using glibc/eglibc based system it should not
> be a problem.

Specifying virtual/libc in a recipe's DEPENDS would usually be a bit
silly since base.bbclass adds it automatically.  Specifying glibc there
would perhaps be legitimate for packages that actually require features
of glibc itself, but I doubt that is the case here.

I suspect that the line in question is probably a slightly mangled
attempt to depend on either glib-1.2 or glib-2.0, which would be
consistent with the original poster's complaint that glib.h was missing.

p.




