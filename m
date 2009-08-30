Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MhhOx-0007O8-Pe
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 12:12:49 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mhh7B-0004UY-Aj
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 10:54:25 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090830092250.GA16275@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<20090829020254.GC6785@smtp.west.cox.net>
	<19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
	<20090830012244.GA5033@gmail.com>
	<1251619852.4215.666.camel@lenovo.internal.reciva.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830092250.GA16275@gmail.com>
Date: Sun, 30 Aug 2009 10:54:22 +0100
Message-Id: <1251626062.4215.687.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS	=	linux-gnuspe for e500
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
X-List-Received-Date: Sun, 30 Aug 2009 10:12:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-08-30 at 02:22 -0700, Khem Raj wrote:
> based upon your idea in last email. Here is something I put together
> seems to work. It will need testing ofcourse
> 
> What do you think about this one ?

Thanks for the update.  This looks like generally the right idea, except
that I still feel it is undesirable for an innocuous-looking change of
MACHINE to result in far-reaching abi consequences.  So we need to
figure out a way to deal with that.

A few other specific comments about the patch:

> +python detect_arm_abi () {

This doesn't really need to be an OE function.  You can declare it
directly as Python:

def detect_arm_abi():

> +       if bb.data.getVar("TARGET_ARCH", d, 1) in [ 'arm', 'armeb' ]:          
> +               if bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']:
> +                       return "oabi"
> +               return "eabi"
> +       else
> +               return ""

Notwithstanding the thing about MACHINE that I mentioned above, this
logic doesn't really look like it can be correct.  There are only two
valid ARM ABIs: eabi and oabi, and I would have thought this function
should always pick one or the other.  In other words, I don't think that
returning "" should be a valid result.

> +       if bb.data.getVar('TARGET_ARCH',d,1) in ['bfin']:
> +               os_suffix = "uclinux"
> +       else
> +               os_suffix = "linux"

I'm not terribly convinced that this is desirable; TARGET_OS itself has
always been a primary user configuration variable and I'm not entirely
comfortable with making it be an auto-guessed thing.  I'm also not very
keen on doing anything to cement the perception that OE is, somehow,
only for Linux targets.  But I guess I am open to persuasion on this
one.

p.




