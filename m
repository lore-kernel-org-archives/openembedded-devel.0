Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21484C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 10:28:28 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.5353.1643365703569281688
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 02:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G39NTBfh;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: festevam@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id d10so14401102eje.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 02:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L/KLcsIgcjPgCmCcUD4tflQ8dij7L0+HfgVLaT/uqRQ=;
        b=G39NTBfhwqqP4LN7HEbAbm2ILqF0Q4EwyDtGLiXkbrVE3f4I+IidRAw30HTS9KWQPi
         vihvskn5JDPVMAGPZSiUF5VoE3mxYyWX/mR92Yb8vAaQxpER+85R/P85a26KxfcZ2AbG
         wqS7e1FevCJiC/o0nZfPVmFss3DHpTU1ay4AON2XaP82GzoAJcm7Nvlod6l0+mo3RnJS
         SARZT40u0CUmkqxvqkfjYYnlgkEzOeKM2B1JHQ5WdqCOQvWO4cgZ3HLmGYTFrCPdj1jk
         UsDzs+5zqD8TTN8IPfCR188ObR91hCoJSmFLCvaq7rU8K/eo4zyvlK05uWrScGY1ntTG
         E+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L/KLcsIgcjPgCmCcUD4tflQ8dij7L0+HfgVLaT/uqRQ=;
        b=F1/CHn2GCUKw9X45T7juxi65WN3H4HUhUJxMxxR4qhRtsdg8UrDNBGXgyEKN9vo5Vp
         lPpopKB/MZdO9GsdXdhKFqbuzjxulH/ESII873upKH9rlzkgg1VgRxW9LLm41ivi29nL
         oUetMunivP/NY+AIPB8REzGf+tLOIPaxR86Lil+f3b5ZsfvXeKPNk0MRkqoxVhic2DQ+
         Ybqsq4GOo4s21SF+QFzPtuk4zmXTCXAycSMcam3T/EtsSpJErtIxaE+PadhIyc0I9PSV
         I78uKWQ10TKg/mKhi30zoeUyZcbL9Qfr4rjb7T1dJcn113At1xbCITyIRxaqTuRrnyeW
         9AjQ==
X-Gm-Message-State: AOAM531nHZb3BokGGPpXpqQa89xV+jrM9+OS41PrnJ5LvztPLRUGv+Mv
	q9HRJdTir58pobYbgDhr4mjbVXt2PU9GL971EW8=
X-Google-Smtp-Source: 
 ABdhPJwc55E8jgDzqP53KQCg9E5iMNb7PY+zQBq39oTbOkWhMorIeV2shdCEzvlnHUMRnLCt/blNl1VMDNzycucTFdM=
X-Received: by 2002:a17:906:478c:: with SMTP id
 cw12mr6198108ejc.214.1643365696970;
 Fri, 28 Jan 2022 02:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20220127230607.35740-1-festevam@gmail.com>
 <d204889ebaf04514b6ec2863a5104052@axis.com>
In-Reply-To: <d204889ebaf04514b6ec2863a5104052@axis.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 Jan 2022 07:28:05 -0300
Message-ID: 
 <CAOMZO5DmubmJmVgTwVdkVBOc8h7+Ep7C2n0eRSKbhDMj9TimTA@mail.gmail.com>
Subject: Re: [oe] [PATCH v3 meta-oe] rtc-tools: Add a recipe
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	"otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>,
 "hs@denx.de" <hs@denx.de>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "raj.khem@gmail.com" <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 10:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95146

Hi Peter,

On Fri, Jan 28, 2022 at 1:48 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> > +TARGET_CC_ARCH += "${LDFLAGS}"
>
> You forgot to remove the TAGET_CC_ARCH line.

If I remove this line, the following error happens:

ERROR: rtc-tools-1.0.0-r0 do_package_qa: QA Issue: File
/usr/bin/rtc-sync in package rtc-tools doesn't have GNU_HASH (didn't
pass LDFLAGS?)
File /usr/bin/rtc in package rtc-tools doesn't have GNU_HASH (didn't
pass LDFLAGS?)
File /usr/bin/rtc-range in package rtc-tools doesn't have GNU_HASH
(didn't pass LDFLAGS?) [ldflags]
ERROR: rtc-tools-1.0.0-r0 do_package_qa: QA run found fatal errors.
Please consider fixing them.

Any suggestions as to how this should be fixed?

Thanks

