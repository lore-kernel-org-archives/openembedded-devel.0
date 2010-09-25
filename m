Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzOov-0001w3-NB
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 09:05:19 +0200
Received: by iwn2 with SMTP id 2so1211302iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 00:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pxb2btQu54QZLoPIRJwDxVtG/rTjvUAZuP8vYk2IDqo=;
	b=UpdJ7AqHFatIusGwoBcsznF4kIN5FltA4yrKfm38uUY3rCZLX2eT/xmWBy+DrwzPsH
	+ylNrA/0mg+YsZbH31oijlL2jgFWPjr+rLBUlMYDdr+C6pfkizNmNqY70/ZAZ3hbWC9Y
	f6W8SSEtTkXTjczqx1NAGXw8JaYY1o/mRSPGc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=S6mMKDj5LEa2QU7uyGuFaexmYSLG/c6urVr6VIjBbMSZ/7nW2QaPfvSr0sbR2wosO/
	TTk1YZ/xtrE9lGF+xHIGsRf/hQhOZH6lB7lwnUFClBMlJjTVlXPjAHBRyZw+8M/qLHZb
	OdQWOkwEO0wGyZsm2hQbw+1KcY4sac4I9xFLs=
MIME-Version: 1.0
Received: by 10.231.35.77 with SMTP id o13mr5134136ibd.92.1285398311088; Sat,
	25 Sep 2010 00:05:11 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 25 Sep 2010 00:05:11 -0700 (PDT)
In-Reply-To: <20100924220649.GB3423@jama>
References: <AANLkTik4OGdeazaQbURbzDS4FSDDLPrrCT43YEQ8YJn2@mail.gmail.com>
	<20100924220649.GB3423@jama>
Date: Sat, 25 Sep 2010 09:05:11 +0200
Message-ID: <AANLkTim4Ucv8upa14EGL8xq4LsKoP5f6WfQFR4KQDKQo@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: navit svn fetchg issue
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
X-List-Received-Date: Sat, 25 Sep 2010 07:05:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/25 Martin Jansa <martin.jansa@gmail.com>:
> On Fri, Sep 24, 2010 at 10:30:54PM +0200, Frans Meulenbroeks wrote:
>> bumped into this fetch issue with navit
>>
>> first did a bitbake -c patch -b navit-icons_svn.bb
>> then did a bitbaek -c patch -b navit_svn.bb
>>
>> That one failed with:
>>
>> NOTE: Running task 2 of 2 (ID: 0,
>> /home/frans/oe/openembedded/recipes/navit/navit_svn.bb, do_fetch)
>> NOTE: package navit-1_0.1.99+svnr3535-r8.10: task do_fetch: Started
>> NOTE: Update svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/tru=
nk;module=3Dnavit;proto=3Dhttps
>> svn: Failed to add directory 'navit': an unversioned directory of the
>> same name already exists
>> ERROR: Task 0 (/home/frans/oe/openembedded/recipes/navit/navit_svn.bb,
>> do_fetch) failed with exit code '1'
>> WARNING: /home/frans/oe/bitbake/lib/bb/build.py:49:
>> DeprecationWarning: BaseException.message has been deprecated as of
>> Python 2.6
>> =A0 self.message =3D name
>>
>> NOTE: oestats: error sending task, disabling stats
>> NOTE: package navit-1_0.1.99+svnr3535-r8.10: task None: Failed
>> WARNING: /home/frans/oe/bitbake/lib/bb/build.py:59:
>> DeprecationWarning: BaseException.message has been deprecated as of
>> Python 2.6
>> =A0 msg =3D self.message
>>
>> ERROR: Unknown fetch Error: [Errno 2] No such file or directory:

>> '/home/frans/oe/downloads/navit_navit.svn.sourceforge.net_.svnroot.navit=
.trunk_3535_.tar.gz'
>>
>> Guess there is an issue fetching navit after having fetched navit-icons.
>
> Yes same downgrade/upgrade cycle as there was in matchbox-panel-2 and
> matchbox-panel-2-icon-themes
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc6a72ee2b9=
34017cfa31914886b32f1c58978c72
> issue discussed here many times..
>
> but keeping same SRCREV between navit and navit-icons is not good fix,
> because introducing separate navit-icons was mostly because it doesn't
> need to be upgraded that often (and it's rather big package to
> redownload even without any change inside everytime SRCREV of main navit
> recipe changes).
>
> Regards,
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
Ah ok, I understand what is going on.
Also peeked in the files now, which was interesting:

navit-icons_svn.bb says:
#use different URL than navit_svn does, to prevent upgrade/downgrade
cycle in downloads dir
SRC_URI =3D "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk/=
navit/navit;module=3Dxpm;proto=3Dhttps

navit_svn.bb says
SRC_URI +=3D "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk=
;module=3Dnavit;proto=3Dhttps

so apparently someone was aware of this issue (see the comment) but
someow it ended up on being the same svn anyway

Frans


