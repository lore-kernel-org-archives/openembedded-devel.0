Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DCCC38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 04:01:26 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web08.3366.1666670480865430981
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 21:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l/xezMyG;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so7026140otu.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 21:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HPChpg5ezbPlREEsIRLjxpblQoaC207sSvBhH0ZsLlc=;
        b=l/xezMyG9yYcbsDoqwCdc1l5K085hSwHdHCJ9iv4AI9S8G+lltSb/xo8DHrs1rrzxa
         RXCO64MF9WF00tYk2ObcBGKpECdWSOxnW+ewZz06RrQRjSxL+vFgX8UEF3THlBd90sRY
         lvM697H4yOfwwfdJBL0GuMW+FGVXWIa68kTx0eNETACptgRbs1iYixojzDLOnjiuCR2G
         aDUnGAqtmdxPsXOi7g9IUMxqSrffwuyLj6j3nc/3RER3JajPgOJTU6nFT9GYg2QC5xH5
         10UEJt9WSicQS66OIhB/tb7ReuZD4fzRPzRvS71vn1FuB802fdx1CZX5XZuCWqCx09sR
         7yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPChpg5ezbPlREEsIRLjxpblQoaC207sSvBhH0ZsLlc=;
        b=B7nOphrUC4o8202rueUbOFa9ZbkbYXMEfsqNzQEwGp861S8sRdMGY9eyygB2DZfIqi
         63haTqODP+K5fLgLr74KwWdvldwqEUIrtyjFGHitqoK104eDM/JCuZCbc2eyYjNWLRsS
         WjekvsKMJj2AuhesA9tUpbqwE2jmWvnr8RUSDZLUVfZVppyUdOJ0KWedCCHO+ZR4ZGCU
         JbmRhupEGxhEkDCGf/T/BfFLAkf511cGxIynUBxDLGUPf0U3i2Qk5Mxz0XVi2MCFKsSD
         Ra6D8UDbDDibpw566WfC6iGck2WKf7igoTV10MpCdtZA6H9HpOzICXQ0jDSeZBoRA3LW
         nptA==
X-Gm-Message-State: ACrzQf1SIlf2DZKftskyiR4xG9RLnmh0aT+QYJ4CYBeJFGauTPjg/tk9
	OAfm3toaj31qFYC4XuulTeK/pNbjhz3kpLQ0PqM=
X-Google-Smtp-Source: AMsMyM4I9JFT21BeYM2IBqxtmpGEF1gMeCkmCnIc70of14QSmXkKt/X0oKjNu1oRWPDMcLgtVNhuvbrfpSaIemvyLcg=
X-Received: by 2002:a9d:74c6:0:b0:661:c309:f0cf with SMTP id
 a6-20020a9d74c6000000b00661c309f0cfmr17444094otl.55.1666670480032; Mon, 24
 Oct 2022 21:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221024095656.292305-1-xiangyu.chen@windriver.com>
 <91f4d7befff848f9a308e5ed77b9c510@axis.com> <70780f6d-9fb9-3553-a6ec-1eb9e8098583@windriver.com>
In-Reply-To: <70780f6d-9fb9-3553-a6ec-1eb9e8098583@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Oct 2022 21:00:34 -0700
Message-ID: <CAMKF1srJjfdCnJkSWH4YBWyq8QifnRZAyU8CPOpR_=PhgL3gGg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ipmitool: add default iana enterprise
 numbers database
To: Xiangyu Chen <xiangyu.chen@windriver.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 04:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99301

On Mon, Oct 24, 2022 at 7:46 PM Xiangyu Chen <xiangyu.chen@windriver.com> wrote:
>
>
> On 10/25/22 00:30, Peter Kjellerstedt wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> >> -----Original Message-----
> >> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Xiangyu Chen
> >> Sent: den 24 oktober 2022 11:57
> >> To: openembedded-devel@lists.openembedded.org
> >> Subject: [oe] [meta-oe][PATCH] ipmitool: add default iana enterprise numbers database
> >>
> >> When using default configuration without add IANA_ENTERPRISE_NUMBERS and
> >> SRC_URI in a bbappend, the ipmitool would report an error as below:
> >>
> >> "
> >> root@intel-x86-64:~# ipmitool -I open bmc getenables
> >> IANA PEN registry open failed: No such file or directory
> >> "
> >>
> >> Add a default iana enterprise numbers database to avoid the error
> >> happen if using ipmitool default bb configuration.
> >>
> >> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> >> ---
> >>   .../ipmitool/ipmitool/iana-enterprise-numbers | 237682 +++++++++++++++
> >>   .../ipmitool/ipmitool_1.8.19.bb               |      6 +-
> >>   2 files changed, 237686 insertions(+), 2 deletions(-)
> >>   create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers
> >>
> >> diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers b/meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers
> >> new file mode 100644
> >> index 000000000..f8c328796
> >> --- /dev/null
> > [cut 237k+ lines... ]
> >
> > For the benefit of all members of this list, do not send a 237k+
> > lines patch as a mail! The resulting mail was 20 MB. It took my
> > Outlook client over two hours to create this response (where I
> > then had to remove most of those 237k+ lines again)...
> >
> > Instead push the change to some public repository. For
> > OpenEmbedded you should be able to use the github repository and
> > create a merge request that way (and let us hope that Khem does
> > not have automatic tooling that sends all merge requests as
> > patches to the mailing list...)

Regardless, I would not like to have binary blobs in git metadata.
Please make it a separate downloadable artifact
hosted somewhere reliable.

>
> sorry about that, i'll pay attention to check the size next time.
>
> I've created a merge request on github
> (https://github.com/openembedded/meta-openembedded/pull/629)
>
> >> +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/iana-enterprise-numbers
> >> diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> >> index 0a600e23b..e166ea213 100644
> >> --- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> >> +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> >> @@ -27,9 +27,11 @@ SRC_URI = "git://github.com/ipmitool/ipmitool;protocol=https;branch=master \
> >>              file://0001-ipmi_fru.c-Provide-missing-function-declarations.patch \
> >>              file://0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch \
> >>              "
> >> -IANA_ENTERPRISE_NUMBERS ?= ""
> >>
> >> -# Add these via bbappend if this database is needed by the system
> >> +# Default IANA enterprise database version is 2022-10-24
> >> +IANA_ENTERPRISE_NUMBERS ?= "file://iana-enterprise-numbers"
> > If you compress the file with xz, the size is reduced to a third.
> > Bitbake will then uncompress it automatically during do_unpack().
> Sure, I used a xz instead of the pure text file in latest version merge
> request.
> >
> >> +
> >> +# Add these via bbappend if the latest version database is needed by the system
> >>   #IANA_ENTERPRISE_NUMBERS ?= "http://www.iana.org/assignments/enterprise-numbers;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
> > Change "?=" to "=", or the suggestion to add it as a bbappend will
> > not work.
> I have changed ?= to = in latest version merge request.
> >>   #SRC_URI[iana-enterprise-numbers.sha256sum] = "cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"
> >>
> >> --
> >> 2.34.1
> > //Peter
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99300): https://lists.openembedded.org/g/openembedded-devel/message/99300
> Mute This Topic: https://lists.openembedded.org/mt/94530972/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

