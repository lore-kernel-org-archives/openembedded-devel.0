Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB170C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 22:04:28 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.11846.1640124268119624924
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 14:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ll/zBJ93;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id x7so848302lfu.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 14:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=chWlTtbLNo/T/NaRfO63zwMMbrMXuw1svO4vfJ0yTQY=;
        b=Ll/zBJ93fwJQ2336aE+lawsOvX484+9pb87NuM0YjiJdZ0I0zlBFtflmNTTlp+ztIW
         26nrOZmvHQtSawB8afiHv99szmNwKUZIT91A9I31mfWsnancTvMUavFgrZawSVAOrLOR
         eIDzNy0BUEfVg+c4IX94ObWEH6gXMSp3B1tzIv6jk52/Ii9ahhVQh/9KayB+uxoEy0Pa
         oiCBnFRYbMZ2yPkt0XI9wGnD82aOJ1fz0rxYmJQEgmugQgleVbCfi7ary1opWAKX2tth
         Yv/lgbvSF1R7AkdFHdeMYu7FU97VgeW7amREyZgc9AL/pPD1Gc5OcpTI14AWrGlbGsBt
         XIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=chWlTtbLNo/T/NaRfO63zwMMbrMXuw1svO4vfJ0yTQY=;
        b=rzeVPEF//w6rtqmVODb30NmV5K+D8LWJhdvy1fshZ4eeuq4Hpg2n+bPz3cdaGgG1qQ
         ccZaKIn3S4gkq02Fg7HEgL27r6jFQK5MC3TkCCD4nJgRoff6JhA7X66S9ZMBwHQZM7Fp
         k5LXwkFgY68dgnXyyd+XDdh+kbGp3t/ZV13pMcU1J1Hu3AjLPmS4+nkTX5c8KbM9FvQy
         Wxr9xp7OCytjQkdveKOmRHZ6opOx+XooV2wbLyIWtTxAgwhr0VxTBaneryqoLgxNctmu
         5irimsPmgpoZctXV6wKrjt/hEQQFDcR0GkFpkBLihY550GoZjAtTbSzPy3RXQJ4yCIN4
         lZvA==
X-Gm-Message-State: AOAM531KUrLI6+lk1ul/Ys092Jc6Sxw/lksfQ3HsyJKxilqe4QcC+B1O
	jHlcq3hwwmPRoPhF6cUAN3U=
X-Google-Smtp-Source: 
 ABdhPJwTYurdpkN05jnwW/C0xsjtxIC30GMFNXkNmk8lbrwClDhWFULmkw13O+APWSiiMagj50xOfg==
X-Received: by 2002:a05:6512:1506:: with SMTP id
 bq6mr315717lfb.118.1640124266151;
        Tue, 21 Dec 2021 14:04:26 -0800 (PST)
Received: from [192.168.1.70] (2-108-107-206-static.dk.customer.tdc.net.
 [2.108.107.206])
        by smtp.gmail.com with ESMTPSA id n3sm11947ljc.92.2021.12.21.14.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 14:04:25 -0800 (PST)
Message-ID: <e94238ed4ece4b751421484d23195f84cfbcc0a6.camel@gmail.com>
Subject: Re: [meta-oe]
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, OpenEmbedded Devel List
	 <openembedded-devel@lists.openembedded.org>
Cc: nerdboy@gentoo.org
Date: Tue, 21 Dec 2021 23:04:25 +0100
In-Reply-To: <cfbfdc6b-6ddb-2e04-ff4a-7ded6dc5a2fc@gmail.com>
References: <c27eabd5b0c9c7606367152cc3dc8e3ac7e1dc8e.camel@gmail.com>
	 <cfbfdc6b-6ddb-2e04-ff4a-7ded6dc5a2fc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 22:04:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94472

Hi Khem.

Thanks for your reply

On Mon, 2021-12-20 at 20:15 -0800, Khem Raj wrote:
> 
> 
> On 12/20/21 1:37 PM, Claus Stovgaard wrote:
> > 
> > Looking forward to feedback on this.
> > 
> > Do you prefer to include patch text in the request-pull?
> 
> 
> this looks good. Also check at layers.openembedded.org to see if some
> other layer is maintaining them already. If not then send it as patches

usbip-tools and gutenprint is not provided by any other layers as far
as I can see.

pycups is also available in meta-printing.
https://github.com/rossburton/meta-printing

Though it seems to be discontinued, and only support zeus and dunfell
so would significant work to get updated. Though it might be relevant.
Have added Steve Arnold to the list (maintainer for meta-printing). so
he can comment about the status of meta-printing.

I split the patch's up in 3 emails, as they can be assessed individual
and depending on the results of the review, some might be easier to
include.

Regards
Claus


