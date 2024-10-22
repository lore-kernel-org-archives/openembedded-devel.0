Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FB5CDD0DD
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.21957.1729612100736220668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C97Iarbt;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e38fa1f82fso54605297b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612100; x=1730216900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8SvqUklkeNw0eLKkikxN36mWHlydlOUxUqXYYCfmZw=;
        b=C97IarbtJxBKFQSEGVTv/4Lr3Xw1RdQjtbC0ePNypbI7iZhPZxGUjIGKkTh7bd42rd
         9bcfhSbZfFcYszGn7Z+GomSgi3dQ+mUX7qN0TGE24sYMwbFNEu356VxTa/EpxoUEdbuW
         yUvmKq83bWG+Mff41+46Nsjg9vAphWimzhqz8SB1w6jjoMIrKPwvEWxlWzfTym4uMuGC
         PiEkyyAUcWD7y5qE6fl8TRYBMCXi/IxwqUYmP4nDqGyWCAxYvoekEvMJKzg02xZTOetO
         KQo9LOUzVKXrGh8IhhLYrBaLlq9UelDS0KE6VBUCBxkcxjakwl9lUY5VwW3IthY76JQ5
         MnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612100; x=1730216900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8SvqUklkeNw0eLKkikxN36mWHlydlOUxUqXYYCfmZw=;
        b=PTN/FhvJmkkWvrizB2MZPCcj7xNX70ASibfJOR4RuQMbPpdSfppXbrJldROePBjav/
         Mtv6H3rZeti63a6SxYtQV77vlaM2d+zk85bjwNCD7sKrdCD+NKqbGC7ZdNV9NYQ/jkF9
         Qfj2EUonwln/URz2A3I63BhOFHZKnmW+9934ZpUzWLRIgh/TlipGDk8ZGxFDUw/8Jiqm
         APOOBF50THCQ4Cak6lGkcLaLIi9NFo7cYNk7srqqnQCKyxdhtC/G/GfonPUtXKxH2EXr
         0vXYDIe1vSg8iAirIKZEUoPAueeiV9YdSDDT5u/yZenkhPg3u+spA2HtoUyJIjJm25Jf
         rhlw==
X-Gm-Message-State: AOJu0YwnQZfMBYnOy1synL9aERNomvk5BoBrYrGlpC1WYpHevsWotqvW
	JxU2lZwMUrcGwaFYKFVbYv1upYiUZbYGnvQFaJzegzQ283ihuMusa6DBxw==
X-Google-Smtp-Source: AGHT+IHw6Vee2Jyq3ekDsrV+9wY144Q9+fikuu7diGHC5sS6yp4+VC26Rz+qfpP5OK2EadvtD5HmQw==
X-Received: by 2002:a05:690c:9a82:b0:6e3:f9e:5fe7 with SMTP id 00721157ae682-6e5bfeb384cmr134358077b3.46.1729612099295;
        Tue, 22 Oct 2024 08:48:19 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:19 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 38/46] libterm-readkey-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:56 -0400
Message-ID: <20241022154729.20331-39-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113129

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
index f4ce3131d..831ea1a8f 100644
--- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
+++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://README;md5=c275db663c8489a5709ebb22b185add5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b2b4aab7a0e6bddb7ac3b21ba637482c"
 SRC_URI[sha256sum] = "5a645878dc570ac33661581fbb090ff24ebce17d43ea53fd22e105a856a47290"
 
 S = "${WORKDIR}/TermReadKey-${PV}"
-- 
2.43.0


