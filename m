Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyIbU-0000R2-Vt
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 08:14:54 +0200
Received: by iwn2 with SMTP id 2so241529iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=eH/7HNiJpLe655zv35THQD3OAwErCshA2AvNv3jMloU=;
	b=o/NxTwI1H9raUNBhAzPNetL7EFc8YK6bneUEjp4p5PSsWRb7u6NTq20bz3kgYjSkB3
	35p6rr+HMnW7iQmOBxmGiUw7j6cOs7rMz7DUt80dZdgpSjeTRea8jCy/F5n9Jz3Nox2A
	1NsDCwqvfF/vbhk19zruzU/o1e5U0Cv5rzmDA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UsoEkNSyayzrnettrwjCK6kwxie8hXh4b7CvjcfIA56/4bO8Eo1VfYLIMg9Rzk4teM
	27M2lKnfBN6q24+5wuxwpIvs3SNWshs2GRMQzi0IQY3gVV5Pxc1f7WfuNPpFHeK9Y1Kt
	IA0zRNXvWXX21xpDDAMgTmrRyLKPb0J3hFgYI=
MIME-Version: 1.0
Received: by 10.231.118.28 with SMTP id t28mr10688159ibq.131.1285136084452;
	Tue, 21 Sep 2010 23:14:44 -0700 (PDT)
Received: by 10.231.161.1 with HTTP; Tue, 21 Sep 2010 23:14:44 -0700 (PDT)
In-Reply-To: <4C995FE3.3060601@mentor.com>
References: <4C995145.8090707@gmail.com>
	<4C995FE3.3060601@mentor.com>
Date: Wed, 22 Sep 2010 15:44:44 +0930
Message-ID: <AANLkTikQg+iOc102pB2OLd51NLeteHWuzxcerBsqz1vn@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] firefox_3.6.8.bb: Mark as COMPATIBLE_HOST="(powerpc|arm|i.86.*)".
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
X-List-Received-Date: Wed, 22 Sep 2010 06:14:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 22 September 2010 11:16, Tom Rini <tom_rini@mentor.com> wrote:
> To sum up what I said on IRC, I'd really rather just go ahead and fix mipsel
> (and mips and ...) by pulling in the jsautocfg.h file from Debian or similar
> rather than use the more heavy handed COMPATIBLE* stuff for things that
> build in limited places by accident rather than by design. I don't know if
> that's enough for a NAK or not, but I'd like to talk it over a bit more :)

I'll submit patches to build python-numpy and firefox for mipsel when
I get a chance, but the others really are machine specific.

-Graham


