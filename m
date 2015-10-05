Return-Path: <mbc@koumoul.net>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2676060125
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2015 09:16:23 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so178247834ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Oct 2015 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=s8OWQUV0I6A+bYgQbFtvtAjg9MXSxFEIkf6b/Xjqobc=;
	b=lpbtqu5A98PrqJXk074gF3mE6moDfIywI0Ofd9ccMTBa6jUGZX++0JDHWiorbuSBU5
	oPiKhXHVIjxhnUARzFLGnBhLmVd1qmc38aiWDjEPCIWELMJkeEZ5nUGpqw4oWE85v2P3
	8WIqYg6Xb/wSLsOUKT3HF8cw/0n40beXNByvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=s8OWQUV0I6A+bYgQbFtvtAjg9MXSxFEIkf6b/Xjqobc=;
	b=f+VF1EOlE1TkHvpoeh6KqGLDoJKjxidCBL31P2FAQtjc7aQ5qLh48p8ndQkPgWDome
	8oA3s5ACOpIIny0ff6/2xJH4KFfr6in5xN/nixFN6ibesgxsK+g0kM/kaToUZ9aymQiK
	r/4UkJio2yvrMcoD+zRZrnW97ORdpqRia6Enrsg1ugqlf6+E3QGaPcC7obQRSSowL73V
	VEnMPAUaZjA+ficZMz/Tdb+ZqWL5p4C5LPGlhVRBCBPS+KTwX7Y4tEvfd4Rz5R2oSIYv
	z4/KOG3zNDzU/dnl0OD4pOISfz++hb3dm4qhxcDGeRKPQawvHr1cH1I6ouQX2U9dy/zj
	PsOw==
X-Gm-Message-State: ALoCoQkt5UFoEBRMgqRKyjBfPdEkUqXB0OujfV05oHaoYkJzYn2h9i/eJJrddbuF96KgTwa8+MjF
MIME-Version: 1.0
X-Received: by 10.107.138.231 with SMTP id c100mr24904401ioj.87.1444036583913; 
	Mon, 05 Oct 2015 02:16:23 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.111.6 with HTTP; Mon, 5 Oct 2015 02:16:23 -0700 (PDT)
X-Originating-IP: [2.13.130.70]
In-Reply-To: <CAJTo0La71ae2eMfyqPqSWo1QyNy+Yq7e7hJsZXtnB8Un8KyHBA@mail.gmail.com>
References: <1443904562-21819-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAJTo0La71ae2eMfyqPqSWo1QyNy+Yq7e7hJsZXtnB8Un8KyHBA@mail.gmail.com>
Date: Mon, 5 Oct 2015 11:16:23 +0200
X-Google-Sender-Auth: 5ivEw7E1C7PenEFaOZuqtVX5zvU
Message-ID: <CANTDXNfoEGFScZPTJvRi5TdN9Zi010R5Bt7EJs9TeXyUi4ptbw@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 3/3][meta-multimedia] rygel: Add recipe
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
X-List-Received-Date: Mon, 05 Oct 2015 09:16:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi Ross,

Thanks for the pointer, just saw your branch ! Yes I can see it is better
(it handles plugins such as tracker e.g). Will take a look and submit a v2
patch.

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-05 11:06 GMT+02:00 Burton, Ross <ross.burton@intel.com>:

> On 3 October 2015 at 21:36, Manuel Bachmann <manuel.bachmann@iot.bzh>
> wrote:
>
> > Rygel is a UPnP Audio-Video media server, that allows to
> > share media files to other devices. It can also become a
> > MediaRenderer controlled by UPnP or DLNA Controllers.
> >
> > Rygel makes use of the GStreamer library to recognize and
> > index media files. UPnp clients will then be able to browse
> > through them with the aid of metadata (artist, date...).
> >
> > (we do not propose to build without GStreamer support,
> > because then if cannot parse any actual media file, and
> > this is pointless)
> >
>
> It's a fair bit out of date now but meta-openembedded-contrib has a
> ross/gupnp branch which adds a Rygel recipe but also more configuration
> options and flexible packaging.  It would be good to merge both recipes
> together.
>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

