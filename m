Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 875FE65DA3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 20:16:23 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id hz20so10587063lab.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 13:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=p/d+inQD4dxeVwqe30znVgQ0vAscOC7Yhr1Zqm46EFo=;
	b=OXudoLoqZiaKoCbZVTMUwsTND4wLQk1U0dJq4wRnKDeScxS3KaAQqjDHZHdT1A5Lc2
	9EX27wgoUlpwaHuEGumILJbTXEKfKcg78eZchR9QYi/t9ejYutmIOqyJ6thwBnmSkPIx
	7LG8pfDeb0SqW9zoyapZtyfA+U96Wt+92dBpgkDQZ+WVU9iD5pgBXOUjxzEAyTyAFU/x
	DrO0RgKW2XW4DSPGZGEp+Am57nJnbLGOiPLk5u/Kh6WAiLlaGHEi3RRTwxbGVynktshm
	Zc3qkehLVtPaqYBKtr1NNwwi4D6fpn59rpecCO25fVNdGo84U0f+S81buQHgU6lYLbSq
	EtLg==
X-Received: by 10.112.4.70 with SMTP id i6mr6438996lbi.54.1408738583228; Fri,
	22 Aug 2014 13:16:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Fri, 22 Aug 2014 13:16:03 -0700 (PDT)
In-Reply-To: <20140819120740.GR3660@jama>
References: <1408448964-11764-1-git-send-email-yasir_khan@mentor.com>
	<20140819120740.GR3660@jama>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 22 Aug 2014 13:16:03 -0700
X-Google-Sender-Auth: bEOOsg2npzgtuJyZ2Ka95bMeeeU
Message-ID: <CABcZANn26XQ2GP7V_=vyT3jH7mLTC8c688uwvpjW9=LCGKRVZw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] lmbench: if a machine config file exists, install it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Aug 2014 20:16:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 19, 2014 at 5:07 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Aug 19, 2014 at 04:49:24PM +0500, Yasir-Khan wrote:
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> > ---
> >  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > index 41db150..a3873a6 100644
> > --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > @@ -60,6 +60,13 @@ do_install () {
> >             ${D}${bindir}/lmbench-run
> >      install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
> >      install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
> > +
> > +    # If the machine installs a config file, install it to the
> appropriate place
> > +    if [ -f ${WORKDIR}/CONFIG.${MACHINE} ]; then
> > +        install -D 0644 ${WORKDIR}/CONFIG.${MACHINE} \
> > +                        ${D}/${datadir}/lmbench
> /bin/${TARGET_PREFIX}/CONFIG.${MACHINE}
> > +    fi
>
> that makes lmbench MACHINE_ARCH and PACKAGE_ARCH isn't set that way.



Any objection to creating an lmbench-config package, either in lmbench or
in its own recipe, making that machine specific, and rrecommending it from
lmbench? IIRC that's how we usually handle such things (e.g. alsa-state
pulls in alsa-states which is usually empty, but which bsps can append to
pull in the machine specific configuration).

-Chris

