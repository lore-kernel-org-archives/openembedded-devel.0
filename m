Return-Path: <debrabander@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8BBC3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 08:07:26 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.38274.1722413241902258449
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jul 2024 01:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JX3PQ6DS;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: debrabander@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7d89bb07e7so200505166b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jul 2024 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722413240; x=1723018040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvggP1gfdyz5G4eYwvZA1yubehpFtwMiqdHUVbnI8PQ=;
        b=JX3PQ6DSkQMrBQHyhR+vMarwJwHkI37LATF1RAjFZKyHz3vdoJP4tvsZsF0Ve8ew5M
         VLY2dkWScO2TZP8k6tKHgKKLnBBS/gO/nnH8ZsEKkjx3CG/tX38OxjiWZQbtkURUY1Ha
         UPxsbe296ccUhUh6ssaTh/FEBgAi1SNGm80jOyto2RWXSIBBX/amZUnjsuzbUEM1V1Zu
         ZWJDyiILLADyRiTvKF09M7WCe30haJihQ/r5rqA7YOHMqwernE0vSZv0J6fRoWB1/Pdh
         w0Cj2dhkzRzIy75ql85H2W5cXTl8BXf3YGZdAFhr1XYq6t+/ufAtmvrp6pOimTIwpSn2
         XlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722413240; x=1723018040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvggP1gfdyz5G4eYwvZA1yubehpFtwMiqdHUVbnI8PQ=;
        b=luEVUNVJ3cR/dD72qykSwus7yRUNimWfLSSxoMNcPnCmCadq8RFsqS6Fh2DLyx1pix
         uF9R8Tv/B8fqDsfK8ZhZTix7b2gDj1mLtEJJCRLEPT4rU2TelrsjTOCuanLReLZyp1G6
         r5LW5wxMia4KrJ0kf861wNrcYWLBq5/2EaQxeDRPnX5Ox9runG9BJJ0nk5WIJHN654Eh
         sdS9NbXVpjJSxBI7HPQIYIjg26n8GYVXPb1j5hTvN6LPDGpplowGuHkazs6l/hbElHKU
         jaPkDNBedISk7ALA09uObu/TIOLOEYOaxwApQPlT7CGhxsCkfT9dA0JiHU8/fbHxKfdh
         lhCg==
X-Forwarded-Encrypted: i=1; AJvYcCVeLRTyt3Oo6Ul3xdI/GgU/pebH12hfGO6xb68NANqsnZPY606W3xLguXLW7KO0uW8WJm9T5M6QgRXIA2afJaRxLmgZFkI0CUGzVQXdhYYgvp80lNKVXzhMxA==
X-Gm-Message-State: AOJu0YxWiRJsg/0GNwjfXMI7qrQk+zbR0cg7XMAdMqowyqFc/hXgaW5H
	rTClSdy3smM3SZmp4kMkctz+mLDO/V5BQ+Wzf+CsW/LSG+e5Edxv
X-Google-Smtp-Source: AGHT+IGTtsrnIgVyUl8uqwFz6dDBrsSga8Q2L+TRk4W8YhfgEjb+9/eErtG784mBClHH/QnkMFp8KA==
X-Received: by 2002:a17:906:da8e:b0:a7a:aa35:409a with SMTP id a640c23a62f3a-a7d401cd9acmr949364666b.68.1722413239714;
        Wed, 31 Jul 2024 01:07:19 -0700 (PDT)
Received: from win95.FOX.local ([89.205.136.153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad91005sm742179666b.173.2024.07.31.01.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 01:07:19 -0700 (PDT)
From: Frank de Brabander <debrabander@gmail.com>
To: dev@g0hl1n.net
Cc: akuster808@gmail.com,
	debrabander@gmail.com,
	openembedded-devel@lists.openembedded.org,
	tim.orling@konsulko.com
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core: upgrade 2.16.3 -> 2.18.1
Date: Wed, 31 Jul 2024 10:07:16 +0200
Message-Id: <20240731080716.1205-1-debrabander@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <gf7b52p53drjd6yb3ldr7gmki7gzwc7mzkjque6qdp2wrswm7u@akaiwyp6pxqj>
References: <gf7b52p53drjd6yb3ldr7gmki7gzwc7mzkjque6qdp2wrswm7u@akaiwyp6pxqj>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Jul 2024 08:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111484

I was unaware of this discussion when I created the fix for master.
Note that I've silenced the TMPDIR QA message, this still needs a
proper fix in master as well.

This indeed needs to be fixed in scarthgap as well, since the
incompatible versions do break some code. My two cents for the available
options:

 - Revert pydantic upgrade (from 2.7.0 back to 2.6.4)
 - Update pydantic-core to 2.18.1
 - Use master (pydantic 2.7.3 and pydantic-core 2.18.4)

Would only downgrade if this is the *only* allowed option according to
the LTS branch policy. Version 2.7.x includes new features compared to
2.6.4. Removing these with a downgrade would violate the LTS patch policy
of not merging "ABI/API breakage".

Option 2 or 3 are my preferred choices and they fall within the
"fixes for bugs" category of the LTS patch policy. Option 2 is the smallest
change to fix the problem, but option 3 includes some additional upstream
fixes with the update from 2.7.0 to 2.7.3.


Regards,
Frank

