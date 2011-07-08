Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1QfCWx-0000et-EL
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 16:59:48 +0200
Received: by vxa37 with SMTP id 37so1631429vxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=yqwiltNnJecZlThqJepW/WpFJbjiPHPRHYeXyERZZZY=;
	b=aNrKuyDSkYuo55Ev9wH6e9zCWs0W4OgwmCnNeEiOgSwMmR/FWRpMiEtNB9ibpHa8KU
	t0umHnkVPf4TlBtKIIar4DLSSt8Hm/J/p63WJztDgqxSejl8Fh6tHzqwrGC3itRPKEvI
	b2vZh4OFPP1y17PY2rfINwI5hYXZuFKptRAj8=
MIME-Version: 1.0
Received: by 10.220.6.135 with SMTP id 7mr740705vcz.201.1310136951171; Fri, 08
	Jul 2011 07:55:51 -0700 (PDT)
Received: by 10.220.176.194 with HTTP; Fri, 8 Jul 2011 07:55:51 -0700 (PDT)
In-Reply-To: <CAG4_upTi2CKyBMig3jsSGesFikj_qXeQ87x4e5Yv0i3USO0Lww@mail.gmail.com>
References: <CAG4_upTi2CKyBMig3jsSGesFikj_qXeQ87x4e5Yv0i3USO0Lww@mail.gmail.com>
Date: Fri, 8 Jul 2011 07:55:51 -0700
Message-ID: <CAG4_upRV2mYJ6UAUzZkhji9XxDi6o0Y3bVYRmE=Z0qacbXgztg@mail.gmail.com>
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Using ${DATE} in PR
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
X-List-Received-Date: Fri, 08 Jul 2011 14:59:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Using ${DATE} didn't work, but I was able to use a similar trick to
get this working:

BUILD_DATE ?=3D "${@time.strftime('%Y%m%d', time.gmtime())}"
PR =3D "r5.${BUILD_DATE}.0"

Perhaps because ${DATE} in bitbake.conf is declared without the "${@"
tag this causes a more "static" interpretation of the variable?

Hope this helps someone else in the future,
Chris

On Fri, Jul 8, 2011 at 7:21 AM, Chris Verges <kg4ysn@gmail.com> wrote:
> Hi all,
>
> I'm attempting to use the ${DATE} variable from
> openembedded/conf/bitbake.conf in the PR value of a local overlay
> recipe. =A0The idea is to create a recipe that will automatically
> rebuild each day. =A0(The recipe itself is creates a small text file in
> /etc that tracks the build date.) =A0BitBake is at 1.12.0, and OE is on
> 2011.03-maintenance.
>
> Unfortunately, the following didn't work as I expected:
>
> PR =3D "r5.${DATE}.0"
>
> (I use the "r5" prefix field to increment in case I make any major
> changes to the PR format, and the "0" suffix field to increment any
> minor changes to the recipe itself.)
>
> The expected behavior is that the recipe will automatically rebuild
> each day. =A0The actual behavior is that the recipe does not rebuild.
>
> Does anyone have any ideas on what I'm overlooking?
>
> Thanks,
> Chris
>


