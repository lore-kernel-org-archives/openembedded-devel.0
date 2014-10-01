Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 82EE86A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 01:24:08 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id l13so96879iga.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 18:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Cpe4rBvWEVZRcqDBAGEUQHwO52gnpDAhVJbdr8JwgMU=;
	b=JmBWGOpbsEU2K87YV18HU7LcDF1ngh/QFugX3QDTP+3+iyi+om0O4Ve/eBc4YADhbo
	/5+PBRlefmsFS8BZoOcq7L+2n3q3S+0rWXzbvr7p/tVxYMh1hgMOUcqZ1gho0Dkdk1GF
	Qn/HHutwfTaMrmVZDqWcVV1ns/dm2J+Z6JtgBC78YG0/KZ0r9baebT8Hj1Xcdr0/5U8+
	7fGHO+MNLLLWueDR2EZuZgn0X0XI2oiqvkZoxsw2jPe4Yetjmr32wlvIzpJVmYMjsV7U
	/e18bD+9GnaCFDzQ8t267Uw+UPpVSQKAK9qG7vPaOOI1FoFbs+YABoBGrd/OP6H1bDam
	xYWA==
X-Received: by 10.50.138.233 with SMTP id qt9mr13884233igb.30.1412126649906;
	Tue, 30 Sep 2014 18:24:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.179.5 with HTTP; Tue, 30 Sep 2014 18:23:39 -0700 (PDT)
In-Reply-To: <542AE566.80708@balister.org>
References: <542AE566.80708@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Sep 2014 18:23:39 -0700
Message-ID: <CAMKF1soHgDHBUiStGqaW28L8jWu63HmoaHBdYavie0r=dFZ+7g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Hostapd recipe is DEFAULT_PREFENCE = "-1"
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
X-List-Received-Date: Wed, 01 Oct 2014 01:24:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 30, 2014 at 10:16 AM, Philip Balister <philip@balister.org> wrote:
> Does anyone know why the hostapd recipe is DEFAULT_PREFERENCE = "-1"

history !!. it was imported from oe-classic and there we had multiple
recipes and default was 0.5.10
but latest was 1.0 which was brought into new world and needless to
say it was verbatim

