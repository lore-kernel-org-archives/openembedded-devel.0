Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuS87-0008GD-U6
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 17:08:56 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PuS6i-00009e-QC from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 08:07:28 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 1 Mar 2011 08:07:28 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Tue, 1 Mar 2011 08:07:27 -0800
Message-ID: <4D6D19AD.5010505@mentor.com>
Date: Tue, 1 Mar 2011 09:07:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
X-OriginalArrivalTime: 01 Mar 2011 16:07:28.0649 (UTC)
	FILETIME=[C344E790:01CBD82A]
Subject: Re: [PATCH] sane-toolchain-*: add -g to FULL_OPTIMIZATION to make	-dbg packages more usefull
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
X-List-Received-Date: Tue, 01 Mar 2011 16:08:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2011 02:10 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   conf/distro/include/sane-toolchain-eglibc.inc      |   12 ++++++------
>   conf/distro/include/sane-toolchain-glibc.inc       |   10 +++++-----
>   conf/distro/include/sane-toolchain-uclibc.inc      |    6 +++---
>   .../include/sane-toolchain-uclinux-uclibc.inc      |    2 +-
>   4 files changed, 15 insertions(+), 15 deletions(-)

While we're in here, we should look at what the angstrom ones do 
correctly which is that BUILD_OPTIMIZATION is only for -native recipes.

And personally I'd like to see the -g flag (for both target and the 
rest) be a variable that can be tweaked as needed (for more or less 
debug in the area).

-- 
Tom Rini
Mentor Graphics Corporation


