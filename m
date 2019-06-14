Return-Path: <fw@javox-solutions.com>
X-Greylist: delayed 392 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Jun 2019 13:53:00 UTC
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
	[80.67.18.15])
	by mail.openembedded.org (Postfix) with ESMTP id B07ED7E98D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 13:53:00 +0000 (UTC)
Received: from [78.34.218.136] (helo=[192.168.178.95])
	by smtprelay03.ispgateway.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <fw@javox-solutions.com>) id 1hbmXD-0000l8-Rz
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jun 2019 15:46:27 +0200
To: openembedded-devel@lists.openembedded.org
From: Florian Wickert <fw@javox-solutions.com>
Organization: Javox Solutions GmbH
Message-ID: <e0d06b82-d76e-01af-f1c3-f3976eafa459@javox-solutions.com>
Date: Fri, 14 Jun 2019 15:46:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
X-Df-Sender: ZndAamF2b3gtc29sdXRpb25zLmNvbQ==
Subject: rtmpdump and GnuTLS
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
X-List-Received-Date: Fri, 14 Jun 2019 13:53:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US-large

The following commit changed rtmpdump to use GnuTPS instead of OpenSSL:

commit b284f2b45a9127b84460ab99f00fd13755b1af5b
Author: Khem Raj <raj.khem@gmail.com>
Date:   Fri Feb 1 23:00:08 2019 -0800

     rtmpdump: Switch to using GNU TLS instead of openssl10

Unfortunately this leads to really nasty heap corruption errors that are 
hard to track.
This is a bug in rtmpdump, not in the meta layer, so this e-mail is just 
a warning to people who are using rtmpdump.

I have a patch that makes rtmpdump compile against the OpenSSL 1.1 API. 
If someone is interested I can post it to the mailing list.

Regards,
Florian

-- 
Florian Wickert, M.Sc.
Javox Solutions GmbH
Gallierstr. 33, 52074 Aachen
Germany

Phone: +49 241 99034569
Web: www.javox-solutions.com


