Return-Path: <ashcharles@gmail.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9B90C61F16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 23:53:32 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id pa12so4545456veb.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 16:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=9pr0gHlRHmjubp0xq0S7adLNlyK2k+Oy3XtsZY5jF/4=;
	b=nryouYJ3IWLrkDFLohI/ycMIQu6qCxzq92CLZIY3MLQeTYtIQkQPynrqVufENLsKLX
	BJTtbydGdZet6YFhatf8SKamMs55Igu72/AB8e1t1kapcGQsR76QbsDurlS9GT0LNLp3
	v9n04CDIFqzEkTMIB95TOmhnvQfqiB1fK7Son6hzRp+yJTJMyhLwIy3D+pWSWAyPF5AO
	JiPFOlCRv0qIM2nDO7wBEh7s+1KGQ//zhkuSXq106bNiYAK0+Ybeblpzl08Y74SKVg+d
	RDJt5QupeyIFeyCuXptVyz0OdGXJ3M2oGpIulfQ8srodfWxwd7FjDgg/SdASAnQnedKd
	PH1g==
X-Received: by 10.52.27.209 with SMTP id v17mr13782290vdg.23.1403826813182;
	Thu, 26 Jun 2014 16:53:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.196.229 with HTTP; Thu, 26 Jun 2014 16:53:03 -0700 (PDT)
In-Reply-To: <20140626235010.GI1580@denix.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org> <20140625185504.GD1580@denix.org>
	<CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
	<53AB5ADB.3080403@balister.org>
	<CAMCfZKHUaFwx_pQdgqbeS1C-WmKM9DEcNfixug9Jw8Z645epuQ@mail.gmail.com>
	<20140626180954.GG1580@denix.org>
	<CAK8F28kHj_JJh84XWcVt7wy2p70BvpV+WCF4n2r1=FWrRQT8cQ@mail.gmail.com>
	<20140626235010.GI1580@denix.org>
From: Ash Charles <ashcharles@gmail.com>
Date: Thu, 26 Jun 2014 16:53:03 -0700
Message-ID: <CAK8F28mxyajbeEhUikwKisBSQrVDYbwoe1xLBsWHXH-+93vrUw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Thu, 26 Jun 2014 23:53:44 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 26, 2014 at 4:50 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Definitely OMAP34xx/35xx family. I'm not very sure if OMAP36xx/37xx had a
> fixed BootROM already, but probably it had, as Beagleboard xM was much more
> forgiving to SD card format, IIRC...
This matches my experience.  Unfortunately, we still have a lot of
customers using OM35xx parts so I'd better not take the CHS stuff out
of our instructions just yet.
--Ash

