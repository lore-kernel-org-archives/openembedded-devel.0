Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johan.hovold@lundinova.se>) id 1Oy6zI-00050A-Fs
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 19:50:42 +0200
Received: from pi (unknown [10.240.22.2])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailhost.lundinova.se (Postfix) with ESMTP id 7F417B94007
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 19:50:36 +0200 (CEST)
Received: from johan by pi with local (Exim 4.72) (envelope-from <johan@pi>)
	id 1Oy6zE-0003hn-D8 for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 19:50:36 +0200
Date: Tue, 21 Sep 2010 19:50:36 +0200
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100921175036.GB5750@lundinova.se>
References: <4C9494EC.4070309@freyther.de>
MIME-Version: 1.0
In-Reply-To: <4C9494EC.4070309@freyther.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: <johan.hovold@lundinova.se>
X-SA-Exim-Connect-IP: 92.33.14.100
X-SA-Exim-Mail-From: johan.hovold@lundinova.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question regarding the staging layout
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
X-List-Received-Date: Tue, 21 Sep 2010 17:50:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 18, 2010 at 06:31:08PM +0800, Holger Freyther wrote:
> I am seeing a lot of messages like:
> 
> /home/ich/build/arm/xscale/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> warning: libc.so, needed by
> /home/ich/build/arm/xscale/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libgcc_s.so,
> not found (try using -rpath or -rpath-link)
> 
> 
> is that to be expected?

Same issue here.

See the thread "[oe] several recipes give a link error: libc.so, needed
by libgcc_s.so, not found" from Mon, 23 Aug 2010 for some discussion on
this matter.

/Johan


