Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 615 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 Jun 2016 13:49:08 UTC
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7F07319C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:49:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1466171348; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=BKf1WWce1KeOT3+Eg9U0O82aMp5dzqjQUkRxEgsZHsI=;
	b=TcBu77Np0XaiW0exVZqxJdyTpSrp7BAwYI0ybS+pxb+np7riJVga449lQVXGAzHmYFlDLGyh
	ZXyXQJDRjZJGzCIT8GyDiWFLSapY5bFmXbaTHDJt5AOPOlH4j1gZYumW97qkQR37QkJBVT5t
	BSqf31qE+2lkrPKM0e/4cd1aeHs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=cWIgU3F1nQUf3de0j5xo2ioOcBzoKLxR3YJequK3WO4eXp2BqLeS7O8t9VF+vCClZgacLm
	yQ1k0nBzsZxOI62vujqaYNHpV97QnJ8HBcCmEzIv+h3Y7NK8yZzR/5f+0n0EH7HUQWQ1sILo
	ACeNV8ONJmSd2/iKOqlqxEV2S1FeQ=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mxa.mailgun.org with ESMTP id 5763fd6b.7f42d1492870-in07;
	Fri, 17 Jun 2016 13:38:51 -0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id f30so69282618ioj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 06:38:51 -0700 (PDT)
X-Gm-Message-State: ALyK8tLhLWpHS/dwQQE21VTery0FSAXn3onA3Ym+MRJVKW7UaJFOAzC2No6oijdetYy9p6Ej4PMGNGnrJaR1aA==
X-Received: by 10.107.18.225 with SMTP id 94mr3161005ios.157.1466170731533;
	Fri, 17 Jun 2016 06:38:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.178.131 with HTTP; Fri, 17 Jun 2016 06:38:51 -0700 (PDT)
In-Reply-To: <E49AE6D7-2850-4C61-B163-F39F26CF732A@gmail.com>
References: <1465435705-3794-1-git-send-email-derek@asterius.io>
	<E49AE6D7-2850-4C61-B163-F39F26CF732A@gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 17 Jun 2016 09:38:51 -0400
X-Gmail-Original-Message-ID: <CADNbA1o+aK2tr=1jHwJ21Szk28vWZMVNM4mXGCkebJHaZbYHCA@mail.gmail.com>
Message-ID: <CADNbA1o+aK2tr=1jHwJ21Szk28vWZMVNM4mXGCkebJHaZbYHCA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] geis: add CFLAG to ignore misleading indentations
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
X-List-Received-Date: Fri, 17 Jun 2016 13:49:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It didn't seem worthwhile to create a patchset to fix whitespace issues.  I
can create the patches if people prefer that to suppressing the error.

-Derek

On Fri, Jun 17, 2016 at 12:17 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Jun 8, 2016, at 6:28 PM, Derek Straka <derek@asterius.io> wrote:
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> > meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.b=
b
> b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> > index bc88143..9b087a8 100644
> > --- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> > +++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> > @@ -24,6 +24,8 @@ SRC_URI[md5sum] =3D "2ff9d76a3ea5794516bb02c9d1924faf=
"
> > SRC_URI[sha256sum] =3D
> "8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
> >
> > EXTRA_OECONF =3D "--disable-integration-tests"
> > +TARGET_CFLAGS +=3D "-Wno-error=3Dmisleading-indentation=E2=80=9D
>
> why not fix the code
>
> > +
>
> >
> > FILES_${PN}-bin =3D "${bindir}"
> > RDEPENDS_${PN}-bin =3D " \
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

