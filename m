Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A5EC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 09:00:21 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.8261.1713344420990078132
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Apr 2024 02:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G48cwHne;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d6ff0422a2so65685701fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713344419; x=1713949219; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s+hIQltN4nB49QfZmnRbEMx8YXsJOxzyS+9QoJaWOYQ=;
        b=G48cwHneeZJZpxcNzAmRdc5S0PRWdoeaAjG5BAICtXZfQL2rS+xO9CgRN4oxhKJ95f
         MVy+yHJyKeZXPgqe/8HRzsBarzYwmdTx0daVvKkhMk1nb9rv3NkInTqaMT+1BZenlMVG
         JAuEl/aa6dqgkOSEObDg5b1YoH043ZsbyvkKTRuNI4DupoLQHbsfQ4uXTS2FBFbER9J0
         0ibvj3VMj1THLjOPQd6W/IrKNHIMI0DcpmA4XXH/jrWhIwSMnU0GWa0Wv2R5PIa3+aI2
         0DyW/pnuZrQZRlv3gw6vEvX8lz5C7W71/seKfjEgFLYFBHEWa7d5jPzm/s971l4KMhOt
         zzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713344419; x=1713949219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+hIQltN4nB49QfZmnRbEMx8YXsJOxzyS+9QoJaWOYQ=;
        b=hI+7K4viMgNWYn6S5ff+EbthAr+o1tBpE+O5rJXqyG1XEiIJF1rr95rcV4x3n9XlWw
         XtrqaGIkSSzihuNAgxNw4In9ssRkca6StsUvataC7QMLMMlIhS8dOTqerBhPacbrur54
         ToQhC4JtKbfOqWeoQnvqysCktS/tpwjKf0Qz8U5krdiunOeWX2C+QSsS+Ck0dF7i8KYA
         EzkSoGXOZKQkzIs5YAmTaMFWVfYjCTkxt7Xn4tysoWQHhg57t9C3fQyUhRPbgQQvsPgk
         X6mc94Fn4qy7Bkx0qj1hqaG9sWkpZu0GGbrJniMtekN+7uKqwmBo0vI/i9tHw5KbOs/+
         vjdw==
X-Forwarded-Encrypted: i=1; AJvYcCV3exDqpkssnIPa5EN9mPRw8az2iI+gkUuAdhs7pCvCfoBfc3dokS+9VqpVNX82lFKgs13Jrh3Fg7g3NXxQ2zAtIto0Aoh5pRRUMfhkHWVmi7tP8eSmAAZztA==
X-Gm-Message-State: AOJu0YyTm6ybOnG6L75vDKV+uNcS6PseZEs70+HcFP1bQKVUX5FGRgla
	hIvXSZgD0GVB0QitI7w/fbimNq3urPWrATRyzoDCQC6uDoOSPDCdKbQLs4437+9nKo7ABMn5FzY
	uB+bcsXvebz/U0swZguwvIICyPOw=
X-Google-Smtp-Source: AGHT+IGyOs5Vp2mES8AqcoOl/iqBdMLZKVJ4WcnK2zlGYm4fqx3MBI0NMBm5sywWiWDOcLpo0vT7vIc2wZGUhJ9iGZg=
X-Received: by 2002:a05:651c:1029:b0:2d4:1fa4:9eb8 with SMTP id
 w9-20020a05651c102900b002d41fa49eb8mr10333187ljm.40.1713344418658; Wed, 17
 Apr 2024 02:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240415131443.7295-1-marex@denx.de> <CA+chaQcJXRzwTd4Hh=2gYZ7aQQDw3DAFSFq7=KH67-dhgODz1A@mail.gmail.com>
 <743657ad-53aa-4fad-b4e7-ae4ee204984a@denx.de> <AS1PR10MB56979F3C20FEAA7E4EA855CEFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj-idDTJMihKSJYZCf3R16d1qYajfBC6AscGigR91UeqLQ@mail.gmail.com> <CA+chaQd60TVDT6iz+KMDPub4HwF5VZOj=akyYSZCSo4SbN5VwQ@mail.gmail.com>
In-Reply-To: <CA+chaQd60TVDT6iz+KMDPub4HwF5VZOj=akyYSZCSo4SbN5VwQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Apr 2024 11:00:06 +0200
Message-ID: <CANNYZj-AXRhPc+ak1TjfF01B06217T9gQ_1Bn5JCVrxZF44MnA@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
To: Martin Jansa <martin.jansa@gmail.com>
Cc: peter.marko@siemens.com, "marex@denx.de" <marex@denx.de>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 09:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110039

On Tue, 16 Apr 2024 at 17:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> As there is strong opinion against declaring scarthgap compatibility
> in official meta-python2 from Timo, Alex and Jose, I don't plan to
> merge Marek's change (nor my version with additional fixes for
> Upstream-Status etc).

There's more to it. It's a protest against people focusing on obsolete
retro computing stuff because of their poor product planning, while
offering no help to keep things current. It took me two months to
update python to 3.12 while ensuring nothing breaks in core or
meta-oe. Something you Marek perhaps don't need right now, but will
certainly need in the future. Did you help?

Alex

