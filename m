Return-Path: <eduardo@monkey.io>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 52DE060144
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:57:20 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id x19so10573906ier.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=/hQxDaXMc7+c7UiaYwlyuFqEJdn9CzIne5z9xRM7kzE=;
	b=IWjvKN5CoUS/uqwNWLNuZ0wmRewATD0maUQWMPqciSDrP5GaGs2S48/KzKH8IEWOX7
	NJ8M6VRsX4ZHgx0hOBdaro4d32SrkkRzuePdTa2rWzcdKM0UgAWh7LYGE3ke+WByO2fv
	9O8/T8YvSW2jalGHudr2aHIvNsk5U/F4KfpKBQl9q7ndWbj6IjIfeHLkUE540Wp3JJcI
	Kaeu6BfTG+bQB+jAbHYmHPkBJdV8cm4Lqq85CkDu2xQJlWt70rwpjgDQKk5oyx6s3Dw7
	VMW13FtM/UFDAWkNf49zeMnHy0XK4qI3ujSfUZmV/fU3Gj7T7QNh20rtO3fIC9CdQEsQ
	33bg==
X-Gm-Message-State: ALoCoQkbb1PMmzEnnIc3V5clgyU68XdJIgp2Kt3ffPYvUeCSekWkV13uYIB6UKmxgW1I3sZWzFjl
MIME-Version: 1.0
X-Received: by 10.50.6.77 with SMTP id y13mr40034176igy.21.1407182241145; Mon,
	04 Aug 2014 12:57:21 -0700 (PDT)
Received: by 10.107.133.199 with HTTP; Mon, 4 Aug 2014 12:57:21 -0700 (PDT)
In-Reply-To: <CAEaCVQjC6f-6o1DhjR_=pCSngLsg8xCFWG+BDCpwZp-kbNKMEw@mail.gmail.com>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
	<20140718181535.GQ2433@jama>
	<CAEaCVQj60r8pmT4RwLWZ3RO5NvkKzbQPHbkdhOqhoX3zbO2mRw@mail.gmail.com>
	<20140718182742.GR2433@jama>
	<CAEaCVQjMYWSZQQYj+wueXund=+XRyfnzXtmrg6WW8FyCSztukQ@mail.gmail.com>
	<20140720214725.GG22875@jama> <20140725100507.GS2492@jama>
	<CAEaCVQjC6f-6o1DhjR_=pCSngLsg8xCFWG+BDCpwZp-kbNKMEw@mail.gmail.com>
Date: Mon, 4 Aug 2014 13:57:21 -0600
Message-ID: <CAEaCVQhOqybiwMXyAX=jA2B12cvehYUkNsiDGhHMbB_5+ORLww@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Aug 2014 19:57:31 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

Is this something OE specific or something in your own environment ?

best


On Sat, Jul 26, 2014 at 9:03 AM, Eduardo Silva <eduardo@monkey.io> wrote:

> hi Martin,
>
>
>> > My builds are using "distroless" setup, if you're using poky then it's
>> > possible that there is still sysvinit added in your DISTRO_FEATURES
>> > somewhere (check bitbake -e monkay) so the sysv init script isn't
>> > removed in the end for you.
>>
>> I've just noticed that CONFFILES is set to
>> ${sysconfdir}/monkey/
>>
>> so it's not caused by missing init.d script but whole
>> ${sysconfdir}/monkey/ is empty in PN, can you check what's installed
>> there in your builds?
>>
>> It's either not installed when some dependency is missing or it's
>> included in different package in my build (knowing which file to look
>> for would help).
>>
>>
> thanks for tracking this. In my build using Poky i get installed the
> following files:
>
> root@qemux86:~# find /etc/monkey/
> /etc/monkey/
> /etc/monkey/sites
> /etc/monkey/sites/default
> /etc/monkey/plugins.load
> /etc/monkey/monkey.conf
> /etc/monkey/monkey.mime
> /etc/monkey/plugins
> /etc/monkey/plugins/fastcgi
> /etc/monkey/plugins/fastcgi/fastcgi.conf
> /etc/monkey/plugins/logger
> /etc/monkey/plugins/logger/logger.conf
> /etc/monkey/plugins/mandril
> /etc/monkey/plugins/mandril/mandril.conf
> /etc/monkey/plugins/dirlisting
> /etc/monkey/plugins/dirlisting/dirhtml.conf
> /etc/monkey/plugins/dirlisting/themes
> /etc/monkey/plugins/dirlisting/themes/guineo
> /etc/monkey/plugins/dirlisting/themes/guineo/entry.theme
> /etc/monkey/plugins/dirlisting/themes/guineo/footer.theme
> /etc/monkey/plugins/dirlisting/themes/guineo/header.theme
> /etc/monkey/plugins/cgi
> /etc/monkey/plugins/cgi/cgi.conf
> /etc/monkey/plugins/auth
> /etc/monkey/plugins/auth/monkey.users
> /etc/monkey/plugins/auth/README
> /etc/monkey/plugins/proxy_reverse
> /etc/monkey/plugins/proxy_reverse/proxy_reverse.conf
> /etc/monkey/plugins/cheetah
> /etc/monkey/plugins/cheetah/cheetah.conf
>
> if you need any extra info let me know,
>
> best
>
>



-- 
Eduardo Silva
Monkey Software

