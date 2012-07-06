Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SnBce-0001vq-JY
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jul 2012 18:43:12 +0200
Received: from mail69-ch1-R.bigfish.com (10.43.68.239) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jul 2012 15:59:46 +0000
Received: from mail69-ch1 (localhost [127.0.0.1])	by mail69-ch1-R.bigfish.com
	(Postfix) with ESMTP id B1C134E0328	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2012 15:59:46 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail69-ch1 (localhost.localdomain [127.0.0.1]) by mail69-ch1
	(MessageSwitch) id 1341590384396896_15267;
	Fri,  6 Jul 2012 15:59:44 +0000 (UTC)
Received: from CH1EHSMHS009.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.236])	by mail69-ch1.bigfish.com (Postfix) with ESMTP id
	5F5A74C004A for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2012 15:59:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS009.bigfish.com
	(10.43.70.9) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jul 2012 15:59:43 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.163]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Fri, 6 Jul 2012 11:01:42 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] cramfs_cvs.bb: fix compile step so it can be
	rerun without failing
Thread-Index: AQHNW5Ci2R0F75l70k665zan4bU0rg==
Date: Fri, 6 Jul 2012 16:01:41 +0000
Message-ID: <CAEsOVNdKQOA1bHMfptKGm7aAabpAxb7+uR7zYxp_W8T9Pf7Tdw@mail.gmail.com>
References: <1341588382-17688-1-git-send-email-msm@freescale.com>
	<CAMKF1sofwemm9LTT5_GW5JvuXxEvro0trn_-=EmoUwDU-ASiuw@mail.gmail.com>
In-Reply-To: <CAMKF1sofwemm9LTT5_GW5JvuXxEvro0trn_-=EmoUwDU-ASiuw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] cramfs_cvs.bb: fix compile step so it can be rerun without failing
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
X-List-Received-Date: Fri, 06 Jul 2012 16:43:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <364193F1D1E62145BAB06D62600398B5@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 6, 2012 at 10:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jul 6, 2012 at 8:26 AM, Matthew McClintock <msm@freescale.com> wr=
ote:
>>
>>  do_compile_prepend() {
>> +       unlink Makefile || true
>>          ln -s GNUmakefile Makefile
>>  }
>
> why not just ln -sf ?

No reason... I guess that's better... v2 coming.

-M


>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



