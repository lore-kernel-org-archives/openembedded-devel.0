Return-Path: <mik.hargreaves@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 686F0607A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 13:11:08 +0000 (UTC)
Received: by pdbep18 with SMTP id ep18so45197006pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jul 2015 06:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=KLSlGLSdgCRpBYwOuf/uzjKeu2+58Aw5v0680mJgoAs=;
	b=I6lKxlLr++skqC04e8SGGJ8GwDNV2dnj4VWCqM6H/bhsEfvB7ICudardzOUe6W8yZz
	NazWAylOnT3zYqxv76VmubwFhqKiLKBDD6uCA3B6ioKu14xStxBI4qs14Qxfz3FLCYnz
	lfp2t+dFhM0jbd2DSd43Zc3QVSsZhZF2bNpn9rqVy8uHp/bKCcwrQTH7HiGAohFYSHJq
	vl8hkGgPEjBTRpt/VK2SkfN0WtjtdP4BEu6uRFJky6GAuLvPthpmHScbODa/s+Ay83aD
	UEIpsR54qzS9oFkgxv/v4+aDp+jKUtBiI51SMdasaP127ByVPLUL/wbDDf6nSeND9MV6
	6FBw==
X-Received: by 10.66.139.41 with SMTP id qv9mr66148023pab.35.1435842668956;
	Thu, 02 Jul 2015 06:11:08 -0700 (PDT)
Received: from [192.168.0.6] (124-150-90-170.dyn.iinet.net.au.
	[124.150.90.170])
	by mx.google.com with ESMTPSA id y2sm5700389pdc.91.2015.07.02.06.11.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jul 2015 06:11:07 -0700 (PDT)
Message-ID: <55953861.2050506@gmail.com>
Date: Thu, 02 Jul 2015 23:10:57 +1000
From: Michael Hargreaves <mik.hargreaves@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.5.1435838401.9446.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.5.1435838401.9446.openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 02 Jul 2015 13:11:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nikolay,

On 2/07/2015 10:00 PM, openembedded-devel-request@lists.openembedded.org 
wrote:
> Hi Zoltan, On 06/12/2015 09:57 AM, Zoltan Kuscsik wrote:
>> >Do you have a crash log? If not, you should change your build from Release
>> >to Debug and
>> >get some backtraces.
> The chromium debug binary is 3.1GiB, there's no way to run this on my
> ARM target. If you have other suggestions how to extract trace/debug
> info, I would be glad to try them.
>
> Regards,
> Nikolay
I hit a similar issue on intel platform since updating meta-browser. It 
wasn't crashing, but was getting the 'Aw, Snap' chromium page on any 
html5 video or audio.
It turned out to be because the ffmpeg codecs have been separated into 
their own split package.
Adding both 'chromium' and 'chromium-codecs-ffmpeg' to the IMAGE_INSTALL 
resolved the issue for me.
Possibly not the same issue, but sounds similar.
Cheers,
Mik.

