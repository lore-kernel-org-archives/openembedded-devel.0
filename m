Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PAIew-0000Ma-Pq
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 10:44:04 +0200
Received: by iwn41 with SMTP id 41so503406iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zTK0Cl+hBdqYReddQpriyM4WZ6RySwZbrw6Y3EbeEzk=;
	b=Y1lsu/lG5dEquhM0HbXeIOdAv0EDtEtc2OuLI67Mi6ApeyyeAbkngLwEvs6uU/w9GB
	7U07VhF0H83kg1FaQr7Gftrowi9OpL7cJKsfbaTrCW3T0h3XSdaSfCaVXj31eYMdMpP4
	5gizFrtyzlXY3DQ3r5IgjrarSqnKeKugkTlhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=OeXkD2sw44Ir6BQ4/zeRMwC1+/Kjwjnrt9AELAE11PB7O0yX+EBCHNHDNJyp+kV9qp
	slPPkE6oYaGV4r+5ew4xdGpBgrZcAKzuckW81JQ7YSskTElN2uCPaNU559GqjlkFLRAL
	Y8wnV6niNZxkRwa7OAES/i4NwXnUQfAbAf1d0=
MIME-Version: 1.0
Received: by 10.231.85.137 with SMTP id o9mr1313023ibl.130.1287996192519; Mon,
	25 Oct 2010 01:43:12 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 25 Oct 2010 01:43:12 -0700 (PDT)
In-Reply-To: <AANLkTi=8nX02nqndcpp3uMgx2D6sb83qMK20Nuy1jovN@mail.gmail.com>
References: <AANLkTikq1TNg1Y=f7tVjpkZR8Hre1FoGyK1gUGTKNDKB@mail.gmail.com>
	<AANLkTimPLjpHi7Xt=NsnQRxHOR+9ZWEPoTE7PjssdzN1@mail.gmail.com>
	<AANLkTi=8nX02nqndcpp3uMgx2D6sb83qMK20Nuy1jovN@mail.gmail.com>
Date: Mon, 25 Oct 2010 10:43:12 +0200
Message-ID: <AANLkTimWaT4j+PLqQshAG+sJHJWnm9OdY5xwKvVcqJi+@mail.gmail.com>
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
Subject: Re: empty strings
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
X-List-Received-Date: Mon, 25 Oct 2010 08:44:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/25 Khem Raj <raj.khem@gmail.com>:
> On Fri, Oct 22, 2010 at 2:00 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> ping.
>>
>> people don't care?
>> I feel there are some issues in the examples below (and some easy
>> cleanup actions).
>
> If you dont generalize and pick and test a recipe at a time that would
> be much sane way to go with such changes.
> Sometimes they might look obvious but they may not be. So my humble
> request is to go recipe by recipe instead of
> some seding and grepping.
>

I will.

Actually one of the reasons for posting this was that someone perhaps
could say upfront something like:
"Nah this is sound, no need to waste time on this" (as actually done
by Robert in a previous email"

The other reason was that I hoped that some people would be triggered
to peek in their recipes and resolev things themselves.

And the 3rd reason was to get some feedback on things that look
suspicious or strange.
E.g. these ones:

apt/apt-native.inc:PACKAGES = ""  (this is a native recipe, isn't this
always the case for native recipes ? )
bind/bind_9.3.1.bb:RPEDENDS = "" (this one has a DEPENDS on openssl, I
would expect it also to rdepend on openssl in this case)
glibc/glibc_2.10.1.bb:  CPPFLAGS="" oe_runconf (I was wondering of the
resetting CPPFLAGS is useful, didn't really dig into this one)
ipkg/ipkg-native.inc:PROVIDES = ""  (hm, no provides)
psmisc/psmisc.inc:FILES_${PN} = "" (guess all files are added to other
packages, if that is so, should there be a line like this?)
tmake/tmake_1.11.bb:FILES = ""
ttf-fonts/ttf-hunkyfonts_0.3.0.bb:RRECOMMENDS_${PN}-dbg = "" (seems
somewhat strange to me)

Frans.


