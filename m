Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JH06j-0000Cp-Lk
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2008 18:06:49 +0100
Received: by ug-out-1314.google.com with SMTP id i24so956291ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2008 09:06:49 -0800 (PST)
Received: by 10.67.19.9 with SMTP id w9mr4146760ugi.86.1200935209622;
	Mon, 21 Jan 2008 09:06:49 -0800 (PST)
Received: from ?89.252.38.142? ( [89.252.38.142])
	by mx.google.com with ESMTPS id e34sm20379385ugd.17.2008.01.21.09.06.48
	(version=SSLv3 cipher=OTHER); Mon, 21 Jan 2008 09:06:48 -0800 (PST)
Date: Mon, 21 Jan 2008 19:16:22 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <13810087643.20080121191622@gmail.com>
To: Marcin Juszkiewicz <openembedded@haerwu.biz>
In-Reply-To: <200801211408.31701.openembedded@haerwu.biz>
References: <200801211408.31701.openembedded@haerwu.biz>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Bug 2430 -- TrueType fonts handling and solution for it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2008 17:06:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Marcin,

Monday, January 21, 2008, 3:08:31 PM, you wrote:

> http://bugs.openembedded.net/show_bug.cgi?id=2430

> Rolf Leggewie tries to solve problem when TrueType/OpenType fonts are used
> in OPIE or other environments.

> Currently installing new font does not add it into list of available ones
> as there is no consensus how to handle it. I want to tell how I see it.

> 1. There will be /etc/update-fonts.d/ directory where
>    packages/environments will add own scripts for handling fonts
> 2. There will be "update-fonts" package which contain script which calls
>    all those scipts (via "run-parts /etc/update-fonts.d/" command)
> 3. "opie-ttf-support" script will install "update-qtttffontdir" command in
>    ${bindir} and script which will call it in /etc/update-fonts.d/
> 4. "fontconfig-utils" will also store own script in /etc/update-fonts.d/
> 5. packages/ttf-fonts/ttf.inc will RDEPEND on "update-fonts" and will call
>    it in postinst/postrm
> 6. qpf.bbclass (which should be renamed to qpf.inc and moved to
>    packages/qpf-fonts) will also RDEPEND on "update-fonts" and will call
>    it in postinst/postrm
> 7. qpf fonts will also RDEPEND on qte-fonts-common which
>    provide "update-qtfontdir" script

> This way we have solution which can be extended to any format of fonts and
> into any environment without changing anything. If someone will 
> create "XDE" which do not use fontconfig but use TrueType fonts then it
> will only need to install own script into /etc/update-fonts.d/ to have
> them supported.

> Any ideas/objections?

  Is such extra level of indirection and multiplexing really required?
Or rather, I wish we separated this matter to 2 separate ones:

1. Adopting reusable pattern for solving task of "need to 'register'
objects of arbitrary type".
2. See what kind of registration support required for objects of type
fonts.


For 1, I wish we adopted some easy scheme, like, for all packages
containing object of type foo, to have in postinstall:

[ -x /usr/bin/update-foo ] && /usr/bin/update-foo


Then, for each specific object type, specific package will handle
registration, for example among following (but not limiting to)
choices:

1. No registration needed at all - no /usr/bin/update-foo, nothing
will be done.
2. In simplest case, /usr/bin/update-foo will be a symlink to tool
handling registration for specific environment.
3. If some objects really need registration with different facilities,
multiplex scheme as described can be used.


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



