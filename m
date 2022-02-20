Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3E3C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 15:39:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.22276.1645371559953527888
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 07:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WIcaWZ6K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d27so22932914wrb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 07:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7mZXnzUWh/SPBOEX6DgMaorM64zZMYfyAhbfklTqKz0=;
        b=WIcaWZ6K1P9XAxzxnFZ9NISX5Lgv++Pn4AjBpyDVcVNn1u7MgTwKGpfN325vQiz0f3
         NHGGsBHR8aDz8uyvGOJ0zsOkqDVem9ZYm5nQvP3ZseAT9t11MGE1oTSQW6FrxjVxbk+I
         hNb2bkBR464LhebC1Dge9VxEh3dwYTOIRkfNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7mZXnzUWh/SPBOEX6DgMaorM64zZMYfyAhbfklTqKz0=;
        b=WIxEpbJns7fci0wqaPyEUn1MHCMWTMknY4MBs0Wf6jsqitVOI1nT5WkzRXRSUwAg7g
         wnnglPrYPN1qRLR5TkKFtGr+30h8opvEuBxrrEFSL6gGTFvzqO2SUYFCUttC6qyp2YOF
         S/EG1NI+Cu99HB2Bh6yj0G6tIjFLlIBfbOkU4yqhxbQrfKlzP5DYqCnfKnMBMgm1/of7
         15kP9NzTwBvTjPYzGCoMfstD0EcZd5iGQFcGNREDmPC+6Ti0HJ9K5Tvk5jK2W0MdO1gN
         ZM/yiB/RWSyiYqaV6iw5XLiwzJrCwUTi/3fudqNxnEAF1QD19rKgu392paXrQH8lu10T
         STLg==
X-Gm-Message-State: AOAM530lqhM4o3HN+GKCEuvDfJxOdeHFiLExgoLISnw+az2BP4nWQC43
	pBOvdDiVMfIbDYywFAn26iTcrA==
X-Google-Smtp-Source: 
 ABdhPJz6eJW9cvsTAqryf+XB5N2QtuMPOdC/440Brhv2BK2aQd30Z1GZPY1w2pWLqyheusXcd8Ubqw==
X-Received: by 2002:a05:6000:1ac6:b0:1e9:3a52:4c86 with SMTP id
 i6-20020a0560001ac600b001e93a524c86mr9411489wry.389.1645371558323;
        Sun, 20 Feb 2022 07:39:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9355:e71:cc42:42f1?
 ([2001:8b0:aba:5f3c:9355:e71:cc42:42f1])
        by smtp.gmail.com with ESMTPSA id
 h11sm29578472wrr.64.2022.02.20.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 07:39:17 -0800 (PST)
Message-ID: 
 <fc955ccbd9a05e04afb590ff908f10dd05da0d7f.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Proposal:
 INCOMPATIBLE_LICENSE_EXCEPTION
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>, OE-core
	 <openembedded-core@lists.openembedded.org>, OpenEmbedded Devel List
	 <openembedded-devel@lists.openembedded.org>,
	openembedded-architecture@lists.openembedded.org
Date: Sun, 20 Feb 2022 15:39:16 +0000
In-Reply-To: <c2098bee-157e-4f23-d0bf-26fc4b5bb37d@windriver.com>
References: <c2098bee-157e-4f23-d0bf-26fc4b5bb37d@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Feb 2022 15:39:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95393

On Fri, 2022-02-18 at 11:41 -0800, Saul Wold wrote:
> As a follow-on to yesterday's email and replies, I would like to make 
> the following proposal for dealing with the changes to 
> INCOMPATIBLE_LICENSE and associated variables.
> 
> Current Usage:
> 
> INCOMPATIBLE_LICENSE is a list of licenses that are considered 
> incompatible with a distro's requirements. This is used to compare 
> against packages built by a given recipe.
> 
> A set of exception variables based on the license name (currently 
> WHITELIST_<license>) that contains a list of recipes that will be 
> checked against the current recipe (PN) being evaluated.  If it's in 
> that list then all packages in that recipe will be built and included 
> and the rest of the evaluation will be skipped.
> 
> Otherwise, the packages (PKGS) from the recipe will be evaluated to see 
> if any have a package specific license (LICENSE:<pkgname>). If a package 
> has a license other than the INCOMPATIBLE_LICENSE the recipe will be 
> built and any packages with the INCOMPATIBLE_LICENSE will be excluded 
> from being packaged in package.bbclass via LICENSE_EXCLUSION-<pkgname> 
> internal variable.
> 
> The exception is predominately used for GPLv3 related packages, based on 
> the emails replies overnight.
> 
> 
> Proposal:
> 
> Keep the existing INCOMPATIBLE_LICENSE variable with the same behavior. 
> The values in INCOMPATIBLE_LICENSE should be SDPX normalized license 
> strings.
> 
> As Richard has already suggested an alternative variable that is more 
> meaningful: INCOMPATIBLE_LICENSE_EXCEPTION with an a <pkg>:<spdx_lic> 
> value. Rename the LICENSE_EXCLUSION-<pkg> variable to make it clear that 
> it is an internal variable. The usage of the _EXCEPTION variable should 
> contain pkg names not recipe name. ** This would be an important change **
> 
> Clean up code as appropriate to ensure the exceptions are handled once 
> and identified during parsing.
> 
> I will start working on the implementation, Monday is a holiday in the 
> US, so this should give sometime for this to be reviewed for Tuesday.

Thanks Saul, from my perspective I think this is a good balance between cleaning
up the syntax and other issues whilst being practical to implement and test in
the time frames available.

Cheers,

Richard



