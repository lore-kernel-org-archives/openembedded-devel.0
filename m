Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P2NTx-0005DW-5S
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 14:16:00 +0200
Received: by iwn2 with SMTP id 2so5710278iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Oct 2010 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TSTtCPkE8gmZl+fm1rYj4RsMuDlOH/5n1hmZ34T5dq8=;
	b=LLRkHscMoJ14Da3PQ7j8UqVAiQhgnKm4zAR2w9O6YUxSkP93BqA711V7PCGi+ibEL5
	/+aOi/RG5nhfo9GIgsBglN2Bg7rPdTRlPtspP7fwn88a5GW4nx1HHwPjPzj/RzVgmQRU
	4HwNiubdnFWEFgKJdUGi6O5BWkfKp+Is1snUc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BqHLLPWHB2DtBsurZpnMsyHxA2zrdUGX/8Mys2rwAAwRCDT0/aG7rY8t/o9SctbRcn
	QwMCwSNWoFnXyE5J60V9IR7zpK3vG3s7DniUtGHqa14ZuKTUiX0sUKVG1E02ztfZReE9
	vnz07XDYT2Ny4jjvAqlWicW8n4vrjAksxDjn0=
MIME-Version: 1.0
Received: by 10.231.14.69 with SMTP id f5mr8496057iba.116.1286108141592; Sun,
	03 Oct 2010 05:15:41 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 3 Oct 2010 05:15:41 -0700 (PDT)
In-Reply-To: <AANLkTinS0BVcVmDv4LrJL9YwkP4sCydBwx=Ff9fVMzHW@mail.gmail.com>
References: <AANLkTi=Wt1eRcSoXzjwMJizLBgQ-+hV=Xj1UWW155MWQ@mail.gmail.com>
	<AANLkTinS0BVcVmDv4LrJL9YwkP4sCydBwx=Ff9fVMzHW@mail.gmail.com>
Date: Sun, 3 Oct 2010 14:15:41 +0200
Message-ID: <AANLkTi=SQUqwqcHs+SYS7Ebc7WQo-p=b15cwU4OTE0=S@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some more non fetching recipes
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
X-List-Received-Date: Sun, 03 Oct 2010 12:16:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/3 Martin Jansa <martin.jansa@gmail.com>:

>
>> xorg-driver/xf86-input-vmmouse_12.6.10.bb
>> xorg-driver/xf86-input-vmmouse_12.6.5.bb
>> xorg-driver/xf86-video-geode_2.11.6.bb
>> xorg-driver/xf86-video-geode_2.11.9.b
>
>
> All 4 redownloaded OK, I guess you got
>
> NOTE: Out of date cache found, rebuilding...
> Command execution failed: Traceback (most recent call last):
> =A0File "/usr/lib64/python2.6/site-packages/bb/command.py", line 88, in
> runAsyncCommand
> =A0 =A0commandmethod(self.cmds_async, self, options)
> =A0File "/usr/lib64/python2.6/site-packages/bb/command.py", line 164,
> in buildFile
> =A0 =A0command.cooker.buildFile(bfile, task)
> =A0File "/usr/lib64/python2.6/site-packages/bb/cooker.py", line 691, in b=
uildFile
> =A0 =A0self.status.task_deps[fn]['depends'] =3D {}
> TypeError: 'NoneType' object does not support item assignment
>
> because of: COMPATIBLE_HOST =3D "i.86.*-linux" in those 4 recipes..

Ah ok.
I got

ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 88, in runAsyncComm=
and
    commandmethod(self.cmds_async, self, options)
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 174, in buildFile
    command.cooker.buildFile(bfile, task)
  File "/home/frans/oe/bitbake/lib/bb/cooker.py", line 650, in buildFile
    self.status.task_deps[fn]['depends'] =3D {}
TypeError: 'NoneType' object does not support item assignment

and indeed I did not use an *86 target.
Guess we need a better error message here
Something like:
NOTE: the recipe you are trying to build does not match your
machine/architecture"

Frans


