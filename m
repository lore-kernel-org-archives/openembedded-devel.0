Received: from [209.85.217.15] (helo=mail-gx0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mturquette@gmail.com>) id 1L74M0-0003Fs-H1
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Dec 2008 09:42:04 +0100
Received: by gxk8 with SMTP id 8so2150018gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2008 00:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=ZUX78OatT1IERTT/eG/OwjOuYAK6MP/omFsvIkPNW/s=;
	b=Y2N/olDPpRl3qIqjH2WDfUeCuXjM14kiD2zpWn2mdyPGuie+9sCykI6YdQAV7usHmY
	dc1/M7CTHfB+tCITpnZ3T0NYyAXfLgicqJPaZZE2Hj3Xkmx/dKUu0vBMTdVIyK4WM56c
	xaOc8Ap5nweix8ma391XQIkh+Q762yphaaScY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=o2GzSPVXVJWAOUt2Mpjk9HGZLAe16v6cmr6vIU5vqVNz7l2LnKUziO840ihERQSwon
	ocG/PCuDMxY97Ilhnpb8DZmoh3xDi3b+dtM6h+JOtCJIb+Tw+CifDPKn+qm6FO7Uolli
	f+br6dRcjJqOnRl2yVfG0TSAMJow+qWw7/iIM=
Received: by 10.151.39.2 with SMTP id r2mr3773766ybj.193.1228120721960;
	Mon, 01 Dec 2008 00:38:41 -0800 (PST)
Received: by 10.151.134.3 with HTTP; Mon, 1 Dec 2008 00:38:41 -0800 (PST)
Message-ID: <59e7e6f90812010038u77d22e6m181cb0a02f732220@mail.gmail.com>
Date: Mon, 1 Dec 2008 02:38:41 -0600
From: "Mike Turquette" <mturquette@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: conditional kernel configuration
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
X-List-Received-Date: Mon, 01 Dec 2008 08:42:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I was recently looking into configuring the kernel dynamically based
on IMAGE_FEATURES.  Here is a snippet from my kernel recipe:

OVERRIDE_WLAN = "${@base_contains("IMAGE_FEATURES", "my-conn",
":mywlan", "",d)}"
OVERRIDES .= "${OVERRIDE_WLAN}"

SRC_URI = "git://some_tree"
SRC_URI_prepend_mywlan = "git://some_other_tree_with_wlan"

This is a simplified example of what my recipe does (in fact I don't
fetch from git in this recipe at all).  But the point is clear:
looking for my-conn in IMAGE_FEATURES (which is set or not set in
my-cool-image.bb) should determine whether SRC_URI has one tree or
both trees in it.

The problem is that IMAGE_FEATURES only has the stuff specified in
local.conf when the kernel recipe gets selected (this obviously
happens when I bitbake mykernel, but also when I bitbake
my-cool-image).  All of the features specified in my-cool-image.bb are
not in it (yet).

Am I going about this the wrong way?  I would really like to
conditionally set which code to build in my kernel recipe based on
whether or not the my-conn task is included in IMAGE_FEATURES.

Any other solutions that depart from my IMAGE_FEATURES scrape method
are very welcome too!

Thanks,
Mike


