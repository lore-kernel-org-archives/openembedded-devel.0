Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Nzo9o-00070F-P5
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 11:36:17 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 9E3AFEA799
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 05:32:55 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 08 Apr 2010 05:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=QtiFeuubfrzC7iavsTqA8SrlmyM=;
	b=k6sgdbJ1cwYizKGNbf8f1NeS6OgqZuJBH27YPBY4ThfPD5r0Xp+gOTn6L3AKFxXIIfSOL4VFDtXGvAJh/hnTXS+PC8qGwkt07eZsrnM3Xejp8Jxv9kHFLhJVAGEvNsApO6h17svM3l9WT4SXVP7fv+VnqiRLZc6iZKITtUJ4fqI=
X-Sasl-enc: hJx1+RONw6neDQg9itC7plS1f+dDeSfRd+h88qpZcGlv 1270719175
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id EA61C4A44C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 05:32:54 -0400 (EDT)
Date: Thu, 8 Apr 2010 11:32:47 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100408085916.GB27376@excalibur.local>
Message-ID: <alpine.DEB.1.10.1004081113570.3264@vitus.devnet.local>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
	<alpine.DEB.1.10.1004081030010.3264@vitus.devnet.local>
	<20100408085916.GB27376@excalibur.local>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Thu, 08 Apr 2010 09:36:17 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 8 Apr 2010, Stefan Schmidt wrote:

> On Thu, 2010-04-08 at 10:32, Vitus Jensen wrote:
>> On Thu, 8 Apr 2010, Vitus Jensen wrote:
>>>
>>> Add recipes for version 0.5.2 and for the head of the SVN repository.
>>>
>>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>>> ---
>>> conf/checksums.ini                             |    4 ++++
>>> recipes/dfu-programmer/dfu-programmer_0.5.2.bb |   17 +++++++++++++++++
>>> recipes/dfu-programmer/dfu-programmer_svn.bb   |   20 ++++++++++++++++++++
>>> 3 files changed, 41 insertions(+), 0 deletions(-)
>>> create mode 100644 recipes/dfu-programmer/dfu-programmer_0.5.2.bb
>>> create mode 100644 recipes/dfu-programmer/dfu-programmer_svn.bb
>>
>> I know that nowerdays the checksums are inside the recipe.  But we
>> are working on the stable/2009 branch were it isn't done this way
>> (or not supported?).  Please accept as is.
>
> This patch was targetted for the stable branch? If yes please indicate this in
> the subject of the patch. You would need to get your patch into OE.dev first
> before it can go into stable IIRC, but I leave it to the stable developers to
> comment on this.

Well, everything we do is done in the stable/2009 branch because we need 
the stability.  We cherry-pick from .dev (which is getting harder because 
of the staging changes) and add new programs and machines.  I would like 
to publish the changes but they have to be for .dev (policy) and mostly 
identically to what is used here (because I don't want to maintain 2 
images for the devices).

> Having one patch for .dev with the checksum in the recipe and one for stable
> with the sum in the ini file would also be fine I think. No hard feelings on
> this though.

Will try out checksums inside the recipe in the stable/2009 branch.  I 
think the support for it is only depending on bitbake versions, right?

> An updated patch for the AUTOREV issue is still needed.

Well... the repository get updates every few months, mostly to support new 
chips.  So the possibility is high that someone needs _svn.bb because of 
he wants to program a newer atmel and I don't feel like deciding which 
chip support to include or not.  I've included it to make it simple to get 
the absolute newest programmer, for me 0.5.2 is enough.

Should I drop _svn.bb or use the head revision of today?

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


