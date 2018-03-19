Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E18D878931
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:27 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a16so6640139pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OlbH/rPCPh+4mHz+V8WYTUKZsMLBMiiwbeLzN+FoEmQ=;
	b=VsEBoclB8BetYKYltlPrtvHv5RIoId9G67aQ6VIn3/Ryxuc8WUDJsE5G8vlT1iHqRb
	MGgAZZeniqoYKK3NRwrLGsJPJlVVnQBnYpBcrHhSqmorknU2ZcF0dMR4eOt+G+Kwd8cC
	NHJCSNghOiOzNTgwLmW9FH5QcY9w3weAUGW4tIZraLfx4LuVplestl/U4vbUa0D1KAMf
	eiW1nd7SqN4i0sExUeNduJ0+tlcH2/8tVmf4GXKrYyw3+vQQ+qjAKvhVDcSpY+NesS/N
	bAHlAtoX4f+XvwBMV1TNWLa5W7aFlWR0dSMt37fyzNeTpNjB5bv82Yv/g8gfVv5td6+V
	MUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OlbH/rPCPh+4mHz+V8WYTUKZsMLBMiiwbeLzN+FoEmQ=;
	b=m+K+MybNsjSI74rcAeyJtrytgJfUvQ+HByOoXvjaU8Jh39DtFGlQIjm/Rj9W43lDrS
	kJcAFU1lhocb8t5qZX5AdiRR2Y2t87JE3PzJKXQw2MFDWKUTfAp5qr0Myf9QCqozXj/D
	QsSDqmnghsNBwrbIKpvS6AEkrfvw6xwBCeCp1/ffta3MDxz+WYSIRYT93FqNeDbXpoEv
	WBMHzFoyY2gVaWbPqejimgyzYMPazopoFROb8BjZKY3RUg+jeMBtm0vvc5Xy7qQXaaPN
	LyJrfUUxEp7Bw3gqz8si4T7QNNhRVdcIL72lDfW6/Rjy6Qa+x4LeIsa3m6C8J1y/942L
	GcXA==
X-Gm-Message-State: AElRT7H9FcO5aKuvkrTo1Sth/SFzgeLUXNWRs3lA+6bgDPnnNHjmZsg0
	mHkjVjZ2ZRmJuq4NM1zVoGnL5g==
X-Google-Smtp-Source: AG47ELvdj0F6LD1M5JYSfOAOiFDfN6QjA/a9NaFypQADBQAMi9lW0mRKm24mhSa+c7s2nCoQDEMc5w==
X-Received: by 10.98.147.27 with SMTP id b27mr9259461pfe.145.1521439409269;
	Sun, 18 Mar 2018 23:03:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:55 -0700
Message-Id: <20180319060300.5366-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 13/18] ebtables: Fix duplicate definition errors due to netinet/ether.h
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:28 -0000

Make the patch musl specific as it is regressing glibc 2.27

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index d5e7341a0..e4adafd3c 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -29,9 +29,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://0007-extensions-Use-stdint-types.patch \
            file://0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch \
            file://0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch \
-           file://0010-Adjust-header-include-sequence.patch \
            "
 
+SRC_URI_append_libc-musl = " file://0010-Adjust-header-include-sequence.patch"
+
 SRC_URI[md5sum] = "506742a3d44b9925955425a659c1a8d0"
 SRC_URI[sha256sum] = "dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9a4455d"
 
-- 
2.16.2


