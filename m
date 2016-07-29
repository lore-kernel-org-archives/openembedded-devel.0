Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1B136607A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 20:17:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1469823434; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=8oymwihoOiKMABAH9E0zj22+maBYjxMRrkaWL2+eKSA=;
	b=l8qninxfrh+w0rA3CXC70i9oZTK6sV4TkXHuZ6fxgHePf/2H333fDH9YFyR8eU173ntRooGE
	8FuDCfZoZKUvZjQ4/MWZbtEF0B36Vbf3OSxlSRc709uW86iVup7XWiT9AqKk0L4mtKmrZc8f
	AajTatvymfw1WSZbEaWA8WEStVU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=U7Qg/kGUUTuILL5hJZjI1ixRRMdqVJTXZ+j0HKJuACK+xBD6aLzuDvNzC6+WILsSVWXC46
	4uidE+ND+wZpk/vmYQ6udwlD5yfpm0IlblJQFOu66vGCeOyzN04seu7yTkxItL5A/Ef5DQFE
	jkAOeP5veAbN9Xw1uCjar+loUxBz8=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mxa.mailgun.org with ESMTP id 579bb9ca.7fd56c31a830-in6;
	Fri, 29 Jul 2016 20:17:14 -0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id 38so138802308iol.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 13:17:14 -0700 (PDT)
X-Gm-Message-State: AEkoouvtTS65ydJF1OsLMEB/HFD6oNnHREK0sg5tyiWvp0znpFG54PVYgW+M+x/BjffXtp1ore7g8Joo6CYdZQ==
X-Received: by 10.107.62.135 with SMTP id l129mr45346858ioa.185.1469823433939; 
	Fri, 29 Jul 2016 13:17:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Fri, 29 Jul 2016 13:17:13 -0700 (PDT)
In-Reply-To: <CAFn+KXByikEDEQLaFKdmh=73kHiSr_YBK_p-v9-V=ZumxAyv_Q@mail.gmail.com>
References: <1469035439-23466-1-git-send-email-cynthia.ms.chiu@gmail.com>
	<20160727125539.5p7zs2kaxf2nxbms@jama>
	<CAFn+KXByikEDEQLaFKdmh=73kHiSr_YBK_p-v9-V=ZumxAyv_Q@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 29 Jul 2016 16:17:13 -0400
X-Gmail-Original-Message-ID: <CADNbA1qo54rnGPCkez_MUyNGnQL+jERd9joe6ZkFYA4YXUoBWw@mail.gmail.com>
Message-ID: <CADNbA1qo54rnGPCkez_MUyNGnQL+jERd9joe6ZkFYA4YXUoBWw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v3] Pointing the LIC_FILES_CHKSUM to a valid file.
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
X-List-Received-Date: Fri, 29 Jul 2016 20:17:16 -0000
Content-Type: text/plain; charset=UTF-8

Why would you be using BSD when the source indicates the license is GPLv2?
Also, the git repo already has a LICENSE file at the root.  Is there a
reason you don't use LIC_FILES_CHKSUM =
"file://LICENSE;md5=75859989545e37968a99b631ef42722e"

-Derek

On Fri, Jul 29, 2016 at 4:02 PM, Cynthia Chiu <cynthia.ms.chiu@gmail.com>
wrote:

> Hi,
>
> Thanks for your feedback. I apologize for the confusion. I have changed the
> recipe to use: LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb"
> I have tested this and it works.
>
> I just wanted to confirm that using ${COMMON_LICENSE_DIR} is an acceptable
> convention before I apply another patch.
>
>
> Regards,
> Cynthia Chiu
>
> On Wed, Jul 27, 2016 at 6:55 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> > On Wed, Jul 20, 2016 at 11:23:59AM -0600, cynthiachiu wrote:
> > > Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
> > > ---
> > >  meta-oe/recipes-extended/canopennode/canopensocket_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > > index 7c58a26..1e0f7d0 100644
> > > --- a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > > +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > > @@ -1,7 +1,7 @@
> > >  SUMMARY = "Linux CANOpen tools"
> > >  DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
> > >  LICENSE = "GPLv2"
> > > -LIC_FILES_CHKSUM =
> > "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > > +LIC_FILES_CHKSUM =
> > "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >
> > LICENSE.GPL also doesn't exist, FFW test your patches before sending
> > them.
> >
> > Dropped from master-next until someone sends *tested* version.
> >
> > >  SRC_URI = "gitsm://github.com/CANopenNode/CANopenSocket.git"
> > >  SRCREV = "7777653da3a630b0dc02b3fa5ff029d9bc57cd26"
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

