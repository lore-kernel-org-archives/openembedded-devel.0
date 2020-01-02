Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A5F347FC42
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 11:08:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47pQHn2WYbzQJ;
	Thu,  2 Jan 2020 12:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577963285;
	bh=VjxvMV0svpUVPVLMxBrmjx5PyEQqQscLttbFerFuYgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2VqluynMwtgiQKjSZyKc2rPQ2kihqQvzIHcZEGQ13Tqi16zeCj2sLodgAPcCSFh1
	a8qNSd/t6w6sSJbcxWwhRluc+h6bt2L2K923mFgxLa/76q7w4mWKe7Eij4XNofO5nc
	59buIQIkULmrTVmBG4liMAPQ3r5UUrOiXTdX1TuDJg27uatRTKlTN8guEzFFZax27n
	ulpqKOBp4N4oBhNTZdPHl3UVA5ET8yHAIJic6dC8Nm/GTD6DHJ5jjsf/eB10Lo6aIp
	++g0xUGbvpHxofX6xYgsP5n9OC7LeHt/yuZO+ZaV87Pydf7hvCRppYrs5evaYKMJJl
	mHE1iU0pMYmtSKFUPodUtUnc+f8c2iOykkiRTr5sI/3Wyd9gtn2PxaQobIBp87GeeK
	i8n0lzGz/7U1YaDZCc+OWcyXJiwgGVr+Bbg4NRV6yjkz7yVo3D0RUqLh4gF5jHXjIc
	SkAJoQkoarVW1JgB1CTyFo07Vor91a/OPkygwAStpvM25itKsf8XgmINlIrMzhG04f
	hFhRN3998t7l3IpYbvbSz4dZI/843Urhm44dpcsHF4Q6TUQl+0qykJsU44U5mvxXtK
	0kr8Dh5GCApqyMMlYSvTytAOd8DucfiHRyfONHpSepI71SEZMLGnyCpyeL/DwFvE3t
	8zXLaw6TBkcLEmBrMQt5zyD0=
Date: Thu, 2 Jan 2020 13:08:03 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200102110803.GB11760@localhost>
References: <20200102061330.480482-1-raj.khem@gmail.com>
	<20200102061330.480482-4-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200102061330.480482-4-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/6] hddtemp: Fix build with latest gettext 0.20.x
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
X-List-Received-Date: Thu, 02 Jan 2020 11:08:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 01, 2020 at 10:13:28PM -0800, Khem Raj wrote:
>...
>  ...ame-to-configure.ac-and-use-external.patch | 14743 ++++++++++++++++

It should not be necessary to remove intl/ in the diff.

Removing intl from SUBDIRS and AC_CONFIG_FILES should be sufficient and
keep the patch at a readable size.

cu
Adrian

