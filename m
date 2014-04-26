Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id BDACC65E22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 00:40:31 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id db11so5455251veb.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 17:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=h6VXM3nTpOux6za9OtQFbi4LVXEre3WzjTq1KBr7Ais=;
	b=QsBT65oNy+2FCK91ZroQ2sYOnwHlBl3bcgqyNrZjbGqZmqlcDERaiofG3Wn57jXW7a
	+MH+q4HIZWL504yXyA7N+8PRFCLupv3cNE+gTfrOu/5SiG3CeZqr105zRiPPfvyzs2Im
	lUgfHMR8IIQtxo1CxQ0YaHC3vLZLliFiKkLm+jxOdAAMdBR+bP/0ZIlvf3/sbEKDWq0J
	5bobJ6Ww/yjuhNY4FYD2dTr6RNYlqIJknZNAfWKNbc0IYgVNDNddPCu2i7Pz6ySp4L8m
	feo5yxG7mAHgINImyThNbIEMClYlM5N5DO7fvwATp/Cdky7mXMfZLhLBT/OIniZbV3EG
	VKiw==
MIME-Version: 1.0
X-Received: by 10.52.90.37 with SMTP id bt5mr7939929vdb.7.1398472832875; Fri,
	25 Apr 2014 17:40:32 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Fri, 25 Apr 2014 17:40:32 -0700 (PDT)
In-Reply-To: <CAN-NoH3eEb1x-XYt8aNDJm_s5DmLq_C_YyvkiskR8jp2n0uqRQ@mail.gmail.com>
References: <CAN-NoH3n=jjiSUou_drXk1xSD8rrKymWXiERgoHEeyus2LCz+A@mail.gmail.com>
	<20140425235627.GA2486@jama>
	<CAN-NoH3eEb1x-XYt8aNDJm_s5DmLq_C_YyvkiskR8jp2n0uqRQ@mail.gmail.com>
Date: Fri, 25 Apr 2014 17:40:32 -0700
Message-ID: <CAFeBWL7qqCRw2rdJT41KvmOc9wHneaCrYE0oP=Go-o_FoXJ8GQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: v4l-utils won't build
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
X-List-Received-Date: Sat, 26 Apr 2014 00:40:35 -0000
Content-Type: text/plain; charset=UTF-8

which branch are you on? I am on master-next for OE and on Daisy on Poky.
Both opencv and v4l-utils build ok.

Adam


On Fri, Apr 25, 2014 at 5:30 PM, Richard Cagley <rcagley@gmail.com> wrote:

> On Fri, Apr 25, 2014 at 4:56 PM, Martin Jansa <martin.jansa@gmail.com
> >wrote:
>
> > On Fri, Apr 25, 2014 at 12:56:26PM -0700, Richard Cagley wrote:
> > > After running bitbake core-image-minimal I'm trying to run bitbake
> opencv
> > > and I get the below. I've looking through the log files and the
> v4l-utils
> > > recipe. All I can see is that it's unhappy about something to do with
> the
> > > autotools configuration for the project. Any ideas?
> >
> > See
> >
> >
> http://git.openembedded.org/openembedded-core/commit/?id=baf5b230af919b6b0fd14ac5fc3e734bf7c464d5
> > and related discussion on ML
> >
> >
> sorry, i'm too new at this stuff to extract the needed information. Any
> chance you can give me a bit more guidance? I'm not even sure what to
> search for in the mailing lists. What's a good procedure to debug this sort
> of thing?
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

