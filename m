Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PZ5A9-0001m5-5O
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 18:22:41 +0100
Received: by yie16 with SMTP id 16so2895168yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jan 2011 09:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=5YyAdhXMUPbU7tOW0YBiad6iJh7RDJgBU+qNlMgtvco=;
	b=phXdk9ETOO+BDXLuXspB8wvS0dzjz4hOd3/t3DysOfeF1zyB2XgL4nXnCOu1ZLfkQB
	3Gk9UKCBS5YvDhpw3VyJRDC26Lzr50JPMKfO+o42lC4Sspi5fKUXbdtB4SZNS9hwoyAY
	EuU73FkqiUJ4geDHNOdwqeZiMeKxtY0yZluug=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=BjbqyubOFgj69Cplc1CYU1552jfHic8GbpuMwq1NeblKHd/crFqyuW8L1e2BchRxvq
	uwhUeRvy44RsQqNJlSqyqngKiJGYcVDXUeDfgYZ2dM0EvSwbH6lgedd6nF2BFphLDyU6
	6sfGLpbTrjmDiEQhv58ETI7o9L2s/1SZDAV+E=
Received: by 10.90.72.2 with SMTP id u2mr10219022aga.4.1293902537742; Sat, 01
	Jan 2011 09:22:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sat, 1 Jan 2011 09:21:57 -0800 (PST)
In-Reply-To: <1293892652.4179.18.camel@mattotaupa>
References: <1293892652.4179.18.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Jan 2011 09:21:57 -0800
Message-ID: <AANLkTin+37dkdCpXJbWE6Mn9R7-NLrzRcLOMV4s2x0qV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: binutils_2.21: ERROR: QA Issue with staging: libbfd.la failed sanity test (workdir) in path /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib
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
X-List-Received-Date: Sat, 01 Jan 2011 17:22:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 1, 2011 at 6:37 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> `bitbake -k console-image` give the following error message in task
> `qa_staging` for `binutils_2.21.bb`.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$ more minimal-uclibc-dev/work/armv7a-oe-linux=
-uclibceabi/binutils-2.21-r13.1/temp/log.do_qa_staging.19251
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: QA Issue with staging: libopcodes.la fa=
iled sanity test (workdir) in path /oe/build-minimal-uclibc/minimal-uclibc-=
dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: QA Issue with staging: libbfd.la failed=
 sanity test (workdir) in path /oe/build-minimal-uclibc/minimal-uclibc-dev/=
sysroots/armv7a-oe-linux-uclibceabi/usr/lib
> =C2=A0 =C2=A0 =C2=A0 =C2=A0FATAL: QA staging was broken by the package bu=
ilt above
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: Error in executing python function in: =
/oe/openembedded/recipes/binutils/binutils_2.21.bb
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: Exception:<type 'exceptions.SystemExit'=
> Message:1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: Printing the environment of the functio=
n
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: Function do_qa_staging failed
>

yes its known to me.

>
> Thanks and a happy new year,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


