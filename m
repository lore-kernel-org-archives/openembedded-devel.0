Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PrtgZ-0002y4-El
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 15:57:55 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PrtfF-0002Py-1K from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 06:56:33 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Feb 2011 06:56:32 -0800
Received: from [172.30.80.151] ([172.30.80.151]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Feb 2011 07:56:31 -0700
Message-ID: <4D63CE95.8080605@mentor.com>
Date: Tue, 22 Feb 2011 07:56:21 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298116419-18277-1-git-send-email-schnitzeltony@gmx.de>
	<4D63718E.2090404@eukrea.com>
In-Reply-To: <4D63718E.2090404@eukrea.com>
X-OriginalArrivalTime: 22 Feb 2011 14:56:31.0987 (UTC)
	FILETIME=[B1359430:01CBD2A0]
Subject: Re: [PATCH] cross.bbclass: Fix many QA RPATH errors for distros preferring libtool-2.2
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
X-List-Received-Date: Tue, 22 Feb 2011 14:57:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 02/22/2011 01:19 AM, Eric Benard wrote:
> On 19/02/2011 12:53, Andreas Mueller wrote:
>> * This patch removes the absolute path in
>> sysroots/<arch>/usr/lib/libstdc++.la
>> *
>> * It was build tested wih clean tmp for xfce46-image. Additional known
>> * QA-RPATH-error-candidates were checked for successful build:
>> *
>> * aspell-0.60.6-r0
>> * curl-7.21.2-r4.0
>> * clutter-box2d-0.10.0-r2.0+git4e72b9c135a9439b82d801c62422531db611f98b
>> * enchant-1.6.0-r2
>> * gnome-vfs-2.24.1-r3
>> * libcdio-0.82-r3.0
>> * libsoup-2.2.100-r1:
>> * neon-0.25.5-r4
>> * schroedinger-1.0.9-r0
>> * tiff-3.9.4+4.0.0beta6-r0
>> *
>> * Build environment was (RPATH QA errors treated as fatal / acl fixed
>> manually)
>> *
>> * BB_VERSION = "1.10.2"
>> * METADATA_BRANCH = "cross-bbclass-test"
>> * METADATA_REVISION = "a44300e"
>> * TARGET_ARCH = "arm"
>> * TARGET_OS = "linux-gnueabi"
>> * MACHINE = "overo"
>> * DISTRO = "angstrom"
>> * DISTRO_VERSION = "2010.7-test-20110219"
>> * TARGET_FPU = "hard"
>> *
>> * Notes:
>> * - To have effect, gcc-cross has to be rebuild (changing all gcc packed
>> * was not an option)
>> * - This patch does not affect libtool-2.4 distos
>> * - The story is found at
>> *
>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-February/030115.html
>>
>>
>> Signed-off-by: Andreas Mueller<schnitzeltony@gmx.de>
> Acked-by: Eric Bénard <eric@eukrea.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


