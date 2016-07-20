Return-Path: <cynthia.ms.chiu@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 316CB606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 17:12:10 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id c199so5398313oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 10:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=t7/UESto1zqAO6/6cdzZyY5Mzjv8VzewCgYJz9RSdck=;
	b=RTVanZM+Gfmfg4TbJI1XZIFkHJ3MUcShuDKMzTIGcQn66rzTdjFXyS4eGMoXSsq02P
	hvhmWkh6unPbgJjAEsGGZWsbXJCTWLRzB9nDMg/CYrlggmZ7P+T5/Bb/lyIU6g0EyzIu
	siNJLCF/ATKn5dhB7aaG/mkBMkObY95qx+zZK8yUQJbnAFi2MD9aVBIdvk+9MvtAMuFH
	mR1RbRCpcPlfV2wORU5Mi2ee9Bcan5li5M0+y55gMLRmrl0Ojamt8VZCkhkjuz7d8NRt
	a53euXYSM0+ORcOL1fjJpgKfLruZbw4lClHPL1b6iP2tqaG+YvgQQNzd1/pJXenXb0zu
	6veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=t7/UESto1zqAO6/6cdzZyY5Mzjv8VzewCgYJz9RSdck=;
	b=lFAMzkhKs2ZxC+lfKpGiZPJeZrzCqA7Zv8xNAyR66H1Lv59SE+DyvEowmbqUPfB3jH
	mjxLCl20oaMT2fbXcH2ZGfCszP8msKexY3vd3C333FDJydFXALYO2RDAtNHa+lVVw74+
	Oibj79NADRKQJqrPVFQaW3TdpfE4IfmwgE2tciK6GxNDIWLK8qeoD8vjVIPEHUSRirFF
	NMl3SaLVxu64h9I5kFr0+wfIC3+UIDP1+oMq7V8/hufVMFEYpCHDoydEdqk3vfPchedD
	rIXSF+nKmUhpU/zkIhhIgGzwbwdmoOX5epCiE67HsM+a9pIdO+RS1pVRKkV4MwyUuxhl
	rEig==
X-Gm-Message-State: ALyK8tLGTIzfY6W7fH2PQdPyMpqj7YJkXnXhJi2tGKF1Ea3mqy8VK9yeqP6nQVUjXjDX4XoW7NABTry4uMSkKA==
X-Received: by 10.202.87.129 with SMTP id l123mr23556593oib.15.1469034731155; 
	Wed, 20 Jul 2016 10:12:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.171.7 with HTTP; Wed, 20 Jul 2016 10:12:10 -0700 (PDT)
In-Reply-To: <20160720135910.hs6ucmxt3mxv6zu7@jama>
References: <1468508914-17420-1-git-send-email-cynthia.ms.chiu@gmail.com>
	<20160720135910.hs6ucmxt3mxv6zu7@jama>
From: Cynthia Chiu <cynthia.ms.chiu@gmail.com>
Date: Wed, 20 Jul 2016 11:12:10 -0600
Message-ID: <CAFn+KXBvG8LmWUm2mgG0d+y-V7iEOzTn_smGVqrGpWh_448TVg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] CANopenNode: recipe for building the CANopenSocket tools
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
X-List-Received-Date: Wed, 20 Jul 2016 17:12:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Thanks for your feedback, I will update the recipe.

Regards,
Cynthia Chiu

On Wed, Jul 20, 2016 at 7:59 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Thu, Jul 14, 2016 at 09:08:34AM -0600, cynthiachiu wrote:
> > Initial check-in for the CANopenSocket tools recipe.
> >
> > Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
> >
> > Including a specific revision for the recipe.
> >
> > Using gitsm.
> >
> > Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
> > ---
> >  .../canopennode/canopensocket_git.bb               | 25
> ++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/canopennode/
> canopensocket_git.bb
> >
> > diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > new file mode 100644
> > index 0000000..7c58a26
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> > @@ -0,0 +1,25 @@
> > +SUMMARY = "Linux CANOpen tools"
> > +DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM =
> "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> canopensocket-git: canopensocket: LIC_FILES_CHKSUM points to an invalid
> file:
>
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/canopensocket/git-r0/git/gpl-2.0.txt
> [license-checksum]
>
> > +
> > +SRC_URI = "gitsm://github.com/CANopenNode/CANopenSocket.git"
> > +SRCREV = "7777653da3a630b0dc02b3fa5ff029d9bc57cd26"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +do_compile() {
> > +    cd ${S}/canopend
> > +    make
> > +    cd ${S}/canopencomm
> > +    make
> > +    cd ${S}/canopencgi
> > +    make
> > +}
> > +
> > +do_install(){
> > +    install -d ${D}${bindir}
> > +    install -m 0755 ${S}/canopend/app/canopend ${D}${bindir}
> > +    install -m 0755 ${S}/canopencomm/canopencomm ${D}${bindir}
> > +    install -m 0755 ${S}/canopencgi/canopen.cgi ${D}${bindir}
> > +}
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

