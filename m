Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N7Qci-0004Y4-Ki
	for openembedded-devel@openembedded.org; Mon, 09 Nov 2009 10:33:23 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 6E7BD1D36078; Mon,  9 Nov 2009 10:32:04 +0100 (CET)
Date: Mon, 9 Nov 2009 10:32:04 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091109093204.GF16449@ibawizard.net>
References: <1257504486-7975-1-git-send-email-ynezz@true.cz>
	<1257504486-7975-2-git-send-email-ynezz@true.cz>
	<be7a9f3d0911060413i778aec0cpf2c618832437665a@mail.gmail.com>
	<20091106140519.GA25214@ibawizard.net>
	<be7a9f3d0911070857t179c5c31o7f066945c5738917@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0911070857t179c5c31o7f066945c5738917@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][geodegx] geodegx: Fix glibc configure error
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
X-List-Received-Date: Mon, 09 Nov 2009 09:33:23 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Otavio Salvador <otavio@ossystems.com.br> [2009-11-07 14:57:49]:

> Hello,
>=20
> 2009/11/6 Petr =A9tetiar <ynezz@true.cz>:
> > I build dev and I found this fix on the web using Google, now looking=
 it up
> > again I found yours and Hrw's conversation on #oe http://pastebin.com=
/f6640d6f7
> > It seems, that it's 4.3.3 issue?
>=20
> Yes; you and hrw are the two persons that found it; maybe it is gcc
> related indeed; while you're on it, do you mind to test it?

My bad, of course it's glibc related, nothing to do with GCC.

configure.in:

[..snip..]

	# Find what sysdep directories exist.
	sysnames_add_ons=3D
	sysnames=3D
	for b in $base ''; do
	  for m0 in $mach ''; do
	    for v in /$vendor ''; do
	      test "$v" =3D / && continue
	      for o in /$ostry ''; do
		test "$o" =3D / && continue
		for m in $multi_arch_d $mach ''; do
		  for d in $add_ons_pfx ''; do
		    for a in $add_ons_sfx ''; do
		      if test -n "$m0$m0sub$b$v$o$m$msub"; then
			try_srcdir=3D"${srcdir}/"
			case "$d" in
			/*) try_srcdir=3D ;;
			esac
			try=3D"${d}sysdeps$m0$m0sub$b$v$o$m$msub$a"
			test -n "$enable_debug_configure" &&
			echo "$0 [DEBUG]: try $try" >&2
			if test -d "$try_srcdir$try"; then
			  sysnames=3D"$sysnames $try"
			  { test -n "$o" || test -n "$b"; } && os_used=3Dt
			  { test -n "$m" || test -n "$m0"; } && machine_used=3Dt
			  case x${m0:-$m} in
			  x*/$submachine) submachine_used=3Dt ;;
			  esac
			  if test -n "$d"; then
			    case "$sysnames_add_ons" in
			    *" $d "*) ;;
			    *|'') sysnames_add_ons=3D"$sysnames_add_ons $d" ;;
			    esac
			  fi
			fi
		      fi
		    done
		  done
		done
	      done
	    done
	  done
	done

[..snip..]

	if test -z "$submachine_used" && test -n "$submachine"; then
	  AC_MSG_ERROR(The $submachine subspecies of $host_cpu is not supported.=
)
	fi
	AC_SUBST(submachine)


