Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 278A160111
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 11:38:59 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 2so204675666ioy.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 04:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=o80X2WUikGGvPfr+Mnwqw0jcVwKV3PgX13GJs/0UrFM=;
	b=ArXNMA5oALx8LxmIFuEZQfIX2oKiEAWkOq2HPCYu0POh4g7rtppuIBwoehIjHMiCxj
	mv90q8wdtCQFhJaNzGVnjLXQZyRwPCoPVqnZXEU2uJsNQ7EeiSjMZn2T6ffFR+4aSSaD
	OOG5p00iiy8n/U87CSKCZV9G5N3EqNTr/4UXssrK+4PX0y6qf2unB6r5HQuJyHRWYc4j
	azWgpXKTv2aBJDHKwyXL82dcwtk0AGPt6b7CQkk5ck59yEpEvMoBDQ/lr94UdhQyjXKH
	ys+XN5rlDx0GYQVCkTSV8JJW7hpzibOy+OsgVVxT49wv5qmCWF3q/g53YXb2h/8Hq3Qe
	sG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=o80X2WUikGGvPfr+Mnwqw0jcVwKV3PgX13GJs/0UrFM=;
	b=J/QkMrzq4VdfbMfTn5wuOjTh2iMBnBuk1FZPwh+NMI2vYCCsplpIbz8aWfe5pvNduF
	ERMhEjPTJGAN4RqXQ9pzS40Q2+APG/YETdwfxB0pOAeTau+XOzaShEAPYc/pGwrMe4yD
	JJ6/vyfIGFOtSkp2igsuXVIRptY5Av8WKxbN7ajgWu16N7z84qpr31LEFZ6Dk8MUqOEe
	J1VuyUxWxDqWan5RR44YyCYmCOBMpYiyXnhbaU+4TCBr2ta/6Tf89yfkwZfATn8sgk1l
	vhE+Oq1XTdUJMEZZryRVnNkxNRH5+yMdHXCX4UVRt4RO2dLk4rULqS2z1cPTNWUawh9j
	k4Bg==
X-Gm-Message-State: AD7BkJJ6nQN31ZpOCTd9e1atr7JkwvYq55YlBnF8eVakQ/8XrdHt84koAj1vfMcFZhq9wbDa+dx63ybZxyBy5R72
X-Received: by 10.107.135.74 with SMTP id j71mr24927230iod.133.1460374740484; 
	Mon, 11 Apr 2016 04:39:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Mon, 11 Apr 2016 04:38:41 -0700 (PDT)
In-Reply-To: <570B676B.1080905@mlbassoc.com>
References: <20160127145110.GH2574@jama>
	<1460363642-2233-1-git-send-email-daicy.fnst@cn.fujitsu.com>
	<570B676B.1080905@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Apr 2016 12:38:41 +0100
Message-ID: <CAJTo0Lb=k2T2G9RfsXo6Vf4cav-hUZwu_jQ7PzCwuqFe2gG1_A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] hwdata: add new recipe
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
X-List-Received-Date: Mon, 11 Apr 2016 11:39:00 -0000
Content-Type: text/plain; charset=UTF-8

On 11 April 2016 at 09:59, Gary Thomas <gary@mlbassoc.com> wrote:

> +do_compile() {
>> +    cd ${S}
>> +    LANG=C
>> +    export LANG
>> +    unset DISPLAY
>> +    LD_AS_NEEDED=1; export LD_AS_NEEDED ;
>> +    autotools_do_configure
>>
>
> Why isn't this done in do_configure()?


More to the point, why is this done at all?  What's wrong with just inherit
autotools?  Exceptional recipes require justification.

Ross

