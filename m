Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Nlqv3-0007Zq-MJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 22:43:23 +0100
Received: by pwi5 with SMTP id 5so1254183pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 13:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ZfLn3NVCO7GStZ/5hQtwC8jpNcAjvuqaqxD4ym6BcsM=;
	b=tjQjh+oi8hkjo0y5hs09R7l+a1TPsmaGfTbVksi/n3vQlDl1BM4AD+iDPhpUI8Ys6Z
	sdAiAqaO3fT1x7xQ0iKvFMw3Fwp0eBOa3IiTlpfjjsrj9dQS6wc+tzNknY6sGBN/5prS
	DMR5DcKdPMlwenid1eQmNS9edvHNA7+pPekoY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=uTjs+imwxlWnjQQCEV08Aon5vuDLkILEJNZnIMQMcjxqJdBnwT/z5zQQ06d4roEwpt
	QED6fcAJpMuwxTS0zKdIh0gvOmZsC/efv8WHKfq3Yh9o6VGddMQlaZq01fRRGyQN4v5E
	2boFKe3yzYfoMVWYiO5qGCZznsc59n87oly7c=
MIME-Version: 1.0
Received: by 10.142.1.6 with SMTP id 6mr2024783wfa.156.1267393231688; Sun, 28 
	Feb 2010 13:40:31 -0800 (PST)
In-Reply-To: <ac9c93b11002281226w3b73d9ebo6c3169dedd1b74c5@mail.gmail.com>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<hmeia3$p6c$1@dough.gmane.org>
	<ac9c93b11002281226w3b73d9ebo6c3169dedd1b74c5@mail.gmail.com>
Date: Mon, 1 Mar 2010 08:10:31 +1030
Message-ID: <6ec4247d1002281340t76447b67hc0457bbf702d38b9@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Sun, 28 Feb 2010 21:43:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 1 March 2010 06:56, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> 2010/2/28 Koen Kooi <k.kooi@student.utwente.nl>:
>>
>> But more importantly, what harm do the recipes do to you? Does it offend
>> you that there are 26 recipes?
>
> Somewhat yes. Frankly I don't see a use for 26 recipes for all kind of
> different versions, some of which are very outdated.

What should offend you more is stuff like this:

[grg@rak gcc]$ pwd
/home/grg/oe/openembedded/recipes/gcc
[grg@rak gcc]$ find . -name svn-updates.dpatch -exec ls -l {} \;
-rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
./gcc-4.4.2/debian/svn-updates.dpatch
-rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
./gcc-4.4.1/debian/svn-updates.dpatch
-rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
./gcc-4.3.1/debian/svn-updates.dpatch
-rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
./gcc-4.3.3/debian/svn-updates.dpatch
-rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
./gcc-4.3.4/debian/svn-updates.dpatch
-rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
./gcc-svn/debian/svn-updates.dpatch
-rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
./gcc-4.3.2/debian/svn-updates.dpatch
[grg@rak gcc]$ grep svn-updates *
[grg@rak gcc]$

-Graham


