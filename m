Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.6245.1589640963638790669
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2020 07:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:41978 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jZyEL-00Gwyy-K0
	for openembedded-devel@lists.openembedded.org; Sat, 16 May 2020 10:56:02 -0400
Date: Sat, 16 May 2020 10:55:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Subject: why is python-mako recipe in OE, while python-mako.inc is in meta-oe?
Message-ID: <alpine.LFD.2.21.2005161051310.10701@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  was just perusing some python recipes, trying to learn all the
details of how python recipes work, and i noticed the following:

./openembedded-core/meta/recipes-devtools/python/python3-mako_1.1.1.bb
./meta-openembedded/meta-python/recipes-devtools/python/python-mako.inc

  as in, the recipe for mako is in oe-core, but the include file is in
meta-oe, the recipe does not include the .inc file, and the git log
just looks confusing. is there something clever going on here that i
just don't get?

rday
