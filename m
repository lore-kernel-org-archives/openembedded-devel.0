Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MJAMI-0007UV-QY
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 20:04:38 +0200
Received: from 79-71-239-25.dynamic.dsl.as9105.com ([79.71.239.25]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MJA59-00026Z-TQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 18:46:57 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90906231030i3e810672j13ca95b56c647022@mail.gmail.com>
References: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
	<1244838263.5958.34.camel@dax.rpnet.com>
	<f96d234e0906181109y4ee832bcu7b53037c917709be@mail.gmail.com>
	<19c1b8a90906231030i3e810672j13ca95b56c647022@mail.gmail.com>
Date: Tue, 23 Jun 2009 18:46:54 +0100
Message-Id: <1245779214.29153.376.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [rfc] change default for BUILD_OPTIMIZATION, remove	spurious 	assignments
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
X-List-Received-Date: Tue, 23 Jun 2009 18:04:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-06-23 at 10:30 -0700, Khem Raj wrote:
>  -frename-registers was a workaround to get past a ARM GCC ICE in 4.2 IIRC
> we should get rid of it.

No, -frename-registers is an optimisation in its own right.  I think we
probably want to keep that.  You might be thinking of the
-fno-rename-registers that we do use for some packages to avoid an ice
on arm with gcc 3.4.

> -fexpensive-optimizations and -fomit-frame-pointer are passed by
> default at O2 so we should get rid of them too.

Is that true on all targets?  I didn't think that -O2 implied
-fomit-frame-pointer on arm.

p.




