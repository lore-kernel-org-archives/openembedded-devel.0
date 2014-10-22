Return-Path: <cnelson711@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B8CF965C66
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 14:02:06 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id tp5so557666ieb.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=VlHF151IHJsSVQg6rfKWNE/rzSuI5jDLABOxOVSkq3o=;
	b=y5rvJjdDj2vVkUCxmkYg/qQ0iR+QKVv6YSclw9IdL/Rd4HwXl0tAdvD2nQuBamJ3O1
	U02AazFsJBHE1GDyHrhbmmlGCcgGUmBm4uLOhD3cHkbdPIbYDYS9wsqSuL+jjqjJRbg1
	AEySvk6qiuCQ3ElaDy1U/tJnxu+vxf5dG8pNJ6fml6sTA86JaZPr8ulqe+JoeWSji5JH
	675GLmvQ9X+NltE4h5UvXQBMubhPxqnYOtIkIy3HBb+WQLqBEj5388odJ3zmwR4RclYN
	qTC+CrT8z7dhwYChlIPIMBM+xXTHfu9hTI04B0781JQteGUyVmhrS20X9bPjbQHxOHCF
	riEw==
X-Received: by 10.42.168.73 with SMTP id v9mr4697442icy.21.1413986526153; Wed,
	22 Oct 2014 07:02:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.134.92 with HTTP; Wed, 22 Oct 2014 07:01:17 -0700 (PDT)
In-Reply-To: <CAMKF1so35KLMvZ77w14kF6a19D4xrwNHiR43=Fi5_HwA+5Bx5A@mail.gmail.com>
References: <1413947089-3995-1-git-send-email-cnelson711@gmail.com>
	<CAMKF1so35KLMvZ77w14kF6a19D4xrwNHiR43=Fi5_HwA+5Bx5A@mail.gmail.com>
From: Chad Nelson <cnelson711@gmail.com>
Date: Wed, 22 Oct 2014 09:01:17 -0500
Message-ID: <CAKs3hO0kACPcqaJinUEdOm+QP2btbQ09dRpLYtYaH6Wg9MQSoA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-ruby][PATCH] ruby-lang.org changed the subdomain/hostname of their download server.
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
X-List-Received-Date: Wed, 22 Oct 2014 14:02:06 -0000
Content-Type: text/plain; charset=UTF-8

Agreed.  We can throw away the patch.

--
Chad M. Nelson
Software Engineer
Ag Leader Technology
cnelson711@gmail.com
Cell #: 1+319-389-0689
Skype, Gmail, Fbook: cnelson711


On Tue, Oct 21, 2014 at 11:50 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Oct 21, 2014 at 8:04 PM, Chad Nelson <cnelson711@gmail.com> wrote:
> > From: Chad Nelson <cnelson@agleader.com>
> >
> > Signed-off-by: Chad Nelson <cnelson@agleader.com>
> > ---
> >  meta-ruby/recipes-devtools/ruby/ruby.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc
> b/meta-ruby/recipes-devtools/ruby/ruby.inc
> > index 409a320..7702869 100644
> > --- a/meta-ruby/recipes-devtools/ruby/ruby.inc
> > +++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
> > @@ -20,7 +20,7 @@ DEPENDS_class-native = "libyaml-native"
> >  INC_PR = "r1"
> >
> >  SHRT_VER =
> "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
> > -SRC_URI = "
> http://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
> > +SRC_URI = "
> http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
> >             file://extmk.patch \
> >  "
>
> It seems to be a temp failure now I can download successfully from
> original ftp location
>
> curl -O ftp://ftp.ruby-lang.org/pub/ruby/ruby-1.9.1-p429.tar.gz
>
>   % Total    % Received % Xferd  Average Speed   Time    Time     Time
> Current
>
>                                  Dload  Upload   Total   Spent    Left
> Speed
>
> 100 8865k  100 8865k    0     0  1403k      0  0:00:06  0:00:06 --:--:--
> 1865k
>
> this patch may not be needed
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

