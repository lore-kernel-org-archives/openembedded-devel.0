Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Ot4Te-0000ie-Q3
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 22:09:11 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id A18932B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 16:08:31 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 07 Sep 2010 16:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=E8z+hXRZKodHLJdmlLJZQyFDhEY=;
	b=PUQ/iNONuAs9caA2fNx2qljza9oxqwmBeuRyYzOxZZ2wxaqg2n+GIFhfOSyCLYabwNYeURZFTx23A/neYMf74HFrcLyM8/oDU8zqk17QmU/VQSMyz5IAlortrxQefQlgKid02F1JNtjqFsJua0lMDnyo6n2fexwIfsP3zwqdyJs=
X-Sasl-enc: gOXNiXrKmqSQEtfsT1FaGaijMwVa6YTAkYsz9fIBNgdk 1283890111
Received: from [192.168.1.34] (hnvr-4d078030.pool.mediaWays.net [77.7.128.48])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 11AC24005BC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 16:08:30 -0400 (EDT)
Date: Tue, 7 Sep 2010 22:10:12 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1281734825.3858.281.camel@mattotaupa>
Message-ID: <alpine.LNX.2.00.1009072155300.22847@asterix.crazy-teaparty.dyndns.org>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTikQ5qGF4N1N0Ud11cdS7P4+HxfPEXSvWwMvm4YV@mail.gmail.com>
	<alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinChtk+VTgQ4H3+sMfyTRUQks+=YQR9Agj8M7a_@mail.gmail.com>
	<alpine.LNX.2.00.1008132255040.11048@asterix.crazy-teaparty.dyndns.org>
	<1281734825.3858.281.camel@mattotaupa>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch queue/patchwork: How should states be used?
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
X-List-Received-Date: Tue, 07 Sep 2010 20:09:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 13 Aug 2010, Paul Menzel wrote:
> Am Freitag, den 13.08.2010, 23:01 +0200 schrieb Vitus Jensen:
>> On Fri, 13 Aug 2010, Khem Raj wrote:
>>> On Fri, Aug 13, 2010 at 2:59 AM, Vitus Jensen <vjensen@gmx.de> wrote:
>
>
> I would also advise to set the commit ID when setting the state to
> applied. Actually this can be done automatically [2], but the
> administrators have not yet had time to address this.

This requires the pwclient script which people without commit access 
probably don't use.  Well, I don't use it.


> We have the following 11 states.
>
>        $ pwclient state
>        ID    Name
>        --    ----
>        1     New
>        2     Under Review
>        3     Accepted
>        4     Rejected
>        5     RFC
>        6     Not Applicable
>        7     Changes Requested
>        8     Awaiting Upstream
>        9     Superseded
>        10    Deferred
>        11    Applied
>
> What is the difference between 3 (Accepted) and 8 (Awaiting Upstream)?

In which state should the "Archived" flag be set?  What is the effect of 
that flag?  And do we really need all those states?  Rejected, Not 
Applicable, Changes Requested, Deferred?  IMHO that's Rejected, refer to 
the mail archive for details.

BTW: who removes patches from patchwork?  I do have some patches in 
"Superseded" state which I no longer care about.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


