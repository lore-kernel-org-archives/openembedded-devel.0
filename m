Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id ECD1961134
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 22:39:45 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id g21so83416pfb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 14:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KJPlBw0YHDyVCCHKwxVvbzdB294UHdSk+pK3kuG2Yvg=;
	b=L4Yt6aziXfc7fL8obvHZE49Heqbd4WiyCj4cxDWAFVVHF177rzo7kp5sB2Ukk+Z3Ji
	XcFbMacVzT8K+/GuSiQbG8U1+O7I+D45/+we3pKloq5BFSGLv1lfvZK6YYzVWS9bpvBt
	WTZF38t/mM2x+yxWrJsHpY8nrnPfpRqjMm9ti57cqxuwLA9QjN1lRK6QpJZarh8RZFf2
	yYv7vbCGMpyhmMvquxgYZsse5P9oerfu2NhtHKJj1xwEDroZUHQ913hwsrWExqUQdT3Q
	3bqF58pTPX2d7oNWR1AS7HtZyqurYVmMbaSAeGx1v5Kjr8D5HNFDe2JkJ4o/B5GgkJql
	8oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KJPlBw0YHDyVCCHKwxVvbzdB294UHdSk+pK3kuG2Yvg=;
	b=OZWKXDx2v8nqTozoZknT7VNga7u+/1mhfCkP5MwioZvfvjHW0SpknupbIfKElFzWcd
	B3f41443SoMzf/cxq/7YON5/gXpZ70ZwAuv9bGjEcJdfo6Jvi3zDukJvu+pTiL3cXM3s
	8coOEDWUuGMrVp8Wc9zF8yCspQrSNWU643BhUMJsKNVj6ZT2sDotyQP6Bf661TnrSX35
	orS2CB2Xfd3oeTxOJmyiWGzNqBwr6VzQW3Dtenm4eANxahUqsX0gNc5JhO8yJfYFJ2Gk
	VLG9Ae7qPT67gbvzepnDAdClrgQs3EjB7FsM+MtOSe7OTRCIuCBOxQ00jzhCGqHxKSKP
	SBAA==
X-Gm-Message-State: ANhLgQ2TmbosUUlnOXsh5YJSW9eI1URJEo7qRkCvAw2B4V805u8w0xpS
	xlQ/b4d2YTmMY67Hg6X64MpVB4gRwWM=
X-Google-Smtp-Source: ADFU+vu7AuIAsdd9rNU9ZVAggOKUia82TmO7/XTFwfehRYMkfl7BMTvgpYC40mmGn4hJlwaSy7UvQA==
X-Received: by 2002:aa7:8b03:: with SMTP id f3mr591761pfd.133.1583447986729;
	Thu, 05 Mar 2020 14:39:46 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	g9sm33711247pfm.150.2020.03.05.14.39.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 14:39:46 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 55E5F2A07BB; Thu,  5 Mar 2020 14:39:45 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2020 14:39:37 -0800
Message-Id: <20200305223937.12418-7-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305223937.12418-1-jpuhlman@mvista.com>
References: <20200305223937.12418-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 7/7] proftpd: make prxs a mulitlib script
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
X-List-Received-Date: Thu, 05 Mar 2020 22:39:46 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Script encodes compiler settings and compiler name.

my $compiler = q(x86_64-poky-linux-gcc  -m64 -march=nehalem -mtune=generic -mfpmath=sse -msse4.2 );

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
index a080bec81..d5bbdd374 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
@@ -16,7 +16,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
 iSRC_URI[md5sum] = "13270911c42aac842435f18205546a1b"
 SRC_URI[sha256sum] = "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc541b40e152ecaf"
 
-inherit autotools-brokensep useradd update-rc.d systemd
+inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
 PACKAGECONFIG ??= "shadow \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
@@ -134,6 +134,8 @@ GROUPADD_PARAM_${PN} = "--system ${FTPGROUP}"
 USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} --home-dir /var/lib/${FTPUSER} --no-create-home \
                        --shell /bin/false ${FTPUSER}"
 
+MULTILIB_SCRIPTS = "${PN}:${bindir}/prxs"
+
 FILES_${PN} += "/home/${FTPUSER}"
 
 RDEPENDS_${PN} += "perl"
-- 
2.20.1


