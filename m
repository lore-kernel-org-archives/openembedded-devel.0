Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>)
	id 1MBCDb-0004aP-OS; Mon, 01 Jun 2009 20:26:45 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1MBC57-0005Iv-TQ; Mon, 01 Jun 2009 19:17:58 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h012tn$v40$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
	<20090601165809.GZ23842@smtp.west.cox.net> <h012tn$v40$1@ger.gmane.org>
Date: Mon, 01 Jun 2009 19:17:34 +0100
Message-Id: <1243880254.5049.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Mon, 01 Jun 2009 18:26:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-01 at 19:25 +0200, Koen Kooi wrote:
> So far I've only seen suggestions that will trigger a rebuild of recipes 
> using module*bbclass, but no solutions for automagic version changes so 
> that the package manager will pick it up as well.

I don't quite understand why this is so complicated; can't you just
append the kernel's ABI version to either ${PR} or ${PV} (depending on
whether or not you want parallel installability) for the modules?

p.




