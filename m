Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbjHp-0007E0-6I
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2011 03:09:49 +0200
Received: by pzk36 with SMTP id 36so598533pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 18:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=orC3T9trTunMTw1B1wRS9vexT9DDIVaEyIX2dT/xR3U=;
	b=SE/zxXEYP+5+yXLId6GFldAEoSAH4jqj5nrxp1uVnUU9GSGXUVa/MOx0KvMz46gPne
	ZaGMSHmLR18ySFt8yo3wBgT+/mmf2b16tsEhzV17NWUa2Iv95eOITjrLiX/qakp0glqU
	72I7IHgLDOifJn+t7YPvWz1cVV6uljCOW9Qw0=
Received: by 10.142.65.6 with SMTP id n6mr124257wfa.172.1309309566540;
	Tue, 28 Jun 2011 18:06:06 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z20sm460414wff.7.2011.06.28.18.06.03
	(version=SSLv3 cipher=OTHER); Tue, 28 Jun 2011 18:06:04 -0700 (PDT)
Message-ID: <4E0A7A7A.6040900@gmail.com>
Date: Tue, 28 Jun 2011 18:06:02 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <w4liwla3gm.wl%peter@chubb.wattle.id.au>
In-Reply-To: <w4liwla3gm.wl%peter@chubb.wattle.id.au>
Subject: Re: gettext-native fails to build
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
X-List-Received-Date: Wed, 29 Jun 2011 01:09:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2011 05:25 PM, Peter Chubb wrote:
>
> On a clean checkout from this morning's git, I did:
>     bitbake gettext-native
> and saw:
>   | + oe_autoreconf
> | + '[' 'x-I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gnulib-local/m4/         -I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-runtime/m4      -I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-tools/m4' = xdefault ']'
> | + acpaths='-I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gnulib-local/m4/      -I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-runtime/m4      -I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-tools/m4'
> | ++ sed 's/.* //;s/\.[0-9]\+$//'
> | ++ automake --version
> | ++ head -n 1
> | + AUTOV=1.11
> | + install -d /usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/share/aclocal
> | + install -d /usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/share/aclocal-1.11
> | + acpaths='-I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gnulib-local/m4/      -I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-runtime/m4      -I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-tools/m4 -I/usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/share/aclocal'
> | + echo --exclude=autopoint
> | + grep -q aclocal
> | + rm -f aclocal.m4
> | + '[' -e configure.in ']'
> | + CONFIGURE_AC=configure.ac
> | + grep '^[[:space:]]*AM_GLIB_GNU_GETTEXT' configure.ac
> | + grep '^[[:space:]]*AM_GNU_GETTEXT' configure.ac
> | ++ sed -n -e '/^[[:space:]]*AC_CONFIG_MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' configure.ac
> | + for aux in m4 '`sed -n -e '\''/^[[:space:]]*AC_CONFIG_MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p'\'' $CONFIGURE_AC`'
> | + mkdir -p m4
> | + autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gnulib-local/m4/ -I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-runtime/m4 -I /usr/src/oe/tmp-zaurus/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/gettext-tools/m4 -I/usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/share/aclocal
> | /usr/bin/autoreconf: unrecognized option `--exclude=autopoint'
> | Try `/usr/bin/autoreconf --help' for more information.
> | + oefatal 'autoreconf execution failed.'
> | + echo FATAL: 'autoreconf execution failed.'
> | FATAL: autoreconf execution failed.
> | + exit 1
>
> Should oe not be using its own version of autotools?  Should not
> gettext-native require autotools as a prerequisite?

are you using oe.dev or oe-core ?
oe-core has these races solved
> --
> Dr Peter Chubb  http://www.gelato.unsw.edu.au  peterc AT gelato.unsw.edu.au
> http://www.ertos.nicta.com.au           ERTOS within National ICT Australia
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



