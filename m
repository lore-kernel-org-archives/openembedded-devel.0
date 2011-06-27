Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QbCTP-0004nk-DB
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 16:07:36 +0200
Received: by vxa37 with SMTP id 37so3711205vxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 07:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=aloJJYc5i372+C9ZsIA+Z0tnbanHnKAiZu76P4dLX+8=;
	b=FOYOF6XxGMi6xtYJicvcsFu7uvyqEgpDsETOmk7Ktu4fFWKIAx0nV1MFQ5HhvoIVYE
	L7z1mBKGB7ycu+YyHyNBn9Gnr1kKoX1d7peWZsx4yvFzxv1F7VNjgnR7AawrWtN7QuQb
	gMztskA240ECfD0GJrGRcsjZnfDDh5RZYzO58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=oLsh0rHohwTYlfrBPdTyhGxFBfRtpXhSeJfIjVvDcDtUIbde8RwW5DCikgMukbTkmB
	aSrSETu8EtCM/HRtQ0tv7vR/csig/aareiCGXwRFtqydcbm3a11NtUeKyo3azTKTtSVI
	T+uo4t9JB7FmvVFLyrliAmVZUyOGNXC0J+4xk=
Received: by 10.52.116.33 with SMTP id jt1mr8832435vdb.249.1309183430067; Mon,
	27 Jun 2011 07:03:50 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.2 with HTTP; Mon, 27 Jun 2011 07:03:30 -0700 (PDT)
In-Reply-To: <1309183130.21613.317.camel@phil-desktop>
References: <1309183130.21613.317.camel@phil-desktop>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 27 Jun 2011 07:03:30 -0700
X-Google-Sender-Auth: DqY9PsuMJq-MZGRnGPF-AZNPNH8
Message-ID: <BANLkTikPttPdPM6JmL0=S8h5eg4D0Z6fCA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Remove SHELL from preserved_envvars_exported?
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
X-List-Received-Date: Mon, 27 Jun 2011 14:07:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2011 at 6:58 AM, Phil Blundell <philb@gnu.org> wrote:
> One of my colleagues pointed out to me just now that $SHELL is, somewhat
> surprisingly, passed through to bitbake subprocesses from the calling
> environment. =C2=A0Under most circumstances this would be fairly benign s=
ince
> few things actually care about that variable, but it turns out that:
>
> a) flock(1) has the misfeature of using $SHELL rather than /bin/sh if
> the former is set in the environment (in contrast to system(3), which
> always uses /bin/sh); and
>
> b) zsh has the misfeature of always reading ~/.zshenv even if it was
> invoked as "zsh -c ...".
>
> So the net result of all this is that, if you are using zsh as your
> interactive shell, the contents of your .zshenv end up in the
> environment for everything that's run under flock and bad results can
> potentially ensue. =C2=A0In our particular case my colleague was setting
> $PATH from his .zshenv with predictably unfortunate consequences.
>
> It isn't very obvious to me that having SHELL whitelisted is sensible
> for anything except interactive tasks. =C2=A0Does anybody know of a reaso=
n
> why it needs to be included everywhere?
>

I don't know why it is the way it is right  now, but I want to jump in
here and say that as another zsh user, this has bitten me multiple
times before as well. I actually have SHELL overridden in my
~/.oe/conf/site.conf to work around it for now. I agree that it should
probably not be exported other than for interactive tasks, for what
it's worth.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


