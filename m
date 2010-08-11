Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oj4US-0000eV-QL
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 08:09:15 +0200
Received: by yxi11 with SMTP id 11so4294121yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 23:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=a/GWZigYX5rIaYpyhPyhBL6jU2qkERw+eviZxkgrRB8=;
	b=djIhVIuzXvVxz+0tcWywSps7Rv3L6cMxtv0SuTBEf6537E38Gls0XaCZfCi9OG4/od
	yw68vnB7Owd23ZiqaXVXcP2bGrt7HLh7azF8cKc69yIANGx2Mtn2vTy+cIsz12fzNlPj
	bLn4aBVsha4D7KreI7HUwE5F1mp2HP+4Smp5o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dvnGF/XcvUxBd0RRSDWq4WPqSHQhCunpIDJ6zmKPjP0UUDJlJqHRySx2k1n3Wy3d5H
	Su1o3A2kG36QpqruxlYOg78+JpaatE0v/I/qH4BqjkVw/Qmp6lmoKXsxEMs/astiyHGe
	hdfmg8wBuaNeVBgIVqZpJW5iYOt+mHAeCVkXk=
MIME-Version: 1.0
Received: by 10.151.149.1 with SMTP id b1mr14490939ybo.303.1281506900211; Tue, 
	10 Aug 2010 23:08:20 -0700 (PDT)
Received: by 10.150.53.9 with HTTP; Tue, 10 Aug 2010 23:08:20 -0700 (PDT)
In-Reply-To: <AANLkTimVFCKL+M_c0rb=Zu0cktc0_QZQzZikR_T63Wj2@mail.gmail.com>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
	<i3se2n$gj7$1@dough.gmane.org>
	<AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
	<AANLkTimVFCKL+M_c0rb=Zu0cktc0_QZQzZikR_T63Wj2@mail.gmail.com>
Date: Wed, 11 Aug 2010 08:08:20 +0200
Message-ID: <AANLkTim2yjjPSC6=KfCgqWQteTqSFFga39gNyg7SoB3+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Wed, 11 Aug 2010 06:09:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Without quoting tons of text and without going into each individual
argument given there are a few remarks I want to give.

Things should be consistent and intuitive.
local.conf is for local configuration. as such it suggests that
whatever is in there is leading.
Having to append _local to an override to me is counter-intuitive.
(and *if* that is really desired or needed to have a _local suffix, it
should be documented clearly in the manual. Also an example should be
give in the local.conf.sample file. Afaik neither is the case as of
today). Even for a

Distro's probably know better what does and does not work together,
but in some cases distro's pin recipes for no apparent reason (or
personal developer preference). Users should have an easy way to
override this, and e.g. select a different version.

Also wrt the remark that "distro's know better". The same holds for
machines. As a machine maintainer I know probably better than the
distro which compiler is best for this machine/architecture. Yet as a
machine I am not supposed to pin the version of the compiler.

Have fun! Frans


