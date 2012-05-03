Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQ0jK-0002iu-BX
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 20:26:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 May 2012 11:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149027415"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2012 11:16:30 -0700
Message-ID: <4FA2CB7E.7080600@linux.intel.com>
Date: Thu, 03 May 2012 11:16:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
References: <CACW_hTb5BO+mS07Xnd534N5V-ETtwrXc=NNo67kxcemQPGuJog@mail.gmail.com>
In-Reply-To: <CACW_hTb5BO+mS07Xnd534N5V-ETtwrXc=NNo67kxcemQPGuJog@mail.gmail.com>
Cc: yocto@yoctoproject.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] yocto 1.2: 2nd experiences: image building problems
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
X-List-Received-Date: Thu, 03 May 2012 18:26:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2012 01:01 AM, Frans Meulenbroeks wrote:
> Dear all,
>
> I'm migrating a project from oe-classic to yocto 1.2.
> This goes fairly smoothly. Got some warnings I reported before.
>
> If I build my app it runs fine (with the uclibc from oe-classic that
> is already on the board).
> Next step was to try to build a complete image.
>
> There I encountered two issues.
> The first one was that my image recipe had a few SRC_URI += lines.
> This to get the static device table I am using and two files I needed
> in my IMAGE_POSTPRCESS_COMMAND.
> However yocto immediately goes into do_rootfs, and does not have a
> fetch/unpack step (as oe-classic used to have).
>
> I have worked around this by adding
>
> python do_get_src () {
>      bb.build.exec_func('base_do_fetch', d)
>      bb.build.exec_func('base_do_unpack', d)
> }
> addtask do_get_src before do_rootfs
>
> to my image recipe. I think it would be nice to have this
> automatically done if a non-empty SRC_URI is found (but unfortunately
> I am not enough of a python wiz to provide a patch).
> Anyway that kept me moving.
>
Can you file a enhancement bug for the above issue.

> The second issue is probably lib related. As I need a small footprint
> (not too much storage available) my project uses uclibc.
> When building the image I get some 15 or so of these:
> | 	rtld(GNU_HASH) is needed by busybox-1.19.4-r6.ppce300c3
> | 	rtld(GNU_HASH) is needed by i2c-tools-3.0.3-r0.ppce300c3
> | 	rtld(GNU_HASH) is needed by libz1-1.2.6-r1.ppce300c3
> ...
>
> I noticed that eglibc has this:
> meta/recipes-core/eglibc/eglibc-package.inc:RPROVIDES_${PN} =
> "glibc${PKGSUFFIX} rtld(GNU_HASH)"
>
> but I did not find a similar RPROVIDES for uclibc.
> Not sure whether it is missing there, or whether the dependencies for
> the packages like busybox and libz1 are wrong.
> Anyone any advice ?
>
Khem might be able to help with this maybe.

Thanks
	Sau!

> Thanks, Frans
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>
>


