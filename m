Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9843FD5B854
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.129.1730140094712388474
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EeTOp0xD;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ea11b32ab4so7984307b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140094; x=1730744894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gd1/yKDF5MuwPNH7yy/zgGTir/0MODzmfHy7m217AJ0=;
        b=EeTOp0xDJYNuvt4DwyV2Ru+kDs7rrlJK9PDedYCkstnF8rJTSPUXE6iwhw7o2klgeA
         l3XALLdtdjJgFA7ez/ogfH6vys3XiMmeI52iitF/12v3hiwBT9fy7FPNMEC7yOwDOzO+
         USdy88M1aoDyaApgE4QIF5WQPGsXyZJxmOtesP5Ly4hayojegusgROjO+YPPFuSIfSCW
         OFNaG1YRccNCDWlrgC9GAmb30JUZ2hKn9TsPINkSfS+5Ud7EO2/d/mctSg95iHCyTf/1
         eXSRftV+0w8cyjMkd8MksN9u+ywPaBqggyAW87uXImRli746KAulj35Y8K4lP4VCAS9+
         N/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140094; x=1730744894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gd1/yKDF5MuwPNH7yy/zgGTir/0MODzmfHy7m217AJ0=;
        b=wx38XkJFlXu16h1vMOYr/BQH+NZyAlR3tJoFS4vUakZbzjrypDYdj7LjpNhuEBKfVf
         NoIcPZkJrSBxUWyQfejVWrsMxo8LrDydsgfJJuk/yOfHfiz9rPdyfk6nYDF3G2NTtGr3
         +NslJZtI0FdPfLh4HeausDCKETBrAG1wQl/qExIDow10PlxaxPw+PmyG/DYC0FnsZ7ox
         5T2DduGMwOLXYICdGRZfb/Zhs4QWTHkpr7JDBau0N7O7IWX9aa96/m0HjtvBUHxVitSV
         31lQGV+CuAexHellWPckUDhHLNac1l0D3ShSwatRI7JRLFFDb99Z7+nGf7D6o92HC63f
         Cz+g==
X-Gm-Message-State: AOJu0YyAsY8vSGarQbiiaxolIh60aAP8nMOdDM8jLApTxu1rPDX2l+IO
	JizYj7iqNrUtds8gAD5d+TzR3S+QABjP7jH4zncDgbjzwRxwvChEY1DNUA==
X-Google-Smtp-Source: AGHT+IFEb03q70wgV7IVAgZt5yrq01xOFb8ta8/OEzfNeCznyAlTOM+PuUDUXH4U1CASj6OA69sDMA==
X-Received: by 2002:a05:690c:61c1:b0:6e2:3e9:d892 with SMTP id 00721157ae682-6ea22e5ea8amr6837257b3.19.1730140093368;
        Mon, 28 Oct 2024 11:28:13 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:13 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 04/22] libdata-hexdump-perl: Use
Date: Mon, 28 Oct 2024 14:20:20 -0400
Message-ID: <20241028182749.5058-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113272

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
index 25483bf35..f52d0034f 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://lib/Data/HexDump.pm;beginline=215;endline=217;md5=bf1
 
 DEPENDS = "perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
            file://run-ptest \
 "
 SRC_URI[sha256sum] = "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17454d03535cd9be70"
-- 
2.43.0


