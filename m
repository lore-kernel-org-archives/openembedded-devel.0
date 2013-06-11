Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 51E856A99A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:27:39 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id k5so12479932iea.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9vNDh7jhHOKJcmBKmwo+6qJkCjQS+6SiK5rKcazcsW0=;
	b=pitA5m1ma61ysHvdS7p5yhgFpDAPwOYf8trnnYUDFZsGzXdP/W1v6cBx5dSKMeJvI7
	jsNmJhtkbXUeqdSYEdpVc2ouxUAZaXmSDd/AqwEnXyexmULvEQA3HBMiuToST7dpi8tS
	3Tg9/WPGNYH9BV8Y35bAUE9KXpFsmm45hPwqrDSHy0AhGHj3A0zh6KA0anvvkWZKgcAn
	Yj5v67d+nSEC1PYt7EAJyzoIyuktuLOrq0xSKKNmhh4RSjEEElq5zKbY+1lvzWOEQa6/
	1/1pAZh7KgBsLj3s8LwaD/+DrDScp3yMbYXOcUkiblKE/6ZCxfq2EszGtQmmweZKxr+M
	Efcg==
X-Received: by 10.42.11.211 with SMTP id v19mr3425693icv.29.1370939260191;
	Tue, 11 Jun 2013 01:27:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 01:27:10 -0700 (PDT)
In-Reply-To: <20130606132426.GD22710@jama>
References: <CALbb29ugW_zahrp72enLdr-Opk=a7wfJq_TLH7RZB3HQxiRSTg@mail.gmail.com>
	<20130606132426.GD22710@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 01:27:10 -0700
Message-ID: <CAMKF1spaYVhgSBCvV7rVE3jrty_Bb-r2B9=AGbdaxsAq+MDZ+g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Pasquale Bongiovanni <palebongiovanni@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-multimedia] Problem with xbmc
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
X-List-Received-Date: Tue, 11 Jun 2013 08:27:39 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 6, 2013 at 6:24 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jun 06, 2013 at 03:13:46PM +0200, Pasquale Bongiovanni wrote:
>> Hi all,
>> I'm new on yocto, I would like to create a core-image-sato including the
>> package xbmc.
>> But when I launch the command bitbake core-image-sato or bitbake xbmc, it
>> fails at task co_compile with the following file log:
>>
>> ...
>> In file included from DVDClock.cpp:25:0:
>> /home/pasquale/Scrivania/alibi/projects/prova/image-xbmc/tmp/work/armv7a-vfp-poky-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a43efa-r15/git/xbmc/utils/MathUtils.h:
>> In member function 'int CDVDClock::UpdateFramerate(double, double*)':
>> /home/pasquale/Scrivania/alibi/projects/prova/image-xbmc/tmp/work/armv7a-vfp-poky-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a43efa-r15/git/xbmc/utils/MathUtils.h:101:28:
>> error: impossible constraint in 'asm'
>> /home/pasquale/Scrivania/alibi/projects/prova/image-xbmc/tmp/work/armv7a-vfp-poky-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a43efa-r15/git/xbmc/utils/MathUtils.h:101:28:
>> error: impossible constraint in 'asm'
>> /home/pasquale/Scrivania/alibi/projects/prova/image-xbmc/tmp/work/armv7a-vfp-poky-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a43efa-r15/git/xbmc/utils/MathUtils.h:101:28:
>> error: impossible constraint in 'asm'
>> /home/pasquale/Scrivania/alibi/projects/prova/image-xbmc/tmp/work/armv7a-vfp-poky-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a43efa-r15/git/xbmc/utils/MathUtils.h:101:28:
>> error: impossible constraint in 'asm'
>> make[1]: *** [DVDClock.o] Error 1
>> make: *** [xbmc/cores/dvdplayer/DVDPlayer.a] Error 2
>> ERROR: oe_runmake failed
>> ERROR: Function failed: do_compile
>> How can I solve this problem?
>
> It's known problem, fails for all my architectures, koen probably has it
> working, so maybe he will give you better advise..
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2013-June/090945.html

as it seems if you have neon enabled for compiler to use then this
works out ok. So any arm platforms using neon
would work out to be ok. If your platform does not have neon then you
want to explore --with-platform option and probably
disable some features which includes the offending code

>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

