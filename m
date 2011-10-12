Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RDyq0-0000ly-2V
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 15:27:12 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 690CA6AACAD; Wed, 12 Oct 2011 07:21:30 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6A0B216601A9;
	Wed, 12 Oct 2011 07:21:27 -0600 (MDT)
Message-ID: <4E959457.8030908@mlbassoc.com>
Date: Wed, 12 Oct 2011 07:21:27 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: mgundes <mgcse@hotmail.com>
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
	<4E95893C.6050903@mlbassoc.com>
	<CAObi9r8Vm92XauJ1nh50qBC4uz9OyyfhYSUW0YMdRCsFdOmgbw@mail.gmail.com>
In-Reply-To: <CAObi9r8Vm92XauJ1nh50qBC4uz9OyyfhYSUW0YMdRCsFdOmgbw@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Wed, 12 Oct 2011 13:27:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-10-12 07:10, mgundes wrote:
>
>
> On Wed, Oct 12, 2011 at 3:34 PM, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     On 2011-10-12 06:22, mgundes wrote:
>
>             Hi,
>
>             I think one of the big issue with OE is build time. It does everything
>         for you, so that it takes too much times. I want to minimize build time and
>         realized that OE creates ipkgs for almost every package. If there is a way
>
>
>     Not true.  Only the packages needed to complete your image will be built.
>
>     That said, there are some packages which are built (the first time only) that
>     comprise the build environment and tool chain which takes a lot of time, but
>     this is only the first time through.
>
>     What image & target are you building for and what packages are built that you
>     don't think needed to be built?
>
>
>
>       In my tmp/work directroy there are 868 ipk packages which was created by OE:
>
> $ find -iname *.ipk | wc -l
> 868

You'll find nearly 1/2 of those are support packages, e.g. XXX-dbg or XXX-dev, which are only
used for development or debugging and not normally installed on your image.

>
>       I use arm based pc7302 chipset and vendor supplied machine and distro configuration. I use standard filesystem with packages like below in my rootfs image.
>
> IMAGE_INSTALL += "base-files base-files-doc  base-passwd  busybox  bash  mtd-utils  dropbear  ethtool  firmwareupdate  strace  oprofile  kernel-modules  memview \
>                                  modutils-initscripts modutils pareadback picomon2 picoifapp picofuse ubootenv"
>
>       Of course every needed packages should be built and located into rootfs filesystem directory.
>
> "ipk" and "deb" files are used to install target system, right? I mean If I don't need ipkgs as a developer, it would be nice if there is a way to prevent ipkg creation steps. As
> far as I know, OE creates ipk from built package's files and then use created ipks to create rootfs directory; then creates image from rootfs directory. I am asking that what about
> directly creating a rootfs directory and install built package files to rootfs after compilation in install tasks. By this way there is no need to create ipkgs? Am I right?

That's not the OE philosophy.  Using ipkg (or rpm) is a way of keeping the relevant files
in a convenient, reusable, container.  These containers are then used to build the image.
By having reusable containers, you can [re]use the same set to build multiple different images
without having to rebuild the component pieces.  Also, the working directories used to
build the packages can be purged after the package containers have been created.

>
>         to prevent creation of ipkgs it would be really good for me. In my opinion,
>         it would be fine for other people too since usually rootfs directory is
>         enough and ipkgs are not frequently used directly by developers.
>
>             I have asked in freenode oe room but friends said there no way to do that
>         in OE system. If there is no way to do that in current OE, do you plan to
>         add as a feature?


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


