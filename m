Return-Path: <prvs=3224e252f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 48A8661984
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2020 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1583061243; x=1614597243;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=7RuXYOrTMS6FT7sVj8Px/MJuh4VbahHwXPgJvVXzNZg=;
	b=RC1MhsJUi6PL3O5KzKEn97sQcQNnPZMCAPXIBILIiuVcv5PbekloZ0/x
	uDwcrrnM5bkkSlJn+UKU8yWUwnWi6L5bWVOifgNPjwgHv/+53lb3PyadQ
	SIB9WXVBhEzmQRHxMBgHHQVCc1ejG/N8gAVFKnsnvAf381Qf2Y3+j1wGL
	ksvOJnA4ZvMyV8PrxHKryzr/c83e4bdybyWbhNaZm7/Ob0Mi4+YinOMQc
	Ivo0h0DRlA2VtUFtFvSYYw4UmjINK7z8XEXOoCKbS9j/AAOl/ZRwbwGEd
	psr+W9LVWpZlq/9WTcv8Jic6YK288MFa5AlilQOvZEfi01xZpZ1cgFZxp A==;
IronPort-SDR: ulg0N6+rIqf++nKH9lNfProXJiszlxajpv+19kUPy3DVU8plYwnWTPbaPo6Hlbha+m3bCeRGnT
	ESJ/lOWRkX4+tkdknkjsoNHy4y/sPjKBlaudYD/gtk/87DtDnm5dK7RHcc66GBXlKIkEv4cpQg
	1rsV0BioaejpViZNUIPCHoLqjkA2X2Lu2F0vMEvRgXqfLu++4WFTeOBYLU05daeLA0we3p2s10
	/XH7/IEDUZ5TqBtzQ5CqGEBXdWU8Na6jooZlfx3VuLvUT5OSb+jR+kZ5o2wDzqENMnFROI16pv
	SP4=
X-IronPort-AV: E=Sophos;i="5.70,503,1574118000"; d="scan'208";a="22963188"
Date: Sun, 1 Mar 2020 12:14:00 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
Message-ID: <20200301111400.GB1806323@pcleri>
References: <20200226183011.x7pp6kwn6nlwgcrc@csclub.uwaterloo.ca>
MIME-Version: 1.0
In-Reply-To: <20200226183011.x7pp6kwn6nlwgcrc@csclub.uwaterloo.ca>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] openjre-8 fmacro-prefix-map problem
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
X-List-Received-Date: Sun, 01 Mar 2020 11:14:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Wed, Feb 26, 2020 at 01:30:11PM -0500, Lennart Sorensen wrote:
> On Mon, Sep 30, 2019, Vincent Prince wrote:
> > Hello again,
> > 
> > I see that there is a patch that should fix the problem:
> > https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-flags.patch
> > It is applied but it seems target compilation options are non filtered?
> 
> I just hit this problem too, and found out why it isn't filtering.
> TARGET_CFLAGS isn't actually exported so the build can't use it to filter.
> 
> Adding this to openjre-8_242.bb fixes the problem:
> 
> export TARGET_CFLAGS
> export TARGET_CXXFLAGS
> 
> No more problem with the host gcc/g++ complaining about -fmacro-prefix-map
> being unknown.

Thanks for the pointer. I'll take a look into it!

regards;rl

> 
> I suspect openjdk-8 would need to same fix but I didn't build that yet.
> 
> -- 
> Len Sorensen
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

