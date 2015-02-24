Return-Path: <otavio.salvador@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id E50F772007
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 17:08:19 +0000 (UTC)
Received: by wesw55 with SMTP id w55so26493894wes.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 09:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=oqAUqbsQ062BbTzQzrJozXykCSLvpAiu5uA9XKXXIXE=;
	b=yNNFmA85OIApv8LvlmdjAQM/umrdWOW7rc61DrGbbfBNJyB8GnIxs9PRpQDAs/CeRX
	2fT0lzt/DvlVVOpnq4paIYPgKChDh8VVwqPTWRGoAP0I1jZUjUVTlsJhF/DWmFvFtX6J
	DYTfCjLRooBkP2/2vKIF73oIPHZRuFP+jgNyY+i1g2L/dDbjpqm/KPxcAF+JiOCGZXay
	L3FwkdxppmonRD2/eskzotGU6bYWLYn6XQe1BiILnwhOWbjg6U+LdMxWrLXkDIu3sweU
	e/clWtcY6uK6HSbxK0oYbyGu1wmZzNlbpCeAnCvdE+KV8fZNy3lzMtJUGg3TQ+OfnOcH
	Jb8A==
MIME-Version: 1.0
X-Received: by 10.180.198.162 with SMTP id jd2mr8141688wic.21.1424797700756;
	Tue, 24 Feb 2015 09:08:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.27.11.18 with HTTP; Tue, 24 Feb 2015 09:08:20 -0800 (PST)
In-Reply-To: <F81DC1078564A34BB4DA30CAE03814D1276975E1@ORSMSX104.amr.corp.intel.com>
References: <F81DC1078564A34BB4DA30CAE03814D1276975E1@ORSMSX104.amr.corp.intel.com>
Date: Tue, 24 Feb 2015 14:08:20 -0300
X-Google-Sender-Auth: i4rxnkIdTDtVsnRxb1Hkrh8wBwU
Message-ID: <CAP9ODKo1c8NuZvTY-j+dbiYVeRo4Qe6HdqHEdiZULPxNb4ASpQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: iecedtea7-native will not build. Possible fix attached
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Feb 2015 17:08:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2015 at 3:37 AM, Bruce, Henry <henry.bruce@intel.com> wrote=
:
> Hello openjdk community,
>
> iecedtea7-native from git://git.yoctoproject.org/meta-java doesn't build =
due to well documented Turkish currency expiration problem. This has been f=
ixed for icedtea6 so I borrowed the patch (not sure if this is appropriate)=
 and put into a the attached bbappend that fixes the problem. I went with a=
 bbappend as I wasn't sure of the process for patching a recipe. Resulting =
JVM seems to work for my application.

Check the current patchset which Hugo has sent (now in Cc) as I think
this address the issue you had.

> Out of interest, why has v6 been fixed and v7 left broken? Is openjdk7 de=
emed unstable or otherwise not worth the effort to maintain? I'd like to ke=
ep with the v7 features, but if this is not recommend, I'll back off to v6.

Lack of manpower.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

