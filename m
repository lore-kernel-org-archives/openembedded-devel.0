Received: from mail-qw0-f65.google.com ([209.85.216.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <a.sappia@gmail.com>) id 1PHo1F-0004Vj-2R
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 02:38:10 +0100
Received: by qwi4 with SMTP id 4so137358qwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Nov 2010 17:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=0ofAkSiJFrYMPvz4or2lUtdx8Vu1qN+aOR2VqpFE7is=;
	b=K/nYtsPJevxJbS0RBDU44GJwIPimhMoQCi4wsZESmBdVtKqur9UzhyjCxwuoVg3kus
	e6ndFKCWXz1ffNGzEZRl827mYRac7kRnTBlYhrMckSmRZsGiEn3cDNGHuIVPZhVyi1id
	A6LdpIL1fZfkOS0PDPWnkU8rHPIdSu6SKAzZM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=tUK+5j49ZHH6cbielkIskXfZFTyp/DMilt2LiW59kpa5hc9DtoOHfcmiinPGwiwRfH
	AlCtBuO55krqJ6lh1wSjLGKdejfb6ej7xo66MxLbclr8Fmmo9bvLWsDmRIP2u4KDp7ng
	z1XmSw8/HkANwE692LlEpyHRsp6ye8WwNr8sw=
Received: by 10.229.241.5 with SMTP id lc5mr3571642qcb.165.1289785020332; Sun,
	14 Nov 2010 17:37:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.215.129 with HTTP; Sun, 14 Nov 2010 17:36:38 -0800 (PST)
From: Alessandro Sappia <a.sappia@gmail.com>
Date: Mon, 15 Nov 2010 02:36:38 +0100
Message-ID: <AANLkTinbpJJnbj38dV1P7tN1aHobq4XOmQe16kR7-bkW@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.216.65
X-SA-Exim-Mail-From: a.sappia@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: qt4-embedded and plugins - bitbaking qt4-embedded in a useful way
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
X-List-Received-Date: Mon, 15 Nov 2010 01:38:10 -0000
Content-Type: text/plain; charset=UTF-8

hi all,
I wrote a small qt application and I want to run it on top of a mini2440
board (7").
I was able to build a working image with qt4-embedded and my app but then
I'm
stuck to the point that my app needs sqlite and qt4-embedded don't provide
it
(almost from what I've read).

the git repository I've used is
git://repo.or.cz/openembedded/mini2440.git

the image boots and on prompt I write

qMyApp -qws

this stats qt-embedded right, and after I read that there is no sql driver
plugin
available.

from what I've found (1) classes/qt4e.bbclass says just "network" plugin and
no "sql"
plugin; (2) qt4-embedded.bb include qt4.inc that has --no-sql-sqlite in it.

now I'm stuck: change that to what I need ? I've tried to overlay the
qt4-embedded.bb
recipe, but I didn't get anything useful from it (maybe I'm doing overlaying
wrong)

Does anyone knows how to solve this ?

regards

Alessandro

-- 
Alessandro Sappia
a.sappia@gmail.com

