Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4C96B512
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 07:34:47 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 500)
	id A84EB22051A; Wed, 28 Nov 2018 08:34:47 +0100 (CET)
Date: Wed, 28 Nov 2018 08:34:47 +0100
From: Max Kellermann <max+openembedded@blarg.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181128073447.t7zp2zmi4ozx4zb3@swift.blarg.de>
Mail-Followup-To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20181119172519.28377-1-max+openembedded@blarg.de>
	<CAMKF1srm_TiixkGadQhAk-dLTj2CmKoj47QmKOf=9OEtK+VjJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srm_TiixkGadQhAk-dLTj2CmKoj47QmKOf=9OEtK+VjJQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] mpd: update to 0.21.3
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
X-List-Received-Date: Wed, 28 Nov 2018 07:34:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2018/11/28 06:53, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Max
> 
> it fails to build with systemd see
> http://errors.yoctoproject.org/Errors/Details/202303/
> 
> It seems the new meson change is not installing the system unit files
> and socket file during do_install properly, one way is that we explicitly
> install/copy them during do_install, but I think its better to fix it in mpd
> itself if possible

We had this problem already when I submitted version 0.21 for the
first time, and my 0.21.3 patch contained more explicit options to
enable systemd, hoping to make it fail earlier, but it didn't.

Packaging with systemd works perfectly fine here on my machine, all
the units are in the right place.  Unfortunately, your Yocto build
logs are devoid of any hints what went wrong.

So yes, I agree with you that we should fix this in MPD upstream (I am
the MPD upstream maintainer, btw.), but I have no idea what's wrong.
If only I could reproduce the problem.

Is there any way to get more verbose logs from your build bot?

Max

