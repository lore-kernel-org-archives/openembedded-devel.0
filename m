Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 25E3560043
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 18:58:22 +0000 (UTC)
Received: by wizk4 with SMTP id k4so118381924wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=1Ukk6xYpKX/dLVH3j9GHr4y68BOnY3l35CPuevjPFUc=;
	b=kEDMkILY+1fr2mwdb9o4Opzme+Ldb+H3o1aXp4vhRNrIxub2IJK+FUOkyeuz/mR2wT
	GQGvblYHVvewIoVFaZr0GOgncdq7eVrdcJ6dU9k8ic9BmrGr+rG5ly933tTJCLG+o4JU
	TNWI/y7yPVx/rV5XtLMiNNOabKzsBljsru5C81WoXL3YTFyUDKei8AO0TjZ4mn/AdXRC
	4ZPUT0bR5aOANaWfNxSUyE9VRFij0rIotQiW6wuRz8C06WdLtkCg3jlc40hsuRoCIYsC
	xVqxacYf2fH6cgRBam4fpq/46Gs9BUuCe7N6xnmku0iMqsLP00ZeIHRT/zaaKoyxxCp/
	M7+A==
X-Received: by 10.194.59.46 with SMTP id w14mr23249362wjq.106.1431370703222;
	Mon, 11 May 2015 11:58:23 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id dq4sm1053109wid.17.2015.05.11.11.58.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 11:58:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 May 2015 20:58:53 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150511185853.GJ2400@jama>
References: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
	<1430852951-18707-7-git-send-email-raj.khem@gmail.com>
	<20150511091643.GG2400@jama>
	<CAMKF1spGXt=mNhu94Q72Le-uLY4yDLTDR6qLMMTinS9X6uJdng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spGXt=mNhu94Q72Le-uLY4yDLTDR6qLMMTinS9X6uJdng@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][meta-gnome][PATCH 7/7] obex, gnome-bluetooth: Depend on bluez5
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
X-List-Received-Date: Mon, 11 May 2015 18:58:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2015 at 09:06:33AM -0700, Khem Raj wrote:
> On Mon, May 11, 2015 at 2:16 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Please send v2 with PNBLACKLISTs removal once the runtime testing is
> > done.
>=20
> it worked ok runtime in my case. but which recipes are you referring
> to wrt blacklisting

All where you changed bluez4 dependency to bluez5, see:
http://git.openembedded.org/meta-openembedded/commit/?id=3D73ba7cd70f75a898=
bf4c3f8ae38c9904fc3e4724

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

