Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.3743.1612477309256164806
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 14:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:60732 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1l7n0V-00038D-G2
	for openembedded-devel@lists.openembedded.org; Thu, 04 Feb 2021 17:21:48 -0500
Date: Thu, 4 Feb 2021 17:21:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] correct "RRCOMMENDS" typo in ipset recipe
Message-ID: <4a405d47-5d18-d257-824b-6e3c383e194@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta-networking/recipes-filter/ipset/ipset_7.9.bb b/meta-networking/recipes-filter/ipset/ipset_7.9.bb
index 95e48f013..1ec890b2c 100644
--- a/meta-networking/recipes-filter/ipset/ipset_7.9.bb
+++ b/meta-networking/recipes-filter/ipset/ipset_7.9.bb
@@ -16,6 +16,6 @@ inherit autotools pkgconfig module-base

 EXTRA_OECONF += "-with-kbuild=${KBUILD_OUTPUT} --with-ksource=${STAGING_KERNEL_DIR}"

-RRCOMMENDS_${PN} = "\
+RRECOMMENDS_${PN} = "\
     kernel-module-ip-set \
 "

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
