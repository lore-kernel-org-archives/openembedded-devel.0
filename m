Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0C36114E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 22:39:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i13so88764pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 14:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=611pZqmMUZSsbknDSvuGXWTrfDe7zB805Os1BmF8+YE=;
	b=Pt8QOnyNcj88fAvACJz3k/StKq90/Q35NgZLbnkPqnmIpbnagOdMSw34+6YymxCvg4
	ZYaOuUOCWtqJwaeYiSlC1vrMf4KHD1js5ojsKSXndocGohrC8i6wWVX8i+wu+b4Elx/G
	FM4tUwLlngS6wKYPYxPHBvOKsOxKGpwvedpxPfeCXJ5S9FolrfWxPm6ywfx/PB5F7RDo
	eOTBxk5pmQ0RR7nls6LChYWze7yyw67UZZbWUcDfNWC+vaWr8Yeoi0A8a4VpiZXZOfZ3
	IFCqAPHIXuEV2+FJw25+O4XKeF0FEGmOqgUMT//vC0v/vrjAc1t8mQCZBF3ny9vJUO2E
	+VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=611pZqmMUZSsbknDSvuGXWTrfDe7zB805Os1BmF8+YE=;
	b=FpMdzn36uZQzhrkOF6N6kduDql+uW9KhBEGSw7cC6CfUP9Px0IVOc78H8l+h9r3mpe
	5CGEo5+Pdix2t6FPmcm9yRh9SC8URK+RR4SF9KA998ZqfBESaYV8RujGwllF+PMbjP8l
	NtlIN12EkAvFS0gO9vVmGuINlVkv7erAcMlj48KU0Qn+2BzBgXZnb745Ea6+QEcXhraX
	VG/E6AbOdKctfxEdInFEg3ecr9PXoDcH5iK/w0D+KfGylwDErun32rB8fJ2PWY7vkTyN
	OsHU7wjcGrWGGlOsgdwzWix6bh1A0yCBQWDQbwfXeaOzN3NV+jKkYXTuMrVGlvC71inQ
	Fekw==
X-Gm-Message-State: ANhLgQ3oLCq46uvSG0xUQhemDW5fQnApYLueHGRDK9JTKXgh0Sy0TzlL
	i4jpj80xn9qthSvMBC6wQUzGUakanSs=
X-Google-Smtp-Source: ADFU+vuaE3fE7c9U3hLyCI89ND71EKR1p+WOJIVAxhykOfoxZsz9c5Ucrh9gpIBQi/H/33w6In/wvA==
X-Received: by 2002:a63:9549:: with SMTP id t9mr360086pgn.346.1583447983911;
	Thu, 05 Mar 2020 14:39:43 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	x11sm32871772pfn.53.2020.03.05.14.39.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 14:39:43 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 966D82A07BB; Thu,  5 Mar 2020 14:39:42 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2020 14:39:34 -0800
Message-Id: <20200305223937.12418-4-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305223937.12418-1-jpuhlman@mvista.com>
References: <20200305223937.12418-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/7] net-snmp: fix reproducibilty issues in net-snmp-config
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
X-List-Received-Date: Thu, 05 Mar 2020 22:39:43 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Both STAGING_HOST_DIR and -fmacro-prefix-map path to WORKDIR were
encoded in the config.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 317350e94..91c50c4e3 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -124,11 +124,13 @@ do_install_append() {
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed -e 's@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g' \
         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*--sysroot=[^ "]*@@g' \
         -e 's@[^ ]*--with-libtool-sysroot=[^ "]*@@g' \
         -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
         -e 's@[^ ]*PKG_CONFIG_PATH=[^ "]*@@g' \
         -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
+        -e 's@${STAGING_DIR_HOST}@@g' \
         -i ${D}${bindir}/net-snmp-config
 
     if [ "${HAS_PERL}" = "1" ]; then
-- 
2.20.1


