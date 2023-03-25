Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0EAC6FD1F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 12:30:32 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.20550.1679747425672235551
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 05:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LRvMxz09;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id d10so2568029pgt.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 05:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwqUsvj/w6MUX309UTS0w2I+sEnPJLOvgD0cAPY0SaA=;
        b=LRvMxz09hi5N1mqy+zJekh1lWZuhX2m+xIZO5VCl1anp95o36aVpc/j3t3L7cjBxeR
         uGjS2hTMO5flpUd75KK185s4LsZSXtzyNYsxFX1QbNcxppuOt9DMZuqZK2U26k3aCQyV
         v4eMxN/iiY6CGuzAEV+lpt0YVXhJQt7tvCEbHSQTjCWk3mvaIkSOpX5jf8uecuFvl+gS
         6oXjUU7QqlFpBVfY/eOrIaq2X1pWF6WlK3Fnx2R2DgAGDyVoQuBYVH4Qo26CiAV+uL1O
         UBH0ztCtDJV0KmgISvxDVCLwI8P7ZDo9RNDCkB83nsc/IM1cQtLjcz+Y5MUfL12r36/j
         5wYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwqUsvj/w6MUX309UTS0w2I+sEnPJLOvgD0cAPY0SaA=;
        b=KUXzeUl6h/m20jfO4fy058v7Lt88rjF2HbnTetzzF+LUmw3MabYxv4sN4XvWvwDiax
         tYrhnyCQZQpAimETsJdo4ovyxSv59+YGaOfZU+uA3yaE/Y27OGvhWuH0ZctJVH/2JVZa
         T5GJmcfS+hCcaFOXOWbdtpUjpii5OUwhh1Vs7ZQLXj8sE3fJ3hN5x7hoCmIt7BgZpbkV
         sw65W5Rdcob6ZX0R2B09GN/CPx3LF3YnEC7XsG3dzW3qyBKxJT9HqwY7+ox4iBfm4XW6
         VVmD7+3cKjqZpf0NwArFJ0hRb+BJ1B09UQZVFDqiqbURRdlyQGRRRF2kZJSDot+4onWp
         6Muw==
X-Gm-Message-State: AO0yUKWjTuK0KDYJaA4AMoGNUBrE0tgZ9vxBvqxF6VEdIrpbCN+sYuyt
	gk77FHh4Y1M8q/S51eU/idz9aB9U4SBX0SzdmFU=
X-Google-Smtp-Source: AK7set/g0BBnDk2EF89ESrLKzwoSiYlE7QvlOyN4POpt6rhEWYkeoXu8BbdchOeIsS74o5at4t+wFwpzBY9oL2cmK7s=
X-Received: by 2002:a05:6a00:4510:b0:626:1710:9b7d with SMTP id
 cw16-20020a056a00451000b0062617109b7dmr5537334pfb.0.1679747424953; Sat, 25
 Mar 2023 05:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230325080256.923752-1-f_l_k@t-online.de> <20230325080256.923752-6-f_l_k@t-online.de>
In-Reply-To: <20230325080256.923752-6-f_l_k@t-online.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 25 Mar 2023 09:30:13 -0300
Message-ID: <CAOMZO5AQ1KY3rFGLTBiciQzgvan-wXCf0NKNyc9Dmg5BQLpsCQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 06/32] gedit: update 43.2 -> 44.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 12:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101748

On Sat, Mar 25, 2023 at 5:03=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> ---

You missed your Signed-off-by tag.

