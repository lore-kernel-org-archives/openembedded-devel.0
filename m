Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RvTRx-0001Xf-N8
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 13:50:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B5F743158ADD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2012 13:42:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id vuOwLHQDI93S
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2012 13:41:54 +0100 (CET)
Received: from [172.22.22.61] (drms-590c5a35.pool.mediaWays.net [89.12.90.53])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 3F6453158AC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2012 13:41:54 +0100 (CET)
Message-ID: <4F33BF11.4010009@opendreambox.org>
Date: Thu, 09 Feb 2012 13:41:53 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F2A97B7.2080709@opendreambox.org>
	<CAP9ODKqah-6Y6hp-beD0hUi=-r6VXJ02QD=puXFFYW2Hq8FACw@mail.gmail.com>
	<4F32CE7B.8050109@opendreambox.org>
	<CAP9ODKr+bmWJX8tjesyTvP8_4pEgFDXjOA+s2ZbSq5U+=PC4rw@mail.gmail.com>
	<4F331951.2010701@opendreambox.org>
In-Reply-To: <4F331951.2010701@opendreambox.org>
Subject: [meta-oe][PATCH] giflib: don't link against libx11, don't depend on libsm
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
X-List-Received-Date: Thu, 09 Feb 2012 12:50:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09.02.2012 01:54, Andreas Oberritter wrote:
> On 08.02.2012 20:48, Otavio Salvador wrote:
>> On Wed, Feb 8, 2012 at 17:35, Andreas Oberritter <obi@opendreambox.org>wrote:
>>
>>> I already explained in the commit message, why a PR bump is not needed.
>>> Can you please explain which other possible failures you're expecting,
>>> so I can learn why my reasoning may be wrong?
>>>
>>> This patch only fixes an unavailable build dependency at bitbake level,
>>> nothing more.
>>>
>>
>> Can the user call:
>>
>> bitbake libsm
>>
>> and then build giflib? in case of positive, we need to enforce have or not
>> it linked.
> 
> At the time I created the patch, the user couldn't run bitbake libsm
> (for the same reason that it wouldn't be built automatically through
> giflib's DEPENDS).
> 
> That said, I updated the repos after your mail and ran bitbake libsm in
> order to get the error message again, but the error vanished.
> Apparently, an indirect dependency on libx11 was dropped during the last
> few weeks. I searched the logs, but didn't find the change. Strange.
> Now, many x11 packages got built even though x11 still wasn't listed in
> my DISTRO_FEATURES.
> 
> Anyway, please consider this patch obsolete. I'll probably resend an
> updated version together with other patches to disable some more x11
> libraries on demand.

I did some further research regarding giflib:

- giflib doesn't depend on libSM alone, but optionally depends on 
libX11. When linked against libX11, it also links agains libSM and 
libICE, under certain conditions. Since libSM does not depend on 
libX11, the current giflib build is non-deterministic.

- Debian's/Ubuntu's giflib gets configured with --disable-x11 
unconditionally.

So we have two options:

1.) Pass --disable-x11 unconditionally like Debian/Ubuntu
2.) Add virtual/libx11 to DEPENDS, if x11 is defined in 
DISTRO_FEATURES, and add --enable/diable-x11 to EXTRA_OECONF

Because the current recipe didn't depend on libX11 and no one 
complained about it, I question the usefulness of linking giflib
against x11. Therefore I vote for option 1 (see patch below).

What does giflib do if linked against libX11?
- It builds a tool called gif2x11
- DumpScreen2Gif() gains support for dumping X11 windows

Regards,
Andreas

From eb1d09faa42fd7532338e0cc858ca1ff681bcaf8 Mon Sep 17 00:00:00 2001
From: Andreas Oberritter <obi@opendreambox.org>
Date: Thu, 9 Feb 2012 13:34:52 +0100
Subject: [PATCH] giflib: don't link against libx11, don't depend on libsm

libsm wasn't used unless libx11 was built before giflib. Therefore
drop the dependency on libsm and disable x11 unconditionally like
Debian does.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
index bd7b495..e1a0777 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "shared library for GIF images"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
 
 inherit autotools
 
-DEPENDS = "libsm"
+EXTRA_OECONF = "--disable-x11"
 
 PACKAGES += "${PN}-utils"
 FILES_${PN} = "${libdir}/libgif.so.*"


