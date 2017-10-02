Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 86615774DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 16:07:08 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 124so1895707pgi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hp5UE8lVlMv/t8lxme0tzS+qaBG/l+TCZCHpimI9pAU=;
	b=Dnr/6zJKcP02OoMmj3yI2SHB5nx/rpqvkNdJk4cS7Fhb8WDnRbr8aOfk0XsVrDkpRf
	R6V1Ch/6CV94toGwUluC3Fl+O68DIyTfaHyiLLWLf+1V/NmnuIHfdDuPc+dV4gQHeILM
	PQupwWH92JnbtjbZ9r0WKymNxz0YEkYCN6VVYYYTDAacCK7o6RWSxCVC5pHux/ZbDD4A
	v5iMvZbYEvZkovjL1q3FKwXo+0K5108ufzIAB6iLF1VSOyNBN//Ho5jqe9dfZJ2PNp76
	SWF7gGycWkONea3PErvL/eO5Ib9VNHklLEsBVpyhOWP9OTDWcsy+9Cs/XUmmi7wZHTBI
	3rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hp5UE8lVlMv/t8lxme0tzS+qaBG/l+TCZCHpimI9pAU=;
	b=iykZqK4FF6JzpB0rx9FsSn5Wq5igUKO9118o+RXJUvjrRVT3/eHcXnfxSLjIimoaFF
	pg6xum6wwCakN+5wXsGCtakSd1GEl6qkwJbPSJajsG/wBoMC2MBWisznHFX0Fe1TrR0o
	4E6HBO4bFl14H9aXsSI5d4AsUoyFhvnxE+Ubdhw0S4e8EXIOtIkkvQiwGv0ch1wve7KT
	tyfeZFC6iCZjrsqVWb2z0R5v5OzK1o8wNm37mg2hyWEW2KXHGyukWd6DWkvLON7HJLXg
	UM3ZK19Hm6NdihJ06dlfwFASv9wSD9XxenLarmbII4r0gVY2th1KJeI12UclieUdPZqZ
	kQMw==
X-Gm-Message-State: AMCzsaUxWI0kqt+4paAdvAl7OY060G69TrUJGUp4mIH2mWFAlGReb5xg
	muwhfwiT8LJQqzSpqAXU7yhwtQ==
X-Google-Smtp-Source: AOwi7QBGbW5e7Gomgqb4XZz7Nr646eL1w/jcNM/TZW87MKb/1ofu16gPi1AxlgxoImaV8OfXaHm8ig==
X-Received: by 10.99.155.26 with SMTP id r26mr7899487pgd.139.1506960430315;
	Mon, 02 Oct 2017 09:07:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id
	f2sm17329405pfg.135.2017.10.02.09.07.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 09:07:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Oct 2017 09:06:56 -0700
Message-Id: <20171002160657.39576-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171002160657.39576-1-raj.khem@gmail.com>
References: <20171002160657.39576-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 4/5] klibc.bbclass: Pass TUNE_CCARGS in flags
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
X-List-Received-Date: Mon, 02 Oct 2017 16:07:09 -0000

This is needed for ABI compatibility since
march defines if -mthumb means thumb1 or thumb2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index 1ec7b2b05..b7b72b728 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -11,6 +11,6 @@ CC_append_armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_
 CPP_forcevariable = "${CC} -E"
 
 # klcc uses own optimizations by default. See klcc(1) man file.
-export CFLAGS=""
-export CPPFLAGS=""
-export LDFLAGS=""
+export CFLAGS="${TUNE_CCARGS}"
+export CPPFLAGS="${TUNE_CCARGS}"
+export LDFLAGS="${TUNE_CCARGS}"
-- 
2.14.2


