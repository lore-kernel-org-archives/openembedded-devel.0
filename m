Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2rGD-0002SE-1z
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 21:31:29 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 93408EAFCB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 15:28:00 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 15:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=lipU9Z5xST9H+s2VjBxVtjsHmPU=;
	b=MZiGoM67zDg58Zph2k8ifFepERnndN9WyRzcfBuKJaItin/rz9bIdhxcpwveqbfJwi8ivR8kExu3XVRJ44A/LYknMMwmvwUx20rqFiVRHvVehGcBs6Ooq2uAu9Sf7FvmsGMVuAznnCNPqYnRCfjUVQb++LUB9rxcULfaF6r2NAI=
X-Sasl-enc: hByDzYoH5UnwsPijHuwmqNXM2IJMYV+xQ4T/XygMPP2I 1271446080
Received: from [192.168.1.34] (hnvr-4d07a1c5.pool.mediaWays.net [77.7.161.197])
	by mail.messagingengine.com (Postfix) with ESMTPSA id E83842B135
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 15:27:59 -0400 (EDT)
Date: Fri, 16 Apr 2010 21:28:50 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hqa6tn$h32$1@dough.gmane.org>
Message-ID: <alpine.LNX.2.00.1004162117110.28729@asterix.crazy-teaparty.dyndns.org>
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
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,
	MIME_QP_LONG_LINE, RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=no version=3.2.5
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
X-List-Received-Date: Fri, 16 Apr 2010 19:31:30 -0000
X-Groupsio-MsgNum: 18679
Content-Type: MULTIPART/SIGNED; 
	PROTOCOL="application/pgp-signature"; MICALG=pgp-sha1;
	BOUNDARY="=_MIME_CONTENT_BREAK_=_NNFQGKVJQUNFTTQFBDDLLQDMAIOUTMF_="

--=_MIME_CONTENT_BREAK_=_NNFQGKVJQUNFTTQFBDDLLQDMAIOUTMF_=
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline; filename="message.txt"
Content-Transfer-Encoding: quoted-printable

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
> That's using legacy staging, which we are trying very hard to kill in .dev=

> I suspect you can just remove method since do_install usually works in
> autotools based systems.

Hmm, will try to build it in our stable/2009-based tree on monday without=20
that method.

BTW, I've seen a tree named stable/xxx/2010 in git, are there activities=20
to create a new stable tree?  The different staging methods did already=20
create work I could live without.

Vitus

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers

--=_MIME_CONTENT_BREAK_=_NNFQGKVJQUNFTTQFBDDLLQDMAIOUTMF_=
Content-Type: application/pgp-signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iD8DBQFLyLqEtSDdbxQoLLsRArXNAKDetvjK+Z0kw5Jxxym1zmw7bYyHAwCgp2SG
hm6yrsqfeTBH/Orc+2Ii+Yk=
=YiiP
-----END PGP SIGNATURE-----

--=_MIME_CONTENT_BREAK_=_NNFQGKVJQUNFTTQFBDDLLQDMAIOUTMF_=--
