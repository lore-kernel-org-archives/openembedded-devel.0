Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RKGXP-0000Ad-GD
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 23:33:59 +0200
Received: by ggnj1 with SMTP id j1so4610929ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 14:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yPEJkqfqpizjbOKDj3NlOMAdpJp6BvVQNG4eKpVB3sU=;
	b=Q9/shUgZjqvScV0ZxT71i2WLyTcu4EanN2QYd1B2zk1TRhYysofY7tH56IkUFbXlGV
	BehEG4sd+98iuYgkw2Zwj6aLD/Uz7vEUTnsyznkIuUus+vvAtt+nmFEr2Li4O1TOz6cM
	SJ3lruM7kJMtrqjxNIBplaEGjvap8L2WK28QU=
MIME-Version: 1.0
Received: by 10.236.108.225 with SMTP id q61mr10178723yhg.66.1319923674841;
	Sat, 29 Oct 2011 14:27:54 -0700 (PDT)
Received: by 10.147.182.9 with HTTP; Sat, 29 Oct 2011 14:27:54 -0700 (PDT)
In-Reply-To: <CA+M6bXnq6jfhyZ+6nRB3GDqoRv3oa=m-xcht8xrAYV_7aeVzkA@mail.gmail.com>
References: <4EAC296D.8040403@telia.com>
	<CA+M6bXnq6jfhyZ+6nRB3GDqoRv3oa=m-xcht8xrAYV_7aeVzkA@mail.gmail.com>
Date: Sat, 29 Oct 2011 23:27:54 +0200
Message-ID: <CAAQYJAucXepsfHvxSkJyvsEnv4Eid6yu3NxPgMfk5QrNb4t=mw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Adding sumtool to a JFFS2 build to speed up first boot
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
X-List-Received-Date: Sat, 29 Oct 2011 21:33:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 29, 2011 at 7:14 PM, Tom Rini <tom.rini@gmail.com> wrote:

> On Sat, Oct 29, 2011 at 9:27 AM, Ulf Samuelsson
> <ulf_samuelsson@telia.com> wrote:
> > Trying to solve another problem I came up with
> > changing IMAGE_CMD_jffs2 defined in conf/bitbake.conf
> > by redefining it in conf/local.conf.
> >
> > During that process I noticed the "sumtool" utility
> > which works on the jffs2 image, doing some
> > bookkeeping which then does not have to be
> > done on the target.
> >
> > I unserstand, this can speed up loading significantly.
> > Any reason not using this in OE?
>
> Last time I looked at this, the reason was that you had to re-jigger
> the IMAGE_CMD a bit and you also have to take care as not all of the
> options are the same between mkfs.jffs2 and sumtool.  At least the
> first part might be easier with oe-core and the reworked image class.
> The latter part is just annoying.
>
> --
> Tom
>
> FWIW we are defining our jffs2-summary in
http://cgit.openembedded.org/meta-handheld/tree/conf/machine/include/zaurus.inc

This works beautifully in oe-dev but not using oe-core for it sets
IMAGE_CMD_jffs2 = and this can  not be overriden
We would just need a weak assignment in image_types.bbclass or maybe a new
image type like IMAGE_CMD_jffs2-summary and related commands.

Regards

Andrea

