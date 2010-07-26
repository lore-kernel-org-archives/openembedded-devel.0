Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <ossy1980@gmx.net>) id 1OdV2G-00060o-CQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 23:16:36 +0200
Received: (qmail invoked by alias); 26 Jul 2010 21:09:36 -0000
Received: from p4FDD302C.dip.t-dialin.net (EHLO [192.168.1.104]) [79.221.48.44]
	by mail.gmx.net (mp015) with SMTP; 26 Jul 2010 23:09:36 +0200
X-Authenticated: #2644563
X-Provags-ID: V01U2FsdGVkX1+7YNRJr1q7uK46MQRUFTpoJmaeOkK+LRFAz5vMjS
	pDOmIUybMDdG18
Message-ID: <4C4DF98E.6080703@gmx.net>
Date: Mon, 26 Jul 2010 23:09:34 +0200
From: Ossy <ossy1980@gmx.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; de;
	rv:1.9.1.11) Gecko/20100711 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C4C9AD7.7010603@gmx.net>	<AANLkTinQG5SA2sGRj1xapuhfDCxQF4Sss7BHeS=nLesA@mail.gmail.com>	<4C4DD663.1070902@gmx.net>
	<AANLkTi=0VygaJwKNMTYj_HfxNj=zKDPNzmaCQNiU_bhN@mail.gmail.com>
In-Reply-To: <AANLkTi=0VygaJwKNMTYj_HfxNj=zKDPNzmaCQNiU_bhN@mail.gmail.com>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: ossy1980@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: could not include bb file even though it exists and	directory included in BBPATH
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
X-List-Received-Date: Mon, 26 Jul 2010 21:16:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 26.07.2010 21:15, schrieb Frans Meulenbroeks:
>> Unfortunatly I'm still not able to create a minimal-image:
>> ERROR: Task 306 (/home/ossy/kom/openembedded/recipes/stage-manager/
>> stagemanager-native_0.0.1.bb, do_unpack) failed
>>
>> I guess the stagemanager is an essential tool and should be well tested. So
>> were can I find some output which action went wrong?
>> (unpacking seems not that difficult to fail...)
>>
>
> If stagemanager cannot unpack something is probably wrong in your source
> tree.
> My recipes/stage-manager has:
>
> rans@linux-suse:~/oe/openembedded/recipes/stage-manager>  ls -lR
> .:
> total 8
> drwxr-xr-x 2 frans users 4096 Jul 21 22:13 files
> -rw-r--r-- 1 frans users  626 Jul  9 15:26 stagemanager-native_0.0.1.bb
>
> ./files:
> total 48
> -rwxr-xr-x 1 frans users  5215 Aug 23  2009 stage-manager
> -rwxr-xr-x 1 frans users 28781 Jul 21 22:13 stage-manager-ipkg
> -rwxr-xr-x 1 frans users  6217 Aug 23  2009 stage-manager-ipkg-build
>
> You should have these as well. If not that is the root of your problem.
> If you have these, then probably your TMPDIR points to a nonexisting place
> (e.g. if it still points to .../build/tmp and you also removed build)

I DO have the same file in recipes/stage-manager.
I set the tempdir to something outside my PRJDIR (overlay DIR).
The tmpdir outside fills when I run bitbake minimal-image, but I still 
run into the an error:
NOTE: Running task 6 of 1092 (ID: 14, 
/home/ossy/kom/openembedded/recipes/images/minimal-image.bb, 
do_distribute_sources)
NOTE: Running task 7 of 1092 (ID: 306, 
/home/ossy/kom/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb, 
do_unpack)
NOTE: Unpacking 
../../kom/openembedded/recipes/stage-manager/files/stage-manager to 
../tmp/work/x86_64-linux/stagemanager-native-0.0.1-r13/
NOTE: Unpacking 
../../kom/openembedded/recipes/stage-manager/files/stage-manager-ipkg to 
../tmp/work/x86_64-linux/stagemanager-native-0.0.1-r13/
NOTE: Unpacking 
../../kom/openembedded/recipes/stage-manager/files/stage-manager-ipkg-build 
to ../tmp/work/x86_64-linux/stagemanager-native-0.0.1-r13/
ERROR: Task 0 
(/home/ossy/kom/openembedded/recipes/images/minimal-image.bb, do_unpack) 
failed
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: /home/ossy/kom/openembedded/recipes/images/minimal-image.bb, 
do_distribute_sources (2247)
NOTE: 2: 
/home/ossy/kom/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb, 
do_unpack (2248)
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: 
/home/ossy/kom/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb, 
do_unpack (2248)
NOTE: Tasks Summary: Attempted 4 tasks of which 0 didn't need to be 
rerun and 1 failed.
ERROR: '/home/ossy/kom/openembedded/recipes/images/minimal-image.bb' failed
NOTE: oestats: build failed, see 
http://tinderbox.openembedded.net/builds/79904/


Is there a problem with running multiple tasks? bitbake doesn't wait 
correctly until the other task finishes? I'm running bitbake 1.8.18

Regards,
Marcus


