Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 654E962137
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 08:53:28 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id g8so39091840igr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lwfa8BJL5SYaBWticY86LwIaK5uEYAXoozuNZGY7ZJE=;
	b=uU4bykzP8wjB05IQjqoOZDhe/+ujSOsOBMWftGzHTTbfO6ABjPwArAXHPknb8tQqQn
	H0/QK8CB3AZqeE6bRLHvke4llZK6p+8YCHSnyhiP39L8ez+l45QgiRBXKDXIR4sycg5J
	naojKFyn0Op4D5+9H66EBg5jVly4Nwwj94b/AJM6pl6QcTVTcqiGltdl4jDR5ggNgTOF
	yfcAryPoBACLJIw/sPlXDkWGA0uBN9VwYUk+TYtuEQpiSZK8jeAzB1l60nRcjg8zpaBZ
	Uo7HLk3aFZ8u+YNL9Nub0lHkiBy7rWWeu2aZj93/7DrrmbWh2P56yiTAo/GgoeU419KP
	7Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lwfa8BJL5SYaBWticY86LwIaK5uEYAXoozuNZGY7ZJE=;
	b=NcR0I8nGIdnlwvl9xQt/+n9WQhGkSNWvZ6m9IRmFMizGzc9alQFI4bTcbJZfc68txJ
	SaX/fYZtNTO94kYlH+mIwbMw+TnT6MWi352H4uRYmz63vdH05EVApS3KyJuNrXcgW3J4
	p4XZflZcsCTvoknoczUPi/O+tXMZ8lGNrOeb6NmNSP//rxpd2AJMix49rRuRVHQ7YqDD
	YW9YiuWBvktRZDJP+9nB73JobFvJ4RLrlVPVkqPdmewsqAyrjgPuOVDOqKLwJuGPgu+d
	09XHQE9ew/BoiISfyaGf5l2rYEZOTJnHqkb3gGxv/uAwDv4gmylrgHuh6Osnwd4zZ1A0
	u1Fw==
X-Gm-Message-State: AOPr4FUyJ8AtAowqOqrsUKM7IsPSVJTSYOOdJAwpfLYm1GMyW8aEHT81FiwRgSBeW2P/iQ8Eq6XIjbo5ixbH2OhB
X-Received: by 10.50.150.1 with SMTP id ue1mr24101938igb.52.1461747209154;
	Wed, 27 Apr 2016 01:53:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Wed, 27 Apr 2016 01:53:09 -0700 (PDT)
In-Reply-To: <CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Apr 2016 09:53:09 +0100
Message-ID: <CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [OE-core] [RFT] GCC 6 Recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2016 08:53:30 -0000
Content-Type: text/plain; charset=UTF-8

Finally made errors.yp do the right thing:
http://errors.yoctoproject.org/Errors/Latest/?filter=91ef7bf5ad13304827e2ef06738f7fc28ed650f6&type=commit
is a list of all the failures.

Ross

On 27 April 2016 at 09:02, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 21 April 2016 at 04:06, Khem Raj <raj.khem@gmail.com> wrote:
>
>> I have updated
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-6
>>
>> With few more patches added now. Most of packages in OE-Core are
>> building fine except linux-yocto on mips and ppc
>>
>
> I threw this at the autobuilder.  Lots of c++ failures on various
> architectures.
>
> https://autobuilder.yoctoproject.org/main/tgrid, the row for SHA 91ef.
>
> Ross
>

