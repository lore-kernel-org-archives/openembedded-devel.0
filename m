Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OFqdy-0000TX-1Y
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 May 2010 17:29:43 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 8BDEAF80AB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 May 2010 11:25:32 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Sat, 22 May 2010 11:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type:content-transfer-encoding;
	s=smtpout; bh=TBZYvHTRn12QrFtO23xE1ug29ME=;
	b=nVa6dS+rMbPd08fbWoBnAyZsOMonCvTXmGiadJLQxgRa7J6KYQHmBrlBGRwbQJntkZBick6lwgsTIAQHkiLAoS056SqjFkXlkrc2cRlZxcDr6+pYvDFUTuHa2TaAmCRufNxm8ecUiJvS4uxHglisusZ/egcmj1P2o2lN2+2mjdU=
X-Sasl-enc: JmuUTFfV6f2KfLLArNB+LoNLGZopO0zOQMe2QVYwwtq6 1274541932
Received: from [192.168.1.34] (hnvr-4d078a6d.pool.mediaWays.net [77.7.138.109])
	by mail.messagingengine.com (Postfix) with ESMTPSA id DAF1D57679
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 May 2010 11:25:31 -0400 (EDT)
Date: Sat, 22 May 2010 17:26:54 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTilrTp4aqvXB8ggicStZnp3LYj9474x5KedKNeUd@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1005221713170.5274@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1005162211110.21508@asterix.crazy-teaparty.dyndns.org>
	<1274452686-17891-1-git-send-email-vjensen@gmx.de>
	<AANLkTilrTp4aqvXB8ggicStZnp3LYj9474x5KedKNeUd@mail.gmail.com>
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
Subject: Re: [PATCH v3 1/3] libsocketcan: new recipes
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
X-List-Received-Date: Sat, 22 May 2010 15:29:43 -0000
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Fri, 21 May 2010, Khem Raj wrote:

> On Fri, May 21, 2010 at 7:38 AM, Vitus Jensen <vjensen@gmx.de> wrote:
>> Build pengutronix' libsocketcan (netlink interface), used
>> by newer versions of canutils. =C2=A0can_netlink.h is really
>> linux/can/netlink.h from linux-libc-headers but installed
>> here to be independ of staged linux-libc-headers versions.
>
> is there any reason to have an encapsulated copy of this header
> besides being independent ?

It's just that reason.  can is pretty new in linux and the netlink=20
interface even newer.

libsocketcan 0.0.8 needs headers from 2.6.34
libsocketcan 0.0.7 2.6.33, 2.6.32 or 2.6.31

Combine that with the thread about linux-libc-headers and that selecting=20
the version of llh is a distro-thing I think it's best to provide=20
the needed can_netlink.h version.  The canutils source handles version=20
incompatibilities.

Vitus

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


