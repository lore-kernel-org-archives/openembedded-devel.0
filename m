Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id ECC7465CBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2016 03:10:49 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id ph11so204755100igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 19:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=fFMO19m5lHuDaTsfkFFmBbr9rBB4HMdBNJ9dtnObYb0=;
	b=Z97ZSoAYXJeDJ1rZKHeYDYlqFWF0jFqhqu/h31WduAvRElGlk2aF+AG4c8PWgqkRT7
	85u/RMI+1+E1zqPUVSwPe4W/qL4KdHiFjEr3B0VAwIkcuoSFKO6XEz/dhr0KN5uyHG9R
	8nnCb7Wd6TCWwIwcLsd92BDOoWqQ8usqFLr3CxQgf7FkG/LJjkAFE1DbZ+IEHJjgZjwI
	6I7TsjdcCfrNp0vyyMZ45zXcSdk9xEYrxhwMRHUT3bxxVSWyWsIQB7c0zdbYu3yvcBby
	VHnwWu5IAwMnjKLXTIPA77mnQ8wdixptUvCoiLwCpvZb++pW7jiO1QrFq26Ywh64X5W5
	4kzg==
X-Received: by 10.50.131.201 with SMTP id oo9mr30639722igb.68.1451617850020;
	Thu, 31 Dec 2015 19:10:50 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id m6sm233240ige.3.2015.12.31.19.10.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Dec 2015 19:10:49 -0800 (PST)
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <56837748.6020903@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5685EE2D.3050908@gmail.com>
Date: Thu, 31 Dec 2015 22:10:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56837748.6020903@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: chromium 40.0.2214.91 doesn't like gcc5.3
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
X-List-Received-Date: Fri, 01 Jan 2016 03:10:50 -0000
Content-Type: multipart/mixed; boundary="------------040108000506090008070002"

--------------040108000506090008070002
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The version of chromium we're using is a bit old (it's almost a year old
now) and I thought that maybe a newer version might have the required
fixes in it already. Along those lines I tried updating the recipe to
build chromium-49.0.2607.0 which was released December 30, 2015. As it
turned out 49.0.2607.0 didn't have any fixes for gcc-5.3, I ran into the
exact same build problems I had seen building 40.0.2214.91 with gcc-5.3.
But, for fun, I thought it would be worth seeing if I could get
49.0.2607.0 to build and, patch after patch, I not only got it building
but I have also run-time tested it on my turbot. These patches, by the
way, adjust the code and don't simply turn off compiler warnings/errors.

I haven't tried getting 40 to build, but seeing that I have 49 building
(and running) I was wondering if I should work on getting 40 to build (I
assume most of the patches I developed for 49 will probably be the same
for 40) or should I just concentrate on updating the recipe to 49 and
getting that to work?

There's a lot of wayland-specific stuff in the recipe and I've never
built or run a wayland image, so if I'm going to work on making sure my
recipe for 49 works it'll take a bit of time for me to wrap my head
around the wayland stuff. Also, from what I can tell, the Linaro people
use their own branch/version for their ARM builds[1] so I'm wondering
how much testing people would need to accept such an update?




[1] https://github.com/ndechesne/qcom-oe-manifest/blob/master/default.xml

--------------040108000506090008070002--
