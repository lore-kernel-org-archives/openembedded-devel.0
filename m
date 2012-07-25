Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Su3vb-0004eF-N8
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jul 2012 17:55:11 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3945F223202F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2012 17:43:43 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7A6A5223202E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2012 17:43:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052234073.adsl.alicedsl.de
	[78.52.234.73]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2012 17:43:42 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 6897F3C508; Wed, 25 Jul 2012 17:43:40 +0200 (CEST)
Date: Wed, 25 Jul 2012 17:43:40 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120725154339.GA6784@rhein.zuhause.netz>
References: <CALbNGRT3ti_0SnBZ5AbKUPkhQQkHtUh=nOCGQRg1H741b_8KfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRT3ti_0SnBZ5AbKUPkhQQkHtUh=nOCGQRg1H741b_8KfA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: gtk+-native configure fails
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
X-List-Received-Date: Wed, 25 Jul 2012 15:55:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 25, 2012 at 01:47:03PM +0200, Andreas M=FCller wrote:
> Ciao,
>=20
> with the latest sources gtk+-nataive (and maybe also gtk+ - but I
> don't get that far) configure fails with
>=20
> | configure.in:1587: warning: PKG_PROG_PKG_CONFIG is m4_require'd but
> not m4_defun'd
> | aclocal.m4:1818: GTK_DOC_CHECK is expanded from...
> | configure.in:1587: the top level
> | configure.in:151: error: possibly undefined macro: dnl

uhm,

'dnl' besides ';' was the comment sqeuenz. So this is odd and maybee chan=
ged in newer
autotools versions.

> |       If this token and others are legitimate, please use m4_pattern_=
allow.
> |       See the Autoconf documentation.
> | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/us=
r/bin/autoconf
> failed with exit status: 1
> | ERROR: autoreconf execution failed.
> | ERROR: Function failed: do_configure (see
> /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/gtk+-native-2.24.8-r=
5/temp/log.do_configure.22156
> for further information)
>=20
> Supporting hints welcome :-)
>=20
> Andreas

Bye Henning


