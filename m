Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id B572A60D7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 11:04:03 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id uz6so18392991obc.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2014 03:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ONQb+1yL2y3v1uBqdZ27wpPajVsEgq+w9wbwPjnrAi8=;
	b=AXrxkv5SbdTiVD/UpW9Q3YeJQsyvVQnBEW8eYAGC2xHIxE8DzThAn8Aoq/oqW0krpJ
	A6/CUMdLfrujEOoyjaObged3LAWqN8/Rp0gLtrQf9RNNqX1NARhD7zvjfUgWqM1U4B6J
	KF7WWllTx+ZgRiZB/AtNX39BJrfBqv1L7hu9govCAC2bfy3Hv3dSaK7t+0drwdGhi/nf
	ICtQH+8lQpKhogtPnWVRqbGoV/HAsQ2WHawEibH/Zs++G/Zml1VbUcJrRV3648eG3Pcc
	gcpT2cFjAJpGyAaLWIeQgq0oWTfxO1jIkyb8gHxnQ/oRKWfSVO73Z584sNjlaMDkI7bX
	jD0Q==
X-Gm-Message-State: ALoCoQkJ2rCcxOPesmxb8PU8kLGAjPi0OlP5+bqvCIilkqo5wycsTdU7OlNb1SMQCFFtIbFDxk43
X-Received: by 10.60.115.138 with SMTP id jo10mr249745oeb.71.1389006244584;
	Mon, 06 Jan 2014 03:04:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.89.143 with HTTP; Mon, 6 Jan 2014 03:03:44 -0800 (PST)
In-Reply-To: <20140106103211.GF3709@jama>
References: <1388489871-14502-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP71Wjwq17ZZ9K_tWPBEq3A3rOPe4HmCfhOEKHfgy_0pVzmpUg@mail.gmail.com>
	<20140106103211.GF3709@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 6 Jan 2014 12:03:44 +0100
Message-ID: <CAP71WjzWHewqb6U7R9aLkYHbrOHmBUK2nCWz6TyaRvCXOQvqtw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] qtwebkit: Depend on gstreamer-1.0 instead of 0.10
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
X-List-Received-Date: Mon, 06 Jan 2014 11:04:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 6, 2014 at 11:32 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> > right now i am using the dora branch and qt5.1.1 which hasn't been
> updated
> > for a while, which is fine.
>
> This is only for master which will soon became just qt5.2.0 where
> gstreamer-1.0 is used by default and I believe more tested than
> integration with gstreamer-0.10.
>
> So it won't change anything for people using 5.1.1 from dora branch. If
> someone really wants to use gst-0.10 with 5.2.0 I would accept patch for
> PACKAGECONFIG.
>

Ok. thanks. I don't need it, now, at least. if we ever move to qt5.2 and
still use gst0.10, then i will submit the patch

>
> gst-1.0* seems to be working fine for our ARM project and
> we've removed all gst-0.10 from our images lately - that's why I've
> noticed this qtwebkit dependency.


well, assuming you get the video codec plugins ported onto gst1.0 ;-) which
might not always be a trivial thing.. anyways, right now we don't have the
choice and gst0.10 is required!

thanks for your quick answer.

