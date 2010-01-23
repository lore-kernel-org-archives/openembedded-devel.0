Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYdDZ-0001Ku-PU
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:27:52 +0100
Received: by gxk7 with SMTP id 7so2381946gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 02:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=S0JInDChhRBnGSyNKgdMTRutpFGLsZVXghNs+SVniLc=;
	b=WzHIf5wusLr8CRFaYDl4Mcb7X/EK3ThX08aAZfo4fRyvjL4I4eHDJbexgVqHZnFyF2
	sV3/zaDaIyqhRcU6RljetbV4sInNFm71jsG/ye7FurUQIvhONqFq0RXuYhm/Ztgo0OZr
	OOHSOH84UOxUDIjjg5SRqfGYCP6MYD/wfrfTE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=g5SJ17PUHOeoELnu600B9Idr3nCdNYuifp3hkWv/dwP69AiW119iBHTOkh/5wpGscI
	/BhPIv2i7LcTAi1XcBHw/8Sjy9ihh9gQ6EhuPVa7rsgcl2b5Hx1zhQcOJhv1+0mDSiYg
	s/YPsZKPDcNpWa+HO09KxlhXry2WC4hPmmF7o=
Received: by 10.150.209.1 with SMTP id h1mr4389048ybg.145.1264242322095;
	Sat, 23 Jan 2010 02:25:22 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 23sm1120818ywh.33.2010.01.23.02.25.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 02:25:21 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1264239367-26057-1-git-send-email-camelguo@gmail.com>
	<201001231051.06864.holger+oe@freyther.de>
	<op.u6zcjg0gmn1qzu@guohr-laptop-ubuntu> <20100123101047.GE15943@jama>
Date: Sat, 23 Jan 2010 18:25:11 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6zdv9pamn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <20100123101047.GE15943@jama>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-storcenter: fix circular dependency between do_package and do_deploy
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
X-List-Received-Date: Sat, 23 Jan 2010 10:27:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

the do_deploy task has been added in kernel.bbclass, which defines the  =

proper order for these tasks. So it should be safe to remove 'addtask  =

deploy' from the recipe.

=E5=9C=A8 Sat, 23 Jan 2010 18:10:47 +0800=EF=BC=8CMartin Jansa <martin.j=
ansa@gmail.com>  =

=E5=86=99=E9=81=93:

> On Sat, Jan 23, 2010 at 05:55:54PM +0800, Guo Hongruan wrote:
>> Yes, I did.
>>
>> the same question exists in
>> recipes/linux/gumstix-linux.inc|72| addtask deploy before do_package
>> after do_install
>> which may cause circular dependency too.
>
> But if you just remove that line, the custom do_deploy task won't be
> used at all IIRC.. so proper fix would be to adjust after and before
> like in a55e9a527a8c9823044196d031f2da2783ff8f35 and then
> bc2bddb71d8c5db25b80aa6435392ec1c8df39f9
>
> Probably:
> addtask deploy before do_build after do_package
>
> but please check
> before do_build was needed to force it run at all (for -c build)
> after do_package was used, because we're packing already stripped
> modules to modules.tgz and we needed to have packages-split already
> populated.
>
> Regards,
>


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


