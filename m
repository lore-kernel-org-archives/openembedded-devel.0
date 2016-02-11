Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3C64960119
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 14:11:54 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id g203so29722146iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 06:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=1gdlAl6r7sy/ToS2wspGHZeoD6au7KTiV6LyS59jJ6M=;
	b=TX0nb3HQv1PeNH09wFF3ViVBgTT3oYS5p1lB/ii3GLrX/Ee+HDev+MS3Lc7bc+8zz+
	RqV0rfCUyROyOGbq+7sZoopvfSF59pbtJDMeQSr+vMAbLgo8tdUhm0A+jUEW1vrnY7Rc
	UC1zfVqvbhnyRH9v/mnwVmc4KiGruW/M5utfppH99Xv6AHOKhu97Si32jYhxHlsRmIKK
	GlYKobWu8gehIuv8us3AwGWHEY+8UjkiKrmnorkO7wgx5+wz1OkePu2RioJpdIariLMH
	uajItLVyapI4rw9yp8uIaDgOrygYYVvl5OnUdx1NZ6Ut4z/uWm+fTjfOQecBi0vOGlTO
	YAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=1gdlAl6r7sy/ToS2wspGHZeoD6au7KTiV6LyS59jJ6M=;
	b=HrIzLLdADzLPo1lKwZD9/OMs5p7Mz2HyNbykGW3Lkgp8Co/NrUl3Je3wNVuQnuB/b2
	bZhMpg1yLIx7JCX2yvB7y1Q9li+W2nuQ9Ct3MMygWKF0617yXm+u7xZN8ncU0058lOPe
	2V8TB/b6ZncwMTseOaIW6iIikOoDzk1z1+IDAo6nMs61CHmvw6FGBUR6ViuZQEO+zcN6
	5NgGIhqI620T2Ag95fBT8eoPNAb6dHKzM8ONXEMWinVVhBvYHbL6xuh5+L9oPbjA0uKQ
	H1++T+Lsvzm14s1fJ7+w4LVxUm2KtCEkn6xn29WNqLoUGlsRhMRSR9c2uQW7V9ERxsee
	F9/g==
X-Gm-Message-State: AG10YOTBuOJAdNngc3zfH+OukLt6c8joVNgl9BUmYkpmICOEL4TfANpjT1yI4TfVBz5Ec4EyPVH4CJrsOneLCcVG
X-Received: by 10.107.164.15 with SMTP id n15mr41053858ioe.148.1455199915562; 
	Thu, 11 Feb 2016 06:11:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 11 Feb 2016 06:11:36 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Feb 2016 14:11:36 +0000
Message-ID: <CAJTo0LaMycXVjZLoPMU7Te2HDpp7+YUu8GGuNznhk8D8Yje27A@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Dropping Debian 7 as supported?
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
X-List-Received-Date: Thu, 11 Feb 2016 14:11:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm proposing that we drop Debian 7 from the supported distributions list
in master, so that the 2.1 release supports Debian 8.  Debian 7 was
released in 2013, Debian 8 superceded it in April 2015 so will have been
out for a year when 2.1 is released, which also means that is when Debian 7
stops receiving security fixes. Nobody should be running Debian 7 after
April 2016!

Any objections?

Cheers,
Ross

