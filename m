Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pabcc-0001bU-7g
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 23:14:22 +0100
Received: by gwaa12 with SMTP id a12so3987941gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 14:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=TAulpV9iDG1/MiCLPViq8er8AZJyREZ95zi31PZQpA8=;
	b=QutUfEMNvEvzMRjbBdPuvoS0E1rrmb1/S8R88jszmUXqSJs3du16kU49PPfa65vkZ9
	Ee2MXaIlzD8PHhW45vspJbVuw7td+oqMyjQyLY/pk0IGIGYGWgbDOngrFIXsn5CkJwlX
	aJepddEOmn62b+25R/XoruoO6uCcsUw1Tc7/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=qdaKEHd8t2NaAl1W3TzusSZiN2vP7h1uhX1VUGppKHc+BDX1Jk+nETM96kKm1oFPnT
	Xb9XgvbgN19OQ+PmGEdwhtwPC2jRqxeHCSj1sbKSVIBU6/AKNU00xRkNz46frF9M7M92
	sTRIWO8Dw2R8YyxYzYxhb+8g7aW/0T1wnk730=
Received: by 10.90.80.18 with SMTP id d18mr1262468agb.31.1294265637629; Wed,
	05 Jan 2011 14:13:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 5 Jan 2011 14:13:37 -0800 (PST)
In-Reply-To: <4D24E1FF.9040303@eukrea.com>
References: <4D24E1FF.9040303@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jan 2011 14:13:37 -0800
Message-ID: <AANLkTi=G=rGtJ8pseovKRmwARB+0dYtg-exY1JeWPsgB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: cyclic dependencie
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
X-List-Received-Date: Wed, 05 Jan 2011 22:14:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 5, 2011 at 1:26 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi,
>
> while building minimal for an armv4 target on a freshly installed Fedora =
14
> x86_64, I meet the following problem :
>
> bitbake glib-2.0-native don't build because bitbake first tries to build
> desktop-file-utils-native which depends on glib-2.0-native and thus fails=
 to
> configure with "No package 'glib-2.0' found" (I don't have glib-devel
> installed on the host).
>
> desktop-file-utils-native seems to be listed as DEPENDS only in
> insane.bbclass.
>
> Do you have any idea on how to fix this ?

if you can figure out which parts depend on each other may be we can
sort it out by splitting the recipes.

>
> Thanks,
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


