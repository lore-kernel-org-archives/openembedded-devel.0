Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SIpPb-0007zF-Vd
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Apr 2012 00:56:16 +0200
Received: by qcso7 with SMTP id o7so2276805qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 15:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=MbhMF/vg1NChUiLbzOtgYG5aJ2lVT+/800RYSNY1WC4=;
	b=kXuWVm3apOtqITk5Lh2mnDpQnJHD8WWGQcxNf7Jb8yKSBc4pKU1meHcIfjK8CuGTpq
	PGgUVBGd2VvrmnFH3NWWav/WGmEhH9lBeK3tieO5zCG8AWFPkk2QYVFpSdyKb0LMf+Pr
	1vTkPdxjC5BVoITwFoXfDUZpLR1OQZromCiO6CqR6ZGYh9l/Es/Sv+628qVwdzp4e7ZY
	HhHiJQ/gk8EBThhk2dFSTrJ67MNzztFX6bzr4R/+pOT0VwmwsHZP07PS419ABfWn2MB6
	kLG3Y9wNtrB63Hqug/183qAmiri+H0V7Wh3J8RcYBWm21YMqx1u8RPwFwriT9/MQBnSZ
	BsOA==
Received: by 10.229.136.131 with SMTP id r3mr1406101qct.129.1334357213664;
	Fri, 13 Apr 2012 15:46:53 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id i8sm19936304qah.4.2012.04.13.15.46.48
	(version=SSLv3 cipher=OTHER); Fri, 13 Apr 2012 15:46:53 -0700 (PDT)
Message-ID: <4F88ACCE.1030202@gmail.com>
Date: Fri, 13 Apr 2012 15:46:38 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: ld segfault cant figure it out
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
X-List-Received-Date: Fri, 13 Apr 2012 22:56:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

There seems to be a couple of packages when I build that cause ld 
segfaults such as
[ 6635.846581] ld[14419]: segfault at 8 ip 0077f1bf sp bfbf4a8c error 4 
in libc-2.13.so[73d000+15c000]
[ 6656.831878] ld[20772]: segfault at 8 ip 00ba61bf sp bfaf1bfc error 4 
in libc-2.13.so[b64000+15c000]

I can not seem to be able to track down the package/packages that are 
causing this. I have tried with a clean build dir and only building nano 
and I get it so it is something in the getting environment ready steps. 
Is there a way I can easily track down the build/builds that are causing 
this? Am I even on the right track in this thinking? Nothing fails to 
build and other than task-native-sdk all result in what seem to be 
working packages.

Any info on what or how to figure it out would be greatly appreciated.
building for bbxm on 11.04(uptodate), build environment setup with 
Angstrom scripts and all is up to date.

Thank you


