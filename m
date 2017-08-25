Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 62CD0783CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 07:14:33 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id a7so2705837pgn.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V4hf/wsYT4MtXykfSAJUuqYU6qrNHvmpFeXA8lP7Nsw=;
	b=MgHcsc/qTCDyy3yuRydPK5RPD+W/Ynqv3Ju5667wL/cWm9GFyCvJi8Is6gAODk+Ho3
	dG04KAFy60gtGmpfWIOx5rS97SwWrvlcdl6+uHcVYf7QxZ9jWGdH3U8I15dv5Q2PmsM4
	/reDgLRuQtB+MjwmP2/ivCPoYMBilZA42qzY2UtYJwsHmu7cEmN/8cgq9d27PJPGMEbl
	DuYAMA5G8y/KbzZKn6fI31AQ3hw+jS63kCLHe47CR5kRFvpqqnW+fBwhPh0IIJGZMPeg
	0p/w2wZvAkucd0iQam8dhQJ12QHwQGmnsLlyM9/r2Y3mShihOjsfSV8J1hTzauOpbwtb
	FrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V4hf/wsYT4MtXykfSAJUuqYU6qrNHvmpFeXA8lP7Nsw=;
	b=hjjyAJ0CZ8QoUfaIYlsPupfopJwSP81J6k+x8FSfAyPN+P4W1qvCFvyEgyAtqMkswd
	5wNtRDy/7Vn27a77dCSyCbvxSIqiJx2mCWT4Ir9axecOVoUK0NlziAx1oxPxyMYvcCe/
	8CPAvr9NpUD5ghXZJOMbMhQ1QuWVUaNrzJN+pQ6Y6EfP/yFXRG76I3B27m+veOzQec7W
	ytixB6aqvE1fcQZfigy5H8O4bQdzkoiFVDv45isEyqoUdKbnfxQHwWzCDSqp5qqhF7zu
	s6AdXiFMAeRaGZNrx+gDrLICIQhJhj8l8VrShUKEadJJ4NypWqD1ubbJm6M7wsjvPeTL
	o4+Q==
X-Gm-Message-State: AHYfb5h4aTcjz4nPsF5dQPcx+XxHg5tzSmbxfc5TmHhLfaDC2OQE1/jr
	+T2e9CXt2KfEvykf
X-Received: by 10.99.160.106 with SMTP id u42mr8649799pgn.26.1503645275294;
	Fri, 25 Aug 2017 00:14:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	x11sm11730377pfk.43.2017.08.25.00.14.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Aug 2017 00:14:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Aug 2017 00:14:22 -0700
Message-Id: <20170825071422.3969-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170825071422.3969-1-raj.khem@gmail.com>
References: <20170825071422.3969-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] squid: Fix QA errors about wrong perl interpreter
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
X-List-Received-Date: Fri, 25 Aug 2017 07:14:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/squid/squid_3.5.26.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
index 0260497e7..5c3ac86fc 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
@@ -54,7 +54,10 @@ BASIC_AUTH = "DB SASL LDAP"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 BASIC_AUTH += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'PAM', '', d)}"
 
-EXTRA_OECONF += "--with-default-user=squid --enable-auth-basic='${BASIC_AUTH}' --sysconfdir=${sysconfdir}/${BPN} --with-logdir=${localstatedir}/log/${BPN}"
+EXTRA_OECONF += "--with-default-user=squid --enable-auth-basic='${BASIC_AUTH}' \
+                 --sysconfdir=${sysconfdir}/${BPN} \
+                 --with-logdir=${localstatedir}/log/${BPN} \
+                 'PERL=${USRBINPATH}/env perl'"
 
 export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
 
-- 
2.14.1


