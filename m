Received: from nm8-vm4.bullet.mail.ne1.yahoo.com ([98.138.91.168])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <joncoops@yahoo.com>) id 1QxFq6-0000Al-TO
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Aug 2011 12:10:11 +0200
Received: from [98.138.90.48] by nm8.bullet.mail.ne1.yahoo.com with NNFMP;
	27 Aug 2011 10:02:49 -0000
Received: from [98.138.88.236] by tm1.bullet.mail.ne1.yahoo.com with NNFMP;
	27 Aug 2011 10:02:49 -0000
Received: from [127.0.0.1] by omp1036.mail.ne1.yahoo.com with NNFMP;
	27 Aug 2011 10:02:49 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 869938.68004.bm@omp1036.mail.ne1.yahoo.com
Received: (qmail 47380 invoked by uid 60001); 27 Aug 2011 10:02:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1314439369; bh=wDyz9hcvcYJ8BjMpWh0Q4GqBzm8Gig5gLj0nTd2uFkM=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=rvf3I2/MOERetga4b6v74fmPfSpLiTqTtYlD7oEbuU/tC7vmgTNKzO1w+baLW0rFML4Hjfhb7p9BPOIMqLul14DvuR3rbad4CNesZ+S/zyfwhf/3xMS1BEnbsKB9Np59pNw/0pkfbBIGTkKvOZ+UJMywrPhgdSfZyPfHPhyUZfQ=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=rRKRq2Ttk4qZJxrAqSpNrjMkrRN00y47q59sk6fZKokXWyIAN1qosWC2B+PXzZL9zFYlp5uGNIlrRynF2zKRMBRxKYffd9S5LOBTcq0kOV6N9Iy+qh7nWHi6bcr+v40x7sf5O8Sm7+B1P8scfGQU6tMLLLBQjF/KRdMVdR910Wo=;
X-YMail-OSG: .f6Tn70VM1k7R3zYbziW58.bo4Tb.ICb.bRi8t9OHbl4NWP
	K9ps1YnzfJv5FwcjJN_aTGBdxRE1Yy_o74SOqumxvSBISjPMNwIfg0U1njCo
	yRFQk0Dorg5Yde29nyCA5Ue2f2g12KtBwkWjJIlWw8HzMCx_CViNo7O6bQZg
	gsUIMx10rU5S3Dgw9hrHHKT48.t2KCm3D9c_LJACwV3p6FGcs_8Fp2qO0NdD
	7VJe5t0Ap81c_hi3X1NgDxaWjXNIoPURxKWUoBO1.eIkL.QIBCPYj9y_buu4
	_oF.UGGV39czzGex9uCosmxXqpPfYF4P2es1mw7m1mG3vVm.0HOdtYTOfMvV
	DDMSyjbus.REE_pKQLf_ufPyng5Z6Q7qaZqm2x7Z7GYHE9Zv3m63r2u45DoA
	ZGlwYiyHRjATxGsVo.EtLIlbnVkrf3VfdNFTgFCVKzjrubHLNqbOyXoyZ8Vn
	AXflgvhzeSKlzkeOBKYoJorHxYJk_lvxoZrM2vgV.2sgWutnBwgbk0kL7nOT
	8wGVLa38.H0zKrzFmrFKvXgQK
Received: from [72.200.190.155] by web114702.mail.gq1.yahoo.com via HTTP;
	Sat, 27 Aug 2011 03:02:49 PDT
X-Mailer: YahooMailWebService/0.8.113.315625
Message-ID: <1314439369.47073.YahooMailNeo@web114702.mail.gq1.yahoo.com>
Date: Sat, 27 Aug 2011 03:02:49 -0700 (PDT)
From: Jon Cooper <joncoops@yahoo.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: native-sdk-image cvs_1.12.9.bb error
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
X-List-Received-Date: Sat, 27 Aug 2011 10:10:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

I am new to the environment so I am trying things out. I was trying to use =
bitbake to build the native-sdk-image and it=20
was failing&#65533;retrieving cvs source and it appears that the provider&=
#65533;&#65533;http://musthave.sunbase.org in the cvs_1.12.9.bb receipe is =
no longer there. I assume that this is=20
cached for other people but is there another good source for this=20
version of cvs?
&#65533;
&#65533;
Regards,
Jon Cooper
From josua.mayer97@googlemail.com Sun Aug 28 11:37:16 2011
Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josua.mayer97@googlemail.com>) id 1Qxbno-0006iR-5r
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Aug 2011 11:37:16 +0200
Received: by fxg11 with SMTP id 11so3800651fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Aug 2011 02:32:25 -0700 (PDT)
DKIM-Signature: v
