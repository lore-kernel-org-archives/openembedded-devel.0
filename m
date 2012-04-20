Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SLEbJ-0007jb-JM
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 16:14:17 +0200
Received: by qcso7 with SMTP id o7so5902326qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 07:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=h7FVfKzlCZeCpF+lHgSiTqlhcK0ft8T88GkPZIhzy6o=;
	b=oetFEs4Agf9pLD+7J7Axb0WpR+zRF3F9Ccinew7UOY3HOkTyDUp37qDL1kydWWVG1j
	L1X6xJ4UBhdJZ6bAcuzNxH4O4yyAUxiY6G+07rwn8xffefMoeerFL1LsXD6dni/kQ5a4
	eNhasQZBTAJmxawFN4NPtSNqZ/heqdZXfMPzkMlODZY0wHVS8rD6YDIrqtfroxqQfLsB
	5WZkWlEDPDHNr9PnAUNX8xBK+CqO7heiTP0coo9EBDJA9blbFAjUaU1wTavyuLwkvSzP
	ojQ9lPIaTvg6OPqWYN6tjcZMxHlMF2IpryqBObG+zhmQ1dTLab0kxLqd11XlZ+nifpfJ
	9pFQ==
Received: by 10.229.154.78 with SMTP id n14mr2043151qcw.119.1334930687417;
	Fri, 20 Apr 2012 07:04:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Fri, 20 Apr 2012 07:04:26 -0700 (PDT)
In-Reply-To: <4F916294.6090706@mlbassoc.com>
References: <4F916294.6090706@mlbassoc.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 20 Apr 2012 07:04:26 -0700
X-Google-Sender-Auth: WxGkQhSAhfN5z8ZZaATUvlRkgvg
Message-ID: <CABcZAN=ATv+2NUzf1nNq6w1O4Kg+trD1S3kuKM0Eq4=yq4PL2Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: COMPATIBLE_MACHINE
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
X-List-Received-Date: Fri, 20 Apr 2012 14:14:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 20, 2012 at 6:20 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> I'm writing a .bbappend for a recipe which contains a COMPATIBLE_MACHINE
> pattern like this:
> =C2=A0COMPATIBLE_MACHINE =3D "(machine1|machine2|machine3)"
>
> Is there a way my .bbappend file can add to this pattern? =C2=A0I don't w=
ant
> to disturb what's there, just add my machine as well.

It's just a standard regular expression.

COMPATIBLE_MACHINE =3D "(machine1|machine2|machine3)"
COMPATIBLE_MACHINE .=3D "|machine4"

Will result in a value of "(machine1|machine2|machine3)|machine4",
which is still a perfectly valid pattern, as far as I can tell.
--=20
Christopher Larson


