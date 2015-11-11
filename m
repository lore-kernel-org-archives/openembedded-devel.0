Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1086976B7C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 13:42:36 +0000 (UTC)
Received: by qkfo3 with SMTP id o3so11588684qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 05:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AByomwRCw6yfppGNbHFAxCU8sfHlpp3i+2Uk8wbhp8w=;
	b=x/C710B7mLEQmsDw1np3GJ6gYQZWZYalQXOkcQG4N0cZoiXCDYjvyxSG0MMbcBJGSt
	A7PNnubLvHZ1hRzpMV5hhFY8x/wUj5ZgYm4eSDlijSRynzQo5qJMs01lsvqtliMUsluv
	gAVqSTo6kRP6Mn2K4wSnTgqQn6VqepnzXk/t2jLfly/UNG7F9K+3HoHx3l69CI08WICH
	VpOTsEIpRNLc2S5IYt3y7xlit3lwjVDQ4UUNZDif2VIb5goJsZ0Qc8CdTkvZDi3/eP9Y
	LzRwGaFRsjB0MPUv0rk+P/GYpeWlDNMWWd3XrgEGL2EXiU0AnIVb6Cz4nM/pZxUyyFig
	kYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AByomwRCw6yfppGNbHFAxCU8sfHlpp3i+2Uk8wbhp8w=;
	b=LdsZIelswHCPo1B/Ya39h0uyaAIktmXPUnRSloclZV/EeOwR+v9ApXA1BCRSnhCVVz
	KG6OQPtSGnDmONSRlbSViLPngYIv+kFTPBGRXFoSdbSVK7/edKNe8ZrCaTFKA40MlnpV
	rjhGPebmosrAA2h4+uQg5Z3u0pPehaHcz/7nsyTQ7q1l7HHo4VP4kYCAtgUoyOuiMVOO
	cVmK8q9aIqGs1Sv2KRhOIIJefxuURAEvPjcUg5KzYgyqNVfx2jlWaaiYlbdTMr7Zb04M
	yNqUtxYLO6fP9FYmjQoF04cjN0tm4YAnMwPhLooe1x7JlssQqhaQ/KmJ/ZNv1fiiri+e
	gzxQ==
X-Gm-Message-State: ALoCoQnSAoSub/XiBmZpKyiaBLyrmiuCa+ZcUMioJasrYhAD9lwbnN/1ZGkwWSmWSo7YyO9p0Agv
X-Received: by 10.55.73.144 with SMTP id w138mr10606258qka.104.1447249356258; 
	Wed, 11 Nov 2015 05:42:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Wed, 11 Nov 2015 05:42:16 -0800 (PST)
In-Reply-To: <20151111101548.GA2564@jama>
References: <20151111101548.GA2564@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Nov 2015 13:42:16 +0000
Message-ID: <CAJTo0LZPwD=HYXBZ-dJ4XgkLnTCwr+T2HDU1vzdb8EgWsc=YZg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-11-10
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
X-List-Received-Date: Wed, 11 Nov 2015 13:42:39 -0000
Content-Type: text/plain; charset=UTF-8

On 11 November 2015 at 10:15, Martin Jansa <martin.jansa@gmail.com> wrote:

> Finally some good results, only libsdl2 from oe-core is failing with
> default configuration (you need to disable wayland PACKAGECONFIG to get
> it built).
>

I had a quick look at this: the wayland packageconfig requires the gles2
packageconfig.  If this is trivial to resolve there'll be a patch shortly.

Ross

