Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C22BCDD0C6
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.21938.1729612081378492349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L9Y4uzgr;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e61a779148so15102557b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612080; x=1730216880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8cfxfxzHASwRCiJEG8EN/h/cqXWcmPRXS7LU37KcGk=;
        b=L9Y4uzgrpoAo/Rs+x+ALmlL9O22tDk99a/uC5fUN27vWrh0pp1adx2gd+NFnqWPSah
         rmcMBlDg/V+nuMkLTRuvm6MtBwlC3idr8OgH9gcnXHndBeaXPnVFqXyStuQ3Ell4o0y3
         PRFkCT56/wgyotcKmzAamDp7QXrzDwSmqm+NeetrLCJTzW/27wanAbV96VARiVjrQqQh
         wr/jrTzj3NwoAuXq1gq8hjpkUrMYUYMCwgufdPISEkBlHpUetw18mo0kWCVI2lAs71dz
         RD3qUWBgwvMLSeqFbmdqBIBtCSrL+KWmYjo3hZgnMwhIChiO6wyBNgSf3CUMmAmBjrVB
         bqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612080; x=1730216880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8cfxfxzHASwRCiJEG8EN/h/cqXWcmPRXS7LU37KcGk=;
        b=P8HVmVcv5EjfZ+N6cNp8ZmQf4cwTEktDxQ0uLx/AcyTR7efv+ScLHXCxDqP8jgCOrs
         vAcTwXWCLweUoTQXs69R433FOYE1PQkz0xTydnTF+HKahuHG205I26BXZngxJN6SbV5e
         cEp3SE70otTmOOu4jSf+eSFeBLvQJkEqukNfP6KqZvxGeA3ESWhCC8KsLEIKFapa00al
         JZX5ngSzaqSrKivR+1hK7Fcrl3akXM81j5mpKjDI/C7YKlQUFn8pc0wyKvRQKSGIxQE7
         lcpOph3qLTEV1QjB5uPPnGb+SGF4gMQNPZo6CZm2IQEfsVfJNXVCV9J3GohxkGEGp3iO
         y8xA==
X-Gm-Message-State: AOJu0YyjbCbtAIvV8u9l4HUSnJVDmIdzZD+NbeNhEjzuM12imRGIyXGH
	gQL1U040uPgajRoPkJjaUfZuGPJHCWku8LUNwuyR8y21eUoln4Z7yNFuTQ==
X-Google-Smtp-Source: AGHT+IFpleGaLH31yg9QYC7kNQWf1Ff3GGOimZJZU0cCsbgjoRuprNLimxJYUMlLHAq2gZBmpAFIAg==
X-Received: by 2002:a05:690c:386:b0:615:1a0:78ea with SMTP id 00721157ae682-6e5bfc4194dmr161396027b3.34.1729612079920;
        Tue, 22 Oct 2024 08:47:59 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:59 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 09/46] libdevel-globaldestruction-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:27 -0400
Message-ID: <20241022154729.20331-10-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113100

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libdevel/libdevel-globaldestruction-perl_0.14.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
index 1dcecd0dc..e8450c7ac 100644
--- a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
+++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
@@ -10,7 +10,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=53;endline=55;md5=935dadb9423774f53548e5cd5055d41a"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Devel-GlobalDestruction-${PV}.tar.gz"
-SRC_URI[md5sum] = "24221ba322cf2dc46a1fc99b53e2380b"
 SRC_URI[sha256sum] = "34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb41fe5b53efab9154ab"
 
 S = "${WORKDIR}/Devel-GlobalDestruction-${PV}"
-- 
2.43.0


