Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 509A97328A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 14:05:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1471269905; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=TR4MVtEFcuo9acMCsBOT0kr1JhLuwkI+G5MG1Noyo5g=;
	b=DMv7hQLGNw0mvdZeht/P3sYbrHNVs9H88MqW+98s/g3bnqp/viH7gQ0aaN9B5NrOVcjl0syL
	MON2P4HeICETgNxaxoeGx+vd15OJDRZOaI7kBkTffPQya/URXoxWBXW05CyGRDTjGT9LGLg9
	Yd9/WMPnbicDEu08Y25OeSwRYAQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=mMgQQvVPeUNdbn+o3misJ1jI2me5m9h5+RLzJqDr0IPsY3fYU8n8IFduwkjD5fSxRHDius
	LZTr74VrXlUZFltcj+T8K2GjRJ7lK+uIfsGiB7MY09f4U4qDMspEPsFntmr15+mcr5Yk61XF
	fk0oLW2r9LGhDUIvw+QgYv12DoL/A=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mxa.mailgun.org with ESMTP id 57b1cc0f.7f2378312370-in1;
	Mon, 15 Aug 2016 14:05:03 -0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id u186so38124465ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 07:05:03 -0700 (PDT)
X-Gm-Message-State: AEkoousS5WlLdMb6SXam+0r1UEop/3krWCAl0qQSmTrNbl3jYRuNjyvieFDaDKqrlVhtIGRo/Iv/ecB4txru4Q==
X-Received: by 10.36.227.78 with SMTP id d75mr13819007ith.75.1471269903657;
	Mon, 15 Aug 2016 07:05:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Mon, 15 Aug 2016 07:05:03 -0700 (PDT)
In-Reply-To: <20160815102001.oubghmqbafsu43fc@jama>
References: <1470942879-28353-1-git-send-email-derek@asterius.io>
	<20160815102001.oubghmqbafsu43fc@jama>
From: Derek Straka <derek@asterius.io>
Date: Mon, 15 Aug 2016 10:05:03 -0400
X-Gmail-Original-Message-ID: <CADNbA1oB_wiEryucf3E1D79_NoztDYpKqV1Vvhwmdaf4hxDg2w@mail.gmail.com>
Message-ID: <CADNbA1oB_wiEryucf3E1D79_NoztDYpKqV1Vvhwmdaf4hxDg2w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] utouch-frame: fix build errors associated with xmllint
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2016 14:05:05 -0000
Content-Type: text/plain; charset=UTF-8

Yeah.  I'm going to just patch out the man page creation all together
instead of trying to be fancy about it.  I'll send out a v2 once I test it
on qemuarm.

On Mon, Aug 15, 2016 at 6:20 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Thu, Aug 11, 2016 at 03:14:39PM -0400, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  meta-oe/recipes-support/utouch/utouch-frame_git.bb | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> > index 8fc8733..9bd18fc 100644
> > --- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> > +++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> > @@ -16,5 +16,6 @@ PV = "1.1.2+git${SRCPV}"
> >
> >  S = "${WORKDIR}/git/"
> >
> > -# http://errors.yoctoproject.org/Errors/Details/74486/
> > -PNBLACKLIST[utouch-frame] ?= "BROKEN: Fails to execute xmllint"
> > +# Fix non-deterministic issue with a2x being found in the environment
> (asciidoc-native)
> > +# and failing to complete xmllint due to missing dtd files
> > +EXTRA_OECONF = "ASCIIDOC='/bin/false'"
>
> This isn't enough to fix it, maybe /bin/true would work, see:
> http://errors.yoctoproject.org/Errors/Details/75464/
>
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

