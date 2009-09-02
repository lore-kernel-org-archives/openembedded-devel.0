Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MiwlT-0005CF-8e
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Sep 2009 22:49:14 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MiwT5-0008BB-Cq
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Sep 2009 21:30:15 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090902192044.GA18621@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830094809.GB26823@gmail.com>
	<200908311333.20189.marcin@juszkiewicz.com.pl>
	<20090901055731.GA22534@gmail.com>
	<57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
	<20090901153102.GA12420@gmail.com> <20090901230722.GA25864@gmail.com>
	<20090902192044.GA18621@gmail.com>
Date: Wed, 02 Sep 2009 21:29:49 +0100
Message-Id: <1251923389.4490.20.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Wed, 02 Sep 2009 20:49:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-09-02 at 12:20 -0700, Khem Raj wrote:
> This also changes the target triplet for linux-uclibgnueabi to
> uclibc-uclibcebi. So I have also bumped up the OELAYOUT_ABI

Ah, that doesn't sound so good.  Changing OELAYOUT_ABI will be a
nuisance for everyone, even if they aren't using either uclibc or the
TARGET_OS auto-generator.  Is there a way to avoid that?

p.




