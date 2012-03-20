Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1S9zk4-0000GP-2J
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 15:08:52 +0100
Received: by vbbfr13 with SMTP id fr13so30267vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=FH/FvmOTZO7yH05uyqTbUHuJx6BpB7fv1yC1kx/fuzo=;
	b=GQh7flZqMMWu20xM/gtevuT43KeLwEjQkR6Mzlzznruw4IfmKi6zoG6Nc7md3ZNoof
	hXOKT4Kk6ohUQZA8dl937EN+X3gK62JAnwbVKP3iwnsqwELYZ9ZzOqu3CuuDa09pLtjE
	yI6GwgzvggDc89TB8Apkr9UKZbvLMyJ4ahrgpq/WaGT4+unsNbjMmHSqn1hxtfwDxMyO
	UORpOtFEBSq3mQUiWbRidON8/zLtzgafJLs3W/cWUp9e/gY57nvjx/TyfeMvN63oWlLP
	uQP+r5lJnckWDw4XhoAnSr3whCydk/cKBVE9Y31Ms1xqgsLwhZULch1J26+ZLu0OOVDT
	VRWw==
MIME-Version: 1.0
Received: by 10.220.142.82 with SMTP id p18mr13533vcu.5.1332251999073; Tue, 20
	Mar 2012 06:59:59 -0700 (PDT)
Received: by 10.52.30.98 with HTTP; Tue, 20 Mar 2012 06:59:59 -0700 (PDT)
In-Reply-To: <1322824856-15965-3-git-send-email-eric@eukrea.com>
References: <1322824856-15965-1-git-send-email-eric@eukrea.com>
	<1322824856-15965-3-git-send-email-eric@eukrea.com>
Date: Tue, 20 Mar 2012 14:59:59 +0100
Message-ID: <CACW_hTbHP3cjTdyu5JAbfOdHCb+6UEnyWqZg8EE2KvU0UGgjkw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe 3/3] add net-snmp-5.7.1
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
X-List-Received-Date: Tue, 20 Mar 2012 14:08:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

By incident noticed the following issue.

2011/12/2 Eric B=E9nard <eric@eukrea.com>:
[...]

> diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb b/meta-o=
e/recipes-extended/net-snmp/net-snmp_5.7.1.bb
> new file mode 100644
> index 0000000..59d8407
> --- /dev/null
> +++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
> @@ -0,0 +1,26 @@
> +require net-snmp.inc
> +PR =3D "${INC_PR}.0"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;endline=3D8;md5=3D7f7f=
00ba639ac8e8deb5a622ea24634e"

Actually this is not really the license file.
These lines read:

DISCLAIMER

  The Authors assume no responsibility for damage or loss of system
  performance as a direct or indirect result of the use of this
  software.  This software is provided "as is" without express or
  implied warranty

The legal mumbo-jumbo is all in the file COPYING. Guess that should be
referenced here.

Best regards, Frans


