Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OUYXY-0002EY-6L
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 07:11:53 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id E7A1A10A360
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 01:07:07 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Fri, 02 Jul 2010 01:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=kLzUHZNhg5xe/Kk2z1iHItSve6k=;
	b=feLbH4wahCpGO52KeL5B8P1VUI1JEisOMHN4aJE+1/I2ABSidaNuVA2TfUxoBRDeIPozzGXng/0TS35ZVdRqCVFGXtzIQHxk3sGa7Ef/hrXGLidkCTPF70amvj2SICA/2abIUegbm0+0U7Gh+5ppoF2xuod+YEj+VKgUuyIbMSo=
X-Sasl-enc: xEjBy4vnkl6ifDzD51kODbGXrQK+ikJ9yJBmj9nh2gFp 1278047227
Received: from [192.168.1.34] (hnvr-4d079486.pool.mediaWays.net [77.7.148.134])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 4C7956B77A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 01:07:07 -0400 (EDT)
Date: Fri, 2 Jul 2010 07:08:41 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <AANLkTilY3E4WT0Mg7bEckA9jzzeDWlMSBe0G8OxAlMGb@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1007020700170.4844@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTilY3E4WT0Mg7bEckA9jzzeDWlMSBe0G8OxAlMGb@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.27
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: using new syntax for patches in SRC_URI
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
X-List-Received-Date: Fri, 02 Jul 2010 05:11:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hello Khem,

On Thu, 1 Jul 2010, Khem Raj wrote:

> I have seen that some commits still used file://a.patch;patch=1
> please resort to using more convenient form of file:/a.patch
> and as long as its .patch or .diff it will know its a patch
> and if you need to use different strip level then use
> file://a.patch;striplevel=n
> and not pnum=n

Could you please port the commit which introduced the new syntax to the 
stable/2009 branch?  To not increase the difficulties of porting local 
stable changes back to .dev before adding them officially to stable 
again...

Vitus (holiday-mode)

PS: it was bf7d0467a0788a7fcc1c96e0dc35a25ae09278a0

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


