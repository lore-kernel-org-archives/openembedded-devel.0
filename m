Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0357DD5D693
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 22:00:03 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.4619.1731016796211333538
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 13:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fCiS762J;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241107215954a68b79dc9df010da47-6gr61y@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241107215954a68b79dc9df010da47
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 07 Nov 2024 22:59:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4aEOPYm1k46eMGD2cLp51WCdKbhoiSFdAOn8ld+lcYc=;
 b=fCiS762JPyUHkNj//WY7qEnEcGwUNj+2AXrKDXb1U7BU2apophR+ist99IujlbF0A1j16j
 QoZ2gqQyVNicJwxlRNRPEjwBIriZsMUVdqv8qkzG5uSeZXgptMuw8xNzu+tfH4k0Tj3qAyhi
 Iv2F6MVhlPB12pDjUep2MvvBxQqbz8zep1WBj5se1Ek47Ge/8KKmBzdly7u5FFTLd58bGFsZ
 9UydACZlB2R+19A41qhunIjLqQXxe5ZKs8Fo70DoZ703w/LuUtdn2tL7DLF85T8xPDloMaYe
 UR0SD4zew34EvrDC1+puVPvxuHxH2uY34wM63ucDX3l77s/yRDtG52zw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/2] squid: handle CVE-2024-45802
Date: Thu,  7 Nov 2024 22:58:49 +0100
Message-Id: <20241107215849.2282940-2-peter.marko@siemens.com>
In-Reply-To: <20241107215849.2282940-1-peter.marko@siemens.com>
References: <20241107215849.2282940-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Nov 2024 22:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113758

From: Peter Marko <peter.marko@siemens.com>

According to [1] the ESI implementation in squid feature is vulnerable
without any fix available.

NVD says it's fixed in 6.10, however the change in this release only
disables ESI by default (which we always did via PACKAGECONFIG).
This means CVE report would say Patched even if the vulnerability is
still present if someone adapts squid PACKAGECONFIG.

Commit in master branch related to this CVE is [2].
Title is "Remove Edge Side Include (ESI) protocol" and it's also what it
does. So there will never be a fix for these ESI vulnerabilities.
Based on this, remove vulnerable ESI PACKAGECONFIG already now.

[1] https://github.com/squid-cache/squid/security/advisories/GHSA-f975-v7qw-q7hj
[2] https://github.com/squid-cache/squid/commit/5eb89ef3d828caa5fc43cd8064f958010dbc8158

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_6.12.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.12.bb b/meta-networking/recipes-daemons/squid/squid_6.12.bb
index cc3d2f25db..a697f21836 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.12.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.12.bb
@@ -48,7 +48,6 @@ PACKAGECONFIG ??= "auth url-rewrite-helpers \
 PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[werror] = "--enable-strict-error-checking,--disable-strict-error-checking,"
-PACKAGECONFIG[esi] = "--enable-esi,--disable-esi,expat libxml2"
 PACKAGECONFIG[ssl] = "--with-openssl=yes,--with-openssl=no,openssl"
 PACKAGECONFIG[auth] = "--enable-auth-basic='${BASIC_AUTH}',--disable-auth --disable-auth-basic,krb5 openldap db cyrus-sasl"
 PACKAGECONFIG[url-rewrite-helpers] = "--enable-url-rewrite-helpers,--disable-url-rewrite-helpers,"
@@ -67,7 +66,9 @@ BASIC_AUTH += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'PAM', '', d)}"
 EXTRA_OECONF += "--with-default-user=squid \
                  --sysconfdir=${sysconfdir}/${BPN} \
                  --with-logdir=${localstatedir}/log/${BPN} \
-                 'PERL=${USRBINPATH}/env perl'"
+                 'PERL=${USRBINPATH}/env perl' \
+                 --disable-esi \
+"
 
 # Workaround a build failure when using a native compiler that need -std=c++17
 # with a cross-compiler that doesn't.
-- 
2.30.2


