Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oit7Q-0003yw-8z
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 20:00:24 +0200
Received: by gwb15 with SMTP id 15so4087357gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 10:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=yvQPkCrBnV5AFS8dMeRX24cari9K7Hum56/BBRXTUlQ=;
	b=uKtjpQiVw4RD7XkkIycNNEJQiWDoqbFdCrjl8rj3c8cJghDyIjyy0gia7wC5hkrFX2
	9HS+MqSNbdzdElERxmD1r23kJupOrWE7olN5dmpaBgWPXa/YWuFH3b+QVJeRUKXBf4m1
	yAN/LmOHxRW5FmRznCzrutN8SajEesawe5cm4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=O92cuKrwwM2bypzMbVak76da0/oBTDfVS3a1T2EQ8D2dSibJPu9oF/n5znL9v9AVF3
	if1GJxittxz+hCaBtIOLyr+xHw2wH9lRtYv9b2FzIv2SNCEzoScPbhhs+XFHH4T7uvir
	x8XqCnc78qdx38rjiE887AzjFZw9RNnhMd6m8=
MIME-Version: 1.0
Received: by 10.150.58.20 with SMTP id g20mr19659078yba.84.1281463196872; Tue, 
	10 Aug 2010 10:59:56 -0700 (PDT)
Received: by 10.150.53.9 with HTTP; Tue, 10 Aug 2010 10:59:56 -0700 (PDT)
In-Reply-To: <20100810171950.GA32300@jama>
References: <1281459157-4103-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20100810171950.GA32300@jama>
Date: Tue, 10 Aug 2010 19:59:56 +0200
Message-ID: <AANLkTikVJFZcEO39CnBJfVBdVvjFohDM+E17kXZCmjrr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] conf/distro/include: remove unused versions
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
X-List-Received-Date: Tue, 10 Aug 2010 18:00:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/10 Martin Jansa <martin.jansa@gmail.com>:
> On Tue, Aug 10, 2010 at 06:52:37PM +0200, Frans Meulenbroeks wrote:
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> ---
>>
>> While browsing through conf/distro/include I notided some files that were not used.
>> Triggered by this I did a grep in conf/distro and conf/distro/include to see what files
>> were actually used.
>>
>> I manually compared this with the contents of the include directory
>> The folllowing files were not used by any distro. (and there is also
>> no require for them in the recipes dir).
>> Unless someone comes up with a reason to keep one of them, I propose to remove these.
>
> IE fso-autorev.inc is still usefull and usually included from
> local.conf.

Ok, then lets keep it.
>
> preferred-xorg I proposed to cleanup already in
> http://patchwork.openembedded.org/patch/2262/

Missed that. sry. do you still want an ack for it.
>
> conf/distro/include/preferred-xorg-versions-live.inc is only one I
> maintain up-to-date with my xorg bumps (and can be usefull if you want
> latest xorg stuff from local.conf while your distro includes ie X11R7.5
> and you want to overwritte it with latest).

Ok, so good to keep as well
>
> No strong opinion about other .inc.


Well the om can go as openmoko is declared dead.

Personally I was not really sure whether freeze.inc actually is used
and/or is worthwhile to retain.

Frans


