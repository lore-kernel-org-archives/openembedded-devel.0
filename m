Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PA5Qp-0000YH-Ua
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 20:36:36 +0200
Received: by ywa8 with SMTP id 8so1784167ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 11:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=zKcF26Ujs8yo1jewnXDsmumWSMlxDYYzAIEScXQgHu4=;
	b=FibRWRdmsR09z1jFna2QF0sonjfgAtJL14zhUh48DXf8jo8/jVJAW4+5aHP4hMxH2n
	sLvD8xUJ6NNf88IYhQsGQOdYvFjvVmwF6VRZcIJR8tg+IbqYJ5DoKaH+eE0A/kOB+23+
	UMENCLBzQ+kcrdpZV4uvAApgA/rXf9lPG6oFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=dfqb89qswPd4xZ8rNONbSTkYnLqAEivC5+aZ4WTcpxkn2xOneYbDcWPIldFrZugElQ
	Pz7Q3J9Etvn1hzEYmtvCydALtjs3HiW9c3pcywylIFePlfpHNc5AlJUxehy28Y+xbheo
	GkX5jL3tIwhjxSPAfbSOHkJXI1Pcx5Qt69Qh4=
Received: by 10.42.23.84 with SMTP id r20mr433983icb.487.1287945355204; Sun,
	24 Oct 2010 11:35:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Sun, 24 Oct 2010 11:35:35 -0700 (PDT)
In-Reply-To: <AANLkTi=8ZBZmU68NYZO3HkkLVJ09y+jhr0pWrd=bt=32@mail.gmail.com>
References: <1285368419-12062-1-git-send-email-raj.khem@gmail.com>
	<AANLkTimhhvUqQZSicuDE7qEHFdxUJjJJSv=ZioFwwdR8@mail.gmail.com>
	<AANLkTikvA4DOf7uwKUq2myNZMdOPZiOf_B73Kr=USOjZ@mail.gmail.com>
	<AANLkTi=8ZBZmU68NYZO3HkkLVJ09y+jhr0pWrd=bt=32@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Oct 2010 11:35:35 -0700
Message-ID: <AANLkTimjYwr6vn5Makva7yciDA2_4KoiM=K7EtQQkYCf@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] [PATCH] fetchers: Use tar --exclude pattern to remove SCM files
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
X-List-Received-Date: Sun, 24 Oct 2010 18:36:36 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 24, 2010 at 1:08 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Oct 24, 2010 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sat, Oct 23, 2010 at 11:58 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> This commit is usefull for sure, but breaks ie some EFL recipes.
>>>
>>> ie python-elementary depends on elementary >= 0.7.0.52890
>>> but elementary.pc says Version: 0.7.0.0
>>>
>>> elementary.pc.in says Version: @VERSION@
>>>
>>> and finally VERSION is defined in configure.ac:
>>> m4_define([v_maj], [0])
>>> m4_define([v_min], [7])
>>> m4_define([v_mic], [0])
>>> m4_define([v_rev], m4_esyscmd([(svnversion "${SVN_REPO_PATH:-.}" |
>>> grep -v export || echo 0) | awk -F : '{printf("%s\n", $1);}' | tr -d '
>>> :MSP\n']))
>>> m4_if(v_rev, [0], [m4_define([v_rev], m4_esyscmd([git log 2> /dev/null
>>> | (grep -m1 git-svn-id || echo 0) | sed -e 's/.*@\([0-9]*\).*/\1/' |
>>> tr -d '\n']))])
>>>
>>
>> hmm strange that a configure scripts depends on SCM files. To me it
>> seems wrong. Anyway I think you can patch configure.ac
>> to replace v_rev definition to be based on SRCREV may be some sort of
>> sed operation as do_configure_prepend might be a good way
>
> this is used in all efl recipes and I've noticed it in elementary only
> because python-elementary depends on such new version.

Do you have a list of recipes which use this ? I am sure with git it
will be hard to use such a thing
as the git revs are random and simlarily many other SCMs

>
> I've also found similar construct in other projects.. so maybe it's
> not so efl related (and then harder to found&fix in all recipes).
>

I still think packages should not depend upon SCM revisions and we
should fix them

> Regards,
>


