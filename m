Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OReZs-0006AZ-DD
	for Openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 07:02:20 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id EC0CB108B57
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 00:57:40 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Thu, 24 Jun 2010 00:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:mime-version:content-type;
	s=smtpout; bh=/sYa6TCuL5NNK2mx5Y5z+QXi8cs=;
	b=XDcFaE9m8qK0Xvb+ttlD+zkCQrCndSXC2xOpEZFD/bsYRaH9ag1/9gJ4yKc4xr/zFgn9FcDxycjJWNZ9MG7BsAKnrRY+f5sigjS6th4YKUSBc0enDVL7HK7LR10DjSvhBCe/mz7ZHuPXaC5K6gpnxjeUs6UyvtidWDLV12SciKc=
X-Sasl-enc: u8GkQIA+o8oJli+8Brw8MMvQ4/BYSoazWqhOC6OwMkAX 1277355460
Received: from [192.168.1.34] (hnvr-4d07a327.pool.mediaWays.net [77.7.163.39])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 4709A4E2164
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 00:57:40 -0400 (EDT)
Date: Thu, 24 Jun 2010 06:59:12 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Message-ID: <alpine.LNX.2.00.1006240651040.4844@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
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
Subject: libusb1 endian problems
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
X-List-Received-Date: Thu, 24 Jun 2010 05:02:20 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hej!

libusb1 is optimized for little-endian machines *g*, version 1.0.0 (stable 
branch) fails on ppc machines because of endian problems.  Symptom: lsusb 
shows no devices, lsusb -t does, debug messages from libusb1 show transfer 
problems.

I haven't tested 1.0.4 (dev branch) but the last commit message in libusb1 
regarding big endian is only included in 1.0.8 and that version works on 
our bluepro.  So I will add 1.0.8 to dev and stable.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


