Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (unknown [209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id C43A86611E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 10:14:01 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so2461954qgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 03:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Ffgsm/GbgbFy0cJ1lu+6F5LgTwGtjoe6Tm+itegjXo4=;
	b=GirxasXyewl/qH6MPeJIgroA47EiTS89s65/yZXdRSirf1+JoGbBXhHiX4tjmYB/OD
	6CQFAPYeJ0isj9lS4zr+eYnH1+2Bq361EicEBTyGwbj/A3N5nzAmVwbYlntERJqHhEo1
	8ftFtfhjuQtf+LOET4lTYBKDtSr8k0C0FD1y/SqDc1opBwq2G+hTH8XHko+p0Zi5q3se
	o72KMYFbwUGegSVUWClBbEDQ6tIkmAo0JMhhz5/JprufpbSccaQ2D42cnP1ZbIlk+P0c
	P78FGiMiXBMOZcW6Tmz+o2BQFJ/CiaMgz6MqPxcJog6nWXL3r2BHzqJAgBKhF/JqgkWT
	qPkg==
X-Gm-Message-State: ALoCoQkEiekRUbBnGwdXTqHGCPcZy+zSlBrgWpwkurfZhmlXeNVRilvPRo3fisAIJXpV6kGWLgfb
X-Received: by 10.140.28.3 with SMTP id 3mr3910973qgy.71.1400062442975; Wed,
	14 May 2014 03:14:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 14 May 2014 03:13:42 -0700 (PDT)
In-Reply-To: <CAJTo0LasCMwBLQVqgVVwdpLb4ScpKXW0dAPOLKKLcYjxrZeSoA@mail.gmail.com>
References: <CAGw0TDP6FDCfCyWjj2Akm+BfNButm5q93kGC=G8-MKCNxTuG+A@mail.gmail.com>
	<CAJTo0LasCMwBLQVqgVVwdpLb4ScpKXW0dAPOLKKLcYjxrZeSoA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 May 2014 11:13:42 +0100
Message-ID: <CAJTo0LZzTESabuYOF8fakqV2JazLuKt4DtGFAMJ+YDFOAP0eJQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: freetype build error 'libfreetype.la: No such file or directory'
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
X-List-Received-Date: Wed, 14 May 2014 10:14:07 -0000
Content-Type: text/plain; charset=UTF-8

I've just sent a patch to the oe-core list to fix this.

Ross

On 14 May 2014 09:50, Burton, Ross <ross.burton@intel.com> wrote:
> On 14 May 2014 05:57, Charles Oram <charles@oram.co.nz> wrote:
>> |/bin/grep:
>> /home/charles/fsl-community-bsp/build/tmp/sysroots/cubox-i/usr/lib/
>> libfreetype.la: No such file or directory
>
> Saul saw this once but I never managed to replicate it.  Doing a clean
> and rebuild will probably fix it, although that is a work around and
> not a solution...
>
> Ross

