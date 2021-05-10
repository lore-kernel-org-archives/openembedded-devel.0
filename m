Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
 by mx.groups.io with SMTP id smtpd.web11.31840.1620654674099069712
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 06:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=TrL2zRrP;
 spf=pass (domain: pr.hu, ip: 87.242.0.7, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1lg6JT-0007Aa-0T
	for openembedded-devel@lists.openembedded.org; Mon, 10 May 2021 15:51:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/RmKLKODUzIFEn6PzNn7qdMvCdSYbVpTF0w3MzzhHA0=; b=TrL2zRrPAcYDam1Fq/FP1dW2cg
	RAZE6m9eRaW7fTkijX6bRxQYqFu83CjUijpqnlEjGvFdg2O8O7lvd0NO75MC8AAnkpiVzUpZn4DKX
	3JWRbX947WtmwtWnR+eWHCfPM8+sw6x4bSPTRu7fH85tju6Fxf2Vx506MzseEhmRD1yyQuHRBx+y/
	Tw8EgBz23hdtuz6pFAcCC4b7krzk1MEVjuCz/pjgaz+MkhN/5/olavKi8UYaQ5hjvHKKtWB3G89IT
	wy8+iR3WGOubSEmeof7KXfg0X07K4yS1aabZhqr4QPOe39I4foGm/TL1uHLCtKaKbRalIsWGgI9TR
	tGku/pDg==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1lg6JP-0000qG-6F
	for openembedded-devel@lists.openembedded.org; Mon, 10 May 2021 15:51:08 +0200
To: openembedded-devel@lists.openembedded.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: mariadb-native fails to build on Fedora 34
Message-ID: <59e17e43-74f3-76f4-69e1-150f152c1831@pr.hu>
Date: Mon, 10 May 2021 15:51:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 5c27a7ee490ccbfea099474daaf9cbba
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210510135108Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

mariadb-native 10.5.9 on Hardknott fails to build on
Fedora 34 host with a lot of "undefined reference" linker errors.
It's likely related to GCC 11 on the host OS.

BTW the same MariaDB version is shipped by Fedora 34. ¯\_(ツ)_/¯

Best regards,
Zoltán Böszörményi
