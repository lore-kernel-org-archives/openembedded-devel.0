Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1ORnN4-0001am-KJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 16:27:13 +0200
Received: by qwi2 with SMTP id 2so280137qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=Fom765V5+n7vvuzImotXIJzpJznvyl6QKDU73DjO0vE=;
	b=F8hDjTWz229hxQSwk9mgeldzHpNsvrMd/NPSy4R+pEQ63We2SHSzVaeV5Xs4W5hv7b
	ZKujre//6GL7/1UCwBvi4G87cVpv9L3yX5lXLvsy3T4oGGcytvwT9apqSGa5keaa7BjY
	1jI77nwYkU2p+I0tUyiYeNOvFNVzsles486so=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=M13QXLuQa12/nVeJOMURvjOO6g8M/WY+GGsrDkzPv5clcAc4V1FatX9BORdNm+ZaDV
	CMOKv2CEaPf76fPMH4skz0DSMWB+KsukNuTX3bSDJ8EPXr854N7HblYspEOzVv95bagd
	bdmj8/RHQwUrFLSs9qap/OO276pPB53k0wvB8=
Received: by 10.224.98.84 with SMTP id p20mr6288687qan.298.1277389260491; Thu, 
	24 Jun 2010 07:21:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.241.204 with HTTP; Thu, 24 Jun 2010 07:20:40 -0700 (PDT)
In-Reply-To: <1277373334-22503-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1277373334-22503-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 24 Jun 2010 07:20:40 -0700
X-Google-Sender-Auth: XIQCLG1vQ3V8ZzmV5wcprduGbpc
Message-ID: <AANLkTinzdQoS3sO3VbwVuRP23biPUdwGIr1jPzCVp1jZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] binconfig.bbclass: take *-config from ${D}, not from 	${S}
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
X-List-Received-Date: Thu, 24 Jun 2010 14:28:20 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 24, 2010 at 2:55 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> It is not always right to take *-config files from source tree;
> e.g. the buildsystem of recent ncurses takes an 'ncurses-config'
> template and installs it as 'ncurses5-config' and 'ncursesw5-config'.
>
> This patch uses the installed *-config files which are having the
> expected name and content.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>

Looks reasonable to me.

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

