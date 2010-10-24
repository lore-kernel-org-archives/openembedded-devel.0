Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9vdH-0004X5-VV
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 10:08:49 +0200
Received: by wwi14 with SMTP id 14so1229675wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=8/KS0QeF+m2kBczUJgQqVZAikYLngMrX9Esd869Ca2Y=;
	b=JEKdM4L7tP5ACRxyn00lW5Cf4vQFDxPK6XOPGd5jQslEbV8Qw3NKXLdFBulAXjW77a
	v+84Cu+nyaQ1tB8DrF5MrNWfMQvzhRaciTJOnPA5dke7Z+w3sKpOFdWvGhTXKQUAwjKT
	BzLzXhGWqZW1EAMEN0pvteDiEqs21NFjVTVOY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=WOA9S/dlcpqpk1rhPPBwQx+GpjFI6DE/z/SHirNgp/S1LK5kSH7i/mE4/9dtgt3ETN
	wKT/rLUeXhVzj0jIgSp1exm0qWqv/cKj7DR8ahuq1ezhMzKIl6Tdbzweq50//yYbEJM8
	Ekw8sLvQFM1vCMLYbkzLPyV3IuE8uW9LMqQ6g=
MIME-Version: 1.0
Received: by 10.227.142.75 with SMTP id p11mr521594wbu.27.1287907684567; Sun,
	24 Oct 2010 01:08:04 -0700 (PDT)
Received: by 10.227.154.13 with HTTP; Sun, 24 Oct 2010 01:08:04 -0700 (PDT)
In-Reply-To: <AANLkTikvA4DOf7uwKUq2myNZMdOPZiOf_B73Kr=USOjZ@mail.gmail.com>
References: <1285368419-12062-1-git-send-email-raj.khem@gmail.com>
	<AANLkTimhhvUqQZSicuDE7qEHFdxUJjJJSv=ZioFwwdR8@mail.gmail.com>
	<AANLkTikvA4DOf7uwKUq2myNZMdOPZiOf_B73Kr=USOjZ@mail.gmail.com>
Date: Sun, 24 Oct 2010 10:08:04 +0200
Message-ID: <AANLkTi=8ZBZmU68NYZO3HkkLVJ09y+jhr0pWrd=bt=32@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: martin.jansa@gmail.com
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
X-List-Received-Date: Sun, 24 Oct 2010 08:08:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Oct 24, 2010 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Oct 23, 2010 at 11:58 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> This commit is usefull for sure, but breaks ie some EFL recipes.
>>
>> ie python-elementary depends on elementary >= 0.7.0.52890
>> but elementary.pc says Version: 0.7.0.0
>>
>> elementary.pc.in says Version: @VERSION@
>>
>> and finally VERSION is defined in configure.ac:
>> m4_define([v_maj], [0])
>> m4_define([v_min], [7])
>> m4_define([v_mic], [0])
>> m4_define([v_rev], m4_esyscmd([(svnversion "${SVN_REPO_PATH:-.}" |
>> grep -v export || echo 0) | awk -F : '{printf("%s\n", $1);}' | tr -d '
>> :MSP\n']))
>> m4_if(v_rev, [0], [m4_define([v_rev], m4_esyscmd([git log 2> /dev/null
>> | (grep -m1 git-svn-id || echo 0) | sed -e 's/.*@\([0-9]*\).*/\1/' |
>> tr -d '\n']))])
>>
>
> hmm strange that a configure scripts depends on SCM files. To me it
> seems wrong. Anyway I think you can patch configure.ac
> to replace v_rev definition to be based on SRCREV may be some sort of
> sed operation as do_configure_prepend might be a good way

this is used in all efl recipes and I've noticed it in elementary only
because python-elementary depends on such new version.

I've also found similar construct in other projects.. so maybe it's
not so efl related (and then harder to found&fix in all recipes).

Regards,


