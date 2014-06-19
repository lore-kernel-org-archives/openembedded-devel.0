Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0AFED7023F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 23:54:44 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so2395383pab.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 16:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=S+OC0RBA+T1+B68xKmUpMW5Xcpq/kcBUZY0En3O3zo8=;
	b=E5KiQ18gkDER9WoJL6RAdUaYmK1mQ8UHWVtD/varrGfWkilRQeNWhvxGmj4Px/+6xL
	bqsH9e68pw2wB73lY84xrkioW/ji9kwec0o8EetyW05g/QO0EAwJYXNScWWb2KKRdvrD
	EPksxvuhCQoW2CpkcG/FonbAz7b3+sgRVf4WTKdxU8bu50Ky17SC9LaFbUwTIxCli875
	/GPDednZYbxTMmqb90ztoLLZDbQqI4NIiAwFO/PT4LZzClaOSUFPGhGGsUJcYg2Y+Xk+
	p3lrWZ+boijvx43mopyF9YWJVyfXLfbTEoa3tERkicMv+5uNfxYds4uCaRW3w+DlMOr9
	SbvA==
X-Received: by 10.68.181.165 with SMTP id dx5mr9833432pbc.38.1403222085843;
	Thu, 19 Jun 2014 16:54:45 -0700 (PDT)
Received: from [10.7.100.231] (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	ir10sm10404204pbc.59.2014.06.19.16.54.44 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Jun 2014 16:54:44 -0700 (PDT)
Message-ID: <53A37842.70908@gmail.com>
Date: Thu, 19 Jun 2014 16:54:42 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <CAOd_LFwu0hwLcU1+oAvK9TVtsbbawDhRqd=1wafXfOKOWw5T+g@mail.gmail.com>
	<20140619115701.GP2117@jama>
In-Reply-To: <20140619115701.GP2117@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][daisy] pull request, update README's, live555 fix
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
X-List-Received-Date: Thu, 19 Jun 2014 23:54:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 06/19/2014 04:57 AM, Martin Jansa wrote:
> On Thu, Jun 19, 2014 at 07:52:51AM -0400, Cliff Brake wrote:
>> The following changes since commit dca466c074c9a35bc0133e7e0d65cca0731e2acf:
>>
>>    python-efl: add dependency on python-dbus and lua to always build
>> edje and elementary bindings (2014-05-12 10:08:28 +0200)
>>
>> are available in the git repository at:
>>
>>    https://github.com/cbrake/meta-openembedded.git daisy-to-merge
>>
>> for you to fetch changes up to f3f1d14a6587d72388f50725b0a49c84cf417eb9:
>>
>>    live555: fix fetch problem (2014-06-18 13:42:35 -0400)
>
> Thank you!
>
> Acked-By: Martin Jansa <Martin.Jansa@gmail.com>
>
> Waiting for ACK from listed maintainers, then I'll merge it.

Acked-By: Armin Kuster <akuster808@mvista.com>

>
>> ----------------------------------------------------------------
>> Cliff Brake (1):
>>        update maintainer info in README's for daisy
>>
>> Steffen Sledz (1):
>>        live555: fix fetch problem
>>
>>   meta-efl/README                                | 16 ++++++++++++----
>>   meta-filesystems/README                        | 15 +++++++++++----
>>   meta-gnome/README                              | 16 ++++++++++++----
>>   meta-gpe/README                                | 16 ++++++++++++----
>>   meta-initramfs/README                          | 12 +++++++++---
>>   meta-multimedia/README                         | 15 +++++++++++----
>>   meta-networking/MAINTAINERS                    | 11 +++++++++--
>>   meta-networking/README                         |  2 +-
>>   meta-oe/README                                 | 14 +++++++++++---
>>   meta-oe/recipes-multimedia/live555/live555.inc |  4 ++--
>>   meta-perl/README                               | 13 ++++++++++---
>>   meta-ruby/README                               | 17 +++++++++++++----
>>   meta-systemd/README                            | 16 ++++++++++++----
>>   meta-webserver/README                          | 13 ++++++++++---
>>   meta-xfce/README                               | 16 ++++++++++++----
>>   toolchain-layer/README                         | 14 +++++++++++---
>>   16 files changed, 158 insertions(+), 52 deletions(-)
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

