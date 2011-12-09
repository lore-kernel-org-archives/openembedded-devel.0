Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYzi3-0008KZ-U7
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 13:37:51 +0100
Received: by bkbzt4 with SMTP id zt4so2906314bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 04:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=QbJGGAE86qe2nGs77mJuq5Fjr6s6lBhYwEABYFXHFww=;
	b=i6vyNnvNjIN03h3GgJILv7r2Ta/zxV3F7UxHTeQfBJvDYHCVRwCwgsUCHeNhzmxZCq
	CePacPbO/AmyHNJaG1PKN6EpW2+5DOeC4gUIYq4iTl5FAkAAMGhNsNRDhs33MmiRD+U7
	C9miAX9IeXZ53omQEavbKM6jqCmRODBIX7AW8=
MIME-Version: 1.0
Received: by 10.204.150.9 with SMTP id w9mr3576236bkv.65.1323433859792; Fri,
	09 Dec 2011 04:30:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Fri, 9 Dec 2011 04:30:59 -0800 (PST)
In-Reply-To: <CAP9ODKo1HMW642EKXw=BAdmSWpS-7j72g1_=LSYX-GXu4TR8aA@mail.gmail.com>
References: <cover.1323432272.git.otavio@ossystems.com.br>
	<9641b1aa618783af7dd82f10d4c1a6ae4d693d15.1323432272.git.otavio@ossystems.com.br>
	<jbsu3u$img$1@dough.gmane.org>
	<CAP9ODKo1HMW642EKXw=BAdmSWpS-7j72g1_=LSYX-GXu4TR8aA@mail.gmail.com>
Date: Fri, 9 Dec 2011 10:30:59 -0200
X-Google-Sender-Auth: 3m3umXKnJ_lhhaR2E_3bmO5a-Jg
Message-ID: <CAP9ODKr_m+=1myqzvYOOdT1unbdKiW4sFuC+=NY3KHbv7+Q5Ww@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 1/2] qconnman: add
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
X-List-Received-Date: Fri, 09 Dec 2011 12:37:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have updated my GitHub branch. Want me to resend it?

On Fri, Dec 9, 2011 at 10:25, Otavio Salvador <otavio@ossystems.com.br>wrote:

> Will do.
>
>
> On Fri, Dec 9, 2011 at 10:14, Koen Kooi <koen@dominion.thruhere.net>wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 09-12-11 13:04, Otavio Salvador schreef:
>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> ---
>> > meta-oe/recipes-qt/qconnman/qconnman_git.bb |   16 ++++++++++++++++ 1
>> > files changed, 16 insertions(+), 0 deletions(-) create mode 100644
>> > meta-oe/recipes-qt/qconnman/qconnman_git.bb
>> >
>> > diff --git a/meta-oe/recipes-qt/qconnman/qconnman_git.bb
>> > b/meta-oe/recipes-qt/qconnman/qconnman_git.bb new file mode 100644
>> index
>> > 0000000..51b458b --- /dev/null +++
>> > b/meta-oe/recipes-qt/qconnman/qconnman_git.bb @@ -0,0 +1,16 @@
>> > +DESCRIPTION = "ConnMan management interface done in Qt" +DEPENDS =
>> > "connman" + +LICENSE = "LGPLv2.1" +LIC_FILES_CHKSUM =
>> > "file://COPYING;md5=4fbd65380cdd255951079008b364516c" + +inherit
>> > autotools qt4x11 + +EXTRA_QMAKEVARS_PRE += "PREFIX=/usr" +EXTRA_OEMAKE
>> +=
>> > "INSTALL_ROOT=${D}" + +PV = "0.0+gitr${SRCPV}" +SRCREV =
>> > "9bab120f426e41552c369b7030414c792dd25a91" +SRC_URI =
>> > "git://github.com/OSSystems/qconnman.git" + +S = "${WORKDIR}/git/"
>>
>> Can I talk you into adding a 'inherit qt4e' version as well?
>>
>> regards,
>>
>> Koen
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.11 (Darwin)
>> Comment: GPGTools - http://gpgtools.org
>>
>> iEYEARECAAYFAk7h+7sACgkQMkyGM64RGpHAxgCgsBxvzbjbLz0GII6RmgCNGU2H
>> smQAn1CPeCyO5X8N+eO9wqtE+v1G7OxA
>> =LtMP
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
>


-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

