Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1874BC5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 18:27:32 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.32286.1673461648958821456
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 10:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fjlwyQeG;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-150b06cb1aeso16409300fac.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 10:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J7LxmzBOXkgTQHaivBoSOGGbrAcNoZtZ8bqZkRRGTHk=;
        b=fjlwyQeGve03RP5viZW+aZ7DfRzHXJopx3qZAePHxSOiCmVSox9eTONv+a7nXJVvWx
         4+TxcTZsnTvmFoEDu1LKAgt+G6SQok8aCdSFKUksoxdzA1JA3BAttcFp6AJ45dYLJ30I
         TGR3PKtXu0M2nEWCuDayJX+IXVCd6dzFKfPbxQoTwt6dsZ04B5YJ0M3QGe9W8YseDy/5
         Ei7vU11jmWs7Yco73vpsZBd2EqKD2D5Vj2y3zvkDb7wLBPWIrAAjbTaf23SNGuantfgK
         M+m9lN/+QX5zdTgKng0BS6Vk40DVogfIN3ckwejJKdbzFXinfKrbV+9H+2caY7OnYGdT
         BQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7LxmzBOXkgTQHaivBoSOGGbrAcNoZtZ8bqZkRRGTHk=;
        b=NJKMz4RGN/raBU4c4xjRDySZuToP+fTmqkaVrYIKlYYzbQC4ABlnT2pe4i7l6d1Cx/
         sL3yN+F5WMWgS8Q56VYLN15eg/4e9ozQRH/UiK2vYGdXxBAzDun34UxS4mjaSYwEQ7Bl
         TtscEEwDTW19XX/aHWrkFfUw31KZApbLdWxUQcF+29jSU9TowBVj3myXX8H+A21Ib6xb
         SXytkyPbdtncm3eP8ZvNOn17Do9zAGUmQB/FF8VBRYzt/XuTJtUu8n4SlO+rKFnZBSJT
         3bzmf18fcijUetV3jmM5Q7iONF61u1ieAVIosGsKo4qCgoAdtZnt0akPJiNyZjaH7XJK
         b5bg==
X-Gm-Message-State: AFqh2kog58Gvdc6DoFVvMlaQE+GFhbssQTuxNUtRmNkrxxeVUtr6cDv0
	G8wYeMhg8FOlyBedz35scsXpJQfxogdPXlp8RFY=
X-Google-Smtp-Source: AMrXdXsOAXWpvcM/c8tsJPa8LCs/dBizljbnMhbLH6dWwx5tJuKYLRw+fhyyvJ9OLlVjG2I8YTvADxFblxRdNyYmM0g=
X-Received: by 2002:a05:6871:4049:b0:150:ab7d:7012 with SMTP id
 ky9-20020a056871404900b00150ab7d7012mr2354081oab.55.1673461648127; Wed, 11
 Jan 2023 10:27:28 -0800 (PST)
MIME-Version: 1.0
References: <7b00f80d33fc4d77eafcddb8ba46b992d713df25.camel@siemens.com> <CAOSpxdapG_z_H0DrcRc=N6AczcPykLLBd+zfHbLCqTFGvOC0Lw@mail.gmail.com>
In-Reply-To: <CAOSpxdapG_z_H0DrcRc=N6AczcPykLLBd+zfHbLCqTFGvOC0Lw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jan 2023 10:27:02 -0800
Message-ID: <CAMKF1so06NJLbWAY-XnCQSNoksGOHZ=3XhT+Mbqzz7tJ6FdA_Q@mail.gmail.com>
Subject: Re: [oe] gRPC
To: Steve Sakoman <steve@sakoman.com>
Cc: "Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 18:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100558

On Wed, Jan 11, 2023 at 10:07 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> Hi Andrej,
>
> I'm the maintainer for openembedded-core, and gRPC is in
> meta-openmebedded. So this isn't my call to make.
>
> However we typically only take version bumps if they are security/bug
> fix only releases.  So if this is the case, you can submit a patch.
> But please be sure to include either release notes or change log so
> the meta-openembedded maintainer can verify that it is suitable for a
> stable release.

Thanks Steve, policy is same for all OE layers. I will wait for Armin
( Release Maintainer for meta-openembedded )
take the final call.

>
> Thanks!
>
> Steve
>
> On Tue, Jan 10, 2023 at 9:31 PM Valek, Andrej <andrej.valek@siemens.com> wrote:
> >
> > Hello Steve,
> >
> > I have a question about gRPC. Would it be possible to backport
> > gRPC(grpc_1.50.1.bb) from master to kirkstone branch? There are some
> > CVEs reported (for the current version) and going to newer version
> > would be better solution I guess.
> >
> > Thank you,
> > Andrej
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100555): https://lists.openembedded.org/g/openembedded-devel/message/100555
> Mute This Topic: https://lists.openembedded.org/mt/96195679/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

