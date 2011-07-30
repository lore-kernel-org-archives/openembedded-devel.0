Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QnBe6-0005Av-3t
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 17:40:10 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QnBFZ-0003lN-Qx from Tom_Rini@mentor.com ;
	Sat, 30 Jul 2011 08:14:49 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sat, 30 Jul 2011 08:14:49 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Sat, 30 Jul 2011 08:14:49 -0700
Message-ID: <4E341FDD.7020500@mentor.com>
Date: Sat, 30 Jul 2011 08:14:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Andreas Mueller <schnitzeltony@gmx.de>
References: <201107301242.41215.schnitzeltony@gmx.de>
	<201107301312.14146.schnitzeltony@gmx.de>
In-Reply-To: <201107301312.14146.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 30 Jul 2011 15:14:49.0671 (UTC)
	FILETIME=[6CBF5D70:01CC4ECB]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: fakeroot 1.14.5 source is missing
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
X-List-Received-Date: Sat, 30 Jul 2011 15:40:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/30/2011 04:12 AM, Andreas Mueller wrote:
> On Saturday, July 30, 2011 12:42:40 PM Andreas Mueller wrote:
>> Hi guys,
>>
>> I tried to build an image based on gumstix overo-2011 branch [1] but the
>> sources for fakeroot 1.14.5 can not be downloaded.
>>
>> ERROR: fakeroot-native-1.14.5:
>> ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.14.5.orig.tar.b
>> z2 cannot check archive integrity
>>
>> In [2] I saw that it is it is not there ( anymore ? ).
>>
>> As far as I can see we have the same issue in mainline oe
>> 2011.03-maintenance.
>>
>> [1] http://gitorious.org/gumstix-oe/mainline/commits/overo-2011.03
>> [2] ftp://ftp.debian.org/debian/pool/main/f/fakeroot/
>>
> I don't know how to create the 'official' pull request bur I think we need to pull 
> 
> commit 085dc5e99abf98772bfb44f3f25320418d500740
> Author: Florian Boor <florian.boor@kernelconcepts.de>
> Date:   Thu May 5 11:28:09 2011 +0200
> 
>     fakeroot: Move from not fetchable 1.14.5 to 1.15.1
>     
>     Fakeroot 1.14.5 was not fetchable any more. Updating to 1.15.1.
>     
>     Test environment:
>         BB_VERSION        = "1.10.2"
>         METADATA_BRANCH   = "org.openembedded.dev"
>         TARGET_ARCH       = "arm"
>         TARGET_OS         = "linux-gnueabi"
>         MACHINE           = "mainstone"
>         DISTRO            = "minimal"
>         DISTRO_VERSION    = "dev-snapshot-20110504"
>         TARGET_FPU        = "soft"
>     
>     Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
> 
> into 2011.03-maintenance.

2011.03-maintenance expects you to have a source mirror available as
there are a number of cases like this.  Further, I want to avoid the
tzdata/tzcode tracking.  I am open to getting this mirrored on the oe
mirror site as well, but I don't have access to putting things there :)

-- 
Tom Rini
Mentor Graphics Corporation


