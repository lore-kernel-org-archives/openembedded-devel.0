Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TCEsk-0004mE-Ql
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 21:15:23 +0200
Received: from mail189-co1-R.bigfish.com (10.243.78.250) by
	CO1EHSOBE005.bigfish.com (10.243.66.68) with Microsoft SMTP Server id
	14.1.225.23; Thu, 13 Sep 2012 18:01:52 +0000
Received: from mail189-co1 (localhost [127.0.0.1])	by
	mail189-co1-R.bigfish.com (Postfix) with ESMTP id 9004C1E01C9	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 18:01:52 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -10
X-BigFish: VS-10(zz98dI154cP9371I936eI1432Id6f1izz1202h1d1ah1d2ahzz8275ch17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh1307hbe9i1155h)
Received: from mail189-co1 (localhost.localdomain [127.0.0.1]) by mail189-co1
	(MessageSwitch) id 1347559311485059_25661;
	Thu, 13 Sep 2012 18:01:51 +0000 (UTC)
Received: from CO1EHSMHS019.bigfish.com (unknown [10.243.78.231])	by
	mail189-co1.bigfish.com (Postfix) with ESMTP id 6D0CE680048	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 18:01:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS019.bigfish.com
	(10.243.66.29) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 13 Sep 2012 18:01:49 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Thu, 13 Sep 2012 13:01:48 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][for-denzil][PATCH] systemd.bbclass: use system
	variables instead of hardcoded paths
Thread-Index: AQHNkYKkNDIzEsbOYUuVM4Radgddzg==
Date: Thu, 13 Sep 2012 18:01:48 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A67942F@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1347521638-3093-1-git-send-email-b28495@freescale.com>
	<k2stiv$jb7$1@ger.gmane.org>
In-Reply-To: <k2stiv$jb7$1@ger.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][for-denzil][PATCH] systemd.bbclass: use system variables instead of hardcoded paths
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
X-List-Received-Date: Thu, 13 Sep 2012 19:15:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1D9DBF7759E95A449A9D47F2749CE6B2@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2012 at 10:20 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 13-09-12 09:33, b28495@freescale.com schreef:
>> From: Ting Liu <b28495@freescale.com>
>>
>> Fix below issue when check service-files for 64bit target: | DEBUG:
>> adding systemd calls to postinst/postrm for busybox-syslog-systemd |
>> ERROR: Function failed: | | For package busybox-syslog-systemd
>> SYSTEMD_SERVICE-entry busybox-syslog.service does not exist NOTE: packag=
e
>> busybox-1.19.4-r6+fsl.0: task do_package: Failed
>>
>> Signed-off-by: Ting Liu <b28495@freescale.com>
>
> Since when do changes go into denzil without going through master first?

This looks to be already fixed in master...

Ting,

Next time you should add a blurb in the commit message so you looked
at master and it does not have this problem / already fixed,
especially in the case you are not cherry-picking an upstream commit.

-M

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQUfmgMkyGM64RGpERAssbAKCXR2IvkFpaaj9XHgJBhnitDRRbpgCfauG8
> IpN4oLULM7EGk/mmU0UJNF0=3D
> =3DZEJH
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



