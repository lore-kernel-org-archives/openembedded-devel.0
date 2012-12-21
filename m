Received: from mail-ob0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tm7Sk-0003kE-5t
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 19:36:50 +0100
Received: by mail-ob0-f179.google.com with SMTP id x4so4809976obh.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=xTCGX2Ye9S3/PXARWGUkhK1RhI9FSD//OqR04fQAsU8=;
	b=AEavsB5r6QesRRLOvHg0+v/yDsU7gWhbwk+nU3AfHCe3/1Q5JFjTU83xEczYBWMYnU
	JgQRz4H8+snRq0OzgEqNhULbjJaaWBPMFQ8f9MUs3EWB+WBjgcZI/WVFHDHfWnsFdTc6
	3es521l2ljKgX4BA52X23pEeI+1FLRbqFljbJ1ocC7T3p3aJCHYcVlNo3mBV3LsywN/J
	C34T4Hq1zxbmEJumLF6jVfXRMrnaKiHr6IntzvUKnOBZf/9kgrOnkpkvy796XLyQqzQi
	c6QnRkPsGKnuBrjtISSD05YWwS60n8+HcDreS6jTcMKv+oK5ZGOTI1SPQ7BOy382f0B3
	hIsQ==
MIME-Version: 1.0
Received: by 10.60.172.178 with SMTP id bd18mr12074051oec.133.1356114122542;
	Fri, 21 Dec 2012 10:22:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Fri, 21 Dec 2012 10:22:02 -0800 (PST)
Date: Fri, 21 Dec 2012 16:22:02 -0200
X-Google-Sender-Auth: aokMlz0xFrXd5Z5HElXwOogEpok
Message-ID: <CAP9ODKr_NPX9kgu1jFWkrvhzM=0qFdHv4S9cZs0cGr=7z-iGZg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: [for-danny] Patches for backport
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
X-List-Received-Date: Fri, 21 Dec 2012 18:36:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Eric,

So we did a new set of changes in master, which we'd like to backport.
The changes are, in order:

2ac0acc2753f9853928a081cbc80c3daacbe7e08 xf86-video-geode: Add
rdepends on EXA Xorg module

ade2d4d35e1efdd83bb555949bcfb8c7a1970ff0 xinput-calibrator: Fix
service file to require display-manag

43c2d4d3ca9889e54646e02d110d8155da96772c openmotif: Update SRC_URI and
add libxft in depends

1db0dbf9a8bf2f09ddbc09a4ccde227fdf9a866a openmotif: Disable printing support

38daf64fb87bbc34caad050e7295b910c9b80e7c openmotif: Avoid use os Xos.h from host

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


