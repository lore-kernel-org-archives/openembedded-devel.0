Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pda6V-00073r-FM
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 04:13:31 +0100
Received: by pwi8 with SMTP id 8so379905pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 19:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7yOq8aDcNHtq2tLal43B11BxADo7ycN+83q0AZXtICQ=;
	b=VzQAI7DxdgtMNO0ukfuTDxxoKgmS5hUyNXT9wUKEd8JSMOnf2cbsCPpPzMsuIod/39
	QkskrENtQDrmIiNFSCpNoja9yzjq5r6uajJ0olZs9zQvENo6FLDBTsQ7GT+AiInMocJL
	4S0mYRJr98NFEzJ/cnf4SXND5dXQ4KQrCi/qg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=EBXXDuAb+lU041QM/pdnupFwonb44GEBGik8BS8c2MihUi3x1UCCsdInTKTXWZ86bb
	3oVP2vkwfWLUYnd1zhZ9VgCHOEymw77hrjdYaWq6wFmxDDu2y7RVe0wtP+0h1yuZQPAY
	XxyKOY1ZS+jEwST+E3jCjhhd4PeKOc9gW4eOg=
Received: by 10.142.232.20 with SMTP id e20mr299140wfh.41.1294974776692;
	Thu, 13 Jan 2011 19:12:56 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v19sm981978wfh.12.2011.01.13.19.12.54
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 Jan 2011 19:12:55 -0800 (PST)
Message-ID: <4D2FBF32.30402@gmail.com>
Date: Thu, 13 Jan 2011 19:12:50 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294832897-3343-1-git-send-email-Martin.Jansa@gmail.com>	<4D2DF2BA.6040000@gmail.com>
	<20110113073157.GO3244@jama>
In-Reply-To: <20110113073157.GO3244@jama>
Subject: Re: [PATCH] libvpx: force arm mode to be able to link with ffmpeg where arm mode already is forced
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jan 2011 03:13:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/2011 11:31 PM, Martin Jansa wrote:
> On Wed, Jan 12, 2011 at 10:28:10AM -0800, Khem Raj wrote:
>> On 1/12/2011 3:48 AM, Martin Jansa wrote:
>>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>>
>> hmmm what issues do u see if you build it with thumb mode.
>
> +# ffmpeg links with this and fails
> +# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
>
> and full log is here
> http://tinderbox.openembedded.org/packages/1398033/

Its not clear in the logs but is libvpx using -fPIE compiler option ? if 
yes then you should remove it and then it will work.

>
>>> ---
>>>    recipes/webm/libvpx.inc |    6 +++++-
>>>    1 files changed, 5 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/recipes/webm/libvpx.inc b/recipes/webm/libvpx.inc
>>> index 9913d5b..9d40945 100644
>>> --- a/recipes/webm/libvpx.inc
>>> +++ b/recipes/webm/libvpx.inc
>>> @@ -1,11 +1,15 @@
>>>    DESCRIPTION = "vpx Multi-Format Codec SDK"
>>>    LICENSE = "BSD"
>>>
>>> -INC_PR = "r5"
>>> +INC_PR = "r6"
>>>
>>>    SRC_URI = "git://review.webmproject.org/libvpx.git;protocol=git;tag=v${PV}"
>>>    S = "${WORKDIR}/git"
>>>
>>> +# ffmpeg links with this and fails
>>> +# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
>>> +ARM_INSTRUCTION_SET = "arm"
>>> +
>>>    CFLAGS += "-fPIC"
>>>
>>>    export CC
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



