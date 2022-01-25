Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E95C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 16:30:53 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.9584.1643128252410096579
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 08:30:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=bkxBsV9p;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id c23so5249834wrb.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 08:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dFHbCqyAMunuBZ3FgqYd6fHQcYqmiDM8b0QR3lI5pP8=;
        b=bkxBsV9pqZ1tovaLbNaZErNk4FNplNpgArkz/RXoDJVTTmG1PQg8wBaghnxp6R13Tn
         jGaaKFceMNq31qqB5dOcXOifhl4UkLP9BF7kSQn+NnuX6hKUs33uuarYQnYNWSPXuu3g
         1PtXDLnKMyeqLYsvNgs2PKL2bbQvNc4gwx2BbVG5imlknRG/7bXxcRwqEGB4hcOiHbem
         RmWK5b3n90US3H00Og/A1ZeWXF0lb4bFqRvjPGPWEfR+evzvUmMWZf39rdOGmx5ISZsE
         Jstf/Hh0oc5ISmLCZpG27NoBmPWUqx+loTcYtCEA1FPNFQ9PhstA3rTdSf9DkKRg7qD5
         76Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dFHbCqyAMunuBZ3FgqYd6fHQcYqmiDM8b0QR3lI5pP8=;
        b=uSMIorZY0kVlBzqATQq5h/4tGXWRG3KouAqjcgUBIB0+pC4Ys8radbmOY3D9sN7ffV
         wl/DpiwtiQhrWdFEPu174Ep6b/237WJ4XL43rRnJxsvaGCbUMOTXpWfkqyziJbbyWtiU
         tipJ8Pn9yJph2donTPCJTqRErK0bWfOKlvemAP7jmIbBjhAI+pPmaaok2eeH86+d/PAb
         zfHq0VXErZTADW/ul/XxZj6GehOrCLKA9VwocwYvyPXYxnT6WrBPGlqHa/B3UgDm+ItB
         N6PfhJUyLUu8bVowJS40BzOu1QoS3+0qwwQNHNCpd9PhydcqgxACYIbia6YhbED6bPlZ
         nWHQ==
X-Gm-Message-State: AOAM532X1B8fbVxmVEZGnuR3pDcDgD1AEhIV47ZBQKvAOKx1SfEKI+hT
	WDDoET0D15r/GnVUvb5/dZc07sUDrYfsKtM7EgFUnw==
X-Google-Smtp-Source: 
 ABdhPJyO6TclGeD9jXIIrTlR42CCUf6+aToiXJQyE+QWXPf1EI1HxQgyYf1zfm+nF05fuA4HH27BIDQUuTHAL5HmKV0=
X-Received: by 2002:a05:6000:1c11:: with SMTP id
 ba17mr10421769wrb.405.1643128250889;
 Tue, 25 Jan 2022 08:30:50 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 25 Jan 2022 16:30:40 +0000
Message-ID: 
 <CAAnfSTu1eneGztK0Kmzcv5Qq89kodoCrgDWzF6JQ7eFStD6Uzg@mail.gmail.com>
Subject: Re: [oe] Inclusive Language Proposal for YP/OE
To: Jon Mason <jdmason@kudzu.us>
Cc: yocto@lists.yoctoproject.org,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 16:30:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95071

On Mon, 24 Jan 2022 at 16:18, Jon Mason <jdmason@kudzu.us> wrote:
> CVE_CHECK_PN_WHITELIST -> CVE_CHECK_SKIPRECIPE
> CVE_CHECK_WHITELIST -> CVE_CHECK_IGNORECVE

This is the only one that sticks out to me.  I think it needs another
_, SKIP_RECIPE and IGNORE_CVE.

Other than that, +1.

Will we have a bit of logic to detect the obsolete names being set and
emit warnings/errors?

Ross

