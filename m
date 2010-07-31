Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Of4iV-0005uV-96
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 07:34:39 +0200
Received: by pwi10 with SMTP id 10so830865pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 22:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=3c9fo746N5gsH2rxkbt6rncqnk8i0iRfiVh3ne7v+Hk=;
	b=g4k7EpEHGGhq5dOVcc1Dv/zyNx/ETwWhUslN5K/J6s1FOJom4yDajtoboX8jvR5EV4
	DUclI/16Ajb0kq43AOydpzZ2++LHgTdngodOgTvaEH9lfu2lYp1g7mWEi63tt5D6DSJV
	lmDBmPBhyJoKPo6x6wbnqMuMe5bZ7bXWnYt1M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=lfCRvJx0ZaVxvu6aE98dAO91Zg9h6hEfu0rdEMd2FVwnjD7P30VQmF1pP2Pf4CzUV4
	cXJjBrPJjet++HRBgw9b0jvQkNGwNbW+Qrt4oKDqBPIb5E8jj4rPxZgCqSHJWUrGIZih
	XVnB1VvHwl02rq3EguLtT+OJ6H4okfwCdjI/w=
Received: by 10.114.46.14 with SMTP id t14mr3489256wat.67.1280554457157;
	Fri, 30 Jul 2010 22:34:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n32sm5308381wag.23.2010.07.30.22.34.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Jul 2010 22:34:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 22:34:06 -0700
Message-Id: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Sat, 31 Jul 2010 05:34:40 -0000

Hi

Following series of patches are for making multi-machine toolchains co-exist with
new cross staging for toolchain.

It installs the toolchain in <native sysroot>/usr/${BASE_PACKAGE_ARCH}
this way we can have multiple toolchains co-existing for different sub-arches and major arches too.

I have booted a native-sdk-image on qemuarm successfully. The build for 
beagleboard minimal image using different versions of toolchain went all fine too.

Please test these patches and if seem ok provide some ACKS/NACKS


Thanks
-Khem



