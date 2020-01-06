Return-Path: <andrei@gherzan.ro>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 321EE7FCA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:24:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so50289856wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=bAFd+WbXlQ7T2hMjtV4vLg1cxkJ1+eCQbu4p0Pt9vG4=;
	b=iXoGRmm32i5SV1pcWA9xGPti8AabuMvQWpE1XRX5rC5vtNt8u+Gs+tsOG7TLdW5xrX
	YI/iptobUVlR1n87fc2228cTsFM+0HSNDuadssZmmudmFPgDpsxfwpnjMI4aWsu8Xyb0
	BBSY+FMBkZ1YNZgqjI/0hdSALiYeOgCZI8Yl83Qc9lZJ4dNbkqjsw0VOUKTZBZGzq1Qf
	8iTcCERB+df087yRQ9WXui/IKizQZXjzq9KFBn056cebjEsedaPG1wV1Rf3N1o4XRPFB
	bteO+rNHCsfxW3YAy52Uvaspcy1TK5gLRfJXk7WazadQ18EaS3BsaFH+CC7CAltXfACr
	7SUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bAFd+WbXlQ7T2hMjtV4vLg1cxkJ1+eCQbu4p0Pt9vG4=;
	b=P70qchWj8ep+vWpVjb2iPZfTmWup083jS7C4jTyqhK1CROgKnkE1ZoTwEcADaYLD9K
	Tcgw+y8fWcPW6o60lW1IxG5utUmXPaKPCg2eX732q+FXYmc1M3Dib+i4MoP73RHgLwds
	1Uu3fU4ZZlPjocxSno6JfeNHbl5+Ek/1vk1V3nZNJ2ZNgDHhDXgoCXYA+orUxi0kcQBk
	9ioxD4LCUH9l3jJVUhK6NdzQQN9gPOV2ZknCjBSp8LcNRK0RM2jx4nXK8eHBVO/6wQq5
	H7G1ykH9pnHCSI/UERa/AhUkkV8RoJrasBcEzhM4ysKv7OEs04EUDlbyRYh+lm6JOphq
	CmMA==
X-Gm-Message-State: APjAAAW2tDppLTDxzfkFdbJMjy+GS7Y54QCtiime2s8vCKL5xP48KLa4
	6bzy6fot/bvjpQ77y9oWJ07MGpxRQck=
X-Google-Smtp-Source: APXvYqxdr3aMIzF6D7u8Ul6fusNnjZOAsN55Y3Fng6E8R2F5TbfRwACb+/lRFD84Ivet4Y7By7GeMg==
X-Received: by 2002:a5d:4f8e:: with SMTP id d14mr65867590wru.112.1578327864653;
	Mon, 06 Jan 2020 08:24:24 -0800 (PST)
Received: from agherzan-lnxU.hanoverdisplays.com ([81.145.148.227])
	by smtp.gmail.com with ESMTPSA id
	p18sm23446867wmg.4.2020.01.06.08.24.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:24:24 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 16:23:55 +0000
Message-Id: <20200106162355.22996-1-andrei@gherzan.ro>
X-Mailer: git-send-email 2.17.1
Cc: Andrei Gherzan <andrei@gherzan.ro>
Subject: [meta-oe][PATCH] kernel-selftest: Include rtc tests
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
X-List-Received-Date: Mon, 06 Jan 2020 16:24:24 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 02359e782..02c56bee6 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -33,6 +33,7 @@ S = "${WORKDIR}/${BP}"
 
 TEST_LIST = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'bpf vm', d)} \
+    rtc \
 "
 
 EXTRA_OEMAKE = '\
-- 
2.17.1


