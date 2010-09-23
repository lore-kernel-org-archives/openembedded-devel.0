Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oyrih-0002WP-5e
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 21:44:40 +0200
Received: by gxk10 with SMTP id 10so754644gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 12:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Vusdo3SYd33d9bvww3T0jf0fPdlwxNEGnkihMotwiGw=;
	b=D11NNdXSQNhmUT8GrToxiiE5YpAh38yR48Hq9z5fimj9Rt8n8/hsB7TXkKOQGccKo0
	zdjFqL+0Axhwp8KnV2Gy8zUQwl3tfWP6GVEXrSL0A5ZXJ47Vb6qmIRZH80B8ngcbcjcu
	StDMQjSVmkoy8mxGttedZ139YMXm8RQgs6hkY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=L+825VSg+4Xff0sHk250kpErYRlS594QOuxVxLk8YV4EPjVz8pXVALsNblLcJ1HwYi
	rZnp9Al3BFvtoVyAfECdaVMrS9ptQ8aBZSbBlNZ8F4BNE9z3OFsxzETGSPQKi6fuqiLM
	tWMpWViif8GxI6NgyjfGsAaIkRYEgTkUWSChk=
MIME-Version: 1.0
Received: by 10.151.144.11 with SMTP id w11mr3481540ybn.313.1285271070618;
	Thu, 23 Sep 2010 12:44:30 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 23 Sep 2010 12:44:30 -0700 (PDT)
In-Reply-To: <201009232126.35996.schnitzeltony@gmx.de>
References: <1285248897-5198-1-git-send-email-schnitzeltony@gmx.de>
	<AANLkTikP=QtJNVf5N=5p-nkwLFM2FMovJEy1tS3s8grU@mail.gmail.com>
	<201009232126.35996.schnitzeltony@gmx.de>
Date: Thu, 23 Sep 2010 21:44:30 +0200
Message-ID: <AANLkTikzbm2zfbDbXc2a6AJTHuvQC9FaZYmw65udiJq-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] clutter-gtk: Bump to 0.10.8
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
X-List-Received-Date: Thu, 23 Sep 2010 19:44:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/23 Andreas Mueller <schnitzeltony@gmx.de>:
> On Thursday 23 September 2010 08:53:33 pm Frans Meulenbroeks wrote:
>> I recall that the introduction of 10.6 caused a breakage in some distro;s.
> If it's not the one you mentioned (missing clutter for incompatible machines - I suggested a patch which was not ack'd / nak'd): Sorry but this the first
> time I hear that. Could you give some details?
>
> Andreas

Sorry, mixed up things.
The problem I had in mind was not clutter related but cairo related.
That one was updated recently, but required a pixman that was newer
than pinned by conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc

Frans (btw still interested to learn how it is tested)


