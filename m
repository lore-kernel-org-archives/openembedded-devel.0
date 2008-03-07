Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JXk3V-0007ka-1j
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Mar 2008 22:24:43 +0100
X-ASG-Debug-ID: 1204924983-46e5004a0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 5EEBA10C30
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2008 15:23:04 -0600 (CST)
Received: from [192.168.1.71] (LRS-CiscoRouter [192.168.1.1]) by
	barracuda.pager.net with ESMTP id UXLOmexc5sWFSFha for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 07 Mar 2008 15:23:04 -0600 (CST)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 + OpenEmbedded: Problems with
	=?iso-8859-1?q?uclibc-initial=09do=5Fpopulate=5Fstaging?=()
Date: Fri, 7 Mar 2008 15:23:08 -0600
User-Agent: KMail/1.9.7
References: <200803051349.39583.geoffrey@pager.net>
	<1204749821.8110.178.camel@dax.rpnet.com>
In-Reply-To: <1204749821.8110.178.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803071523.09157.geoffrey@pager.net>
X-Barracuda-Connect: LRS-CiscoRouter[192.168.1.1]
X-Barracuda-Start-Time: 1204924984
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AVR32 + OpenEmbedded: Problems with uclibc-initial	do_populate_staging ()
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Mar 2008 21:24:43 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 05 March 2008 02:43:41 pm Richard Purdie wrote:
> Hi,
>
> On Wed, 2008-03-05 at 13:49 -0600, Geoffrey Wossum wrote:
> > I'm working on getting OpenEmbeddded to build for an AVR32 system.  Right
> > now I'm using an AT32STK1000, although eventually I'll be running on
> > custom hardware.
> >
> > I've been having problems getting past the uclibc-initial (0.9.28).  I
> > get an error when it attempts do_populate_staging().  Here's the error
> > I've been getting.
>
> I think both your fixes are correct. Those changes were already made in
> poky but had got lost somewhere between there and OE.dev, I'll sync them
> up. Thanks for the report and let us know if anything doesn't work after
> I merge them.

Just pulled this patch out of monotone.

uclibc.inc defines UCLIBC_STAGE_PREFIX, which is what uclibc-initial_0.9.29.bb 
references.  The other uclibc-initial_0.9.*.bb files reference 
UCLIBC_STAGING_PREFIX, though.  Changing it to UCLIBC_STAGE_PREFIX in 
uclibc-initial_0.9.28.bb fixes this for me.

---
Geoffrey




