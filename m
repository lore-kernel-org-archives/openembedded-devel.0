Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025C6C4725D
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:39 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.97656.1703665291667789847
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JM1CKhbf;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5c6839373f8so3088840a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665291; x=1704270091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jj6y8OP9wkVXTLILfJvCy8FK+wY8kmphMGaTFBjnKys=;
        b=JM1CKhbfCjur+6HFDAGP6nOWlHLDGx81IYu7F2k9KPUmjlxpjr8+YKcx+l1KfzWzgi
         4Lv9bPcWOeNCJMXoh120oiuk9SnEK8kFojaLdcgIcraJgq3Ry+ji2rrb0cAshGOfSKrK
         gGOSYmb8iwvwjcgl4pJ1RdCgXZYy9TnaUUcq87/PHHr3mXQATXH/KtB7gJKzqXMCRfSe
         XuI0YhNa18h7yukWm1vMHsY7oC113MRkRHHf2nFj9sdiD0wSpoJD9/91h9ltyxMwGKYt
         8Vpm9h9MHdFhy2WAAR5ZmYcnkVM3axpQNjLe8a6IXm8hwam8TMDtlQHlLHbugIchLgTn
         Uh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665291; x=1704270091;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jj6y8OP9wkVXTLILfJvCy8FK+wY8kmphMGaTFBjnKys=;
        b=E+51CY9j7sR7jkR7ZbnlB9WHINqHPpj4OShV9FcMA3PZQWSnRMAo4BfNnaAPR3Fy0l
         GdHiyZ64xK/Ugy090sXZnREWG1OFCmO9Z8YCZitsQ6ZAvm7yGSm3wM5c/XZf72BObY/Y
         srA2YqP25COlFV7hFwF0tyowC1+LHdBAnbIzhUY2zaChgJw3vJXGqci7smOHhj65Gu1T
         UlXSm3j3TlgMQE5h0kHk/YSvBDnDv14W37NsmWqFYG29umy+nfvMr/Q1641ba69QBk20
         TcCIL0c1E5LfJMVtoTU8uu54V9r/tRs5MDJuWTqoi06WNTtJjlBv880v+OkTnBrsgeyR
         NCjA==
X-Gm-Message-State: AOJu0YzJEkq+MTNY4mYjlgrih8kX92h+8atyo7Nrk+cBLgA2rahUHuL8
	qipAASr/FCUiGLIaYFmeIsO93r0fNU0=
X-Google-Smtp-Source: AGHT+IFsTschQJiacgHUWxP3ZVevejzGzGlxlyYmTluP41Z5wEVesLGWOJ3cOdmqGkyO7UPw1xIsxw==
X-Received: by 2002:a17:90a:bf12:b0:28b:e2c1:8eaf with SMTP id c18-20020a17090abf1200b0028be2c18eafmr10465403pjs.2.1703665290782;
        Wed, 27 Dec 2023 00:21:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <20231220204125.28017-1-alex.kiernan@gmail.com>
References: <20231220204125.28017-1-alex.kiernan@gmail.com>
Subject: Re: [meta-oe][PATCH] thin-provisioning-tools: Upgrade 1.0.4 ->
 1.0.9
Message-Id: <170366529007.1947762.2816571771491423966.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:30 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107836


On Wed, 20 Dec 2023 20:41:25 +0000, Alex Kiernan wrote:
> 


Applied, thanks!

[1/1] thin-provisioning-tools: Upgrade 1.0.4 -> 1.0.9
      commit: b7d5acb3523c95054a0431a5291866d7b5bde5a2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


