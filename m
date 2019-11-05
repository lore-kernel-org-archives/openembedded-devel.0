Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 272257F986
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 13:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 476rlR30FTzCL;
	Tue,  5 Nov 2019 14:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572962115;
	bh=plzQlNIUy+APl24dDBsZfFOluiD/RtETEWwRt1bMkOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I12UfKQjtzUmACmnhcJ/wUFjATVq9IlzY26q5pSQfIj5zIz+oVRPyx32OIRIUYsrg
	YQSNRgAAnEpwJGVbGyMCeokUtaoCWMqvEeSDS0uwHj7TaHCNWCGw/53ZWt0rVdDiS6
	anEVmpqdCUgBDP/CKGzdAqvsbcuM6U6VN6hPjZ5AKbq2CcobBHWPvYjVJru/FPaxHJ
	fi0RVkeQZCxjEcBaTxiNqrAy3ouByW1Le6bs8r9svmNKcCX2vqYVaBl87nB9zubzq1
	oXCKUcrUUStnnTatW04hLW8cNe2sSmc/2vMvFB7do2LSmpuvA94ez59Ien8ABv0tuN
	zNvYIlHG2FXY0xzeRcCSWKlWbg24DLOWal4ihuViWP9LaBW/CYnADU3wsrJB1EWua8
	r9CAROZhmAU6aDCRn9OELJyxVbCgatbHH4lV9FJjpHcct1vci1Hfri4XeXVkgS617W
	n0aBkvL7uuugFi70cdaU+XbK7zQM+t2FF6cv4tAJk1Jq9yN0pW8jdzw9M+AX/eH0+Q
	x3NZ6R49G59qjsL0IlgmWr1k2Y8MBEyUc4J//FIqe99MfQAEPkitvSsqG0lZ5g7+Vo
	R6V2k+rD+EhtH6qMVtZLirrhiNoBjOICAmyxZGxfPk/0CkdL2QbuMkhaqi2AaBvJwy
	wQZJlWap2UZ1ii9/v9/hqhi8=
Date: Tue, 5 Nov 2019 15:55:12 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Martin Siegumfeldt <mns@gomspace.com>
Message-ID: <20191105135512.GB20425@localhost>
References: <20191105120031.6579-1-mns@gomspace.com>
MIME-Version: 1.0
In-Reply-To: <20191105120031.6579-1-mns@gomspace.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe,thud][PATCH 0/6] libiio: backports from master
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
X-List-Received-Date: Tue, 05 Nov 2019 13:55:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 05, 2019 at 01:00:25PM +0100, Martin Siegumfeldt wrote:
> Backport libiio patches from master bumping libiio to v0.18 and

Upgrading on an upstream stable branch can be OK,
especially when this is the lowest risk way to fix CVEs.

But upgrading to new releases on the master branch is usually not worth 
the regression risk - the default is to avoid changes in OE stable branches.

> allows building python3 bindings
>...

No new features in OE stable branches.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


