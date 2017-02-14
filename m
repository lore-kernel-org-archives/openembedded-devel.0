Return-Path: <ml@embed.me.uk>
X-Greylist: delayed 2294 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Feb 2017 14:56:07 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 24CBF731D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 14:56:07 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.20.1702131159380.3464@uk63952.mitel.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <358e792e-f48d-5880-1842-aecb4b54275d@embed.me.uk>
Date: Tue, 14 Feb 2017 14:19:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1702131159380.3464@uk63952.mitel.com>
Subject: Re: building netdata: "No package 'zlib' found"
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
X-List-Received-Date: Tue, 14 Feb 2017 14:56:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 13/02/17 17:01, Robert P. J. Day wrote:
>
>   i'm building a totally stock core-image-minimal for qemuppc with
> latest poky checkout, and when i try to add the existing "netdata"
> recipe to the mix, i get:
>
> | configure: error: Package requirements (zlib) were not met:
> |
> | No package 'zlib' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables ZLIB_CFLAGS
> | and ZLIB_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
>
>   apart from fixing this, how could this recipe ever have built
> before? i realize the current recipe for netdata is almost a year old,
> but should it still not build?
>
> rday

Recipe specific sysroots. Zlib is so common that it was probably already 
available in the shared sysroot to be compiled against, now there is no 
access to the shared sysroot it can't be found and fails. So this was 
always a dependency bug but one that was probably never triggered.

Cheers,
Jack

---
Tuxable Ltd
http://www.tuxable.co.uk
Embedded Linux Consultancy

