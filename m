Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2mut-0006uN-N4
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 16:53:13 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 5B4A1E9C2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 10:49:43 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Fri, 16 Apr 2010 10:49:43 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=/5DigMdHXmCueka/sU8vQgCwu9I=;
	b=NhWVXEkYfer4Kk1LX1a5DEilew097ZsHPyPzLTzOj3R9f0VCZ++BzGZF1jii3IKxe1d+Nyv82GweDOX1Uh5aCH9r3u1Nrr4f4YUuUiCoHEeBqeTFH2x/dID/nWXTvEMlZK0Qw3dnuqp6cE6rpTeEwowbrZg/BT1zftAkmRrZIpw=
X-Sasl-enc: /shQXlka7Nm1s6JUvezsOEFNybjxHnOExU6LPbeC+Cmi 1271429382
Received: from [192.168.1.34] (hnvr-4d07a1c5.pool.mediaWays.net [77.7.161.197])
	by mail.messagingengine.com (Postfix) with ESMTPSA id AE2873A942
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 10:49:42 -0400 (EDT)
Date: Fri, 16 Apr 2010 16:50:56 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100416144107.GC7857@excalibur.local>
Message-ID: <alpine.LNX.2.00.1004161648330.28729@asterix.crazy-teaparty.dyndns.org>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
	<alpine.DEB.1.10.1004081733510.3264@vitus.devnet.local>
	<alpine.LNX.2.00.1004161612220.28729@asterix.crazy-teaparty.dyndns.org>
	<20100416144107.GC7857@excalibur.local>
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
Subject: Re: [PATCH v3] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Fri, 16 Apr 2010 14:53:13 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 16 Apr 2010, Stefan Schmidt wrote:
> On Fri, 2010-04-16 at 16:13, Vitus Jensen wrote:
>> --- /dev/null
>> +++ b/recipes/dfu-programmer/dfu-programmer_svn.bb
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION = "USB Device Firmware Upgrade utility (special atmel-version)"
>> +SECTION = "devel"
>> +AUTHOR = "Weston Schmidt <weston_schmidt@alumni.purdue.edu>"
>> +LICENSE = "GPL"
>> +
>> +SRCREV = "93"
>> +PV = "0.5.2+svnr${SRCPV}"
>
> Should be SRCREV and not SRCPV, right? If thats right I can take care of it when
> testing and applying it.

From previous post by Martin Jansa in this thread:
============
> +PV = "0.5.2+svnr${SRCREV}"

In org.openembedded.dev it's always "+svnr${SRCPV}" for svn recipes
(hopefully soon also unified for git recipes).
============

My patch of today applies and compiles fine in dev and stable (with the 
SRCPV-patch posted before) in the original format.  So I guess SRCPV is 
right.

Bye,
   Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


