Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id BB26877B50
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 07:00:28 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1dChKI-0003hd-7Y for openembedded-devel@lists.openembedded.org;
	Mon, 22 May 2017 09:00:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 22 May 2017 09:00:16 +0200
Message-ID: <ofu29q$9i3$1@blaine.gmane.org>
References: <1495390919-25435-1-git-send-email-maryan.pricak@gmail.com>
	<CAMKF1spDgUYVyRGcBKNmJhb35H5_VjGi0JkLyGboKeU8YkPb-g@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
In-Reply-To: <CAMKF1spDgUYVyRGcBKNmJhb35H5_VjGi0JkLyGboKeU8YkPb-g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libteam: Initial support
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
X-List-Received-Date: Mon, 22 May 2017 07:00:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 22-05-17 om 03:48 schreef Khem Raj:
> On Sun, May 21, 2017 at 11:21 AM, Marian Pritsak 
> <maryan.pricak@gmail.com> wrote:
>> libteam is a library for controlling team network device. Provides
>> utils package for network device configuration.
>> 
>> Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com> --- 
>> meta-oe/recipes-support/libteam/libteam_1.26.bb | 33
>> +++++++++++++++++++++++++ 1 file changed, 33 insertions(+) create mode
>> 100644 meta-oe/recipes-support/libteam/libteam_1.26.bb
>> 
>> diff --git a/meta-oe/recipes-support/libteam/libteam_1.26.bb
>> b/meta-oe/recipes-support/libteam/libteam_1.26.bb new file mode 100644 
>> index 0000000..db1e4a9 --- /dev/null +++
>> b/meta-oe/recipes-support/libteam/libteam_1.26.bb @@ -0,0 +1,33 @@ 
>> +SUMMARY = "Library for controlling team network device" +HOMEPAGE =
>> "http://www.libteam.org/" +SECTION = "libs/network" + +PE = "1"
> 
> Drop this if this package is new.
> 
>> + +LICENSE = "LGPLv2.1" +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=4fbd65380cdd255951079008b364516c" + +DEPENDS =
>> "libnl libdaemon jansson" +${PN}-utils_RDEPENDS = "bash"
> 
> this looks reversed may be you meant RDEPENDS_${PN}-utils

And R* variables need to go below do_install



