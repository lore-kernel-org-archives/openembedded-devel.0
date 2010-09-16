Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OwACp-000255-4u
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 10:52:40 +0200
Received: by iwn2 with SMTP id 2so890283iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=2L1CmmLl/viRzFVKfltmc7AK6h+UQx0sWOE1x1CXLSg=;
	b=DVoKiVgu10r9PtL9i8olis7REdvwTnXQtond5yfM9pLPwXxw/xlWnZI1ABlsu5EmpI
	j38KZaDjNEFZn8ajhmjP42lpgngNQCxV6T2UY1/aHHgnZPIY2jV3NkFgjzh9NWnbAiAo
	UWF1AgnqMijqAaanPOECgvbu1yep/C2mtX/ic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bg8+/0eon+K91fQKyreOYl2Q3I7KsilX5upZodr2mSAWV897AwAOQ9QIytjcvmPF8m
	tZv6TbqnhAu4H0d47NVAmtjxbsVgx1teIMPTzhthK91aKYaOjfPl/qtu3k5aT5ki2lcR
	2evAf5QtkaFb079Vbbv5oGlYO/Iwru+mJg5TU=
MIME-Version: 1.0
Received: by 10.231.32.135 with SMTP id c7mr3218721ibd.3.1284627106333; Thu,
	16 Sep 2010 01:51:46 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Thu, 16 Sep 2010 01:51:46 -0700 (PDT)
In-Reply-To: <4C91D544.7070702@dresearch.de>
References: <AANLkTikYsro5b_6S9NKSyPWC0DMMr9A9zKyL0qXF53Zs@mail.gmail.com>
	<4C91D544.7070702@dresearch.de>
Date: Thu, 16 Sep 2010 10:51:46 +0200
Message-ID: <AANLkTinQbPD21+gAvEoBEn3KaPUvz3cK4u9+LjkL1JqC@mail.gmail.com>
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
Subject: Re: melo git outage
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
X-List-Received-Date: Thu, 16 Sep 2010 08:52:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/16 Steffen Sledz <sledz@dresearch.de>:
> Am 15.09.2010 22:32, schrieb Tom King:
>> In approximately 1hr 21:30UTC I need to rsync the server to create a backup
>> and perform an upgrade to the melo server so that we can add some additional
>> functionality.
>>
>> I suspect that the rsync and upgrad will take approx 2-3hrs (to fix things
>> that break)
>
> No yet back again. :(
>
>> git pull
> git.openembedded.net[0: 140.211.169.165]: errno=Connection refused
> fatal: unable to connect a socket (Connection refused)
>
> Steffen

Here it works:

frans@frans-desktop:~/workspace/openembedded.git$ git pull
remote: Counting objects: 9, done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 5 (delta 3), reused 0 (delta 0)
Unpacking objects: 100% (5/5), done.
From git.openembedded.org:openembedded
   23e6589..6aa0766  master     -> origin/master
   23e6589..6aa0766  org.openembedded.dev -> origin/org.openembedded.dev
Updating 23e6589..6aa0766
Fast-forward
 recipes/nodejs/nodejs_0.2.1.bb |   23 ++++++++++++++---------
 1 files changed, 14 insertions(+), 9 deletions(-)

Frans


