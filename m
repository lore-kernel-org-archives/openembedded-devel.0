Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC0965C78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 16:39:19 +0000 (UTC)
Received: by paza2 with SMTP id a2so64817928paz.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=5rRBjRUattkp3C8FiZYquW/u+WIoLuV/yp8nrWuUETM=;
	b=vVdcI43tRfW2r8giFCPp5x/VhN70R5F6Tb6MzWrSrHaNwVYPMnRAdwvnDtUxGYSQS1
	uYpws8guGl4+hTUWt3ngA/sjBjMnwqnsAQD0U95TWpvFDm4YjYvhfFizCCbext+3hG37
	FS4s7itRAkNtXUPRDhlYG5bTOnARhHZDdIIn+XQRWYlTml3/m+t85IaXeiy9ij2WRk28
	TXg1vj52ksl34/Gg9UialX5SapoSZlAjSY8Xd0dFnU9vu+WR6xf6S7cmvAwcy2hOtNcY
	XBScUN6XSWlA2sTbVs26GDBm/y9xoL8bgEDRLRtLKebRMuHGMPqySh3O2PWLl9xHRevB
	DKKA==
X-Received: by 10.66.149.8 with SMTP id tw8mr41608522pab.69.1432571961217;
	Mon, 25 May 2015 09:39:21 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:a938:95af:d43b:b8e4?
	([2601:c:a700:3ba7:a938:95af:d43b:b8e4])
	by mx.google.com with ESMTPSA id
	c16sm10533245pdl.61.2015.05.25.09.39.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 09:39:19 -0700 (PDT)
Message-ID: <55635034.9010702@gmail.com>
Date: Mon, 25 May 2015 09:39:16 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>	<20150521110638.GB2377@jama>
	<555F5517.5000100@gmail.com>
	<CAJTo0LahDus8tjxEvwZUtyjBjtLO6tsYokx=iMH=WegL9ix46g@mail.gmail.com>
In-Reply-To: <CAJTo0LahDus8tjxEvwZUtyjBjtLO6tsYokx=iMH=WegL9ix46g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add GStreamer 0.10 and things that depend on it from oe-core
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
X-List-Received-Date: Mon, 25 May 2015 16:39:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/22/2015 09:30 AM, Burton, Ross wrote:
> On 22 May 2015 at 17:11, akuster808 <akuster808@gmail.com> wrote:
>
>> I have noticed some breakages when building xfce, (libcanberra DEPENDS =
>> 'gstreamer') now needs to be "gstream1.0". I suspect some of it is do to
>> gstreamer transitioning. I will give a few days to settle before sending
>> patches.
>>
>
> libcanberra 0.29 only supports GStreamer 0.10, libcanberra 0.30 depends on
> 1.0.

ok, I will look into that.
>
> I suspect the problem you're hitting is that libcanberra 0.29 depends on
> gstreamer which isn't in oe-core anymore, but switching gstreamer to
> gstreamer1.0 whilst letting the build run will mean libcanberra doesn't
> actually support GStreamer...
>
> Either xfce should keep with GStreamer 0.10 and so depend on
> meta-multimedia, or xfce and related recipes migrate to GStreamer 1.x.

This is less of an xfce issue as meta-oe world wont build do to the 
above mentioned depends. Maybe we may want to move the failing packages 
to a more appropriate location, upgrade or fix the depends.

failing packages:
farsight2, pidgin, licnice, libcanberra  and qt-mobility

would creating a virtual/gstreamer help?

- armin
>
> Ross
>

