Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1B58171D90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:06:33 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id z128so6571576pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=h4DfzH/bBbtfgiFlWRe/rlcrlkgeuHzlSZEBkpkw59M=;
	b=DJyImFBpVPVwCobO5FuQ9NcrRMAkeFd0M3KS8xwH+Htxi6NDIBuVCDRBb8SOA3oNMA
	Jri1xB6zUA3zl1NvntudeRAp44lfG+yc27y6wUO5egKSaYMx+2LazyOgO9JQQ6WmOgMy
	lpqqc7CYHxzUn/m0JeO3sCmyOjPcVIy4K5Tjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=h4DfzH/bBbtfgiFlWRe/rlcrlkgeuHzlSZEBkpkw59M=;
	b=Y/qfxxAtIqrKVoW0Z42uX296iWmQh4f/LygNdYtDKa7BMAIfTYhuATjUgA6SnT3fay
	MJrTFImaNCtmVi4VQVYJiGogWGhzISxPgtRhARyBc8NX/QQQP0tjLwSZxcykSgoJIHxz
	f7tjI6pt/Qx6n7E6Kc21hBlwxZ6Poy8nT04AtAtOdahhzhD7bOF8H4bdITvKIeL43pd6
	C5e/j1DUhQe2FsTfhwAIgPYeQbkV0PyrvES+tkU8SmKACuSddLt6dFj8MOpl/Qi667dL
	sqWcGIAKYnzaLkBtonkCGAc+ikqT4XvDeLGTRIJz1K5T5/x9WLMnS3wehOKPfLsH3tgq
	mrQg==
X-Gm-Message-State: AMke39kvVR7gIekbudoYEahLQ1VPtKimwI31P8u9awuNb/LxSI3z4t/2WzZqo8BtABI1hoWb
X-Received: by 10.98.42.151 with SMTP id q145mr42213977pfq.175.1487804794841; 
	Wed, 22 Feb 2017 15:06:34 -0800 (PST)
Received: from yct-lpt.lan (74-95-45-185-Oregon.hfc.comcastbusiness.net.
	[74.95.45.185]) by smtp.gmail.com with ESMTPSA id
	z127sm5578134pgz.29.2017.02.22.15.06.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:06:33 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20170222213254.GH3283@jama>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <506a5e6c-36f6-7b1f-a375-24bebb57342f@linuxfoundation.org>
Date: Wed, 22 Feb 2017 15:06:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170222213254.GH3283@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Before you ping some older patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Feb 2017 23:06:35 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

The hooks are repaired and need testing. (Bad git/config settings.)
Please feel free to resubmit patches. Let me know if they do not appear
in patchwork.

I'm trying to see if I can automatically resend the missed patches and
mark them superseded if needed. I'll update post here if it works.


On 02/22/2017 01:32 PM, Martin Jansa wrote:
> 1) Make sure they aren't already in master (or master-next), currently
> there is only one change in master-next:
> eb7979113 netcat-openbsd: fix implicit dependency on pkg-config
>
> 2) Make sure there weren't some negative feedback comments on our change
>
> 3) Make sure the change made it to patchwork, currently there is only
> one "open" change:
> https://patchwork.openembedded.org/patch/137499/
>
> Be aware that the changes are usually daily marked as archived, when
> they are sorted to corresponding bundles and included in master-next
> branch for testing, as described here:
> http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same_oe_project_on_patchwork
>
> I'm writing this, because currently many changes are missing on patchwork,
> because of some unknown issue with it, see:
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111467.html
> once this issue is resolved, please re-send missing changes.
>
> Regards,
>
>

-- 
Michael Halstead
Linux Foundation / SysAdmin


