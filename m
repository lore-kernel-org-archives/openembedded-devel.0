Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 723FA713C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 11:58:59 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id z6so517789yhz.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Sep 2014 04:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=nCc9YwWEfQJKrRLcj+xeZPOSk7iHUy085kb23KjjTMQ=;
	b=0gsVyjAMXohhsUcPHnjHEqWvk3eculHML0Vc9UXBnLWTUaknuWbtJlG88y/+WQRCsd
	/WTDmUoUJq5hGNrUy7Tzh5lIvtEDI/pv5OJSFnE+ON/HsdLP8ImqW+VhXd83dS9Me0IU
	33AHULMFTsIlahTYOHzb37iDRuRIyOsKoKO7hLnzXmWCHCn3EdD6c3y2DShU1TObl516
	vI+AfwmGljLDy9pRfDSXpdyFUlHXyzux6xztI32mjdka5iEdx5f8RBDSakW4sqIBVZ6a
	XtLGC9zF/KvOjQotxSIqu99EYWovo0CVITfPpJ5o7tabSRk2JKJcTlGGxUP0IIawJwg+
	GskQ==
MIME-Version: 1.0
X-Received: by 10.236.130.210 with SMTP id k58mr13263883yhi.102.1409918340806; 
	Fri, 05 Sep 2014 04:59:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Fri, 5 Sep 2014 04:59:00 -0700 (PDT)
In-Reply-To: <CALRGHr_u5LULhoxx0NLYK6Uux4uZ5Kr7+ikOY-TKqMvDfUfYmg@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
	<CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
	<CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
	<CALRGHr_u5LULhoxx0NLYK6Uux4uZ5Kr7+ikOY-TKqMvDfUfYmg@mail.gmail.com>
Date: Fri, 5 Sep 2014 08:59:00 -0300
X-Google-Sender-Auth: xihaueJyqi7sEFB9K7I6dRG1Hj8
Message-ID: <CAP9ODKp=xaS+WoQe-zKTpcKiqmdk4mHteoZ8a9BqO1w96hcbxg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Error while bitbake meta-toolchain-qt5
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
X-List-Received-Date: Fri, 05 Sep 2014 11:59:02 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 5, 2014 at 8:08 AM, Switesh Fulpagare
<switesh.fulpagare@mindastoneridge.com> wrote:
> Hi Otavio,
>    Thanks for your reply.
> I have applied the patch, now it is fetching qtwayland_git.bb but it is
> giving error for do unpack as shown in below link and
> qtwayland-native_git.bb is not going to fetch.
>
>
> http://pastebin.com/dk2gFin0

My bet is that your local.conf, DL_DIR, is pointing to a path with /
at end, fix it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

