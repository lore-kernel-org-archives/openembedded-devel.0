Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4D014609AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 13:54:21 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id ec20so2598548lab.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 06:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zR8Rp9UPxUpaYaYnrUvdRdCbducQxTvvt6FnMitgddw=;
	b=MVpx2DtRpej+a+bqXEwdAhwl699QBJKpGt9ejXhKBwfXgVseHA4Ai7/59VQuIWNFU+
	dIohGiVcuz9oy6O6pExF94XhaxW8ALMzN4M5ytwGFPzorQlowmy/Fszr5TLldJk43zGe
	PuwPX9AMK2ly1B9CCN481RnZ/AS9MtrPJoPGXlj7EobZ1ccakkYNffbTvV1iVIPO69pb
	cSlaz84NpbXa2zHBD2jlr8Y3VUqXIRBykBi6BhYFvZ25A1jI3lMyYOMOisN5Zzv4BBGY
	lmqOzTgmCGzR+BDkeocJRg5W5I83vxH4L1XVqdSuhkjzPVXFa6flYv6YnFXRqVyZ1ioI
	5T0Q==
MIME-Version: 1.0
X-Received: by 10.152.30.41 with SMTP id p9mr22611277lah.26.1398002061340;
	Sun, 20 Apr 2014 06:54:21 -0700 (PDT)
Received: by 10.112.53.73 with HTTP; Sun, 20 Apr 2014 06:54:21 -0700 (PDT)
In-Reply-To: <20140420103441.GL2486@jama>
References: <1397581965-24301-1-git-send-email-jacob.kroon@mikrodidakt.se>
	<20140420103441.GL2486@jama>
Date: Sun, 20 Apr 2014 15:54:21 +0200
Message-ID: <CAPbeDCn+wU_rCnmenVegyK_A4heeVRWOG_qU9j78z32TQ8by6w@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] populate_sdk_qt5.bbclass: Fix PACKAGE_GROUP deprecation warning
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
X-List-Received-Date: Sun, 20 Apr 2014 13:54:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

On Sun, Apr 20, 2014 at 12:34 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Tue, Apr 15, 2014 at 07:12:45PM +0200, Jacob Kroon wrote:
> > Fixes the following warning:
> >
> > WARNING: PACKAGE_GROUP is deprecated, please use FEATURE_PACKAGES instead
>
> It's correct patch, but I'm a bit tempted to take this patch after
> branching daisy, because some people are using latest meta-qt5 with
> older oe-core releases and this undoing this change is easy to miss
> (unlike e.g. cmake .bbappends which fail when not updated for correct
> oe-core releases).
>
> What do you think?
>
>
I think I follow you. So the deprecation happened in commit
d703e07ea5056624101e1bc48f10d25b602635e9, 2014-03-07, so I guess only
daisy/master will give the warning. For older oe-core releases with
meta-qt5 master, this patch could silently break stuff I can imagine. So
like you propose, keeping this one for master only, after branching daisy,
seems like a good idea to me.

/Jacob

