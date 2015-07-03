Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 71930757F4;
	Fri,  3 Jul 2015 06:16:55 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so101401593wid.1;
	Thu, 02 Jul 2015 23:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dq6f8Hnvpmew3gKd4Ix41pZSgEQNO5mZ9Q8mLA0iIqg=;
	b=AGIkbhbhj8VmfchnBYRVgyl5tCRpOxzZkA2FJI1FmS6epfCos4jQzwwwYoRQNhOlFT
	q0ew7QjR6YhB68qzWDonJ8Q7xCd85vu6NL3LGnF21b/sSol9g2Qi7WYLrs2zQocUshTj
	T13W2fyfKR2BXChBBHwrG8k4jBgn5mjPovw6ijl67CX8hAuUEoIUKcczvuBC6vNNJz2J
	E64wrOYd8YHVwURuFNwyJGy4tRVUi+DICmbLSGiJCU2PP7BpsjQEuWZ1tSI/7EdgBUYI
	4sG2Y7sh+90yA19qesHzUKh5Zzb1LDFT0eXycMe7Tg8q6hndjs81YE0ajdSDD50pOJ87
	xQtQ==
MIME-Version: 1.0
X-Received: by 10.194.2.161 with SMTP id 1mr63461844wjv.143.1435904215064;
	Thu, 02 Jul 2015 23:16:55 -0700 (PDT)
Received: by 10.28.167.2 with HTTP; Thu, 2 Jul 2015 23:16:54 -0700 (PDT)
In-Reply-To: <5595F075.5010309@gmail.com>
References: <558B6EE7.5090107@gmail.com> <20150625105906.GA2394@jama>
	<5595F075.5010309@gmail.com>
Date: Fri, 3 Jul 2015 08:16:54 +0200
Message-ID: <CA+chaQeCV9gvoGDAz5NQrzNaR1WJNkW1u4Bg_CLwzLCVrZMr0A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] google mercurial repo issues
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
X-List-Received-Date: Fri, 03 Jul 2015 06:17:02 -0000
Content-Type: text/plain; charset=UTF-8

No, the bitbake fix was merged yesterday:

http://git.openembedded.org/bitbake/commit/?id=378647281ae883dd726f1e1b775dd35ef6a0e8d1

On Fri, Jul 3, 2015 at 4:16 AM, akuster808 <akuster808@gmail.com> wrote:

> It seems to be working today. wonder if it is do to mercurial-native
> update?
>
> - armin
>
>
> On 06/25/2015 03:59 AM, Martin Jansa wrote:
>
>> On Wed, Jun 24, 2015 at 08:00:55PM -0700, akuster808 wrote:
>>
>>> Hello all,
>>>
>>> I have run into an issue trying to build vim.
>>>
>>
>> That's broken for a while (see world reports), because bitbake mercurial
>> fetcher is broken.
>>
>>  /usr/bin/env hg pull
>>> /home/akuster/oss/downloads/hg/vim.googlecode.com/hg/vim
>>> | DEBUG: Python function base_do_unpack finished
>>> | DEBUG: Python function do_unpack finished
>>> | ERROR: Function failed: Fetcher failure: Fetch command failed with
>>> exit code 255, output:
>>> | abort: repository
>>> /home/akuster/oss/downloads/hg/vim.googlecode.com/hg/vim not found!
>>>
>>>
>>> there is a note on google regarding their hg repos: "We have some known
>>> issues with hg repositories."
>>>
>>> https://groups.google.com/forum/#!topic/google-code-hosting/Gh3kl9MrzY4
>>>
>>>
>>> is anyone else seeing this?
>>>
>>> - armin
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>

