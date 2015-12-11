Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id F3F9C6FF86
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 17:48:07 +0000 (UTC)
Received: by qkck189 with SMTP id k189so14054608qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 09:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=zMIq6KktLkQLsr/tGYPI/2F0rSiwYIKx+hrYQJfg72w=;
	b=E6w4Q5rxlhoiJLvU2B3JbluACiFYa3pbxVT1Qb7f6LlGh5cQgqjCNKhU386qUTSh/a
	I/YV4GB9TdtBzGOA3tDUh9JgcFhI+YjxwTYidog+FkdtiqweQEr7//tIlNbhP0Y9zpDx
	lvSsskWNgdHb5mvb5H6K8Mp8TrvKsVZCXwt0oQQmGOTf0nwx7EgMbd2BXfQI3+FwL8hd
	LPXHtVoGIEwxWKn8VaWziQWLd1f/BmDfjib5Jw3huODiGEKbMJ3471UW5XuX4CtrRW1d
	Kv0agBzMJLDDQvArHfqMP1DCLUALj/BJQZlRI1yZ4cJwJI5oPAbHTTdOtSRLafWAZqb2
	3SuQ==
X-Received: by 10.55.22.29 with SMTP id g29mr25025128qkh.100.1449856088045;
	Fri, 11 Dec 2015 09:48:08 -0800 (PST)
Received: from localhost ([177.194.217.47]) by smtp.gmail.com with ESMTPSA id
	z64sm8561900qhd.41.2015.12.11.09.48.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Dec 2015 09:48:06 -0800 (PST)
Message-ID: <566b0c56.43178d0a.373e6.ffff953a@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Fri, 11 Dec 2015 15:48:00 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Fri, 11 Dec 2015 15:48:00 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-java (master) in 2015-12-11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Dec 2015 17:48:10 -0000

Hello,

I pushed following updates:

commit a3c5d358836b40fa44edb300cc687130131683dd (HEAD -> pending, yocto/master, m/master)
Author: Jan Remmet <j.remmet@phytec.de>
Date:   Fri Dec 11 11:50:04 2015 +0100

    rxtx: put license to LICENSE_PATH
    
    fixes "WARNING: rxtx: No generic license file exists for: RXTXv2.1 in any
    provider" on fido
    
    Signed-off-by: Jan Remmet <j.remmet@phytec.de>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit d32ba89d34c930b52fba9a78d7c3581f08f6f3d0
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Wed Dec 9 15:15:08 2015 +0800

    antlr/cup: inherit java-bootstrap-components
    
    This should be part of the following commit but missed:
    commit 04d5d0bf414c05ca59618d77f17ff9898aa1c566
    Author: Jens Rehsack <rehsack@gmail.com>
    Date:   Tue Dec 8 14:51:50 2015 +0100
    
        meta-java: rely on well known bootstrap-path
    
        Instead of potential circular depending virtual/javac-native (even this
        recipe provides such a useable java-native), rely on well known path
        via cacao-native to build up to icedtea7-native in reliable manner.
    
        virtual/javac-native should be used by parts not belonging to the bootstrap
        phase.
    
        Signed-off-by: Jens Rehsack <sno@netbsd.org>
        Signed-off-by: Maxin B. John <maxin.john@intel.com>
    
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

