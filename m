Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-08.prod.phx3.secureserver.net
	(p3plsmtpa08-08.prod.phx3.secureserver.net [173.201.193.109])
	by mail.openembedded.org (Postfix) with ESMTP id AF8206AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 11:12:43 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-08.prod.phx3.secureserver.net with 
	id 1PCj1p00Z0BVjqb01PCk5m; Fri, 10 Oct 2014 04:12:44 -0700
Message-ID: <5437BF2B.9060909@pabigot.com>
Date: Fri, 10 Oct 2014 06:12:43 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	"Fan, Wenzong (Wind River)" <wenzong.fan@windriver.com>
References: <cover.1412910727.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1412910727.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/1][meta-networking] ntp: fix path to driftfile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Oct 2014 11:12:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2014 10:22 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Default path to driftfile is "/etc/ntp.drift", that doesn't work since
> ntp daemon is always started with "ntp" user. It should be created at
> the home directory of "ntp" which is "/var/lib/ntp/".

Could you provide a bit more detail on why this "doesn't work"? Does it 
violate the FHS, or complicate securing an image, or...?

I see that Debian apparently puts the file in /var/lib/ntp.

I certainly don't object to the change, but "doesn't work" suggests this 
patch fixes a functional bug, not an inconsistency with policy.  More 
detail in the commit message will help us occasional contributors 
understand how things are supposed to be done and why.

Thanks.

Peter

>
> The following changes since commit 17ff23b4a4a0e5ed7efde107fb00296f1ebd5fdd:
>
>    xf86-video-geode: fix build with new glibc-2.20 (2014-10-06 01:07:53 +0200)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/ntp
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ntp
>
> Wenzong Fan (1):
>    ntp: fix path to driftfile
>
>   meta-networking/recipes-support/ntp/ntp.inc |   15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>


