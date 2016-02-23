Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 1353 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Feb 2016 16:10:41 UTC
Received: from mail3.static.mgsend.net (mail3.static.mgsend.net
	[104.130.122.3])
	by mail.openembedded.org (Postfix) with ESMTP id EC15E77334
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 16:10:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1456243842; h=Content-Type: Cc: To: From: Subject:
	Message-ID: Date: References: In-Reply-To: MIME-Version: Sender;
	bh=L+Tq/Y16KWXfFe7XgMQHB+PvQj76JpklEt4KYI/mKZc=;
	b=phOXC9Z8oophH00NsAWyCSsX7rP5fhJnKwIHl4KPSAqoTO2AEB1BvmV2IAW/uqo3izsyhCj7
	IDJwgdT0oqyDFXUue/+2iNP40l31jc6iDT0YnKP39UEXnyjzf81Wr5zR7uJCER++Bp57RukV
	LrjNPnJ+FbqDLsLT49EHuSBdCcc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: Date:
	Message-ID: Subject: From: To: Cc: Content-Type;
	b=MGy6Hax2mo2zw8RzzqxccgJsqz51p6Vxaa1iuFHK+qbRBOUa7jL+ryF9jLMpghR2ejHlRW
	N0dscKSW5Kv6TaJRA0fX7/eTG87oT+f1cq7bVLzJnWH41Xt2TmdHwzz+52bqpeXFWdPZ6E8S
	DPS1MIipKa1w7ISZ4V34rWRQNCBXw=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mxa.mailgun.org with ESMTP id 56cc7f14.7c7bb70-in6;
	Tue, 23 Feb 2016 15:47:32 -0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id g203so216681642iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 07:47:32 -0800 (PST)
X-Gm-Message-State: AG10YOSreSh5rnHSFD4+8+BF2kLJNwSR36Rf5MQ3cfPpn49jGHrJpTw3LOajD9j/R/N2B+WSdjwB/8FfKeIDUw==
MIME-Version: 1.0
X-Received: by 10.107.6.205 with SMTP id f74mr35431205ioi.63.1456242452066;
	Tue, 23 Feb 2016 07:47:32 -0800 (PST)
Received: by 10.107.19.167 with HTTP; Tue, 23 Feb 2016 07:47:32 -0800 (PST)
In-Reply-To: <CAMKF1sqPpQPoyMvJTPNBXzmTMeWHOoaon_9vnQXZa6HniTDydA@mail.gmail.com>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
	<1456148105-9644-2-git-send-email-derek@asterius.io>
	<CAMKF1sqPpQPoyMvJTPNBXzmTMeWHOoaon_9vnQXZa6HniTDydA@mail.gmail.com>
Date: Tue, 23 Feb 2016 10:47:32 -0500
X-Gmail-Original-Message-ID: <CADNbA1r=qNvYaaHm9UA49_PeKF+rM_muegX6beiRJQLgGnxMsw@mail.gmail.com>
Message-ID: <CADNbA1r=qNvYaaHm9UA49_PeKF+rM_muegX6beiRJQLgGnxMsw@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 02/11] python-flufl-enum: update to 4.1
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
X-List-Received-Date: Tue, 23 Feb 2016 16:10:42 -0000
Content-Type: text/plain; charset=UTF-8

The license that applies to the package remains the same.  The issue is the
PKG-INFO file is updated with each rev (it contains release notes), so the
checksum would need to be updated each time we update the package.  The
license info for the package is contained on line 8.  I can just modify the
checksum each time and manually verify the license is unchanged if that is
preferred.

On Mon, Feb 22, 2016 at 2:22 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Feb 22, 2016 at 5:34 AM, Derek Straka <derek@asterius.io> wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  .../python/{python-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} |
> 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-flufl-enum_4.0.1.bb
> => python-flufl-enum_4.1.bb} (74%)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python-flufl-enum_4.0.1.bb b/meta-python/recipes-devtools/python/
> python-flufl-enum_4.1.bb
> > similarity index 74%
> > rename from meta-python/recipes-devtools/python/
> python-flufl-enum_4.0.1.bb
> > rename to meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
> > index fe25fd7..ef10848 100644
> > --- a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
> > +++ b/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
> > @@ -4,10 +4,10 @@ specific, concise semantics in an easy to read and
> write syntax. flufl.enum has
> >  features needed to make enumerations useful, but without a lot of extra
> baggage to weigh them down. "
> >
> >  LICENSE = "LGPLv3"
> > -LIC_FILES_CHKSUM =
> "file://PKG-INFO;md5=1fa25baed15d3be23c902636379438e8"
> > +LIC_FILES_CHKSUM =
> "file://PKG-INFO;startline=8;endline=9;md5=250adb4c74c359b7049abcd9d6b115e7"
> >
>
> you need to explain what changes with this
>
> > -SRC_URI[md5sum] = "b3ad23761a78232bc78499ced7cb85d9"
> > -SRC_URI[sha256sum] =
> "4af7e7cf2dcc7517251570c7ef9ad194e30ee4b6f860eba500c03954ae95f9d8"
> > +SRC_URI[md5sum] = "461779384c07ed2b5f554a5d51a000c4"
> > +SRC_URI[sha256sum] =
> "94da1413ba085473652f81565847913ea1543d1739972ecbd6afe57d7b1b68b4"
> >
> >  PYPI_PACKAGE = "flufl.enum"
> >  inherit pypi setuptools
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

