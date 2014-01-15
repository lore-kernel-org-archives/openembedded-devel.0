Return-Path: <t_dufff@yahoo.ca>
Received: from nm31.bullet.mail.gq1.yahoo.com (nm31.bullet.mail.gq1.yahoo.com
	[98.136.217.14])
	by mail.openembedded.org (Postfix) with ESMTP id 0192A61039
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 19:07:48 +0000 (UTC)
Received: from [216.39.60.182] by nm31.bullet.mail.gq1.yahoo.com with NNFMP;
	15 Jan 2014 19:07:49 -0000
Received: from [216.39.60.211] by tm18.bullet.mail.gq1.yahoo.com with NNFMP;
	15 Jan 2014 19:07:49 -0000
Received: from [127.0.0.1] by omp1098.mail.gq1.yahoo.com with NNFMP;
	15 Jan 2014 19:07:49 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 492601.82215.bm@omp1098.mail.gq1.yahoo.com
Received: (qmail 12337 invoked by uid 60001); 15 Jan 2014 19:07:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s1024;
	t=1389812869; bh=ymhUtqQs2rH/pK9TliANJKSqp3tjfD/tLv5zyx4DppY=;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=KhNJbcPpINIUqAuSsgh68CXnaDfP4sSBqfSuXiuPqKGib4yPoJ9Bw2bIu2zw16CzzBe5uPlwVypKBcN+R3RRXo3J75OBZHTg+dyrWxecnkMsgEYJaQ0EpbaDerDIfHUFdjZ5X9gwS8Z0Cz6eB5qWtfUTW25/LuRX06BibsEB+Bc=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.ca;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=tHF/cYXK8qh8q5LUON2IN6Pj3Jd0WaDXnFreg/uUCDWFHtMiUq+fTUC3LqFRLRk/XJMEtlJ6ZVxFKgnzL2rx5dkUwoljrCKvRnIRtoByb2KLSgjV8FDmBrDrZjqb4H+D9TsggXVCH9p5blW0CbWjnj3yVySppEE+nvtP5DU/Y+A=;
X-YMail-OSG: ELUaMK8VM1k1Wy4Mx8gp03GFbgDSAN3Up5T4aQbjJN.F32H
	NRLdxCAmUNmt1K7ZqStb3Z5s9.v8kTMbcZw2c5w818R0FniY0OsLaipMGE1f
	AwbKpbX9GDCuGSVZgwOckgaOa__79VqUSpEcHIcvmQ1gu3lQVfRQWBGKPb84
	.r4TzQvdRt7CbpHt4uzk4Fvle4cVKtneZp4p9PjSPHnZPLEVYlW_p4MJeqTH
	nannHsmJq4NCA.EBYrWJ7A0SAHh_ry924UleIS1.fVgBekW2cT2tv8pOulEk
	EHPz9ZkxHRCtuYBJ7G.XVJW0oL5NSQMPv48YPHfnDnufNRTUyU9Iypq2EZsM
	Ap3JusuIu.wee9mbU7H5iZjDsf6kbJN5Z7XQ445_AO_cVrtbUX2ZEOYoe4Ew
	CH_LIrOYvMLwLAdMJHzY5ZKJZgdrgwsL6RRrBCvwGpgi61zTx3r44x82onM1
	hUgj5ur0bCwQslJv0WgECS9vrtWbVMglq.gh0LaZMh4n3Kqa0iv2qiE9X8oA
	5kBlr0qzeFIIVsBxUgGbhBu.24edLGRbnFQuNndWNdTrYOtDaSwZN0adLHH_
	RgjmMKde7OKM-
Received: from [173.178.26.39] by web164705.mail.gq1.yahoo.com via HTTP;
	Wed, 15 Jan 2014 11:07:49 PST
X-Rocket-MIMEInfo: 002.001,
	SGVsbG8sCgpJJ20gd29ya2luZyB0byBwb3J0IGEgY3VzdG9tIHNvZnR3YXJlLgoKYml0YmFrZSBjb21wbGFpbiBhYm91dCA6CgpOT1RFOiBDaGVja2luZyBQYWNrYWdlOiBmY2dpCkVSUk9SOgogUUEgSXNzdWU6IG5vbiBkZWJ1ZyBwYWNrYWdlIGNvbnRhaW5zIC5kZWJ1ZyBkaXJlY3Rvcnk6IGZjZ2kgcGF0aCAKL3dvcmsvYXJtdjdhLXZmcC1uZW9uLXBva3ktbGludXgtZ251ZWFiaS9mY2dpLTAuMjUtcjAvcGFja2FnZXMtc3BsaXQvZmNnaS91c3IvYmluLy5kZWJ1Zy9mYXN0LmZjZ2kKRVJST1I6IFFBIHJ1biABMAEBAQE-
X-Mailer: YahooMailWebService/0.8.172.614
Message-ID: <1389812869.5889.YahooMailNeo@web164705.mail.gq1.yahoo.com>
Date: Wed, 15 Jan 2014 11:07:49 -0800 (PST)
From: kris duff <t_dufff@yahoo.ca>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: non debug package contains .debug directory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jan 2014 19:07:49 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

I'm working to port a custom software.

bitbake complain about :

NOTE: Checking Package: fcgi
ERROR:
 QA Issue: non debug package contains .debug directory: fcgi path 
/work/armv7a-vfp-neon-poky-linux-gnueabi/fcgi-0.25-r0/packages-split/fcgi/usr/bin/.debug/fast.fcgi
ERROR: QA run found fatal errors. Please consider fixing them.

In my recipe I added : 
FILES_${PN}-dbg += "${WORKDIR}/trunk/Debug"
FILES_${PN}-dbg += "${WORKDIR}/trunk/Debug/*"

I also tried : 
FILES_${PN}-dbg += "${D}/usr/bin/.debug"
FILES_${PN}-dbg += "${D}/usr/bin/.debug/*"

no luck for now. I tried few other things and I don't understand how to do that.

Any help would be highly appreciated!

Thank you

Kris

