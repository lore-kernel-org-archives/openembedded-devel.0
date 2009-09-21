Received: from [64.61.99.36] (helo=mx2.safetynetaccess.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MphyZ-0006nn-N4
	for openembedded-devel@openembedded.org; Mon, 21 Sep 2009 14:26:42 +0200
Received: from [172.19.0.46] (email.sonesta-boston.com [216.57.88.74] (may be
	forged))
	by mx2.safetynetaccess.com (8.13.6/8.13.6) with ESMTP id n8LCPfOu027081;
	Mon, 21 Sep 2009 08:26:01 -0400 (EDT) (envelope-from philb@gnu.org)
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@openembedded.org
In-Reply-To: <1253472330.4ab6784a8f36c@imp.free.fr>
References: <1253437328.4ab5ef902b12f@imp.free.fr>
	<19c1b8a90909200807u66d5d12bh345139ce4c4302ad@mail.gmail.com>
	<1253472330.4ab6784a8f36c@imp.free.fr>
Date: Mon, 21 Sep 2009 13:24:30 +0100
Message-Id: <1253535870.4942.11.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Virus-Scanned: by amavisd-new
X-SA-Exim-Connect-IP: 64.61.99.36
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: minimo not building
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
X-List-Received-Date: Mon, 21 Sep 2009 12:26:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-09-20 at 20:45 +0200, Alain2210 wrote:
> Thanks for the explanation. How can I make minimo build again ? (and do you have
> an idea why fennec with the same code can be built ?)

Fennec uses mozilla.inc, which sets ARM_INSTRUCTION_SET = "arm".  This
is a somewhat sucky workaround since it will force the entire program to
be built as ARM, but it would at least avoid the problem you're seeing.
A better fix would be to identify the source of the offending
instructions and either convert them to Thumb or put them out of line.

p.




