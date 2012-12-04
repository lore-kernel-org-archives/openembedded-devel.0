Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1TfpDD-0000HN-AA
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 10:54:47 +0100
Received: from mail126-co9-R.bigfish.com (10.236.132.239) by
	CO9EHSOBE038.bigfish.com (10.236.130.101) with Microsoft SMTP Server id
	14.1.225.23; Tue, 4 Dec 2012 09:25:17 +0000
Received: from mail126-co9 (localhost [127.0.0.1])	by
	mail126-co9-R.bigfish.com (Postfix) with ESMTP id 1E6F3B400BE	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2012 09:25:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 5
X-BigFish: VS5(z33fclzd6eahzz1de0h1202h1d1ah1d2ahzz8275chz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631hbe9i1155h)
Received: from mail126-co9 (localhost.localdomain [127.0.0.1]) by mail126-co9
	(MessageSwitch) id 1354613114688084_13551;
	Tue,  4 Dec 2012 09:25:14 +0000 (UTC)
Received: from CO9EHSMHS017.bigfish.com (unknown [10.236.132.235])	by
	mail126-co9.bigfish.com (Postfix) with ESMTP id 9CA59C40057	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2012 09:25:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS017.bigfish.com
	(10.236.130.27) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 4 Dec 2012 09:25:10 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.190]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0318.003; Tue, 4 Dec 2012 09:25:09 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: cramfs fetch error
Thread-Index: Ac3SAUC6HiC44CdARemFrFArlItoDA==
Date: Tue, 4 Dec 2012 09:25:10 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A01375E18@039-SN2MPN1-021.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: cramfs fetch error
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
X-List-Received-Date: Tue, 04 Dec 2012 09:54:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Following fetch error appears when I build cramfs with master branch of pok=
y + meta-openembedded, does anyone meet this issue?=20

Error logs:
WARNING: Failed to fetch URL cvs://anonymous@cramfs.cvs.sourceforge.net/cvs=
root/cramfs;module=3Dlinux, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 1, output:
cvs [checkout aborted]: reading from server: Connection reset by peer

ERROR: Function failed: Fetcher failure for URL: 'cvs://anonymous@cramfs.cv=
s.sourceforge.net/cvsroot/cramfs;module=3Dlinux'. Unable to fetch URL from =
any source.

Standalone command: cvs '-d:pserver:anonymous@cramfs.cvs.sourceforge.net:/c=
vsroot/cramfs' co -D "20110110 UTC" linux


Best Regards,

Zhenhua



