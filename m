Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8A04E6FFED
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 18:04:18 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id 77so40040197pfv.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2016 11:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=AlUd/h9yFirsibYvM2ilZuk99dn/EsrJCXa2zEwRKk4=;
	b=EAaBq6ByCvMrNBXOXlnSRjNv/0yQRC/f9cgbazWY9kqViHWslv0AgcV3Ns+unFVxfv
	bnHPPvMFwKYRZb32foSqGZaXc3Yq7e86AHA4VoZa3MfOWJDWpwHKb6GpUCi7DBCmQq/g
	uneVnkhH8OCtbt6O5oX28FXxpaI0FN0zX1IPmJU8owxH4W9bhV6xIX9gjFSy5TgK+RvU
	qauaEr+v7rVM2Xu+1cQymOrYH7Hgr1Swi1P0XHMxdqwkUI6uHhV07ByBt9mBjUvhZATw
	ewq9gA2QpXii92PfkwvZJjlT9OQ35OX8GfiRdSg+6LAtTWhClyNSbGqDb/Jq+ijvaCL4
	SAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AlUd/h9yFirsibYvM2ilZuk99dn/EsrJCXa2zEwRKk4=;
	b=YlptN5AWNAwcfP7L9N7FnarxFqaRsk3nvdtQCNq2Po0DJcBGfmBStG0LQ2ldbrJ50K
	+1hChW+mJKOgR8TQS5Y0ZAU4tPcvf2XFM89jWRmZe93rJsxbPY/JlMH4aJRZxWj5qA6Z
	4muq9T9MDOwM7nhHE88sgFyuK2ZLKkTRXC6PwLFsyAGyTHD7RcqEvxf2b1U2KDSmb6eU
	aW37nfvyWKM2lczAv+O5F9UHdcKkt6z/DhuPhM6Kf59aiEf25p1683spw7HMCiIH6kbI
	fyZ17uqyBCTGZkUBPHGqJr8J7SBNwqbCy/aEn/c8atFaoyAkaDe95frePHAEUZZr6dbn
	4D5Q==
X-Gm-Message-State: AOPr4FVHe3xzhTAqRI60mnxkgKy76wE/htsI5/7QgUgpXKTJgIG0kJUpeUqMQBitUsJhHw==
X-Received: by 10.98.93.5 with SMTP id r5mr22275666pfb.15.1462471459846;
	Thu, 05 May 2016 11:04:19 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:f10a:9ff0:2d1d:e70f?
	([2601:202:4000:1239:f10a:9ff0:2d1d:e70f])
	by smtp.googlemail.com with ESMTPSA id
	y2sm15215895pfi.39.2016.05.05.11.04.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 May 2016 11:04:18 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20160505171932.GG27602@denix.org>
	<20160505172844.GH27602@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <572B8B21.801@gmail.com>
Date: Thu, 5 May 2016 11:04:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160505172844.GH27602@denix.org>
Subject: Re: meta-oe krogoth release
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
X-List-Received-Date: Thu, 05 May 2016 18:04:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/05/2016 10:28 AM, Denys Dmytriyenko wrote:
> On Thu, May 05, 2016 at 01:19:32PM -0400, Denys Dmytriyenko wrote:
>> Armin, et al,
>>
>> What's the deal with meta-oe branching into krogoth way too early (April 12th 
>> pretty much) and missing on many updates and fixes that went in to master last 
>> couple of weeks (delayed due to Martin's well deserved absence at the time) 
>> before the actual release of OE-Core last Thursday? I was hoping there would 
>> be a global merge/rebase from master to krogoth at the time of release, but it 
>> doesn't seem to be the case. It would be a shame if those were missed from 
>> krogoth... Are there any plans to pick them up?
> 
> BTW, I do see your past pull request "attempts" (May 2, April 28) on the list, 
> but they don't seem to be pushed. I guess I should re-phrase my question - do 
> you plan to push the latest pull request and what is the ETA? Thanks!

That is up to Martin. I don't have write access.

- armin
> 

