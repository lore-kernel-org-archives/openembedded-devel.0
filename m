Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O8DhJ-00078A-Nd
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 May 2010 16:29:38 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 42E2AEFE5F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 May 2010 10:17:35 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sat, 01 May 2010 10:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=r6FCm4VSRNWtksDkDA549Yd7u7M=;
	b=Xpr8lfrQpAmin7BWEazTQt5MTufNkDKJRMLQ29FcUEsJSP6KbN7WoU9Pbsxdn+F3az4LLxfAKVFkD0WrfWtNSMstJZKAcQdwSp+pM71bcL8ZIO963xJLBp4OjcbqpJMgumoqbI9+eX1pQYSTyfwKy5pSuQrLb6KNXYQXx5H7EO0=
X-Sasl-enc: gmayZN+AuBy/r/P5edNWBSl1O4Q2s8g1HUWv1jhTakOK 1272723454
Received: from [192.168.100.126] (p5B0FD323.dip.t-dialin.net [91.15.211.35])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 9099742696
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 May 2010 10:17:34 -0400 (EDT)
Date: Sat, 1 May 2010 16:17:30 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
Message-ID: <alpine.DEB.1.10.1005011614380.15503@vitus.devnet.local>
References: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: canutils
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
X-List-Received-Date: Sat, 01 May 2010 14:29:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 16 Apr 2010, Vitus Jensen wrote:

> The current CAN stack in linux needs updated userspace code.  The
> following two patches build canutils from pengutronix.

I've rebuild the patches to no longer require a do_stage method.  The 
reason for the do_stage() was the inclusion of a local copy of 
can/netlink.h which should better be supplied by linux-libc-headers.  And 
is, starting with 2.6.32.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


