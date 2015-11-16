Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD1B76294
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 10:38:11 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so53931106igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 02:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Lp1Mce3ozXZhS8Zhq3/LJXSkocvrH0sd3UVevNIAcwQ=;
	b=QBqW58ai9SDk6RU63dqKCAAWAYUXCoeHexDRZuKXJavOG2c/sYxhTw+lIqDlvnfzoI
	ejTi8AGyL4/CKrEFor6TWcRuf/buJk1ABqKssUlOfvTvh6rn9oa7rd3c+raeHh8xoH+y
	oORirDK03slCAvbB4l8co3LcJXafgw5cY0wtrS6zjUZ22kZnNuzxnSrpmeWprdKk6FB2
	0Xfd0xhZLE155sLfnSw3/G1fkIaNe4YYKcv1zga49HuNpnDhVar62aUhH5LoA2OG6vWg
	cVKxTAac2Cfacxdcu1XE0Of/lU0ysm4bwGA5BMkMQl0OmDOYzQ4fuw/R4dDY+eTO6mrm
	to9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Lp1Mce3ozXZhS8Zhq3/LJXSkocvrH0sd3UVevNIAcwQ=;
	b=T8l7UeoZfqAbRcewNltM6LtgbqeQBGXtXNRm155AQWopiwwQ4vP+22I9NhaU7aRIiS
	pHl59MCTnN6tSLZ/+KfS4FTPKzgq+JnFzWBxEojaIiUWNOLjr/8jo+L8axudC6jRS/CZ
	mxBndnV/WxK8K1LxqqLkPJBkQIEq/UVOCg0EJghInmtBjYiAE6Z5rTrYX5KuiEZnnvT1
	wcDaIyyMitmxIsXVQCV4U0A/DRD+2G1/pla5GUmdAiKNRiiykT0gh3ncqJh5hhifON3U
	7QusCQlNtcM0yn6ArZv+net2fO7MyifY8lG5SPUWj7oY0+pUCH0kl/GyGzUllXuIBC96
	aq/Q==
X-Gm-Message-State: ALoCoQnFRZujVOObezIScX61K2JLZCGUCQyDPJmoadeejBQ274qJwpjU5md5kF7jd97AlVApeUoT
X-Received: by 10.50.79.129 with SMTP id j1mr14632402igx.52.1447670291098;
	Mon, 16 Nov 2015 02:38:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 02:37:51 -0800 (PST)
In-Reply-To: <20151112185907.GL2574@jama>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<20151112171915.GK2574@jama>
	<58904.10.252.13.130.1447349938.squirrel@linux.intel.com>
	<20151112185907.GL2574@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 10:37:51 +0000
Message-ID: <CAJTo0LbxLwz7ijSoAmbj6ij51cGynk9Omf=M+QvbPQ7ahmo2Mg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Mon, 16 Nov 2015 10:38:12 -0000
Content-Type: text/plain; charset=UTF-8

On 12 November 2015 at 18:59, Martin Jansa <martin.jansa@gmail.com> wrote:

> > > There is already enough meta-oe bloat moved from oe-core:
> > >
> > >
> http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112665.html
> > >
> > > WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on glib-2.0,
> but
> > > it isn't a build dependency?
> >
> > If increasing bloat is a problem, why do recipes in meta-oe need to be
> > maintained indefinitely? Old cruft can be dropped from meta-oe, just as
> it
> > is dropped from oe-core. Just ask the public if it's ok, set a timeframe,
> > and do it.
> >
> > qt-mobility in particular has been dead for several years, and doesn't
> > even have official upstream tarballs anymore. Why spend time fixing it?
>
> That's why there is increasing number of PNBLACKLISTs with each release.
>

The recipes were removed from oe-core as they're dead upstream, and
basically as a courtesy moved to meta-oe so anyone still using dead
software can still build it.  If they're just bitrotting and literally
nobody is using the recipes then they should be removed: meta-oe isn't a
historical archive that you're expected to maintain for the next decade.

Ross

