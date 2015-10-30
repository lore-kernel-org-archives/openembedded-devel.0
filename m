Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id AD29475E80
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 11:00:03 +0000 (UTC)
Received: by qgeo38 with SMTP id o38so58211809qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 04:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=C12xH4P0XJptOB+opvH1rTNV2rx60hx7pjc0McXkgcI=;
	b=TncM+wMCgcqbyinCtBUM+VSkRPxH7jC/nS7txfgnXqRDvEAhZqvS3W1BhkLbU6rKib
	O2t9l0PS5WALP0phWDaJjpt0CSkAmqWcESF72KtE1x9r+tzFKm3G/wkeUfhpafvM78RI
	Q7gfr/PJ7wGpY7EEMAGQifer+FdpvnFQ90o+vzwyFG3+QSMu7nCCkIyY7IUvh0rO2DKI
	M5o8/TNPuT28wIyu7vhd4k2IjM2/Tr0mIBVRCq6SWIueeS2SNLD1ZpDFrQ6N/IL2w1B5
	ePNcV7jOWuCAPHTJvr5Y7UuD8zhoeQjY1co1lcZAMW0TtZGoadDm83X9gJbIHkzWjDvb
	Hpog==
X-Received: by 10.140.216.135 with SMTP id m129mr9294019qhb.90.1446202803790; 
	Fri, 30 Oct 2015 04:00:03 -0700 (PDT)
Received: from localhost ([177.100.174.62])
	by smtp.gmail.com with ESMTPSA id 76sm2268348qgo.32.2015.10.30.04.00.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 04:00:03 -0700 (PDT)
Message-ID: <56334db3.52178c0a.5eb87.ffffba68@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Fri, 30 Oct 2015 08:59:58 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Fri, 30 Oct 2015 08:59:58 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-java (master) in 2015-10-30
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
X-List-Received-Date: Fri, 30 Oct 2015 11:00:05 -0000

Hello,

I pushed following updates:

commit bdba48454924bdd45034057153b53a16177ef6ec (HEAD -> pending, yocto/master, m/master)
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Fri Oct 30 10:36:29 2015 +0100

    openjdk: fix indentation
    
    Change the indentation for all openjdk recipes to 4 spaces.
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit d111fae12343f0a79148ea370a45b308ee8b36cf
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Fri Oct 30 10:36:28 2015 +0100

    openjdk-7: remove openjdk-7-release-*.inc
    
    Due to the fact we will always support only one OpenJDK 7 version the
    openjdk-7-release-*.inc is not needed. Therefore remove this file and
    split it content to openjdk-7_*.bb and openjdk-7-common.inc.
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

