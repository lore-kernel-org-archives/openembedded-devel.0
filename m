Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PaXyE-0004ZZ-3R
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 19:20:26 +0100
Received: by iwn8 with SMTP id 8so15962246iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 10:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=K48PrvzpMFHM+znN5b+8w3I2wOTSt1A4iM1eek6l/ME=;
	b=Z+jaK77ppNZd4jaPAPiIrwKzhunKl3qWQnzjzvn2TzRmRG/tEUuPxEFScLQsLaXYYq
	j9iwoPksdGM1TnoYiKf5GGlUMqQC9wwWF7XWOJ/bH03QrtjtIkPdSmTvSbv0JsmsnKOW
	gaR/sU1eJtmNINHL1fj31VTcLZzR+xiOpQU44=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VhiV+ctDXlFDB1DY7d/biRM4OPUPjEtiJPHlyLPrwnnC0sC+O9HaGgcoqhetxpUxIc
	MqcXN/PqrTyWtoh19s5uhcWZXIXtg+UgGrkODB94ciabcyPczs7JHzOhSE1RhoCR+eaS
	kCGTWtMU/Kuj/v2RWvTPbkFyY+Thp4K0gsKnU=
MIME-Version: 1.0
Received: by 10.231.37.70 with SMTP id w6mr13465341ibd.169.1294251601040; Wed,
	05 Jan 2011 10:20:01 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Wed, 5 Jan 2011 10:20:01 -0800 (PST)
In-Reply-To: <201101051735.43988.marcin@juszkiewicz.com.pl>
References: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
	<201101051252.07668.marcin@juszkiewicz.com.pl>
	<AANLkTiks7z6oag1GLC=cj9a-mmtYqm-0Z1oCE2zZXT9R@mail.gmail.com>
	<201101051735.43988.marcin@juszkiewicz.com.pl>
Date: Wed, 5 Jan 2011 19:20:01 +0100
Message-ID: <AANLkTinuhK6fOzjf5gYmZZxeHh8bRkSiVr1pF4ckGZWn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] linux 2.6.36: upgrade to 2.6.36.2
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
X-List-Received-Date: Wed, 05 Jan 2011 18:20:27 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2011/1/5 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia =B6roda, 5 stycznia 2011 o 14:51:35 Frans Meulenbroeks napisa=B3(a):
>> > I think that stable kernel updates should be applied without asking - =
but
>> > if there are some patches for some machines in recipe then it needs to
>> > be checked does it patch/build before pushing update.
>
>> There are. Both systems mentioned above have patches.
>> I've no idea if they will remain to apply after moving to .2. Of
>> course I can verify that, but if they fail I am not too sure if I can
>> fix things. They are machines that I do not have.
>
> for mach in machine1 machine2;do MACHINE=3D$mach bitbake -b linux_2.6.36.=
bb -
> cpatch;done
>
> This will test does patches apply. If they are then push change, if they =
not
> then check why - maybe they contain patches from stable update (edit them
> then)>
>> Thinking of it, probably it is better to create a 2.6.36.2 recipe with
>> DP =3D -1 for all but my board and leave it to the mx31ads and ts72xx
>> machines to move to that recipe when they see fit.
>
> Why not linux-yourmachine_2.6.36.2.bb then? linux_BASE_VER.bb recipes wer=
e
> created to limit amount of kernel recipes, not to enlarge it.

linux-yourmachine_2.6.36.2.bb also enlarges the number of recipes.
And as a policy we could decide to phase out e.g. 2.6.32.1 after a while.

Anyway, the topic is moot as I saw that today 2.6.37 was released so
since I have to take a leap anyway, I'll probably go to that version.

Frans.


