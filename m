Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OsBaC-0006Hw-LI
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 11:32:17 +0200
Received: (qmail 26467 invoked by uid 503); 5 Sep 2010 09:53:49 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 5 Sep 2010 09:53:49 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Sep 2010 11:31:37 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 5 Sep 2010 11:31:35 +0200
Message-ID: <4C836376.3050709@eukrea.com>
Date: Sun, 05 Sep 2010 11:31:34 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=j4E6ZLet=qemx-Ec1CaySKLCuzZMDriX9WQ=T@mail.gmail.com>	<4C835C8E.1000008@eukrea.com>
	<AANLkTi=GrTNa2H+UZjM6RrYU6xAx-DZg2KwDix8MzOgM@mail.gmail.com>
In-Reply-To: <AANLkTi=GrTNa2H+UZjM6RrYU6xAx-DZg2KwDix8MzOgM@mail.gmail.com>
X-Ovh-Tracer-Id: 7167197333834804553
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,URI_HEX
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ushare_hg (the leading ushare recipe) does not fetch
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
X-List-Received-Date: Sun, 05 Sep 2010 09:32:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 05/09/2010 11:21, Frans Meulenbroeks a écrit :
> Alas, this did not help.
>
> NOTE: Running task 520 of 759 (ID: 5,
> /home/frans/oe/openembedded/recipes/ushare/ushare_hg.bb, do_fetch)
> NOTE: package ushare-1.1a-r1+hg2e40e513a4a0: task do_fetch: Started
> NOTE: Fetch hg://hg.geexbox.org;proto=http;module=ushare;rev=2e40e513a4a0
> NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or
> directory: '/home/frans/oe/downloads/ushare__hg.geexbox.org_2e40e513a4a0.tar.gz'
> ERROR: TaskFailed event exception, aborting
>
> This is after removing the downloads/hg dir and all downloads/ushare* files
>
> I have also tried without the proto=http; part (as that did not appear
> in other recipes using hg://) but that did not make a difference
> either.
> I have checked and the rev exists.
>
strange, here (x86 host, ubuntu 9.10, bitbake 1.10, hg 1.43 installed on 
the host) this solves the problem :

* before :
NOTE: Running task 219 of 220 (ID: 0, 
/home/ebenard/cpuimx25/openembedded/recipes/ushare/ushare_hg.bb, do_fetch)
NOTE: package ushare-1.1a-r1+hg2e40e513a4a0: task do_fetch: Started
NOTE: Fetch hg://hg.geexbox.org;proto=http;module=ushare;rev=2e40e513a4a0
requesting all changes
adding changesets
adding manifests
adding file changes
added 433 changesets with 1023 changes to 102 files
updating to branch default
74 files updated, 0 files merged, 0 files removed, 0 files unresolved
abandon : There is no Mercurial repository here (.hg not found) !
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or 
directory: 
'/home/ebenard/oe_downloads/ushare__hg.geexbox.org_2e40e513a4a0.tar.gz'
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/ebenard/cpuimx25/openembedded/recipes/ushare/ushare_hg.bb do_fetch 
failed
ERROR: Task 0 
(/home/ebenard/cpuimx25/openembedded/recipes/ushare/ushare_hg.bb, 
do_fetch) failed with 256
ERROR: '/home/ebenard/cpuimx25/openembedded/recipes/ushare/ushare_hg.bb' 
failed
NOTE: package ushare-1.1a-r1+hg2e40e513a4a0: task do_fetch: Failed

* after :
NOTE: package ushare-1.1a-r1+hg2e40e513a4a0: task do_fetch: Started
NOTE: Fetch hg://hg.geexbox.org;proto=http;module=ushare;rev=2e40e513a4a0
requesting all changes
adding changesets
adding manifests
adding file changes
added 433 changesets with 1023 changes to 102 files
updating to branch default
74 files updated, 0 files merged, 0 files removed, 0 files unresolved
0 files updated, 0 files merged, 0 files removed, 0 files unresolved
NOTE: package ushare-1.1a-r1+hg2e40e513a4a0: task do_fetch: Succeeded
NOTE: Running task 220 of 220 (ID: 1, 
/home/ebenard/cpuimx25/openembedded/recipes/ushare/ushare_hg.bb, 
do_fetchall)
NOTE: package ushare-1.1a-r1+hg2e40e513a4a0: task do_fetchall: Started
NOTE: package ushare-1.1a-r1+hg2e40e513a4a0: task do_fetchall: Succeeded

Can you run bitbake with -vvv to get more log of what is failing ?

Eric


