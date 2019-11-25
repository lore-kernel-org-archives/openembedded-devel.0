Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 356CF7FC4E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 03:08:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47LsS11KqNz4f;
	Mon, 25 Nov 2019 04:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574651313;
	bh=E5kHBQKXdWcJ7VO/0zXGS34NtUt3eDe3ozhp3jKP5nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t2RwXNjqNs3CfKfXqo4mSAZUnPUY4tN7EtmIXC26mrN7z5Plhr6rsusDaWzAMcJDX
	dithDWpLaWHoed93CIQIT4+cocZEvLgOVqLcdNS5FxXigQ/Pz+6oVstGJITES4zFaI
	OeF8RjEtBggH3F974M7qmriYLk5JDM0VLS+vUHPwW6mzvNd+dJj9DDASfAKjpXrP/V
	JsVW9qIMqMCdhtb1NL+lQyQ+i6xnQZByUJGEr9XuobD8kWCP4To22Nsha50VrzcK5v
	gX2IcsllKI8NlVpTSHvIpUWZMNMJa5oOsmKRuZkejmPtMz04L8eYQ2C9jIplB0HlPC
	aA97yt8aBUEVNqQ13US+nZ5tD9w8r3jGtxjHiaFB9YEKkb6N265EZmD1GbVhO5/9m0
	xW42QBKPBMEu8HZhyubSxuAPOH9DPkcSZf2QCVSA9D1w8dlir8ptO4jOteqoAD/LV+
	MUSMjUqZKRdMuOHfljYatTEblihYt1chfo8eXUbl3LOoh4x1Lb2hKLDgtcr4ieMPct
	jhft5EAOYeMOICjBwW7CInr//rN8bIgJ+E6eDNOdEGHTInqibGAw714GZMz0DLXZe8
	ynglUqGERYxJXtotGRnM6pagx7Iw9Q7py3ZkaU7MHe27sU8a0ZNR4axMC6O2d9pRoN
	51UXvPzAam2qpQUaTJuCX5uc=
Date: Mon, 25 Nov 2019 05:08:31 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Lei YU <mine260309@gmail.com>
Message-ID: <20191125030831.GA16252@localhost>
References: <1574315133-73046-1-git-send-email-mine260309@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1574315133-73046-1-git-send-email-mine260309@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] googletest: move to release 1.10.0
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
X-List-Received-Date: Mon, 25 Nov 2019 03:08:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 21, 2019 at 01:45:33PM +0800, Lei YU wrote:
> The googletest recipe was using 1.8.1 tag, and in the recipe it was
> using the git revision instead of the tag release.
> 
> Rename it to googletest_git.bb and use the 1.10.0 release revision to
> get the latest release.
>...

When removing the version from the recipe name you have to set PV manually.

> --- /dev/null
> +++ b/meta-oe/recipes-test/googletest/googletest_git.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Google's framework for writing C++ tests"
> +HOMEPAGE = "https://github.com/google/googletest"
> +SECTION = "libs"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
> +                    file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
> +
> +PROVIDES += "gmock gtest"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "703bd9caab50b139428cea1aaff9974ebee5742e"
> +SRC_URI = "git://github.com/google/googletest.git"
> +
> +inherit cmake
> +
> +ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY_${PN}-dbg = "1"
> +
> +RDEPENDS_${PN}-dev += "${PN}-staticdev"
> +
> +BBCLASSEXTEND = "native nativesdk"

cu
Adrian

