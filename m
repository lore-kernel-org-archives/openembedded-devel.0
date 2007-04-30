Received: from [66.249.82.237] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HiV4o-0000TJ-G1
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2007 14:34:00 +0200
Received: by wx-out-0506.google.com with SMTP id t14so1486969wxc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2007 05:24:45 -0700 (PDT)
Received: by 10.90.30.20 with SMTP id d20mr5076399agd.1177935885124;
	Mon, 30 Apr 2007 05:24:45 -0700 (PDT)
Received: by 10.90.50.5 with HTTP; Mon, 30 Apr 2007 05:24:45 -0700 (PDT)
Message-ID: <c384c5ea0704300524w40a360adne073f9576ee71e19@mail.gmail.com>
Date: Mon, 30 Apr 2007 14:24:45 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: RFC: kernel configure steps hang if make oldconfig goes interactive
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2007 12:34:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I have noticed some kernel builds use an outdated defconfig (because
they use that of another kernel), the one I'm now encountering is
linux-efika-2.6.18+2.6.19-rc6-r2.

During the bitbake configure task, such a package will hang the build
(with a part of the interactive oldconfig output, but no interactive
ways to influence it).

do_configure() {
                install -m 644 ${WORKDIR}/defconfig ${S}/.config
                make ARCH=${ARCH} oldconfig
}

This can be made more robust by doing:

do_configure() {
                install -m 644 ${WORKDIR}/defconfig ${S}/.config
                yes | make ARCH=${ARCH} oldconfig
}

Is this something we would bring in?

Regards,
-- 
Leon


