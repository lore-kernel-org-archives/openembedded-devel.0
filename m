Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OLA7p-0005QP-3A
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 09:18:30 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OLA3f-0001Xx-AJ for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 03:14:11 -0400
Date: Sun, 6 Jun 2010 03:14:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTik0GDc2e8Rmzi_MiUmnu5RS1Feje3NUb1AIG6Vc@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1006060305430.2276@lynx>
References: <alpine.DEB.2.00.1006050226160.9902@lynx>
	<AANLkTik0GDc2e8Rmzi_MiUmnu5RS1Feje3NUb1AIG6Vc@mail.gmail.com>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trying to simplify the patch/apply/pnum/striplevel jungle
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
X-List-Received-Date: Sun, 06 Jun 2010 07:18:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 5 Jun 2010, Chris Larson wrote:
...
> pnum works for compatibility reasons, but it will display a warning, with a
> pointer to the new parameter to use instead.  But yes, that's correct, it
> was just a rename for clarity.
...

> Yep, that's all correct.  It seemed silly to not optimize for the common
> case - .diff/.patch & -p 1, so now it does so.  'patch' parameter too, still
> works for compatibility, and will display a warning.
...

  so while i'm working on the tougher stuff, i can easily submit a
cleanup patch or three according to the following simplifications
(some of which might not even occur in the source anywhere, these are
just general rules):

* any occurrences of pnum=1 or striplevel=1 are superfluous and can be
  deleted

* any *other* occurrences of pnum= can be replaced by the equivalent
  striplevel=

* any *necessary* occurrences of patch=1 can be replaced by apply=yes

* any *unnecessary* occurrences of patch=1 or apply=yes can be
  removed; those would be cases where patching would automatically
  happen, as in that previous example i gave:

recipes/udev/udev_100.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
recipes/udev/udev_100.bb:	    file://flags.patch;patch=1 \
recipes/udev/udev_100.bb:	    file://mtd-exclude-persistent.patch;patch=1 \
recipes/udev/udev_092.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
...


  does all that sound reasonable?  not profoundly deep, just a first
stab at cleanup, and it would eventually be accompanied by updating
the user manual to emphasize that.

rday




-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


