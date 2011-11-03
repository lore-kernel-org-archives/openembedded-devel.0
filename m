Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RM4pW-0001hP-UF
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 22:28:10 +0100
Received: by wwf4 with SMTP id 4so2126258wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 14:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=pEV7Kpfw81CEU1PksCQ9mEmnAGj8nGEl6zj+pXg/1uw=;
	b=MwwuXgt1UPNltzFE1bpjs0zmADshWXVNwsjyWrhhsTUxG+bZ++1QfSXitfUGfVi2K7
	Dff+YisGGqy6Dw3DEO+y9oBB0nJir9AmgFsoPyFujJE10D7uka9wtAZg36qy2zSMGwUr
	tE4UkyRONI1e6r/wnYN1uoVTZ+tCHT4TOt4oE=
Received: by 10.216.54.83 with SMTP id h61mr19889wec.6.1320355322278; Thu, 03
	Nov 2011 14:22:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Thu, 3 Nov 2011 14:21:41 -0700 (PDT)
In-Reply-To: <CAObi9r-62Wr8S8aJV0=UvpB9mhP657UBw556w-cpSq9YkCZ7TA@mail.gmail.com>
References: <CAObi9r-62Wr8S8aJV0=UvpB9mhP657UBw556w-cpSq9YkCZ7TA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 3 Nov 2011 14:21:41 -0700
X-Google-Sender-Auth: 1RizgxsaYzOcqI3eOkDq67N2YSg
Message-ID: <CABcZAN=9hRzsRE0=qPuCn+Kf5z-fNYQmtsh702OWnHyJ9uQbHg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: running bb located path info
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
X-List-Received-Date: Thu, 03 Nov 2011 21:28:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2011 at 2:06 PM, mgundes <mgcse@hotmail.com> wrote:
> =C2=A0 I need to know is there a variable assigned with running current b=
b file
> path?
>
> =C2=A0 One of freenode #oe friend told me to try THISDIR but It did not w=
ork
> for me. By the way, I use openembedded classic.

The 'FILE' variable holds the current file's full path. FILE_DIRNAME
is the directory it's in.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


