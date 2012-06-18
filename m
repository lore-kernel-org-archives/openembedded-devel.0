Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dallas.a.clement@gmail.com>) id 1SgfQW-0002X3-1L
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jun 2012 19:07:44 +0200
Received: by werg55 with SMTP id g55so3644092wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2012 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=TopSv/+u9eEQdEd5lTNzQGlYTZbao+hXAn95JiCYhk4=;
	b=ziyzkdAxR8FsFsWoXOPmxLeWQwNzjYZo+GoQZjLa7RA8u1V1t5NOj8R48AGJq2nIS+
	zLBcITH8SzNWeLwuvpNjWOAj7TdXiEFMZWpv/amJmwN0TlL2qPt4gW4TatJz1Hz4I1M5
	g51zViUA83yFIuA0jcqVLJTGPyDENKRQ1icokz/MgrhnxgwEaSi6fQ6eQsrVp7bngtlt
	LhKwiwUJDh0+Jg04cBBMkNz74jFsNLNZEoBB96sOpKtMbs+6+hbtEFfTZsVz/IHbJm06
	j6SHkp/KOfHzIe1f8RGa9VzeK/j1DfTZ7wa84C5y0BjHWHoNApZj6VWaBs/2xrRaUg6Z
	FpFg==
MIME-Version: 1.0
Received: by 10.180.80.35 with SMTP id o3mr2459082wix.7.1340038621750; Mon, 18
	Jun 2012 09:57:01 -0700 (PDT)
Received: by 10.180.14.193 with HTTP; Mon, 18 Jun 2012 09:57:01 -0700 (PDT)
Date: Mon, 18 Jun 2012 11:57:01 -0500
Message-ID: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
From: Dallas Clement <dallas.a.clement@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Package selection
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2012 17:07:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Pardon my ignorance, I am a newb to OE / BitBake.  I've been building
custom embedded rootfs images the old fashioned way by hand for a long
time.

Recently I've been experimenting with OE / BitBake to determine if it
is suitable for my needs.  I want to be able to select exactly which
packages are included in my custom distro.  I tried to build the
"helloworld" example, and it seemed to download and build gobs of
packages, when all I wanted was the most rudimentary rootfs.  In fact,
for starters I'd like to build a rootfs that simply consists of a
statically built busybox and have the init process point to the ash
shell.  Is this even possible with OE?  Once I gain confidence with
something simple like this, I'd like to continue refining things by
adding packages that I select.

Lastly, it is possible to avoid the repeated fetching of source
packages?  In other words, can the source URI's point to packages in a
local file system repository?

Thanks much,

Dallas


