Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PjVot-0001xC-3f
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Jan 2011 12:51:52 +0100
Received: by iyj18 with SMTP id 18so4186690iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jan 2011 03:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=c5eP9UiUr3hpkyEWLrlLUVEyflL4Eh/bRJwErZcWE7A=;
	b=s7DBfhiWz7Nr6dDrwNuVryLutVq5502NO437j4uY4DdHIgbARv9oOmsk6ml3vwtu4i
	i2glr/Y4Yx7e3bWIgVfP5cAczdLzxdfidrb0hU/qNL000s0zZ0+TC2atRBNqy3oTUaJK
	ku8aBBRG4d2a8W5ygrBRhNSQKdkYMSgLY2/rY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KvGhtmiL2qHx6My8fqVEPT1wNOjK3x10ZIMbWtUkC5fBNQBtbrJPptI/q8R5+zRpXf
	k52bbfcUnKiqlcGuTp70towcdCu/Hyt7yjvQqtMNUUuVFCL6eHB7a2EgXkPAAxncrnjp
	YrjVdPdVE9tloCv01OKb+Ube1CvSj1BlgG4+I=
MIME-Version: 1.0
Received: by 10.231.14.199 with SMTP id h7mr5140310iba.158.1296388255179; Sun,
	30 Jan 2011 03:50:55 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Sun, 30 Jan 2011 03:50:55 -0800 (PST)
In-Reply-To: <AANLkTi=L4=feV011DQf0Nm0RUnrWT6EABbymCi=Uq-o9@mail.gmail.com>
References: <AANLkTi=L4=feV011DQf0Nm0RUnrWT6EABbymCi=Uq-o9@mail.gmail.com>
Date: Sun, 30 Jan 2011 12:50:55 +0100
Message-ID: <AANLkTintxTikzCLfxYP4swU1fy+-rULfSjT68Z6752Od@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: cups QA issue
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
X-List-Received-Date: Sun, 30 Jan 2011 11:51:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/26 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Hi,
>
> I got this while building cups, but I am not a gnome person (actually
> I am only intterested in the server part).
>
> ERROR: QA Issue with cups:
> /home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/cups-1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
> warning: value "Application;System;X-Red-Hat-Base;" for key
> "Categories" in group "Desktop Entry" contains a deprecated value
> "Application"
> ERROR: QA Issue with cups:
> /home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/cups-1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
> warning: key "Encoding" in group "Desktop Entry" is deprecated
> ERROR: QA Issue with cups:
> /home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/cups-1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
> warning: value "" for key "Path" in group "Desktop Entry" does not
> look like an absolute path
> ERROR: QA Issue with cups:
> /home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/cups-1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
> warning: key "TerminalOptions" in group "Desktop Entry" is deprecated
>
> Anyone care to fix this or provide a suggestion on how to fix ?
>
> Thanks, Frans
>

It has been suggested that these problems are resolved in 1.4, but as it stands
- the oe recipe is still at 1.2.12
- we have newer recipes: 1.3.8: added on sep 11, 2008, 1.4.3 added on
april 8, 2010, and 1.4.4 added sep 24, 2010; all these have DP -1
- no distro is pinning a version
Hence the testing for all distro's with sanity enabled should have
these QA errors.

Maybe we should move the recipe forward.

Guess this also illustrate that having unmaintained recipes is not the
best idea in the world.
Also I feel it is quite pointless to have a recipe with DP = -1 around
for two years especially if there are newer versions of the recipe as
well.

I also noticed Koen added 1.4.6 earlier today to meta-oe. Guess it
would be nice to keep oe and meta-oe in sync until we moved (or have
oe as the leading repo).

Just my two cents.

Frans.


