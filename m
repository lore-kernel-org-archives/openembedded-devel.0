Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Opi1J-0004Xf-OT
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 15:34:26 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o7TDXTmh022996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 15:33:30 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1Opi0n-000711-17
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 15:33:29 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1283078750-25729-1-git-send-email-eric@eukrea.com>
	<1283080970-2494-1-git-send-email-eric@eukrea.com>
Date: Sun, 29 Aug 2010 15:33:28 +0200
In-Reply-To: <1283080970-2494-1-git-send-email-eric@eukrea.com> ("Eric
	=?iso-8859-1?Q?B=E9nard=22's?= message of "Sun, 29 Aug 2010 13:22:50
	+0200")
Message-ID: <lywrr95ys7.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] ncurses-5.7 : fix sdk build + add libtermcap link
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
X-List-Received-Date: Sun, 29 Aug 2010 13:34:43 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Eric B=E9nard <eric@eukrea.com> writes:

> -        'narrowc --with-ticlib' \
> -        'widec   --enable-widec --without-progs'; do
> +        'narrowc  --with-ticlib' \
> +        'widec    --with-ticlib --enable-widec --without-progs'; do

can you place this in a separate patch please?


> +	cd ${D}${libdir}
> +	ln -sf libncurses.so libtermcap.so
> +	ln -sf libncurses.a libtermcap.a

This part is wrong; libtermcap functionality is provided by libtinfo and
does not need whole libncurses.

A linker script libtermcap.so with

| INPUT(-ltinfo)

might be a better solution for .so.


> +	ln -sf libncurses.so.5 libtermcap.so.5

This is not needed; DL_NEEDED will be libtinfo.so.X both if you create a
symlink or use the linkerscript.  There is nothing with a libtermcap.so.5
SONAME either.


> -PACKAGES =3D " \
> -  ncurses-dbg \
> -  ncurses-dev \
> -  ncurses-doc \
> -  ncurses-tools \
> -  ncurses \
> -  ncurses-static \
> -  ncurses-terminfo \
> +PACKAGES +=3D " \
> +  ${PN}-tools \
> +  ${PN}-terminfo \
>  "

please put this into a separate patch.


Enrico


