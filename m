Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0770CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 12:57:48 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.166192.1712753860556617888
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 05:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=phFxJwUB;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.52, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so8211393a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 05:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712753859; x=1713358659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=weQmk71aVaSqYqbegk9ZWnXriRV5vpYEzjy4RcebLKE=;
        b=phFxJwUB4tiM4h88QrIfWejONuBxLsyo8F0dljOZa3BbRR1sdGM604npmXCus0GLRR
         ovrtC8jTziV4YIvlHUA1hx1vg0K1HzIvpd3Eq2DK1iPaczD6Qe7dIf/TOApOGqwhii4s
         /E1tbcnwrH8zmHfqD9kUjG6kM7L+7q9zgAmYE0YYTFclCYqqNJGFZ6mY7FOvsjMk6irw
         5hbUiDmIR4NGLAFWL7mQzpYPgx4yRAKXWa2TSjeqBscZ6BzuLD/elkQjHm4yFGFhpPgm
         W+ATnzlGmnfBaySb0NPKF9GDgSli5fvZWbdGRyLM3dXDkiN2RzbTNIt7ODFHLGsSJlkB
         OjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753859; x=1713358659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weQmk71aVaSqYqbegk9ZWnXriRV5vpYEzjy4RcebLKE=;
        b=nTS1o9UJc+VJWnp8FDCVF4CWSkJ/ubVLP3DEAykHprMh/Jag86OC3ntN0zaF0vlH0p
         dU81MTj/O2pfTOwI96WuSIJ3iHuvwu9CMC7BR5Bo71om/1emtYmvUi/bcuUJBAL3VBco
         6beCm4823mttJGPZkl3NzVos+ggDzSk4vYYZj0nhDC6JnBuYYxyDN3qN0St60FHc0iBr
         3F/XtYdYA31PiGA9J08ukNnVzJFikF/sf70Y/3GjnmyUn8dLh+d4feVrE6T3dpMsaxiz
         CiqTb14Emmr6DAN2acWAdyZj0Iq4hKoGlazPwJj5mDR6NIL9LLYKylSrMhE70qZxdd4D
         g9Dg==
X-Gm-Message-State: AOJu0YwpeVD3kFb4hTmHbXO/yXxXuBdkW75f3Du9C9XSdCdZOBn/lw8j
	gz1hixUgD+0qBvXh0qrZYmBcZKGPjIq6LFGz4GRQUMZwUbmOiYMKdYgo73OXUYxse0BiLW8/A9w
	F
X-Google-Smtp-Source: AGHT+IF9WP4EA5+GlsgpNEgUdFzrgHUN04c8Q13Vd6XMCMdWR6VUfO6lq3vcfcbAHXGw7FKTgucTyA==
X-Received: by 2002:a17:906:aed1:b0:a51:c964:3cb7 with SMTP id me17-20020a170906aed100b00a51c9643cb7mr1694563ejb.61.1712753858746;
        Wed, 10 Apr 2024 05:57:38 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id ck20-20020a170906c45400b00a4e23400982sm6951573ejb.95.2024.04.10.05.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:57:38 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] dash: Update CVE-2024-21485 status
Date: Wed, 10 Apr 2024 14:57:33 +0200
Message-ID: <20240410125734.41558-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 12:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109891

The recipe used in the meta-openembedded is a different dash package compared to the one which has the CVE issue.
Package used in meta-openembedded: https://git.kernel.org/pub/scm/utils/dash/dash.git
Package with CVE issue: https://github.com/plotly/dash

No action required. This issue can be removed from the CVE list.

Ninette Adhikari (1):
  dash: Update CVE-2024-21485 status

 meta-oe/recipes-shells/dash/dash_0.5.12.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0


