Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Si4oh-0004BB-9I
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 16:26:31 +0200
Received: by pbbrq2 with SMTP id rq2so3495799pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2012 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=NKEA+t83W6Fgrg5byCIYoZ6RYqmdbUSZuFVHP8ArZ74=;
	b=N9r3fG8lenlaYcuON71dGwJOG8VORHt2Rz8jR2k7SEkNXeVHfHZhAJLrZlgdVgnCrg
	FbToMZjkPXlu/1CzJ+XwaoiYSjmJFMBjjvy3tyVE1lc8OxptSW4cLgVyf4GrU8qJNsJ1
	OqHRjyZoS3MAMZZso7MsKQSP0/am2QlY+ifXxYSqRPUUIEMYIG1vdZA6jyz6l7IKuLWV
	fHt4/MRFV4jIGV9MOIm7Tl2p2FTvH4NJ56/G8eN/AlsOzMmeKJRYvwe4hyqbBR7ezNoz
	dKQ8tJ8beHQSc/TErOMdaVKz5NeSq56MffB7hjcmcFthyPs1in74Zf27gz7x+hge1NLt
	Ts6A==
Received: by 10.68.194.4 with SMTP id hs4mr10170084pbc.128.1340374543286;
	Fri, 22 Jun 2012 07:15:43 -0700 (PDT)
Received: from [192.168.1.102] ([94.205.109.242])
	by mx.google.com with ESMTPS id mt9sm39085310pbb.14.2012.06.22.07.15.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 07:15:42 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Date: Fri, 22 Jun 2012 18:15:38 +0400
In-Reply-To: <4FE3F9C9.7070806@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
References: <1340338450-23907-1-git-send-email-elvis.dowson@gmail.com>
	<4FE3F9C9.7070806@gmail.com>
Message-Id: <28D23521-53F5-447D-A22C-333360833CCE@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-openembedded] python_numpy: Fix SRC_URI warnings.
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
X-List-Received-Date: Fri, 22 Jun 2012 14:26:31 -0000
Content-Type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Jun 22, 2012, at 8:51 AM, Khem Raj wrote:

> anyway something like below is what you need.
>=20
> SRC_URI =3D "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
>           ${CONFIGFILESURI} \
>          "
>=20
> CONFIGFILESURI ?=3D ""
> CONFIGFILESURI_arm =3D "file://config.h \
>                      file://numpyconfig.h \
>                      "
>=20
> CONFIGFILESURI_mipsel =3D "file://config.h \
>                      file://numpyconfig.h \

I made the changes as you suggested and now the SRCURI is reporting the =
correct values:

$ MACHINE=3Dqemuarm bitbake -e python-numpy | grep -i "^SRC_URI=3D"
SRC_URI=3D"http://downloads.sourceforge.net/numpy/numpy-1.4.1.tar.gz     =
       file://config.h 	   file://numpyconfig.h"

I'll submit a patch now.

Best regards,

Elvis Dowson


