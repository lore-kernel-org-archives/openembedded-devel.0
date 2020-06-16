Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.7770.1592303814555051198
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2020 03:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:33406 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jl8xY-001UpS-E5
	for openembedded-devel@lists.openembedded.org; Tue, 16 Jun 2020 06:36:53 -0400
Date: Tue, 16 Jun 2020 06:36:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Subject: standardizing HOMEPAGE values in python3 recipes
Message-ID: <alpine.LFD.2.21.2006160631480.7747@localhost.localdomain>
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


  given the current flurry of python recipe cleanup, just want to
verify a couple things that could/should be standardized.

  first, HOMEPAGE values of the form:

  https://pypi.python.org/pypi/astroid

can be adjusted to reflect the result of the redirection, as in:

  https://pypi.org/project/astroid

also, as i read it, recipe HOMEPAGE values should *not* refer to the
pypi page, as that is already set automatically by pypi.bbclass.
rather, the HOMEPAGE should refer to the actual source home page,
which in the case of the astroid package would be:

  https://github.com/PyCQA/astroid

does this make sense?

rday
