Return-Path: <eduardo@monkey.io>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id B1AB065DBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 14:54:42 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so6216002wib.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 07:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=bZWe+d1oj5dLprfn/JLD2v5dqBWziTc2yiGgZvRRwS8=;
	b=ddqDtRRTdks7YUzlrksg5G1irNAG+LCerve4Lf3B1mkSCSntIvIoLu41tgDcsH2PYv
	/cU2BsuSMEN70eqsFeLY3sEZ9LBajV6YR4t1u8n41S54MLf3ARrOFHIhWJ7etjCh8VLT
	o9ozuHdpzJqLFJnzuc9HNQlxmW3twyduS8pfRdsp7CmQinRj43zSS+ICn30/UmZVw7td
	mxKllzUiaUVHcSpplqnaDCHxGnK6+sZbHUTDYKXaizPaQ69GobK29nErUpTLK16UY+3j
	afeFGriCfd0AUX3v6IpSu+uPpljauFWze4m7K6msEQDmzqZuXLpw6EC0O/ApQZFn0klq
	fo8g==
X-Gm-Message-State: ALoCoQmb4+XKAfsEu/lLwSnrz+a7O8w2FQfsQWmQUJfB9p+KPIFPKmInqMBbLWj6nPisK7jaZOJ2
MIME-Version: 1.0
X-Received: by 10.194.221.6 with SMTP id qa6mr1927855wjc.39.1403621683248;
	Tue, 24 Jun 2014 07:54:43 -0700 (PDT)
Received: by 10.194.88.135 with HTTP; Tue, 24 Jun 2014 07:54:43 -0700 (PDT)
X-Originating-IP: [148.87.19.194]
In-Reply-To: <20140621000133.GB2117@jama>
References: <1403134870-29746-1-git-send-email-eduardo@monkey.io>
	<20140619083908.GL2117@jama> <20140621000133.GB2117@jama>
Date: Tue, 24 Jun 2014 08:54:43 -0600
Message-ID: <CAEaCVQiw_2UNEeBbNz9qLFUWuriuFKrD4KUSPgDH3=Aj9FLBaw@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Tue, 24 Jun 2014 14:54:54 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 20, 2014 at 6:01 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Thu, Jun 19, 2014 at 10:39:08AM +0200, Martin Jansa wrote:
> > On Wed, Jun 18, 2014 at 05:41:10PM -0600, Eduardo Silva wrote:
> > > This patch add the minor release fix of Monkey HTTP Server v1.5.1. It
> fixes
> > > some problems when switching user when started as root.
> > >
> > > monkey/yocto: 3163d01492ea3d85268dc3773419e94db57ee8df
> >
> > [meta-webserver] is still missing in subject (helps me a lot when
> > separating patches on patchwork), you don't need to resend it now, but
> > please remember it for next time.
>
> It seems to fail with systemd enabled:
>
> | ERROR: Function failed: SYSTEMD_SERVICE_monkey value monkey.service does
> not exist
> NOTE: recipe monkey-1.5.1-r0: task do_package: Failed
>

thanks for pointing out the problem.

There is a missing configure script option that is the one in charge to
create the systemd service file. I will make sure to fix it shortly,

best

