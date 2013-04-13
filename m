Received: from nm19-vm0.bullet.mail.ne1.yahoo.com ([98.138.91.59])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prabindh@yahoo.com>) id 1UR2hS-0005IJ-Of
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 17:49:13 +0200
Received: from [98.138.226.176] by nm19.bullet.mail.ne1.yahoo.com with NNFMP;
	13 Apr 2013 15:29:16 -0000
Received: from [98.138.89.171] by tm11.bullet.mail.ne1.yahoo.com with NNFMP;
	13 Apr 2013 15:29:16 -0000
Received: from [127.0.0.1] by omp1027.mail.ne1.yahoo.com with NNFMP;
	13 Apr 2013 15:29:16 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 405885.63040.bm@omp1027.mail.ne1.yahoo.com
Received: (qmail 35694 invoked by uid 60001); 13 Apr 2013 15:29:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1365866956; bh=zF4JnP05vitl1eKwtEhjdllr8EKWZ9AVQJUZ5CRY0pU=;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=SWrmmAppITrsHq0p0zcYmF3TSAKeQrIhU8Af5Bdtfs9+Y92Xt9iHx2NB60NZxOVEhnfKPeX0JqIwKOluQXSNd7IJkdfXtjUbPCIE6JTWcNTbUmF7mATgS4MOaWtDzAwgn/h/JoboppYKPD+Fb8tApAy8mY5y0cCD1KtZ+l3XVsI=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=xMyicLfGMgHcXg+KF8egDc7wJBMBtUlmXvcQONgAYR/IM5wApFNgjcbo1KwbnwY4p41SiDeK5PteWLNF20FIUq9VCEP7bzAkuf8Cnk5oRwb9r0szAGGW7xGHGXmXt/Wctbs4y3KZMqzqTQxmfevnjVIsnClXm4pQeDJ98B0uKyk=;
X-YMail-OSG: mYxeafcVM1mBW77y3faG4p3cFZXT2Tvb4PRqM6vwvIvW1hD
	PuRhVvitZThwoz1WAopmAcIafhS814wwRuU.n3uEqrREuZ_cO7HJEPk_bKb1
	hRnvV7taKxv9ux9hm59IQT60.G68HAaKbedbAWLvyl8myZHAc1JfMR5GBee1
	4tQ.Wu0cuWHi8ooOpRikCBUtdC4G8Ocf_OvEXe8n.Fv3XYbCfLb3uvLeC54v
	lL_vc_xtVfn.Vaz6XLUYtkXK86mFFXuXiWI9eqWLu4R4uRxFKzwcsAhezxCG
	5d98.i1eJc3tucPJ3U6CMyftQeOLN4dheI_GByS4jrCOc5ao3TkamPm_XI8w
	vN6U0a8h1Ci5GEVvzGRJwe7PsiPc_62HKX8SVWWxVQ1EzEJYBG0HA_xcZbmN
	D_PWYbaFDEnY9OfgLaYjgtrEqMGCWmdzdOoiHqDjHfbVAJ7MTIH5r2ysLCYf
	Y80jXvJstVtwNePMF0Sl8r7Esr91rjxD_b5sSPev4Yv1XxrP6XYoSg6N_fhS
	YCk1TKx.1gjdlKPjetcVUGj2XFYTuzA26xWtWmdUO.yDUTHMvkx9utSwN2ea
	rqAI0D5Cp1DnxBfj0HX_j4nayiwE0YtLDAMwWw.95612LtM4Ov6CGnjIgn6I
	81mALhE5J2qf7pbJ7er2w
Received: from [122.172.26.27] by web125602.mail.ne1.yahoo.com via HTTP;
	Sat, 13 Apr 2013 08:29:16 PDT
X-Rocket-MIMEInfo: 002.001,
	QmVsb3cgZ2l0aHViIGxpbmsgaGFzIFF0NSBlZ2xmcyBwYXRjaGVzIGZvciByZXZpZXcgLSBmb3Igd29ya2luZyB3aXRoIGdsZXMyIHBsYXRmb3Jtcy4gSXMgdGhpcyB0aGUgcmlnaHQgd2F5IHRvIHN1Ym1pdCBmb3IgcmV2aWV3ID8gSWYgbm90LCBzaG91bGQgSSBzdWJtaXQgaW5kaXZpZHVhbCBwYXRjaGVzID8KCgpodHRwczovL2dpdGh1Yi5jb20vcHJhYmluZGgvbWV0YS1xdDUvY29tbWl0L2M4MTI5ZmI1MDU3ZjkyNTRjNzczZjgyZDJmZGJkODVkOWM1NjQxMGEKCkkgcmFuIGludG8gdGhlIGlzc3VlIG9mIG0BMAEBAQE-
X-Mailer: YahooMailWebService/0.8.140.532
Message-ID: <1365866956.81107.YahooMailNeo@web125602.mail.ne1.yahoo.com>
Date: Sat, 13 Apr 2013 08:29:16 -0700 (PDT)
From: Prabindh Sundareson <prabindh@yahoo.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: [meta-qt5] Qt5.0.1 eglfs with gles2 - patchset
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
X-List-Received-Date: Sat, 13 Apr 2013 15:49:15 -0000
Content-Type: text/plain; charset=us-ascii

Below github link has Qt5 eglfs patches for review - for working with gles2 platforms. Is this the right way to submit for review ? If not, should I submit individual patches ?


https://github.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d2fdbd85d9c56410a

I ran into the issue of managing the GL providers for eglfs support, and currently using a DISTRO_FEATURE check for virtual/libgl support and 
falling back to libgles2. I am sure there are better ways.

This is build tested on Poky, with Yocto, and runtime checked with minimal plugin on Beaglebone, with TI SGX530 drivers on 3.8.5 kernel. There is no fb support on Beaglebone yet, but I hope to get to Arago on one of the EVMs next.


Please provide comments.

regards
Prabindh



