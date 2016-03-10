Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id A36D96E680
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 16:52:04 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id vs8so21585512igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=evW0UcQNf9bxZuiak+kN76hGmpOaTiHAThgSNqfSNSU=;
	b=HU/iYhMxDAkoFJ13yiOgaZ4YrU+ATiF57RqakFtal5dlCjo4/yqwK76ho9LBNay6Eg
	of6kwq0yzhKAnXdCLYErTbdIRODvRHSrplH5hI6JrUpmzq7cRvdYLSh5qbHXso99ZjPi
	uLRTe7c1Ok6tETnTpm/y8RPi1Hejf20Egov33JalR9mzejLov9J8eQoRiYqWdlhdoUvx
	96kjUF6bZx9AQe/+05kkLbgcmqEa9+7ng1cUTna0pmqMkJ+ACPQ6DOU3rJKkB7pLGSgd
	Gq7/V1CyFSH7F+CCSV9pMTMJ9i26TuvCRNGgrzgqX/Ns27DTHFkKFnIeLQbEkKlqkGpu
	2Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=evW0UcQNf9bxZuiak+kN76hGmpOaTiHAThgSNqfSNSU=;
	b=Wv5EpUGY/fUxs2R4KDGy7vdEcMehmQd8OwcRIoP4LjED4CG7PP167r/bSqidJxqOTT
	z5IcagWnKJDM8/rTbEBHPW6KuPDejaDpVDuz37jOZA1wH2YPNlq8S9zCNePf4hNgJJxM
	Sor3oLHqS9XCgptWmGLKdXK13tQ+ddD01EptdA6xP45maDGyBZBInwCoHo2tg8bt8kOF
	aEFSW1osKlwSs1llEhitKAFnEzScGY059+n889NT2LZHjmwz8GEtL+rGjpUyjSl01pY5
	YRZqv8VMrtYXNvsXA/JEzCu8e3EYJd4QIqINfbpHl143+BEL+T9LsIXkgONJn8TJE5tt
	m8+Q==
X-Gm-Message-State: AD7BkJIDnyjbb34cuvlOrpECY3MqQ3gIP+rTE++PxmExCV9ogGElnn+RmQF8M62JcPS73B3+xwG2HcwYL22nDtjz
X-Received: by 10.50.43.226 with SMTP id z2mr5073185igl.78.1457628724979; Thu,
	10 Mar 2016 08:52:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 10 Mar 2016 08:51:45 -0800 (PST)
In-Reply-To: <20160310161330.GJ2573@jama>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
	<41b4e4a82cb652470eebe853bd1b6076cee59301.1457535831.git.alexander.kanavin@linux.intel.com>
	<20160310142507.GI2573@jama>
	<CAJTo0LbHXD_C+Nm6bjV=xc6MRtMJ=Ry=_Q4YG-ihyWiWHaQ5UA@mail.gmail.com>
	<20160310161330.GJ2573@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Mar 2016 16:51:45 +0000
Message-ID: <CAJTo0LZnsegS80eeExf27=DDytCotMRuYe8ryU7EWfEfWUOr-g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 14/38] python-gst: remove the 0.10 recipe
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
X-List-Received-Date: Thu, 10 Mar 2016 16:52:07 -0000
Content-Type: text/plain; charset=UTF-8

On 10 March 2016 at 16:13, Martin Jansa <martin.jansa@gmail.com> wrote:

> I still build images for om-gta04
> http://projects.goldelico.com/p/gta04-main/
> from time to time, but don't use them in real life anymore (not sure how
> many other people do) - the same with om-gta02, nokia900. Other
> meta-smartphone BSPs are used more actively in LuneOS, so no nukes on
> my meta-smartphone please.
>

Presumably Lune uses the BSP but not the software?

Ross

