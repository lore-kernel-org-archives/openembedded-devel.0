Return-Path: <pab@pabigot.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Oct 2014 11:28:38 UTC
Received: from p3plsmtpa07-08.prod.phx3.secureserver.net
	(p3plsmtpa07-08.prod.phx3.secureserver.net [173.201.192.237])
	by mail.openembedded.org (Postfix) with ESMTP id 796E9717ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 11:28:38 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-08.prod.phx3.secureserver.net with 
	id 1PMV1p00J0BVjqb01PMVs3; Fri, 10 Oct 2014 04:21:30 -0700
Message-ID: <5437C139.1050809@pabigot.com>
Date: Fri, 10 Oct 2014 06:21:29 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 10 Oct 2014 11:28:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2014 10:22 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Default path to driftfile is "/etc/ntp.drift", that doesn't work since
> ntp daemon is always started with "ntp" user. It should be created at
> the home directory of "ntp" which is "/var/lib/ntp/".

The patch in the git repository also adds tmpfile support, which I 
believe should at least be described in the commit message, and 
preferably done in a separate commit since it's not related to the 
location of ntp.drift AFAICT.

Peter

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


