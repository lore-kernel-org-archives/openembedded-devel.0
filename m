Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1Q7M-0005dM-Ai
	for openembedded-devel@openembedded.org; Thu, 30 Sep 2010 22:52:42 +0200
Received: by yxg6 with SMTP id 6so958433yxg.6
	for <openembedded-devel@openembedded.org>;
	Thu, 30 Sep 2010 13:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=lye8BD8/plckB/CEpCf8czLGbbJDVpggxCB4lGAMEjU=;
	b=grrdMU1mNysHdkEnDcxF37qDx2/mNnvi2ecc70UrGaGugr3oK48N7dU+lDWrYc1sqN
	Y+75/hEElcCZRZ3w4cPk+/FxYTaR2JufrNPpEUl93BerZaft5JVQbvQvp9Kg3AgRKeHI
	SE10yxJlb5WRWS3MmvSsG6KIFQ4tdyUUBx5mw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=cY1oSfVSTas4xxOfbftIqswQb4IztmTxEzbzLH38ka95Qqex1SEAOytSaNAh4ewCVH
	8nci3JprtYvAeRITblMg07Ep2bFLhzsujPDxZpKl5YKiEvxGRdhqgbh++Db0w5Lmb41R
	ZMqVlgTKfokk9FoQzdBO/ObYSBHHX1JLSBEmE=
MIME-Version: 1.0
Received: by 10.231.14.140 with SMTP id g12mr4269328iba.84.1285879944835; Thu,
	30 Sep 2010 13:52:24 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 30 Sep 2010 13:52:24 -0700 (PDT)
Date: Thu, 30 Sep 2010 22:52:24 +0200
Message-ID: <AANLkTin7JTEHEx728sX9-qZwswamNEVW8WdbxgQ9rLOM@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gcc 4.5: unpackaged files
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
X-List-Received-Date: Thu, 30 Sep 2010 20:52:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just compiled gcc4.5. This gave some unpackaged files:

NOTE: package gcc-cross-4.5-r1+svnr163322: task do_package: Started
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/libobjc.so.2.0.0
NOTE:   /usr/lib/libobjc.so
NOTE:   /usr/lib/libssp.so
NOTE:   /usr/lib/libssp_nonshared.a
NOTE:   /usr/lib/libsupc++.la
NOTE:   /usr/lib/libobjc.so.2
NOTE:   /usr/lib/libobjc.a
NOTE:   /usr/lib/libssp.a
NOTE:   /usr/lib/libstdc++.so
NOTE:   /usr/lib/libobjc.la
NOTE:   /usr/lib/libstdc++.a
NOTE:   /usr/lib/libstdc++.la
NOTE:   /usr/lib/libssp_nonshared.la
NOTE:   /usr/lib/libsupc++.a
NOTE:   /usr/lib/libssp.la
NOTE:   /lib/libgcc_s.so

Is this ok?

Frans


