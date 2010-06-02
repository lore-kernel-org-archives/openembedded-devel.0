Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OJmot-00033Z-JR
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 14:13:19 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id EDED61660813; Wed,  2 Jun 2010 06:09:01 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 00D4B166080A;
	Wed,  2 Jun 2010 06:08:58 -0600 (MDT)
Message-ID: <4C0649D9.3090908@mlbassoc.com>
Date: Wed, 02 Jun 2010 06:08:57 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <alpine.DEB.2.00.1006011641480.17094@lynx>
	<4C057DFC.6010409@mlbassoc.com>
	<alpine.DEB.2.00.1006011753350.30834@lynx>
	<20100601220233.GG5446@jama> <4C058898.60202@mlbassoc.com>
	<20100602065840.GI5446@jama>
In-Reply-To: <20100602065840.GI5446@jama>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] current build errors, OE dev branch, beagleboard-linuxtag2010-demo-image
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
X-List-Received-Date: Wed, 02 Jun 2010 12:13:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2010 12:58 AM, Martin Jansa wrote:
> On Tue, Jun 01, 2010 at 04:24:24PM -0600, Gary Thomas wrote:
>> On 06/01/2010 04:02 PM, Martin Jansa wrote:
>>> Yes easily fixable fetch errors, those archives are download restricted
>>> and if you open those recipes you will see instruction where to download
>>> them.
>>>
>>> For cheese issue I've already replied, but without answer (about
>>> gstreamer-plugins...).
>>
>> I *did* reply; it seems to be a multi-thread build problem.  When
>> I reran bitbake, it went away.
>
> Yes thanks, the point is that only important part was "Was
> gst-plugins-base built before cheese?" And Robert is still having issue
> with it.
>
> So I guess the answer would be NO and no is more likely with more
> BB_THREADS and in second run it's already built (especially if you're
> building with -k) for some other recipe, so it worked for you later.

Sorry if I wasn't clear.  It did appear that cheese was being built
before the prerequisites were complete.

> I've downloaded cheese, checked configure.ac and yes it depends on
> gst-plugins-base unconditionally. I've pushed an update which adds it to
> DEPENDS (which is ensured to be built _before_ do_configure of recipe,
> RRECOMMENDS is building it too, but it can build it later then
> do_configure.

I've now tried it again, removing all the gst-* packages and verified
that they are complete before cheese is built.

>
> BTW: cheese_2.30.0.bb also depends on whatever -native recipe provides
> xml2po and cheese_2.30.1.bb depends on scrollkeeper-config to build it's
> help. But probably is using happily scrollkeeper from host (as there is
> no recipe) - and I don't have scrollkeeper in my OE chroot..
> http://tinderbox.openembedded.net/packages/cheese/
>
> Robert: If I remember right, you were asked few times to use tinderbox
> instead sending many e-mails with pastebins, why didn't you follow this
> advise yet?
>
> Regards.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


