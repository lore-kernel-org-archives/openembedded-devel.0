Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N6IoJ-0000AF-EJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 08:00:42 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 6167A1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2009 07:09:46 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 6 Nov 2009 07:59:07 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <b8b15f5e0911052137i83348d4rc21cd418d32c1665@mail.gmail.com>
In-Reply-To: <b8b15f5e0911052137i83348d4rc21cd418d32c1665@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200911060759.07303.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: First compilation issues
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
X-List-Received-Date: Fri, 06 Nov 2009 07:00:42 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 06 November 2009 06:37:52 Won J Jeon wrote:
> I successfully compiled Angstrom Linux with OE and now I am trying to learn
> how to use OE on my Ubuntu 9.04. While I was following the simple
> instruction to compile 'myhelloworld' in the manual, I have the following
> error messages:
> 
> $ bitbake -b recipes/myhelloworld/myhelloworld_0.1.bb
> /var/lib/python-support/python2.6/bb/COW.py:29: DeprecationWarning: the
>  sets module is deprecated
>   import types, sets
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 1 of 19 (ID: 1, /OE/openembedded/recipes/myhelloworld/
> myhelloworld_0.1.bb, do_setscene)
> ERROR: function staging_helper failed
> ERROR: see log in
> ${OETREE}/angstrom-dev/work/armv5te-angstrom-linux-gnueabi/myhelloworld-0.1
> -r0/temp/log.staging_helper.9492 NOTE: Task failed:


Oh well... look at the log file? Seeing ${OETREE} unexpanded is weird too... 
maybe you should set the variable to something?

z.


