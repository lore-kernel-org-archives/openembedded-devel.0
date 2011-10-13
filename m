Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mgargela@gmail.com>) id 1REJEB-0003cI-Kg
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 13:13:31 +0200
Received: by ggnq1 with SMTP id q1so1666843ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=56CiJwlB8UVOJFc+LakeAZuXFqdIXBpPt1aBtWj0qd8=;
	b=oLTsfcBufMmS9hW9j/9G0Fzcfb7bh+BNV96BQY20BUb1hDk/U9AsGxow78NACb9uAm
	Ky0w+DnHeZdO3KEqYh9YuxVMH4ZEo+YeA/uZzGxQ/aZChMdftKSlOzmRxC0i3C2BGIFf
	nQYX7eL4wqF6c+bdwuM+CQhav//MXkjv06rAQ=
MIME-Version: 1.0
Received: by 10.236.76.136 with SMTP id b8mr4205212yhe.9.1318504066230; Thu,
	13 Oct 2011 04:07:46 -0700 (PDT)
Sender: mgargela@gmail.com
Received: by 10.236.103.146 with HTTP; Thu, 13 Oct 2011 04:07:46 -0700 (PDT)
In-Reply-To: <1318497983.14199.54.camel@phil-desktop>
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
	<1318497983.14199.54.camel@phil-desktop>
Date: Thu, 13 Oct 2011 14:07:46 +0300
X-Google-Sender-Auth: gU4VAScrMudDwLDgfANzqJMaGbE
Message-ID: <CAObi9r8DqGUVt6ohNvpzQu3ZW-bRh9ET6XL5ZwEGVGK_hbAYUQ@mail.gmail.com>
From: mgundes <mgcse@hotmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Thu, 13 Oct 2011 11:13:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2011 at 12:26 PM, Phil Blundell <philb@gnu.org> wrote:

> On Wed, 2011-10-12 at 15:22 +0300, mgundes wrote:
> >    I think one of the big issue with OE is build time. It does everything
> > for you, so that it takes too much times. I want to minimize build time
> and
> > realized that OE creates ipkgs for almost every package. If there is a
> way
> > to prevent creation of ipkgs it would be really good for me. In my
> opinion,
> > it would be fine for other people too since usually rootfs directory is
> > enough and ipkgs are not frequently used directly by developers.
>
> If you want to eliminate ipk specifically then there is no problem: you
> can select package_rpm or package_tar or package_deb instead.
>
> If you want to eliminate the whole packaging step then this is rather
> more tricky and it's not really obvious that this would buy much.  Do
> you have a proposal for how rootfs construction could be done in that
> case?
>
> p.
>
>
>
      Hi Phil,

      I meant eliminating whole packages.

      Sometimes you think that it should be a better way even if you don't
know the way. I am not expert on OE and unfortunately I don't have any
proposal. I thought there may be or there should be a way to do but if
founders and experts don't agree or say current is the best way to go, then
everything is ok. May be later, when I learn OE good enough and if I figure
out a way I surely share with OE team :)


>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


-- 
MahmutG

