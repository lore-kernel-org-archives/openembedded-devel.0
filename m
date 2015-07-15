Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2B8FC737A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 20:40:21 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so30825302pdr.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 13:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=bGaSjCq5C8zzIFYI9RrG3WP0h+k1SaaPSO0SwGmL6/E=;
	b=HejltiJTJACcvAQOXbQvNMPprGiA0fCfzHsg/6NevClCU8B2FYXwumb1FKEfZ2mzzI
	VPKaeyNu/Me9j1QxsGtX+f9/DN6Me3MW0tcbHMSaxhsOkUWLrySjwacBvHlCVePpTmnh
	MVTMgQkTuWz5KRf39kzkgloNFGkukQEZisFWGbrOx+4yeqlB7WhLAwIClr+fd9eekFYH
	NeLt14DYbzfLYRSXyG18mO/eEoXrfyro+5Xg3EaLUGBchh/Csqz2RvDLGVhFvJI4s4q9
	2C6gCjH4etQhGeESzOg8eixi/qfh5oEHiWpJnJK+38fJcNnqXKfUaO+GTMdMiTMhAikb
	e5yw==
MIME-Version: 1.0
X-Received: by 10.66.222.103 with SMTP id ql7mr11474043pac.144.1436992821117; 
	Wed, 15 Jul 2015 13:40:21 -0700 (PDT)
Received: by 10.70.65.4 with HTTP; Wed, 15 Jul 2015 13:40:21 -0700 (PDT)
In-Reply-To: <20150629125024.GF2393@jama>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
	<1435235754-7339-3-git-send-email-schnitzeltony@googlemail.com>
	<20150629125024.GF2393@jama>
Date: Wed, 15 Jul 2015 22:40:21 +0200
Message-ID: <CALbNGRT8V_4Y+yTEp_=RDVVMfG6FXvf61_PCTXWppCHyw7UjtQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/7] networkmanager: update to 1.0.2
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
X-List-Received-Date: Wed, 15 Jul 2015 20:40:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2015 at 2:50 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Jun 25, 2015 at 02:35:49PM +0200, Andreas M=C3=BCller wrote:
>> * at_console support is gone
>> * add PACKAGECONFIG for bluez5/modemmanager/ppp and disable them by defa=
ult
>
> world build shows:
> networkmanager-1.0.2: networkmanager: Files/directories were installed
> but not shipped in any package:
>   /run
>   /run/NetworkManager
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install. [installed-vs-shipped]
>
> can you please check it?
>
I cannot reproduce this here. Is there some place I can find logs
causing this message? I would be interested in  log.do_configure /
log.do_compile / log.do_install to see what's different to my build.

Andreas

