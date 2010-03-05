Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NnZtv-0005jh-J9
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 16:57:24 +0100
Received: by fxm20 with SMTP id 20so4003157fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 07:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=mXWt9omtB/bzxt9HPajqD1Jg8wVThsEQthyVuNbQg7A=;
	b=Scp424FFDLj/I9c772Dl6kk2tSe8VifhioapaovCBEzxGkYRc77g9B3ogEXtZfom2i
	rtBoNxi7yywOrp7mr0YoEr6wCz1vsrGMZTz0iT6DElO/BGwkzO2CqUQXHIjWNLg0CEJx
	qBICCx5Eeq41rNwzG8SPrRyjZBl5q8zxLd9rA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NVXxjL3K+3BeEzAT5gzFGkvW+hOgwtrLRTji2CYq8Qk/fqvR+vBSysrJwYlbkWSdU6
	2qMy4lDLoyEpXQu02teqGCHwjAcILXglWATIHqwfhEl+CL0ZcQ4vFwFfiPVsjy4OhruD
	lc41HTv+YKbZwSksWaJAgzgc3fJXnF/agW3Ss=
MIME-Version: 1.0
Received: by 10.223.15.148 with SMTP id k20mr1211615faa.67.1267804466078; Fri, 
	05 Mar 2010 07:54:26 -0800 (PST)
In-Reply-To: <20100305090753.GA20686@excalibur.local>
References: <1267751376-17182-1-git-send-email-aalonso00@gmail.com>
	<20100305090753.GA20686@excalibur.local>
Date: Fri, 5 Mar 2010 09:54:26 -0600
Message-ID: <d1ded4381003050754i3069d1f8he18c45834d34ea79@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/5] xilinx-ml507.conf: fix several options
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
X-List-Received-Date: Fri, 05 Mar 2010 15:57:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

The newer patches are based and apply from the previous patches that I send
to the list, let me regenerate them from HEAD so I can be applyed discarding
the previous patchs.

I had on github [1] the corresponding hardware reference project and at my
blog [2] a brief description on how I'm using OE on the target platform.

[1] http://github.com/aalonso/xilinx-ml507
[2] http://aalonso.wordpress.com/2010/03/05/angstrom-on-xilinx-ml507/
Regards.

On Fri, Mar 5, 2010 at 3:07 AM, Stefan Schmidt <stefan@datenfreihafen.org>wrote:

> Hello.
>
> Where did you base this patchset on?
>
> I tried to applay it on top of your older patches, but it failed:
>
> Applying: xilinx-ml507.conf: fix several options
> error: patch failed: conf/machine/xilinx-ml507.conf:30
> error: conf/machine/xilinx-ml507.conf: patch does not apply
> Patch failed at 0003 xilinx-ml507.conf: fix several options
>
> Applying it without them does of course not work as the machine file does
> not
> exist.
>
> I would really like to get this in sadly I only have today or it has to
> wait a
> week. Mind sending a patchset with all your patches included to get it
> working
> from git HEAD? That would make my life easier over here.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

