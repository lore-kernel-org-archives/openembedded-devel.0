Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 21E9E65D3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 07:28:33 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so436594lbj.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 00:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gIg3ALtkmeHfdvRzRVR2/mMAfIfXCNFTQP7F6TzF2/w=;
	b=wjBIBUr14OtolPITdNolQurdA+CmzbuhQ+EDlQOT0PBpaKMt2OqTnuD0fBoz52CzYq
	kHd7mPCgHdoudmiT4ZgtNfYx5o4WWy96WkjBUO2y/c3RsQPmwwGavI8xuxv/o+ph1/9+
	XvoRGDuiuD6+AQtuhy+kPVZFuT8XWeUmvQlZN9ML7Obo9HR/HJMdKZ9lYq1eDfOjKxaP
	njd0+lDpS8Mf5Ex1co70LI7CQTqZGjQUN7echMHiulEAhY/SMzwrLTUCqmhXPOymb4aF
	zCFF7oqxtM014WLI0OtM/rqvJmSQfuE4rjJAEJQek6ErccXwjSzHsQH/t9EJKMKV29Q9
	8qzA==
MIME-Version: 1.0
X-Received: by 10.152.4.41 with SMTP id h9mr497842lah.43.1398238113862; Wed,
	23 Apr 2014 00:28:33 -0700 (PDT)
Received: by 10.112.53.73 with HTTP; Wed, 23 Apr 2014 00:28:33 -0700 (PDT)
In-Reply-To: <6764532.83vtKHNMPE@koontz>
References: <1395236677-28379-1-git-send-email-sgh@sgh.dk>
	<1647989.PEsjAC07VF@koontz> <20140319174024.GB3726@jama>
	<6764532.83vtKHNMPE@koontz>
Date: Wed, 23 Apr 2014 09:28:33 +0200
Message-ID: <CAPbeDCngUZaHTZARjxQ+ChMzHDphfVTMMSeJ2TyP3o08iOctgg@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] qtbase: Add libxi to depends.
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
X-List-Received-Date: Wed, 23 Apr 2014 07:28:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi S=C3=B8ren,

On Wed, Apr 23, 2014 at 9:00 AM, S=C3=B8ren Holm <sgh@sgh.dk> wrote:

> Hi MArtin
>
> This fix is not in master yet. Is it lost between two chairs ?
>
> Onsdag den 19. marts 2014 18:40:24 skrev Martin Jansa:
> > On Wed, Mar 19, 2014 at 06:02:57PM +0100, S=C3=B8ren Holm wrote:
> > > yes problably. I did not investigate the whole structure that thoroug=
h
> > > apparently.
> > >
> > > Could that change get into dora?
> >
> > Yes, but first it needs to go to master.
> >
> > > Onsdag den 19. marts 2014 15:15:01 skrev Martin Jansa:
> > > > On Wed, Mar 19, 2014 at 02:56:18PM +0100, Jacob Kroon wrote:
> > > > > Maybe do something this instead ? This is only necessary for X11
> right
> > > > > ?
> > > > >
> > > > > -DEPENDS +=3D "qtbase-native"
> > > > > +DEPENDS +=3D " \
> > > > > +    qtbase-native \
> > > > > +    ${@base_contains('DISTRO_FEATURES', 'x11', 'libxi', '', d)} =
\
> > > > > +"
> > > > >
> > > > > /Jacob
> > > >
> > > > I think it belongs to
> > > > PACKAGECONFIG[xinput2] =3D "-xinput2,-no-xinput2,libxi"
>
>
Please test the solution that Martin proposed, and if everything looks
good, submit a patch using the instructions found in meta-qt5/README
and http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded.

/Jacob

