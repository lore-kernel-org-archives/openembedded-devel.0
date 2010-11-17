Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIcM2-0001Xr-Uq
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 08:25:07 +0100
Received: by iwn38 with SMTP id 38so524767iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 23:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ArSSJVx49mb/5K3iadTZ7yjpxzxaI9Rn6iFdPWQzaHs=;
	b=wyMnyhnpHRY9MgBbbpccNMavLBEgXTNJ2tQ2D6qBGMY2+G+DH3iuAALy4GqUyl4qGE
	Pn8wpQyfq0MB/zr3vzwkSxIRlW8ErFhklM1b/zpRHSUe7gkuwaCzoDpcLxjYJdJKDJdI
	RHrfle29+N8M4N4kL6DIg7T3kQft6S0nOkcWI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TbbhZiRyY2+/Z6awrP/GnnuumChx7zz2v80j/KmuAafgxwxarXO5pP+QOq4KMaP8QM
	1PmBp/p2ppDUS9R/JVw/cqAoGXbWSmCczkJOU8Gv38fEflF12wJfE43iiO42CkbvFiw6
	VRlcbr4H0ukaoRrWDu4ybpeG9qW6wyzJvPJH8=
MIME-Version: 1.0
Received: by 10.231.17.203 with SMTP id t11mr6813537iba.1.1289977811101; Tue,
	16 Nov 2010 23:10:11 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Tue, 16 Nov 2010 23:10:11 -0800 (PST)
In-Reply-To: <AANLkTikNpCh_ngjsgGwUYhjX4uAZziV=5ZbkdJLk=O+5@mail.gmail.com>
References: <AANLkTimAqPZaYRHA9xy0pOVhpdwyFKq=LWuuMZRBq0N=@mail.gmail.com>
	<AANLkTikNpCh_ngjsgGwUYhjX4uAZziV=5ZbkdJLk=O+5@mail.gmail.com>
Date: Wed, 17 Nov 2010 08:10:11 +0100
Message-ID: <AANLkTinbPOX3sx+xJdZFTq1Qijn1mz6bZTYUf2VHHW31@mail.gmail.com>
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
Subject: Re: PREFERRED_PROVIDER issue/question
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
X-List-Received-Date: Wed, 17 Nov 2010 07:25:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/17 Khem Raj <raj.khem@gmail.com>:
> On Tue, Nov 16, 2010 at 1:44 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>>
>> So it seems to check PREFERRED_PROVIDER_mysql5 not (what I had
>> expected PREFERRED_PROVIDER_libmysqlclient)
>>
>> Questions:
>> Is this a bug somewhere?
>
> Usually sometimes one package provided something the other does not so
> they dont behave as drop in replacement. So make sure you find the
> differences between say mysql and mysql5 recipes
>
>> What should I do to pin my libmysqlclient?
>
> what you did is ok.

Yes but it does *not* work!
After doing so I *still* get:

NOTE: multiple providers are available for runtime libmysqlclient
(mysql5, mysql)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libmysqlclient

That's why I was asking whether this was a bug somewhere.

>
>> Should we perhaps nuke the myql package ?
>
> if its not pinned thats an option.

frans@frans-desktop:~/workspace/openembedded/recipes/uclibc++$ grep -r
mysql ../../conf
frans@frans-desktop:~/workspace/openembedded/recipes/uclibc++$ grep -r
sql ../../conf
../../conf/distro/include/preferred-shr-versions.inc:PREFERRED_VERSION_postgresql
= "8.4.4"
frans@frans-desktop:~/workspace/openembedded/recipes/uclibc++$

There is no DEFAULT_PREFERENCE for it either:

frans@frans-desktop:~/workspace/openembedded/recipes/mysql$ ls
files		 mysql5		   mysql5_5.1.40.inc	    mysql-native_4.1.22.bb
mysql_4.1.22.bb  mysql5_5.1.40.bb  mysql5-native_5.1.40.bb
frans@frans-desktop:~/workspace/openembedded/recipes/mysql$ grep PREF *
frans@frans-desktop:~/workspace/openembedded/recipes/mysql$


Best regards, Frans


