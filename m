Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SIpT5-000860-8A
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Apr 2012 00:59:51 +0200
Received: by qcso7 with SMTP id o7so2277879qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 15:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=wk6xhtr+7bYyyd3p1hIRtgMn29YDsoYCUk4GV5lwfgw=;
	b=hRu7GgZJXW/4cihUTfH2oooW1es7WjO/2ZV9VBRuaWgST1R+GR4KL2gcmsab1CB7Hh
	iLE8QmDopt1FhGfuoj/6bDlVjqtEkVLNOi5r/W9FqKuxOa98rgLxXsUzRPbI7s84+scT
	ws/n0hslKRqtO2iN0nSXyTVEOxImqjco5f6O46s5LceNKmqEvXOs/WpTG7cttP+RgUeu
	EsVwS+lrVHtRDw+l+jyYR57nUOEBYiGKy7oB8CvzSAFiyESiU0mBtLl6b4HfIkeUCfNK
	ID+BE67nlnJ9CkxAcIMF8tyNrpcm9j4jv9kw7ELZeeXtm7LRWHREFExO3diKJniotZqf
	3Big==
Received: by 10.229.135.211 with SMTP id o19mr1395887qct.113.1334357429211;
	Fri, 13 Apr 2012 15:50:29 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id dm8sm19938524qab.18.2012.04.13.15.50.23
	(version=SSLv3 cipher=OTHER); Fri, 13 Apr 2012 15:50:28 -0700 (PDT)
Message-ID: <4F88ADA3.5030804@gmail.com>
Date: Fri, 13 Apr 2012 15:50:11 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com>
In-Reply-To: <4F88ACCE.1030202@gmail.com>
Subject: Re: ld segfault cant figure it out
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
X-List-Received-Date: Fri, 13 Apr 2012 22:59:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2012 03:46 PM, j wrote:
> There seems to be a couple of packages when I build that cause ld 
> segfaults such as
> [ 6635.846581] ld[14419]: segfault at 8 ip 0077f1bf sp bfbf4a8c error 
> 4 in libc-2.13.so[73d000+15c000]
> [ 6656.831878] ld[20772]: segfault at 8 ip 00ba61bf sp bfaf1bfc error 
> 4 in libc-2.13.so[b64000+15c000]
>
> I can not seem to be able to track down the package/packages that are 
> causing this. I have tried with a clean build dir and only building 
> nano and I get it so it is something in the getting environment ready 
> steps. Is there a way I can easily track down the build/builds that 
> are causing this? Am I even on the right track in this thinking? 
> Nothing fails to build and other than task-native-sdk all result in 
> what seem to be working packages.
>
> Any info on what or how to figure it out would be greatly appreciated.
> building for bbxm on 11.04(uptodate), build environment setup with 
> Angstrom scripts and all is up to date.
>
> Thank you
Sorry forgot the info from qa.log

libgcc-4.5: non -staticdev package contains static .a library: 
libgcc-dev path 
'/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc.a'
libgcc-4.5: non -staticdev package contains static .a library: 
libgcc-dev path 
'/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcov.a'
libgcc-4.5: non -staticdev package contains static .a library: 
libgcc-dev path 
'/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc_eh.a'
bash-4.2: bash: Found a reference to /usr/ in 
/home/beagle/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/bash-4.2-r2/packages-split/bash/bin/bashbug
bash-4.2: Shell scripts in base_bindir and base_sbindir should not 
reference anything in exec_prefix

Any other places to check, as these I do not think relate to a segfault?


