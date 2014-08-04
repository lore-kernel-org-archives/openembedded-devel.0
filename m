Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 92F0A60017
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 03:05:10 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so9136245pab.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Aug 2014 20:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=poIg0ielRhLHMj5SS4Ojd0dcfQrz0sXFdtNFg3upi3s=;
	b=dQVykIFgW5nSoVSacX06V+atzuXowPQ5JYiMZGfVI4YI/QaoSCGNKFvp36I4iggVwa
	j6rwFC3mPCMYQ3R4L+FwiHhGTzv+hH//xPPZA9c24sAUTzAKRd/Iq9XnMouagiluR9En
	bHS4Q9h0l/xjsOX5ZpTcrjU76y0wUKlOhLWINUpAcG1sK1eelPw/zLkW2l8AZWiwJRP2
	GaY+TTWegxGn7heejMrtP86nE8mwoOYkcv4kwu0Ot1wSMaSfC/CI9Df/SfhpKVRqwbAQ
	vmaq4KgMfmWGqgi2PLJJiYJWHrNPYxNTdVDyF+Pkp/xvTQar0vtyXsa8AgjKl4Ebllmo
	ZVDw==
X-Received: by 10.70.89.139 with SMTP id bo11mr21182984pdb.50.1407121511253;
	Sun, 03 Aug 2014 20:05:11 -0700 (PDT)
Received: from haswell (c-98-207-177-218.hsd1.ca.comcast.net. [98.207.177.218])
	by mx.google.com with ESMTPSA id
	ue3sm15743004pbc.49.2014.08.03.20.05.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Aug 2014 20:05:10 -0700 (PDT)
Date: Sun, 3 Aug 2014 20:08:00 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140804030800.GB18172@haswell>
References: <017701cfaf7e$77e1a390$67a4eab0$@lge.com>
MIME-Version: 1.0
In-Reply-To: <017701cfaf7e$77e1a390$67a4eab0$@lge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: How to apply "-Wl,--build-id" in all recipes?
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
X-List-Received-Date: Mon, 04 Aug 2014 03:05:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-04 09:53:12, Changhyeok Bae wrote:
> Hi
> 
> I would like to apply "-Wl,--build-id" in all recipes option when I build a
> image.
> I tried to write TARGET_LDFLAGS += "-Wl,--build-d" and BUILD_LDFLAGS +=
> "-Wl,--build-d" in local.conf.
> But it's not applied.
> 
> Do you have any idea?

Did you do it in local.conf or some other global config data files ?

