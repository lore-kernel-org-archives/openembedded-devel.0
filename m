Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3568460620
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 21:48:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1532728098; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: In-Reply-To: References: MIME-Version: Sender;
	bh=jjZbHGyyxT7RlCHz9gALTPl56BM10IvJxSxsYVlQotI=;
	b=uoRMKBRXVN1CaFqsW3S12dHlM/lQDkzMQXvTPE9IcYF48+yY3vSB7VlGgGqL+KqRqFvDNlFF
	FtRmNEsh8Z1WIkLkdzVMoHmQO1XtszlpJHTopmJTy/dQIXygGtSweeC/lcE8XnLtPvzcshrF
	TbfuWfjMMMgtqogmF4lXJl1kjME=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mxa.mailgun.org with ESMTP id 5b5b9321.7ff7f813f1b0-smtp-out-n01;
	Fri, 27 Jul 2018 21:48:17 -0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id z19-v6so5302018ioh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 14:48:17 -0700 (PDT)
X-Gm-Message-State: AOUpUlEwXOLdYC1jKpEPjvSVI1EGDaWGT1av8G47DVh2Med5Xfms+SH9
	w3245ZNSRhJ6gQ2ATAPJCRDfhrrv291Kq3X3bSg=
X-Google-Smtp-Source: AAOMgpeqeEIYY2u9Iiu5QjEC0z6L5bcCbaPCGB44oNos7ms31MwziZ73mG92PUTnRjLQTO+3XxFK26lLjUORjvoQofY=
X-Received: by 2002:a6b:e403:: with SMTP id
	u3-v6mr6364500iog.131.1532728096606; 
	Fri, 27 Jul 2018 14:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <1532722568-9134-1-git-send-email-derek@asterius.io>
	<c9fc0732-de4a-2691-240e-b3968156f76b@gmail.com>
In-Reply-To: <c9fc0732-de4a-2691-240e-b3968156f76b@gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 27 Jul 2018 17:47:46 -0400
X-Gmail-Original-Message-ID: <CADNbA1qsECV0A1TdiqYH1WcDqWpTGX9K9xNorX4n5TGS70RWLw@mail.gmail.com>
Message-ID: <CADNbA1qsECV0A1TdiqYH1WcDqWpTGX9K9xNorX4n5TGS70RWLw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-parse: update to version 1.8.4
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
X-List-Received-Date: Fri, 27 Jul 2018 21:48:17 -0000
Content-Type: text/plain; charset="UTF-8"

Sure.  I'll add something in the message.  The checksum itself didn't
change, the lines did.  For whatever reason upstream throws the license at
the bottom of the source file instead of the top

On Fri, Jul 27, 2018, 5:42 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 07/27/2018 01:16 PM, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  .../python/{python-parse_1.8.2.bb => python-parse_1.8.4.bb}         |
> 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-parse_1.8.2.bb =>
> python-parse_1.8.4.bb} (54%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
> b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
> > similarity index 54%
> > rename from meta-python/recipes-devtools/python/python-parse_1.8.2.bb
> > rename to meta-python/recipes-devtools/python/python-parse_1.8.4.bb
> > index 8e16372..c66d4c8 100644
> > --- a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
> > +++ b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
> > @@ -1,9 +1,9 @@
> >  SUMMARY = "Parse strings using a specification based on the Python
> format() syntax"
> >  LICENSE = "BSD"
> > -LIC_FILES_CHKSUM =
> "file://parse.py;beginline=1191;endline=1209;md5=5147afdd9b3615290ad8733f0137a1a1"
> > +LIC_FILES_CHKSUM =
> "file://parse.py;beginline=1273;endline=1291;md5=5147afdd9b3615290ad8733f0137a1a1"
>
> Why did the license checksum change? maybe add reason as part of commit
> header
>
> >
> > -SRC_URI[md5sum] = "42002338551bdfa0f01bbe4e679a17dd"
> > -SRC_URI[sha256sum] =
> "8048dde3f5ca07ad7ac7350460952d83b63eaacecdac1b37f45fd74870d849d2"
> > +SRC_URI[md5sum] = "fa69ab2fe846f9b183411391f7c6897b"
> > +SRC_URI[sha256sum] =
> "c3cdf6206f22aeebfa00e5b954fcfea13d1b2dc271c75806b6025b94fb490939"
> >
> >  inherit pypi setuptools
> >
>

