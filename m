Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8oop-0001RZ-QM
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 08:40:09 +0200
Received: by ywl5 with SMTP id 5so2672268ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 23:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=86gkbHpaE5q7qnb+EPd1tQLGOHKstV2GFC611qGgP2o=;
	b=oHrV0OPqGOyWGZQ0Aw9YIECizh3Fo2uE/MD4nCcrm9aU+QWHp5mW7rYSbfmS8HGBYT
	pMoPY1g4IGq+9rNz7MxJBJ06wMh8x/NttoWj50iOlhmD+PkthFaVJpM/TtrQSwh7kjSz
	5XFSUx1qITFJkVUUyJYS2p7VYaTMg4ZRP6nfo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=eVfbs6ZPRHzBYmwbiQJa9W8FePXPsXJRB16iY4eNNXIAx+xaen7s0a96tYq3h1XX/l
	7LNn5OMiRUVdYkJJo8GEUeHprIP9yIoj+JiScNZHIK/RdcCuWhErtcvDypMs/sXZ4TQh
	Wjlnmz3OcBUeXeCYY0FSsud7aMXsFTFEEvwlo=
MIME-Version: 1.0
Received: by 10.42.22.132 with SMTP id o4mr178352icb.479.1287643170299; Wed,
	20 Oct 2010 23:39:30 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 20 Oct 2010 23:39:30 -0700 (PDT)
In-Reply-To: <20101020185840.GQ11514@denix.org>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
	<AANLkTi=uKwjKYq5W4VwKXcNHdSJkxZnu_w4M9kkvVWoX@mail.gmail.com>
	<20101020182509.GO11514@denix.org>
	<4CBF39BF.9000809@opendreambox.org>
	<20101020185840.GQ11514@denix.org>
Date: Thu, 21 Oct 2010 08:39:30 +0200
Message-ID: <AANLkTim5Uak1Q6unMDWYg=utkv_cUVeQDod=D2jg7MOR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Thu, 21 Oct 2010 06:40:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/20 Denys Dmytriyenko <denis@denix.org>:
.
>
> GPLv2 and GPLv3 are not compatible. Thus, there cannot be a derivative work
> that combines those two. But if one piece of code is GPLv2+ and another is
> GPLv3, the resulting combination is licensed under GPLv3.
>
> So, it's always good to know which libraries you have as strict GPLv2 and
> which are "GPLv2 or later", even in case when you are Ok with GPLv3, you
> should know to not use strict GPLv2 code in any GPLv3 projects...

Note that this applies to programs. A derivative work that just
combines things is quite possible afaik (e.g. a linux kernel (v2 only)
and a recent samba (v3))
Whether using a v2 only and v3only shared lib in an app is possible is
unsure to me; static linking with v2 and v3 is afaik a no-no.

Frans.


