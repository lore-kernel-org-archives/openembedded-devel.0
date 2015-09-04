Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 36A0D77016
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Sep 2015 07:35:02 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so8352564wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2015 00:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=l0BeYAEtt6O1suhXyHyVJ1M67pmOtiROcf4YWH2m0yk=;
	b=gI35Z7hHzbVqhAyhVxo106SDQNEk0Efaq25eAr/E41E4gTE3alpEhZQeY7HEDwnGje
	Ql2UyuYVwsXfXPl8MdDZmrAAcSrqSVfzzXZAkD7ITiFxCAghHTfE1f8hkM7VaLewThVN
	rx0dbSTRRtQgpPxn1aZq1+3buSwXhFMXUxjz2URmqxdoVqRcpqSJi6BUlDsdyXmtt0Ty
	/igBE4huTdHJCVPcPcWtuZluB45Q8LE7i8iefTvZkUG2DH+4RyB1wwU/x7r6R9b+EFVZ
	93/pk0AsHYdm34YA+sSfk+uTcoXIBmGk2/CI1PT3g2W9Jc1PzEi6VSnuCVBAIA/CzfZF
	urlw==
X-Gm-Message-State: ALoCoQlDODBGXrE46jIcrmv/Yq1r0hFCPnBkdTj6KAngn+pTmqaRplipt293eBWKhsk9aTe1OoGx
X-Received: by 10.194.171.129 with SMTP id au1mr4636638wjc.115.1441352102325; 
	Fri, 04 Sep 2015 00:35:02 -0700 (PDT)
Received: from mobil-400-586.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116]) by smtp.googlemail.com with ESMTPSA id
	v6sm2382461wjf.13.2015.09.04.00.35.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Sep 2015 00:35:01 -0700 (PDT)
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <55E949A4.9050805@dresearch-fe.de>
Date: Fri, 4 Sep 2015 09:35:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
Subject: "sub" machine types?
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
X-List-Received-Date: Fri, 04 Sep 2015 07:35:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

We have some products which differ in bootloaders (u-boot) and kernel device trees only. They use the same kernel and root filesystem.

Does OE have concepts for this? Or any suggestions to realize this without building for many machines?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

