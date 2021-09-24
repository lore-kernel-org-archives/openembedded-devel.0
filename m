Received: from mailout10.rmx.de (mailout10.rmx.de [94.199.88.75])
 by mx.groups.io with SMTP id smtpd.web10.5877.1632475715797101481
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Sep 2021 02:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.75, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout10.rmx.de (Postfix) with ESMTPS id 4HG6Cg2GwGz33rm;
	Fri, 24 Sep 2021 11:28:31 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4HG6Cd2nNhz2TRkV;
	Fri, 24 Sep 2021 11:28:29 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.55.132) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 24 Sep
 2021 11:28:28 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Matt Johnston
	<matt@codeconstruct.com.au>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] openssh-dev package and populate_sdk conflicts
Date: Fri, 24 Sep 2021 11:28:23 +0200
Message-ID: <2617274.mvXUDI8C0e@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <94429904ec0c9d75919cda42339a2fafcbc35fe4.camel@codeconstruct.com.au>
References: <94429904ec0c9d75919cda42339a2fafcbc35fe4.camel@codeconstruct.com.au>
MIME-Version: 1.0
X-Originating-IP: [192.168.55.132]
X-RMX-ID: 20210924-112829-MBWVyXJMTMVz-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 24 September 2021, 05:08:04 CEST, Matt Johnston wrote:
> Recently OpenBMC merged a change to install openssh-sftp-server package
> alongside dropbear sshd [1]. That caused a conflict in "populate_sdk" which
> installs all available -dev packages [2]. 'openssh-dev' pulls in an
> 'openssh' -> 'openssh-sshd' dependency which conflicts with 'dropbear' [3].
> 
> What would be the recommended way to handle that situation? For now OpenBMC
> has merged a change to disable building openssh-dev (it's empty since
> openssh doesn't have libraries) [4].


I had a similar problem. It set the following in my rootfs image recipe:

# SDK: openssh-dev cannot be installed because dropbear is already installed.
PACKAGE_EXCLUDE_COMPLEMENTARY += "openssh"

regards
Christian



