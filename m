Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9432271637
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:26:02 +0000 (UTC)
Received: by qcwb13 with SMTP id b13so11575109qcw.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 16:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:date:to:subject:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=nFEGHx/mic4AXFKKouwiHIsHoowXE8KScTn1+mTwtlI=;
	b=qEyMhgTRTE6oMedRgY0qmeFbixP82TNEDJ4ZWDJ7QFYBk+mRjBYN7dD9eT4++KOE1d
	m8CIjlmmLMRA3OCqGpPYtGYEYoUJfex4ffmvlLAWgaBZu9pR4V/ImkMefI2HvOy4g9Vc
	AcpoHLaBWXDQbIgY2rYRZtsJAPm21T/Jln6O5H2TRPquiIc87WuCIdpWUbedZr3dPR1T
	Tnl+ONtHIkNgP14DpdaHjpu2hYHshTQJOMfUQRuVht7lxM2Tnhdq0U8HdCsa4ahECafq
	ePsyCJkd1fLMfc41JKUlri46JAnPa2Lqug3Rtr0ljels1de5g/fomO8aRMOgWl3bLm2n
	bmyg==
X-Received: by 10.140.37.39 with SMTP id q36mr22701882qgq.18.1424996762162;
	Thu, 26 Feb 2015 16:26:02 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id c4sm1600896qgc.29.2015.02.26.16.26.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Feb 2015 16:26:01 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
X-Google-Original-From: otavio@nano.lab.ossystems.com.br (Otavio Salvador)
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 883F61CC5523D; Thu, 26 Feb 2015 21:25:57 -0300 (BRT)
Date: Thu, 26 Feb 2015 21:25:57 -0300
To: <openembedded-devel@lists.openembedded.org>,
	listing@nano.lab.ossystems.com.br, Mailing@nano.lab.ossystems.com.br,
	Meta-OpenEmbedded@nano.lab.ossystems.com.br
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Message-Id: <20150227002557.883F61CC5523D@nano.lab.ossystems.com.br>
Subject: Updates to meta-java (master) in 2015-02-26
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
X-List-Received-Date: Fri, 27 Feb 2015 00:26:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

I pushed following updates:

commit bd76e577a9f12b3036b0e7923b223dcd8b8ab7ed (HEAD, origin/master, origin/HEAD, pending)
Author: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
Date:   Tue Feb 24 13:05:39 2015 -0300

    icedtea7-native: remove currency data generation expiration date
    
    Removes a currency date expiration check whis causes a build
    failure.
    
    Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 305f1d85a6ce50d0c088e5d78c382565371572eb
Author: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
Date:   Tue Feb 24 13:05:38 2015 -0300

    gnujaf: remove unnecessary reference to autotools
    
    do_install was calling an unnecessary 'make install'. oe_jarinstall
    provided by java-library class is sufficient.
    
    Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 6acfc3350dd4e5f37866d95b870ff91edf64751b
Author: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
Date:   Tue Feb 24 13:05:37 2015 -0300

    cacao: create the link /usr/bin/java in cacao-native
    
    In native build, the link is not created by update-alternatives.
    Some package builds were failing, like gnumail and gnujaf, if cacao
    was the PREFERRED_PROVIDER_virtual/java-native.
    
    Something similiar is currently done with jamvm-native.
    
    Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

