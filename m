Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675FFC46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:59 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.97666.1703665309671907243
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CVhfw76c;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so3896630a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665309; x=1704270109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoYcqNjNweEWLBUxXga76uAj3wT/xmXl19aFAu7aCis=;
        b=CVhfw76cyp8XCAs77q2PZkbisDitVwx5hZJSMb4pAI1a9AE2Wxwzk353Y+q0iT7BKC
         +KOdAC4ivC0TKFg3hktCxZew1bLSR3Zl5yC4Swy+DXlXEjO7FB6Tf+ZxWiRztGLsK4Eb
         HHt+ytx3NMM25xwpoA0ud5aIHdu+Ysj6RoTxUHF8jKNw/KeWk2g8lWjdugL4ftf0hv8h
         E17PElW4WZcRC/+j1ZNNdFPrRxRmbcaIaO99v57X10rus9Nskr7hJzcQGL/oXJNQOs75
         91zFsfI4fPuuxBcJnLA38CHD9m+IwjilbZeS8Hm8ND8Vt+Fkwy/GLg43bVE9LAAGPy3N
         Vuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665309; x=1704270109;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoYcqNjNweEWLBUxXga76uAj3wT/xmXl19aFAu7aCis=;
        b=lQn2Oq7TBRGp/X9/h3s2tRtSowiej4MAGltecH3B8SQmzosMYXg0vpjmyJT2tT490f
         FhRbS4nu+QcJJKbKm25oDe/gM70v7eRyoO4KWVqAEVhkEmzxIz/blAagcb90VX6sIyiU
         /pNcDjPaPK4KX1hT6sq7igxECMR9Lo4WkhcGQY89sXJwFQIAdechgkNTxPTAOo5R/KG9
         MRuHrOoXZFFrTHHnaWn5NO4e5MbCYdabSxxnF0K9RG2hwPpyb6WSAWuRe6SIHgQoSj/6
         eoy+tqywwqIurBHKpCufyaYrA26uEgPdU9cRzyZCPA1VI0eq13S5HaXooCgKWHuo8ipr
         Q+oA==
X-Gm-Message-State: AOJu0Yx0fDdTsljDHwBdwJLiIGExcssZwlPYTJiJTDnUIUBAWCHXQDBd
	/33nNHytXUmJw4t1UuevbcJqQZy5iVQ=
X-Google-Smtp-Source: AGHT+IFXRV5ylCgQP0ERLUs8xXdDHIqhgq2Hnd/oMxj7kg68FHswFhui4boLR5MblCkteEH30pa1hg==
X-Received: by 2002:a05:6a20:3724:b0:190:1e0c:d29 with SMTP id t36-20020a056a20372400b001901e0c0d29mr8220652pze.4.1703665309061;
        Wed, 27 Dec 2023 00:21:49 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221185226.3929207-1-derek@asterius.io>
References: <20231221185226.3929207-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH 1/2] python3-pytest-html: update to
 version 4.1.1
Message-Id: <170366530835.1947762.14671504160225161352.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107856


On Thu, 21 Dec 2023 18:52:25 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/2] python3-pytest-html: update to version 4.1.1
      commit: 0c17c667adf58d6e25250b68303389174f360b1b
[2/2] python3-setuptools-scm-git-archive: remove obsolete package
      commit: 3ddad1958930c6357217b79986136c9a45a9caf2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


