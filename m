Received: from mail.reciva.com ([62.7.80.110] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1P6OxF-0008R7-Vg
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 16:38:50 +0200
Received: from [192.168.106.10] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1P6Own-0004Sc-Mj
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 15:38:21 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1P6Own-0003dc-G7
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 15:38:21 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikHdhZ4ouoyA5UdyxoZBeR+f-bhHfMBwiaA6bCo@mail.gmail.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
	<AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA874@dlee06.ent.ti.com>
	<AANLkTinfQjRpwjYYL-6+He_z3tB6wm3kcW0CSEAqFVuh@mail.gmail.com>
	<i97082$i6g$2@dough.gmane.org>
	<AANLkTikHdhZ4ouoyA5UdyxoZBeR+f-bhHfMBwiaA6bCo@mail.gmail.com>
Date: Thu, 14 Oct 2010 15:38:21 +0100
Message-ID: <1287067101.3770.490.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 192.168.106.10
X-SA-Exim-Connect-IP: 62.7.80.110
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question about OVERRIDES precedence
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
X-List-Received-Date: Thu, 14 Oct 2010 14:38:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-10-14 at 06:59 -0700, Chris Larson wrote:
> On Thu, Oct 14, 2010 at 6:23 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
> > Isn't the definition covered in the bitbake docs? I'm in favour of
> > fixing bitbake instead working around it in OE.
> >
> 
> As far as I can tell:
> 1. The bitbake docs don't cover the ordering.
> 2. The behavior isn't a bug, it's a mismatch between OE's definition and
> bitbake's implementation, and bitbake has been this way since 2003.

Agreed.  And there is plenty of existing code in OE which depends on the
current ordering.  OE's bitbake.conf even has a big comment describing
the behaviour that it expects:

# Overrides are processed left to right, so the ones that are named later take precedence.
# You generally want them to go from least to most specific.
# 
# This means that an envionment variable named '<foo>_arm' overrides an
# environment variable '<foo>' (when ${TARGET_ARCH} is arm).
# an environment variable '<foo>_ramses' overrides '<foo>' but doesn't override
# '<foo>_arm' when ${MACHINE} is 'ramses'. 
# If you use combination ie '<foo>_arm_ramses', then '<foo>_arm_ramses' will override 
# '<foo>_arm' and then '<foo>' will be overriden with that value from '<foo>_arm'.
# And finally '<foo>_local' overrides anything, but with lowest priority.

So, changing the bitbake behaviour at this late stage seems like a very
bad idea.  If the documentation calls for something else then I think
the documentation should be fixed to match the reality, not vice versa.

p.




