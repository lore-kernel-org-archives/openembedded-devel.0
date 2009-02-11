Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LXKil-0005TY-Ps
	for openembedded-devel@openembedded.org; Wed, 11 Feb 2009 20:26:08 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LXKhd-0004nU-A4
	for openembedded-devel@openembedded.org; Wed, 11 Feb 2009 13:24:57 -0600
Message-ID: <499325FC.6030401@dls.net>
Date: Wed, 11 Feb 2009 13:24:44 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <008c01c98b68$bb7386e0$325a94a0$@Willis@Distant-earth.com>
In-Reply-To: <008c01c98b68$bb7386e0$325a94a0$@Willis@Distant-earth.com>
Subject: Re: [PATCH] Add package for ntfs-3g 2009.1.1 (latest) and update checksums.ini accordingly.
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
X-List-Received-Date: Wed, 11 Feb 2009 19:26:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

John Willis wrote:
> This patch simply updates the NTFS-3G package to use the latest release
> tarball (January 22, 2009 - 2009.1.1).
> 
> Builds fine and quickly tested with no issues.

I can (and will) test on the NSLU2 (ixp4xx kernel).  What
machines/distros have you tested with?

If nobody objects, I'll add this version.

> Note: the ntfs-3g v1 package is suspect (download pulled from
> http://www.ntfs-3g.org/) so that may well be best removed? Not sure what the
> process is on such things.

Can you clarify what you mean by suspect?

> Regards,
> 
> John Willis
> 
> Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
> ---
>  conf/checksums.ini                   |    4 ++++
>  packages/ntfs-3g/ntfs-3g_2009.1.1.bb |   12 ++++++++++++
>  2 files changed, 16 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 conf/checksums.ini
>  create mode 100755 packages/ntfs-3g/ntfs-3g_2009.1.1.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> old mode 100644
> new mode 100755
> index 0eba0c8..5036fa9
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -15766,6 +15766,10 @@
> sha256=0bf226bb3a1716e6eb97355e08a7ffcf09aadfb91ba41ccef2ef1ba7a01719a2
>  md5=873a8de662849d129fc7c475ad3f5447
>  sha256=b5bbf81230bb21573d69fc471721b0b0c404eaa5040ef28e7dcec38320a1b2e4
>  
> +[http://www.ntfs-3g.org/ntfs-3g-2009.1.1.tgz]
> +md5=56e4aed24d0c2543597de0ba52b3ed64
> +sha256=0e02ff891645658c1801ba7d665c0ff3a4231e5570b974a803ffc2974ef68e45
> +
>  [http://downloads.sourceforge.net/ntop/ntop-3.0.tgz]
>  md5=1ec6055c75f1acbb5d5600492481ef85
>  sha256=c50cdf2c6cf7309f88c7ec0a56158eca76c80532502b36f3378eeca433423d83
> diff --git a/packages/ntfs-3g/ntfs-3g_2009.1.1.bb
> b/packages/ntfs-3g/ntfs-3g_2009.1.1.bb
> new file mode 100755
> index 0000000..7d73b79
> --- /dev/null
> +++ b/packages/ntfs-3g/ntfs-3g_2009.1.1.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS
> driver for Linux with read and write support."
> +HOMEPAGE = "http://www.ntfs-3g.org/"
> +LICENSE = "GPLv2"
> +DEPENDS = "fuse"
> +RDEPENDS = "fuse"
> +PR = "r0"
> +
> +SRC_URI = http://www.ntfs-3g.org/ntfs-3g-${PV}.tgz
> +
> +inherit autotools
> +
> +EXTRA_OEMAKE = "LDCONFIG=echo"


