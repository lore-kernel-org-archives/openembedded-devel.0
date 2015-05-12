Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C364E73F5C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 22:28:05 +0000 (UTC)
Received: by wggj6 with SMTP id j6so25227227wgg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 15:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=UWHVt90OcMYm3aeHfdNyxMym4EGHRXoSi09TlmlZD0I=;
	b=sHTb0zhqoskUs3Hvi8cbv2ivP4tql7xcLNyIlI8gzRZWj08sN+ZSNNSSB5NZ3CBFFn
	9r5ZjfIQ76F4MK74DZ/6n6ggcZ9dfPbjoOWllfHlMmGPjsBFM+DypyJz8gxUnrAA6/1A
	vJSZb1Ir1KO/RsM62jEOloOiSteb7qO1HP5q5gNrqq478gIL9s+MtF5ZWlSjV8tNZIw2
	rutkA9UJ6ckzVnwd2yl8bJ6glHxsEaBXq4iwVpDYC3uoByqLWC2ArnEG5rLQ2ijl04LV
	t/XWQEN71eHM+34MW/QREnRUwohSxcgnOttMna6Cm3ssMoB1tEQLbrGQNQ/4SaKeeP7B
	CBIw==
X-Received: by 10.194.59.46 with SMTP id w14mr34488386wjq.106.1431469686281;
	Tue, 12 May 2015 15:28:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id f8sm4921216wiy.7.2015.05.12.15.28.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 15:28:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 May 2015 00:28:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150512222810.GF2714@jama>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
	<20150511092704.GH2400@jama>
	<10765250.9tBgYfV1HJ@peggleto-mobl.ger.corp.intel.com>
	<20150512144510.GC2714@jama> <55527C5A.4010900@gmail.com>
MIME-Version: 1.0
In-Reply-To: <55527C5A.4010900@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 01/20] smstools: fix PN -> BPN for multilib
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
X-List-Received-Date: Tue, 12 May 2015 22:28:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2015 at 06:19:06PM -0400, Trevor Woerner wrote:
> On 05/12/15 10:45, Martin Jansa wrote:
> > On Tue, May 12, 2015 at 01:43:19PM +0100, Paul Eggleton wrote:
> >> On Monday 11 May 2015 11:27:04 Martin Jansa wrote:
> >>> On Fri, May 08, 2015 at 03:42:16PM +0800, Yi Zhao wrote:
> >>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >>> Changes 03, 18, 20 didn't make it to patchwork, because they were mar=
ked
> >>> as Spam by gmail
> >> Hang on, I'm confused. Why should the patches being marked as spam in =
gmail=20
> >> have any bearing on whether they should show up in patchwork? Surely g=
mail=20
> >> shouldn't be involved in the sending part, only subsequently when the =
mail is=20
> >> sent from the mailing list to you (since you use gmail)?
> > Isn't patchwork reading some gmail account over imap?
> >
> > The list of patches not appearing in patchwork is exactly matching with
> > patches marked as spam in my inbox, so I believe that the same is
> > happening in patchwork's gmail account.
>=20
> Does anyone know if it helps when I notice them in "Spam" and mark them
> as "Not Spam"?

It helps in my gmail account (some patches probably still marked as spam
in patchwork weren't marked as spam in my gmail folder), but maybe it
needs more time to propagate into other account or it needs more people
to mark it as such.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

