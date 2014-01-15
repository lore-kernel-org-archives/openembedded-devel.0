Return-Path: <t_dufff@yahoo.ca>
Received: from nm31-vm1.bullet.mail.gq1.yahoo.com
	(nm31-vm1.bullet.mail.gq1.yahoo.com [98.136.216.208])
	by mail.openembedded.org (Postfix) with ESMTP id 604816E3FF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 19:07:53 +0000 (UTC)
Received: from [98.137.12.59] by nm31.bullet.mail.gq1.yahoo.com with NNFMP;
	15 Jan 2014 19:07:54 -0000
Received: from [98.137.12.200] by tm4.bullet.mail.gq1.yahoo.com with NNFMP;
	15 Jan 2014 19:07:54 -0000
Received: from [127.0.0.1] by omp1008.mail.gq1.yahoo.com with NNFMP;
	15 Jan 2014 19:07:54 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 258473.32905.bm@omp1008.mail.gq1.yahoo.com
Received: (qmail 99103 invoked by uid 60001); 15 Jan 2014 19:07:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s1024;
	t=1389812874; bh=zCfjiv1AJfNf0pqeQdGIMrkJaRRSsjJQC8/p/jZAvLM=;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=YSrhZHjiBo+jpJ9zPamgK4SFfplyKr3OK0sUitKFvwxDrAVZXQgDBshD3uO2G47G6Mtx7m9H7SNFg5XM8bPY86nGI/b7rqYxFHRB4WvQ5oTTGlYBT1K9aL5K8FVrgBBCpKFSXuWdb2dy28vkBwdjJBkK0sa9gmw+E+F6rr1uVBI=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.ca;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=OKt2d9uiYUmClkm8BQ6G/Wrxk5kg1MMHS+2mW0bChrCzrxLq/pHGV16Zs+nGaGKPUHN3vCVBkqnxe76U82IziihjvVS8AQqE+YxZ8R99+09JVIYIYUkr7/CTns8AXSpR9ihojFBisvujsD5HtdMu1SJd9uruMSHE87+lsm17wcc=;
X-YMail-OSG: qNRtq1MVM1nzC91cMCqkplnvG3GiPg8zeGj.WyfSKU5J8LH
	VDHJXdQn9P_n0ehslW0K1igQvCGTvXuSe1X9Ye0x6UauihO9zSTYsSm4T_0F
	mNZT9KJFZn01K_uSysIy71NRUDYQHa.jDpaLjr5Hn8XHqDTOdJtcLEeX3aNC
	co6O5I5uncc5Q_k08G2p740yDuTlJa7bdnGlW5eOGEvZWIealav5L.hVi_fs
	f6sVoK74iHLaDgNE17EpracV7qXzz7LxQodhzpYtKU8Csk84GwjMRXY077HU
	kvlxUSeboDOBtS582lIDgzep5lpkT4TzVTSgyzbx4l2SjemOnQKCqUtSyG8h
	Z5wYxPxk4ylttm0OtH_2oPMDwDcA83M2CzVFjOV7oci.70MljR4ymlb90Rb9
	aygdre.AOk_NZdFg4YMsvmCqq7AZkufSCG8Ax0d9tphh.UGgo92PrRvGe0xL
	G3dnnJXf_gmYRjDmY_ZTwEZiTCRaCBCNnTD.1NY.xtBL8rGL0yIOEVIXPrTZ
	KYMdlzCDlbmEtQ2Y0ek7dNtLBrN_GFs31yLAYN.4Z6ewNjWLQZK58J_09abx
	tukzZrRVSAIc-
Received: from [173.178.26.39] by web164702.mail.gq1.yahoo.com via HTTP;
	Wed, 15 Jan 2014 11:07:53 PST
X-Rocket-MIMEInfo: 002.001,
	SGVsbG8sCgpJJ20gd29ya2luZyB0byBwb3J0IGEgY3VzdG9tIHNvZnR3YXJlLgoKYml0YmFrZSBjb21wbGFpbiBhYm91dCA6CgpOT1RFOiBDaGVja2luZyBQYWNrYWdlOiBmY2dpCkVSUk9SOiBRQSBJc3N1ZTogbm9uIGRlYnVnIHBhY2thZ2UgY29udGFpbnMgLmRlYnVnIGRpcmVjdG9yeTogZmNnaSBwYXRoIC93b3JrL2FybXY3YS12ZnAtbmVvbi1wb2t5LWxpbnV4LWdudWVhYmkvZmNnaS0wLjI1LXIwL3BhY2thZ2VzLXNwbGl0L2ZjZ2kvdXNyL2Jpbi8uZGVidWcvZmFzdC5mY2dpCkVSUk9SOiBRQSBydW4gZm8BMAEBAQE-
X-Mailer: YahooMailWebService/0.8.172.614
References: 
Message-ID: <1389812873.92918.YahooMailNeo@web164702.mail.gq1.yahoo.com>
Date: Wed, 15 Jan 2014 11:07:53 -0800 (PST)
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
X-List-Received-Date: Wed, 15 Jan 2014 19:07:53 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

I'm working to port a custom software.

bitbake complain about :

NOTE: Checking Package: fcgi
ERROR: QA Issue: non debug package contains .debug directory: fcgi path /work/armv7a-vfp-neon-poky-linux-gnueabi/fcgi-0.25-r0/packages-split/fcgi/usr/bin/.debug/fast.fcgi
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

