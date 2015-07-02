Return-Path: <picmaster@mail.bg>
Received: from mx2.mail.bg (mx2.mail.bg [193.201.172.118])
	by mail.openembedded.org (Postfix) with ESMTP id 7541C6E5F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 20:40:26 +0000 (UTC)
Received: from [192.168.0.62] (unknown [93.152.143.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx2.mail.bg (Postfix) with ESMTPSA id 08A796003ED4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 23:40:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mail.bg; s=default;
	t=1435869626; bh=CRdOsnQmtfUtm8E2HthTgGVnnRmcEl1MNSganJMm3PE=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=nE9Mxd+jl8DzjKs6aF4203ZxJD8t+i8fWFNBNbKfP7FTb4kmBtm57/SSe8PXPWJM0
	l5aEMvap+P7Bdzp8hIrlIr7LdApnR08aVTkXr7GYubhf4EVIDsjl2STvOv+VVaCRpW
	zdbJAh7gbjSWbVMa+2qw6nq+lcAzShpl7SQV+Pu4=
Message-ID: <5595A1B9.6040904@mail.bg>
Date: Thu, 02 Jul 2015 23:40:25 +0300
From: Nikolay Dimitrov <picmaster@mail.bg>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.5.1435838401.9446.openembedded-devel@lists.openembedded.org>
	<55953861.2050506@gmail.com>
In-Reply-To: <55953861.2050506@gmail.com>
Subject: Re: [meta-freescale] Chromium crashes on HTML5 video tag
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
X-List-Received-Date: Thu, 02 Jul 2015 20:40:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 07/02/2015 04:10 PM, Michael Hargreaves wrote:
> Hi Nikolay,
>
> On 2/07/2015 10:00 PM, openembedded-devel-request@lists.openembedded.org
> wrote:
>> Hi Zoltan, On 06/12/2015 09:57 AM, Zoltan Kuscsik wrote:
>>> >Do you have a crash log? If not, you should change your build from
>>> Release
>>> >to Debug and
>>> >get some backtraces.
>> The chromium debug binary is 3.1GiB, there's no way to run this on my
>> ARM target. If you have other suggestions how to extract trace/debug
>> info, I would be glad to try them.
>>
>> Regards,
>> Nikolay
> I hit a similar issue on intel platform since updating meta-browser. It
> wasn't crashing, but was getting the 'Aw, Snap' chromium page on any
> html5 video or audio.

This means exactly that the browser tab has crashed (it resides in a
separate sandboxed process).

> It turned out to be because the ffmpeg codecs have been separated into
> their own split package.
> Adding both 'chromium' and 'chromium-codecs-ffmpeg' to the IMAGE_INSTALL
> resolved the issue for me.
> Possibly not the same issue, but sounds similar.

Well, I found additional issues with Chromium, so it seems important to
really analyze the crash. I don't think me or someone else will be able
to fix the issue by just moving libs around, without understanding the
problem (Chromium is now almost 17M LOCS, not good for guessing).

Regards,
Nikolay

