Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oc4yV-0005Px-BM
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 01:14:48 +0200
Received: by ywe9 with SMTP id 9so1154098ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 16:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=udM0rNFexjh8xwD6r1z+55daKdHRCn4bH7MVuKfIPN0=;
	b=KVMfjBWn/6L1ZUMGClESE+niHFspKvc3OnsytbVuc/7B0gCGNFoWwaN50wmPQa7Ego
	kMoAZM9HT4mNuAmbJhtYbgGaz2ckK5z+0UDpoMB7d2nZi4BYC7+y+nw9FTBJV2FtmIkO
	vRwHft96TRKTiudd+mkmkBE+Bo+9KtVQ+wFu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=RMuzrUAn4OsXHmxW0/EGVkPR5AtnyhmZNRTa7ffPyDSdcDaXtqGMwFl+ADUeqEmZSd
	xDYlBIdSyLc0yRonLMYTITEVxt3pclxEH0CsmMT8HlE8NpPfu3UcxgWF1SCxmIGuqc8m
	ijDAl2afweNs//SRnvu0gUVPfkYusyW3UbEKU=
Received: by 10.224.112.209 with SMTP id x17mr1781224qap.304.1279840469167; 
	Thu, 22 Jul 2010 16:14:29 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.212.11 with HTTP; Thu, 22 Jul 2010 16:14:09 -0700 (PDT)
In-Reply-To: <786613.21629.qm@web88307.mail.re4.yahoo.com>
References: <786613.21629.qm@web88307.mail.re4.yahoo.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 22 Jul 2010 16:14:09 -0700
X-Google-Sender-Auth: r_rC3EL4R4Q58Q-lVlzpvz0AmOM
Message-ID: <AANLkTina2rXxt1VuLkZ89xRoD2jdCD2gIQoL_J3kJhP_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Is it possible to have variables that contain line breaks for module_conf
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
X-List-Received-Date: Thu, 22 Jul 2010 23:14:48 -0000
Content-Type: text/plain; charset=UTF-8

The only way today is to leverage the function syntax.  A function in a
recipe is just a multi-line variable with a flag ("func") set.

On Thu, Jul 22, 2010 at 3:51 PM, Ron Zachariah <ron_zach@yahoo.com> wrote:

> I am trying to have a variable that contains a line break in it.  When I
> use '\n' it seems to just print out the literal characters '\' 'n' and not a
> line break.
>
> The context for this is I want to create a module_conf for my device that
> contains more than one line in it.
>
> In my machine.conf file I have something like
> module_conf_testa = """install testa /sbin/modprobe --ignore-install testa
> force_testa=0,0x74; \
> echo "1" > /sys/devices/plb.0/.../item1; \
> echo "2" > /sys/devices/plb.0/.../item2 \
> \
> \n\nremove  testa /sbin/modprobe -r --ignore-remove testa"""
>
> But when I look at the result /etc/modprobe.d/testa file there is only 1
> line with explicit '\' 'n' characters.
> Is there some syntax I can use to make these appear on seperate lines?
>
> Thanks
> Ron
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

