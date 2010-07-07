Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OWZsb-0000Cq-Jx
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 21:01:58 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OWZnv-0008Aa-3j
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 19:57:07 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikso9BfJHslU0Ss6nQ5SfnOdgy8RIU0WF383jXX@mail.gmail.com>
References: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikso9BfJHslU0Ss6nQ5SfnOdgy8RIU0WF383jXX@mail.gmail.com>
Date: Wed, 07 Jul 2010 19:57:15 +0100
Message-ID: <1278529036.4413.67.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 07 Jul 2010 19:01:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-07-07 at 20:49 +0200, Frans Meulenbroeks wrote:
> 2010/7/7 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> > added INCOMPATIBLE_MACHINE
> > we have COMPATIBLE_MACHINE but that does not allow to say that
> > a package is supported by all except a certain machine.
> > a regexp like "(?!arch)"
> > This mechanism can be used to exclude certain machines.
> > Idea is that in binutils and gcc you can use this to specify that
> > a certain version does not support a certain machine
> 
> actually what I wanted to say in the commit message is that a regexp
> like (?!arch) does not work.
> \b(?!arch) or ^(?!arch) didn't work either and consulting #python did

This might just be an accident of wording, but you do realise that
COMPATIBLE_MACHINE is tested against ${MACHINE} (i.e. not any of the
${xx_ARCH} variables), right?  If you want to test arches then you want
${COMPATIBLE_ARCH}.

I just did a quick test with (?!foo) in C_M and it seemed to work ok for
me.  Specifically:

MACHINE = goodmach
COMPATIBLE_MACHINE = "(?!badmach)"

works, whereas

MACHINE = badmach
COMPATIBLE_MACHINE = "(?!badmach)"

is rejected.  What exactly goes wrong for you?

p.




