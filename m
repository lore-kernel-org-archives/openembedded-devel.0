Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E72ED10362
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.6177.1729801133955780582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ESFUVCfD;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e3cdbc25a0so17279827b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801133; x=1730405933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMtWDj3gEjOLE+hX/ajB7A2ND0q/O3PsvUfcto22P+Y=;
        b=ESFUVCfD+dkWY90h+YL8MY8JkWfkwj4SBsC7tmEhsYTMUWDfmfpHvmqS2bEgBCQnBy
         3dqt9qsMSsDY2iI9SfVIVDMplr2Z3y6PldMJLLgxVKutBU4JW4Zx7xOlNawMRraIQagd
         I7moQ+cxWjdAPA0t/SXypiKI/Rf7HUpW65ExLDkL0OlaWoCZzUbCbKHD8XLzVWPJeoma
         HmeeauDtW/x7QnWshhVg6eQHY5WVDRZdd/dmdfEiAS42mrjU+Ca7/L2QBD21hu7+AnSK
         Ent3AIw4LvI5hczoKc31onds1VxbjwRmB8fStZ1AFGAMMdxYQmI9WSUd+z2ccLfNVjrF
         ag1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801133; x=1730405933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMtWDj3gEjOLE+hX/ajB7A2ND0q/O3PsvUfcto22P+Y=;
        b=ppJylguivPcLwU0GDyxK2d/ykUbNeBfhyJKSIMIN+Y+2HCwCdVn0sICci1pgFfVWkl
         Kjq7Jily/pFKVjmG44M9LWaVMLlK6hZbF+pfxO8CFZrbDhdOjuB0P7SpDhWrzOnuqkU3
         eHSRStpr8x69q9MoPUGMWmK1rt7D5cfNp8TKj2A3icgjeJUqn7jXcSzqslVFmPUDdZaa
         oKER/5fJm504ltyO83kViQl6mKFktvuPftMx74o00Ju+ldQEaPWNwrIRsQk10k10M2Jj
         wSJK/NenkcXeNPXifJsrjltt642Kwo4OUFyUWZp/hsIB4VYu6OzlSPXPXlzeMhG2Xa7q
         7cGg==
X-Gm-Message-State: AOJu0YxvcbnQ8ZUm1pkXFJrRL5FfTsZ0LQSb918nfbe2+hByPM/pC+fM
	L7bNs7TsHRbuxdW+RiYMnmozbrsj0oyTQAGCahttJHkeKedQulCdVE3/WA==
X-Google-Smtp-Source: AGHT+IEYuJtQvaXYmsjUrMIw2AODawRNHQsTiwf9DghXp/EFSfVdqsCim3hpKZ1STVkL1XR01SrBHw==
X-Received: by 2002:a05:690c:ecf:b0:6dd:d2c5:b2c with SMTP id 00721157ae682-6e7f0df62d5mr82811327b3.4.1729801132269;
        Thu, 24 Oct 2024 13:18:52 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:51 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 0/42]
Date: Thu, 24 Oct 2024 16:07:19 -0400
Message-ID: <20241024201806.440273-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113178

This very old news article talks about the migration of search.cpan.org to metacpan.
https://log.perl.org/2018/05/goodbye-search-dot-cpan-dot-org.html

This patch set seeks to remove references to search.cpan.org and replace the references with
the appropriate metacpan location.  This was tested by putting each address in firefox to see where
it resolves.

The changes touch the HOMEPAGE and SRC_URI variables.  In general:
http://search.cpan.org      ==> https://metacpan.org
http://search.cpan.org/CPAN ==> https://cpan.metacpan.org

After these changes, I built the packagegroup-meta-perl and saw no errors fetching packages.

Thanks,
Jason Schonberg

