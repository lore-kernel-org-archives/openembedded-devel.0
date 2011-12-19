Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RceU1-0001tt-Tq
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 15:46:30 +0100
Received: by qabg14 with SMTP id g14so3607414qab.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2011 06:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=pkUsYqKnuaits/ErwH/Vtl81Cyzsazw8bO0K8TWxPH4=;
	b=W24ntH/ifEiUh57wnwiwkZPg+H80I83Mlel/YZATzBeHXiKdaXnMxSTLhBeLOcOxyl
	MA8MSqByfV23M/RQRBQk8gpyv30Q5fiIIW4wYa3VWLA94ZuNQB5ntxmaKaH39e3Ouxv8
	WhhH4K6q37VtPCeeCr7IN6INjpgZtkuLYveNU=
MIME-Version: 1.0
Received: by 10.224.198.10 with SMTP id em10mr24916710qab.44.1324305565972;
	Mon, 19 Dec 2011 06:39:25 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Mon, 19 Dec 2011 06:39:25 -0800 (PST)
In-Reply-To: <4EEEE51E.6040306@dresearch-fe.de>
References: <cover.1323862499.git.sledz@dresearch-fe.de>
	<CA+M6bXk57+wbvAzkLrZVDPCvhGFLH8A-A3ESNnW_-Yk=TiDfLw@mail.gmail.com>
	<4EE995AB.5090503@dresearch-fe.de>
	<4EEEE51E.6040306@dresearch-fe.de>
Date: Mon, 19 Dec 2011 07:39:25 -0700
Message-ID: <CA+M6bXn5CCfETj1qctbPyCt5qB4=9em-K2af78x0W6QEA2ZxsQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/5] pull request 20111214
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
X-List-Received-Date: Mon, 19 Dec 2011 14:46:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2011 at 12:17 AM, Steffen Sledz <sledz@dresearch-fe.de> wro=
te:
> On 15.12.2011 07:37, Steffen Sledz wrote:
>> Am 14.12.2011 19:07, schrieb Tom Rini:
>>> On Wed, Dec 14, 2011 at 4:40 AM, Steffen Sledz <sledz@dresearch-fe.de> =
wrote:
>>>> Hi Tom,
>>>>
>>>> please pull these 5 commits cherry-picked from oe.dev.
>>>> All of them are bugfixes and tested in our own environment.
>>>>
>>>> Thx,
>>>> Steffen
>>>>
>>>> The following changes since commit 9826895e30baa597a5ec433cc0ebd52f5f6=
c8796:
>>>>
>>>> =A0Merge remote-tracking branch 'upstream/2011.03-maintenance' into sl=
edz/maintenance (2011-12-09 14:06:08 +0100)
>>>>
>>>> are available in the git repository at:
>>>>
>>>> =A0git://git.openembedded.org/openembedded sledz/maintenance
>>>> =A0http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Dsledz/m=
aintenance
>>>>
>>>> Stefan Schmidt (2):
>>>> =A0llvm2.7_2.7: Add patch for build errors on newer gcc / glibc
>>>> =A0 =A0combinations
>>>> =A0llvm2.7_2.7.bb: Update patch to use c++ include style.
>>>>
>>>> Steffen Sledz (3):
>>>> =A0live555: replace version 20110314 with 20111120
>>>> =A0icedtea6-native: fix problem on build hosts with linux kernel 3.x
>>>> =A0openjdk: fix problem on build hosts with linux kernel 3.x
>>>
>>> Only 1 2 and 3 made it to the ML.
>>
>> Please have a second look. They all should be there.
>>
>>> 1 and 2 are fine. =A0For 3, we should
>>> grab the old file (someone must have a copy) and stick that on
>>> sources.openembedded.org.
>>
>> The version replacement is not just for the well known live555 download =
problem. It fixes some other problems too. Also the version introduced by t=
his patch is already uploaded to sources.openembedded.org and the angstrom =
mirrors.
>
> Ping!

Sorry for the delay.  Especially since I'm now going to ask you to
rebase the branch.  Here's what I get after merging your request:
$ git log --oneline origin..
b6cc3be87 Merge branch 'sledz/maintenance' of git://git.openembedded.org/op=
enemb
eda1aaf openjdk: fix problem on build hosts with linux kernel 3.x
4500148 icedtea6-native: fix problem on build hosts with linux kernel 3.x
cb5b2fb live555: replace version 20110314 with 20111120
3904feb llvm2.7_2.7.bb: Update patch to use c++ include style.
a992bc4 llvm2.7_2.7: Add patch for build errors on newer gcc / glibc combin=
ation
9826895 Merge remote-tracking branch 'upstream/2011.03-maintenance' into sl=
edz/m
ebb70fd gypsy: update to latest upstream version 0.8, and remove version 0.=
7
69186cf gypsy: move generic SRC_URI part to gypsy.inc
7f9e803 gypsy: fix packaging of DBus starter script
45b8af8 rsyslog: change path for config includes to /etc/rsyslog.d
77a5200 Revert "gypsy: fix packaging of DBus starter script"
105f8ae Revert "gypsy: move generic SRC_URI part to gypsy.inc"
701d1cb Revert "gypsy: update to latest upstream version 0.8, and remove ve=
rsion
593bb51 Revert "rsyslog: change path for config includes to /etc/rsyslog.d"
de3065d gypsy: update to latest upstream version 0.8, and remove version 0.=
7
dbb8899 gypsy: move generic SRC_URI part to gypsy.inc
9bef377 gypsy: fix packaging of DBus starter script
772286e Merge remote-tracking branch 'upstream/2011.03-maintenance' into sl=
edz/m
ef52795 rsyslog: change path for config includes to /etc/rsyslog.d

I'm sure it's all unintentional.

--=20
Tom


