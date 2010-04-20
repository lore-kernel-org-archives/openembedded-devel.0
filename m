Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O48YO-0003k9-P1
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 10:11:33 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id BE7D8EAD7D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Apr 2010 04:08:00 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Tue, 20 Apr 2010 04:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=L1j586Sw3amdAUkIwmdcCfBeBQc=;
	b=A0G20R95fdlvA7zGJsenCnOwhb63mcB2jD57bkHWvoJhH/2fR4hCoIHYi4y2MViw4BNpJDXzk5GidEFDpbHiScUgRInsj79R9JBYJ3agDrzvWDom6SxAbN8sFnSrRyr77olu58RgcWFPMqaM0r6hLHVX0xRRpFB6I2JhbjSIdV0=
X-Sasl-enc: eC4BryPHrmPPrFoBaQpFmPu8Gz8bYYoLkFqPfvIzXXTH 1271750880
Received: from [192.168.1.34] (hnvr-4d079781.pool.mediaWays.net [77.7.151.129])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 0CC124CD488
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Apr 2010 04:07:59 -0400 (EDT)
Date: Tue, 20 Apr 2010 10:09:18 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hqa6tn$h32$1@dough.gmane.org>
Message-ID: <alpine.LNX.2.00.1004201006330.5137@asterix.crazy-teaparty.dyndns.org>
References: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
	<alpine.DEB.1.10.1004161915140.13411@vitus.devnet.local>
	<hqa6tn$h32$1@dough.gmane.org>
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] libsocketcan: recipe to build pengutronix' libsocketcan (netlink interface)
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
X-List-Received-Date: Tue, 20 Apr 2010 08:11:33 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 16 Apr 2010, Koen Kooi wrote:

> On 16-04-10 19:15, Vitus Jensen wrote:
>>
>
>> +do_stage () {
>> +	install -m 0644 include/libsocketcan.h ${STAGING_INCDIR}/
>> +	install -m 0644 include/can_netlink.h ${STAGING_INCDIR}/
>> +	oe_libinstall -a -so libsocketcan ${STAGING_LIBDIR}
>> +}
>
> That's using legacy staging, which we are trying very hard to kill in .dev.
> I suspect you can just remove method since do_install usually works in
> autotools based systems.

Unfortunately headers aren't installed without this method and compiling 
of canutils fails without them.  How is this handled in new staging?  wiki 
and manual still describe legacy staging.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


