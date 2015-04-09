Return-Path: <ppf83764@freenet.de>
X-Greylist: delayed 686 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Apr 2015 10:43:06 UTC
Received: from mout0.freenet.de (mout0.freenet.de [195.4.92.90])
	by mail.openembedded.org (Postfix) with ESMTP id 9ABBF606BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Apr 2015 10:43:06 +0000 (UTC)
Received: from [195.4.92.141] (helo=mjail1.freenet.de)
	by mout0.freenet.de with esmtpa (ID ppf83764@freenet.de) (port 25)
	(Exim 4.82 #2) id 1Yg9kK-0003nS-8l; Thu, 09 Apr 2015 12:31:40 +0200
Received: from localhost ([::1]:56769 helo=mjail1.freenet.de)
	by mjail1.freenet.de with esmtpa (ID ppf83764@freenet.de) (Exim 4.82
	#2) id 1Yg9kK-0000h9-3p; Thu, 09 Apr 2015 12:31:40 +0200
Received: from mx16.freenet.de ([195.4.92.26]:34952)
	by mjail1.freenet.de with esmtpa (ID ppf83764@freenet.de) (Exim 4.82
	#2) id 1Yg9hb-000519-Mt; Thu, 09 Apr 2015 12:28:51 +0200
Received: from p57b3d021.dip0.t-ipconnect.de ([87.179.208.33]:44352
	helo=[192.168.178.21])
	by mx16.freenet.de with esmtpsa (ID ppf83764@freenet.de)
	(TLSv1.2:DHE-RSA-AES128-SHA:128) (port 587) (Exim 4.82 #2)
	id 1Yg9hb-0007Hr-FT; Thu, 09 Apr 2015 12:28:51 +0200
Message-ID: <5526545F.8040704@freenet.de>
Date: Thu, 09 Apr 2015 12:28:47 +0200
From: Peter <ppf83764@freenet.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.2538.1428519743.1448.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.2538.1428519743.1448.openembedded-devel@lists.openembedded.org>
X-Originated-At: 87.179.208.33!44352
Subject: Yocto Dizzy + Beaglebone + Qt5 (Internal compiler error)
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
X-List-Received-Date: Thu, 09 Apr 2015 10:43:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On Wed, 8 Apr 2015 11:18:58 Martin Beaudet wrote:
> Hi,
>
> I'm building an image for the beaglebone. I would like to use (at least) the version 5.4 or more of QT with elgfs platform.
> Also the hardware accelerated support on Beaglebone Black.
> ...
> I read about similar error here (https://bugs.launchpad.net/gcc-linaro/+bug/1312931) but they seem to indicate that this error has been fixed in new release of GCC and they are talking about 4.8 so I supposed it has been fixed in 4.9 ?
>
> I hope you can help me out this compiler error because I'm out of idea :(
>
> Best regards,
> Martin
>

Did you try the supposed patch? 
(http://pkgs.fedoraproject.org/cgit/mingw-qt5-qtbase.git/tree/qt5-workaround-gcc48-arm-build-failure.patch?h=f20)

I ran into a similar issue some time ago. Can't remeber which gcc 
version I used or where the error occurred, but for me it solved the ICE 
at var-tracking.c.

Best regards,
Peter

