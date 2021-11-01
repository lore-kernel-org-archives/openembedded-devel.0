Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD458C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 21:34:15 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.850.1635802454544663516
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 14:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MilJTJg4;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id u11so500452plf.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 14:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RNSwU8Gv6aJuXLGSfUCl+WJsbLmOQ8+M8DWzd/6aaMg=;
        b=MilJTJg4osiQjMOeQg4tnbpjEUd9zDFbYxDio4IGLzmgGQZJSgenSL7+UMmzOzsdTb
         +puTZXDI6x4qm6tldM5rGzCn+Mr1KmOEh4QGXiZcWE+fDWcm7uceOGvL8BleJw+veSsQ
         f6Euxj6aLJhk3+OVNQZUNCnSTcRQYcxUoccodJjFWhX0NBjzeO8BsDZQviEhpGFq4Cut
         5lwfsxNxLSXw0aPQA0aVsm8ALqVvmEo+J2lN5oUeiKjfwmmam3mMomIQyI+JmQPqk9Nb
         ELGyIYNblrWGStSVkTBYvW3bBW/eTozw7A+b/R+khzLkjKGfrRXKEX5MesR9qsAkBC5k
         Jb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RNSwU8Gv6aJuXLGSfUCl+WJsbLmOQ8+M8DWzd/6aaMg=;
        b=fuWjPijB1F4UoHIfS4848+F0yp0Qh3buMHa2AbpQJ0lljO3mMR4Bms0UK0Po6b+axM
         s1Pp33NrVuVuh9lDBf2gKxkyEMght7anu6FtiUrx1975NhlvoEC+pPhAgnlv9/aucb7D
         HWDSujoe6tmCgeRNaH8MQ75fsacewWUW8/6gtPDt5z97VG1kjJ0UlWrUTtM5W0gS6pDC
         Z/14lKeGlsZPjiyAoklLs78plkRuqUiSZVIvMgi6rcfnbEC3ne+4qZ3UmUUSwj/mMgSJ
         VgwVd/8qlyZWDTw42mT+KlNxdegiScuquwn+3JarR786FnfNCMenCn0HFjwFBAIPjIRo
         g8lQ==
X-Gm-Message-State: AOAM530Wre8kUV02+HG1NCA5f3TjgB2o35DJWWdPyNdr0ucscASQlpKQ
	xinuBDzsjQxsDMQGeN38UGRVUtp7PPjaEYXADfc=
X-Google-Smtp-Source: 
 ABdhPJzld84NN8Jg597yEhOT1/HSAZszpTnDUIOoSv27aN7ihu/pID7puO2RlrLP5d0GFgB4n73LBjX++ootBxeXnms=
X-Received: by 2002:a17:90b:4b90:: with SMTP id
 lr16mr1665972pjb.57.1635802454076;
 Mon, 01 Nov 2021 14:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211101202944.1999541-1-raj.khem@gmail.com>
 <20211101202944.1999541-2-raj.khem@gmail.com>
In-Reply-To: <20211101202944.1999541-2-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Nov 2021 22:34:02 +0100
Message-ID: 
 <CALbNGRRqBjNJct4mp+JtuxGwArqmAKfPtwHe95=2jwHZxVjWMg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] mozjs-78: Set X lib/include paths
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 21:34:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93758

* Wonder why I did not see this. Configure just says 'checking for
X... no'. And my host has a running X.
* Found a solution to fix my incorrect assumptions with llvm-objdump

Once gjs has passed build I'll send out on top of master-next

Andreas

