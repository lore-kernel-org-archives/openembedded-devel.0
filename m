Received: from mail-bk0-f53.google.com ([209.85.214.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1Tv6Zg-0003wR-UW
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jan 2013 14:29:10 +0100
Received: by mail-bk0-f53.google.com with SMTP id j5so49826bkw.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2013 05:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=kqP4ZUqUXy9+dkTntzpLaecSYxLszTdVNl0xJnR2qSI=;
	b=NWIRw0vi3NyF1neAbpOkhmQo8PPQCsEpXIWWJPUdjIaZfpLTHixtVyCvZ963QblKzC
	YGsmCHy5VoAqPXCWTVOZGszpLjFAQdbr5fqOxTV2EiOXng9sEdaXDTG68OcFARiqRefh
	1ACvXqaKMFHgP61SwdjvNZdUJrtMrAQJBGUyhfi4CZ/eWbSZ4NHyei7JpoGnx6ixFbfg
	FXpv7BV6aCKPNdWxjy36b+eWpNSA3I3KM3edhFiAnBBHl7LEC+lyKLjHbgHQLptVUytN
	RiRI+rKW31ZIzdV0R1oR9i90h83xhfXeOLhHSPiVfsZNsWGSyXEJkyANXr67cerE6FWG
	6QlA==
Received: by 10.204.136.209 with SMTP id s17mr39780940bkt.13.1358255628605;
	Tue, 15 Jan 2013 05:13:48 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.205.102.72 with HTTP; Tue, 15 Jan 2013 05:13:28 -0800 (PST)
In-Reply-To: <CAAQYJAuoSYreWC6oanAkwW-4Mqv5LsKL+kHr3NhFrKf4t2o7qg@mail.gmail.com>
References: <1358201403-22227-2-git-send-email-hmatrjp@users.sourceforge.jp>
	<CAAQYJAuoSYreWC6oanAkwW-4Mqv5LsKL+kHr3NhFrKf4t2o7qg@mail.gmail.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Tue, 15 Jan 2013 22:13:28 +0900
X-Google-Sender-Auth: E1bD1xYUA5xE2Hp20JApqFeLj9k
Message-ID: <CAPESJy7AAUbiTtU0h1sAM0Eu6konxcyF3mmZi3mfVRE-+3BQcQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs][PATCH] symbolic link to resource.h is also necessary to build with linux kernel 3.2.
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
X-List-Received-Date: Tue, 15 Jan 2013 13:29:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/1/15 Andrea Adami <andrea.adami@gmail.com>:
> Hi,
>
> you are using an outdated recipe, the issue is already fixed.
> Please update your meta-initramfs layer and you'll get klibc_2.0.2.

Thank you for your advice,
according to the output from
 $ git branch
at sources/meta-openembedded/meta-initramfs/ directory, there are two
branches available.

* denzil
  master

Do you mean that I have to do:
 $ git checkout master
there?
Or is there any trick using oebb.sh?
(Though I can't find anything suggesting this from ./oebb.sh --help)
-- 
Takeshi Hamasaki


