Received: from nm21-vm2.bullet.mail.ne1.yahoo.com ([98.138.91.209])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <gkogut@yahoo.com>) id 1Rq8cd-0006qK-8d
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 20:35:07 +0100
Received: from [98.138.90.52] by nm21.bullet.mail.ne1.yahoo.com with NNFMP;
	25 Jan 2012 19:24:49 -0000
Received: from [98.138.89.173] by tm5.bullet.mail.ne1.yahoo.com with NNFMP;
	25 Jan 2012 19:24:49 -0000
Received: from [127.0.0.1] by omp1029.mail.ne1.yahoo.com with NNFMP;
	25 Jan 2012 19:24:49 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 264320.57184.bm@omp1029.mail.ne1.yahoo.com
Received: (qmail 55721 invoked by uid 60001); 25 Jan 2012 19:24:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1327519488; bh=60xOoIAon0w905NGIzi3M02zpBDO6TxZc+0yc4hiqHA=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=QCw/JR2y7WHgetnmCYB8saCiLVPTP/RSRuQfSXJjNmMgt9hWbN35ZVRnlU0+izZ3gz8DZcNC8viEfjIA+OFJhyisjoVcCWSW2hMHU53XALJZL1XMcBELoozZZcktjQhbxgHjtbeCAh0y7OHSrqQ4JZRzNNtVC6FIfijWIIU1Yl0=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=bEX/uN6KdgslwI3y+tTw43L3jTWN62lrBrkztvQJAVvshuXPQ6rderK3fCxcyToxbQf6qR7ZFBSCt5JADYqw7CPdpxC0s/eXNtM1xsUO2K0uYpxT4FqRgC85ZrFJQyhuOJrpEqTJ1TnYjyc+xddSwyCwHiXHPrfToqXGnK82cUU=;
X-YMail-OSG: K9o3Jf8VM1nKA04c0D8eGa5uvKO4yNGNguhKaTMb4MJUNzV
	iRgXesqosLMTCUBoRiRSaRoTvPV6IvvaRnm3q11GbNQLayHcBCowN8RNr7BR
	4x9tCwlkaWBiCrFCLuRg.oRCXoWnjmRYiR4EqZILZ3.Vp1o4t1dlH_iRVx7I
	Wr.So9noiaQzA.BxlcOQrJiIYumilCNcWN2zCRFLwMoSppdp_RJThJk1c6Xe
	_m_cpNMRasWJcw_1DqS4PNww19wO6IMLYj8PoKFOZpPhivpCYic9qMcsbUpH
	2Tooca.cF1_vI58NZ3ohd2ybEaXFwMxLrFEyKDgdBqhX_90k2ylJRXW539SV
	LWeV.S5hm3EfDm3pmfGt35jGHHNWA11jaagQ5UznPcUIcaVlsqBETl12YRzP
	bPWV.fDqQIHu_2eBJ94UWwxMgdinF39isbFrpndKgNEdXLoHGM2zdiir5QyC
	adnCnsPUkCMPZ
Received: from [128.49.41.146] by web36906.mail.mud.yahoo.com via HTTP;
	Wed, 25 Jan 2012 11:24:48 PST
X-Mailer: YahooMailWebService/0.8.116.331537
Message-ID: <1327519488.54350.YahooMailNeo@web36906.mail.mud.yahoo.com>
Date: Wed, 25 Jan 2012 11:24:48 -0800 (PST)
From: Greg Kogut <gkogut@yahoo.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: how to specify alternative library locations from recipes using cmake
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
X-List-Received-Date: Wed, 25 Jan 2012 19:35:07 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

I hope this isn't too much of a n00b question.

I've developed a dozen new recipes (which I'll submit once they're stable)=
, most of which use cmake.

Some of them install libraries to alternative library locations, e.g. '/op=
t/myprog/lib'. &#65533; This works correctly, and I've verified the librari=
es are installed to the correct locations in the filesystem image.

However, while building binaries dependent on these new libraries, also us=
ing cmake, cmake tries to point the linker to these directories on the host=
 machine, not the cross-compiler filesystem. &#65533;With predictable resul=
ts.

What is the correct practice for correctly guiding cmake to the right loca=
tion? &#65533;I've searched the existing recipes which use cmake without fi=
nding anything.

Regards,
Greg
From philip@balister.org Wed Jan 25 21:59:30 2012
Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Rq9wH-0003L4-M2
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 21:59:29 +0100
Received: (qmail 13243 invoked by uid 1003); 25 Jan 2012 20:45:01 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	25 Jan 2012 20:45:01 -0000
Message-ID: <4F2069CC.7060409@balister.org>
Date: Wed, 25 Jan 2012 15:45:00 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1592899.mTy93uB97i@helios>
	<1908796.glHMrEiIxU@helios>	<4F202735.8040405@balister.org>
	<3543079.3rgjSx9VfG@helios>
	<1327514250.29933.37.camel@phil-desktop>
In-Reply-To: <1327514250.29933.37.camel@phil-desktop>
X-Enigmail-Version: 1.1.2
Content-Type: text/plain; charset
