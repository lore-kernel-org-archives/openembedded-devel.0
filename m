Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OdeFN-0002LO-V7
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 09:06:56 +0200
Received: by bwz10 with SMTP id 10so3343433bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 00:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=4cJZRlIi1h/7Z7OSWVLKduFd723ffRA0jfSwKQY4JYE=;
	b=GWeQbghIduz47QG3LHaME4KGACJF+WXPzCBRrU1g9Cz3xneTuabEdjjvL9HYRRi5bg
	CxHnGEuClV1wzDXjigQHFRziVJtkxAUrko6//V0CLpDupufo2jZ1IXuOR64TRspjfqND
	KX2TPv64eMItSHuDCiQu6PawsoEwHLcg1EdAk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Pdk+qe7J3QQaQKlKAikAp9okXawn9Rkl7OB3Rx+brU4/I0jjkiYOPc3b4lqAjpd9xO
	az5OVTaljI11twe/GS3O8oogIWcabCLU4t4CHrwREtKIHNGragVj55NdjIsitDy0gIch
	M+Upnfj0c8qqGjOXzS4nZ0zp312xbYNcKjlt0=
MIME-Version: 1.0
Received: by 10.204.102.2 with SMTP id e2mr6409084bko.112.1280214386466; Tue, 
	27 Jul 2010 00:06:26 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 27 Jul 2010 00:06:26 -0700 (PDT)
In-Reply-To: <4C4DF98E.6080703@gmx.net>
References: <4C4C9AD7.7010603@gmx.net>
	<AANLkTinQG5SA2sGRj1xapuhfDCxQF4Sss7BHeS=nLesA@mail.gmail.com>
	<4C4DD663.1070902@gmx.net>
	<AANLkTi=0VygaJwKNMTYj_HfxNj=zKDPNzmaCQNiU_bhN@mail.gmail.com>
	<4C4DF98E.6080703@gmx.net>
Date: Tue, 27 Jul 2010 09:06:26 +0200
Message-ID: <AANLkTikNCidXo3Y3hwUj1sG5ev3xFYFka8diyJxp_KY1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: could not include bb file even though it exists and directory included in BBPATH
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
X-List-Received-Date: Tue, 27 Jul 2010 07:06:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/26 Ossy <ossy1980@gmx.net>

> Am 26.07.2010 21:15, schrieb Frans Meulenbroeks:
>
>> Unfortunatly I'm still not able to create a minimal-image:
>>> ERROR: Task 306 (/home/ossy/kom/openembedded/recipes/stage-manager/
>>> stagemanager-native_0.0.1.bb, do_unpack) failed
>>>
>>> I guess the stagemanager is an essential tool and should be well tested.
>>> So
>>> were can I find some output which action went wrong?
>>> (unpacking seems not that difficult to fail...)
>>>
>>>
>> If stagemanager cannot unpack something is probably wrong in your source
>> tree.
>> My recipes/stage-manager has:
>>
>> rans@linux-suse:~/oe/openembedded/recipes/stage-manager>  ls -lR
>> .:
>> total 8
>> drwxr-xr-x 2 frans users 4096 Jul 21 22:13 files
>> -rw-r--r-- 1 frans users  626 Jul  9 15:26 stagemanager-native_0.0.1.bb
>>
>> ./files:
>> total 48
>> -rwxr-xr-x 1 frans users  5215 Aug 23  2009 stage-manager
>> -rwxr-xr-x 1 frans users 28781 Jul 21 22:13 stage-manager-ipkg
>> -rwxr-xr-x 1 frans users  6217 Aug 23  2009 stage-manager-ipkg-build
>>
>> You should have these as well. If not that is the root of your problem.
>> If you have these, then probably your TMPDIR points to a nonexisting place
>> (e.g. if it still points to .../build/tmp and you also removed build)
>>
>
> I DO have the same file in recipes/stage-manager.
> I set the tempdir to something outside my PRJDIR (overlay DIR).
> The tmpdir outside fills when I run bitbake minimal-image, but I still run
> into the an error:
> NOTE: Running task 6 of 1092 (ID: 14,
> /home/ossy/kom/openembedded/recipes/images/minimal-image.bb,
> do_distribute_sources)
> NOTE: Running task 7 of 1092 (ID: 306,
> /home/ossy/kom/openembedded/recipes/stage-manager/
> stagemanager-native_0.0.1.bb, do_unpack)
> NOTE: Unpacking
> ../../kom/openembedded/recipes/stage-manager/files/stage-manager to
> ../tmp/work/x86_64-linux/stagemanager-native-0.0.1-r13/
> NOTE: Unpacking
> ../../kom/openembedded/recipes/stage-manager/files/stage-manager-ipkg to
> ../tmp/work/x86_64-linux/stagemanager-native-0.0.1-r13/
> NOTE: Unpacking
> ../../kom/openembedded/recipes/stage-manager/files/stage-manager-ipkg-build
> to ../tmp/work/x86_64-linux/stagemanager-native-0.0.1-r13/
> ERROR: Task 0 (/home/ossy/kom/openembedded/recipes/images/minimal-image.bb,
> do_unpack) failed
> NOTE: Waiting for 2 active tasks to finish
> NOTE: 1: /home/ossy/kom/openembedded/recipes/images/minimal-image.bb,
> do_distribute_sources (2247)
> NOTE: 2: /home/ossy/kom/openembedded/recipes/stage-manager/
> stagemanager-native_0.0.1.bb, do_unpack (2248)
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1: /home/ossy/kom/openembedded/recipes/stage-manager/
> stagemanager-native_0.0.1.bb, do_unpack (2248)
> NOTE: Tasks Summary: Attempted 4 tasks of which 0 didn't need to be rerun
> and 1 failed.
> ERROR: '/home/ossy/kom/openembedded/recipes/images/minimal-image.bb'
> failed
> NOTE: oestats: build failed, see
> http://tinderbox.openembedded.net/builds/79904/
>
>
> Is there a problem with running multiple tasks? bitbake doesn't wait
> correctly until the other task finishes? I'm running bitbake 1.8.18
>


mutlple tasks should not be a problem (I use that all the time), but if I
recall correctly it can be disabled in local.conf
Have you specified an absolute path to TMPDIR (e.g. /home/ossy/kom/tmp) ?
 This part: ../tmp/work/x86_64-linux/stagemanager-native-0.0.1-r13/ does not
look good
(especially the ../tmp part of it).
Can you verify TMPDIR and probably also mention it in your previous mail.

If you want to you can also join #oe on freenode irc for faster feedback.

Frans


>
> Regards,
> Marcus
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

