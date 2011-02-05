Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PliJB-0005RT-E6
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Feb 2011 14:36:13 +0100
Received: by iwn8 with SMTP id 8so3107054iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Feb 2011 05:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=9clOdFxcPv68bBlRwNZDZgbnTnDRHBCqxlvezYUZmIY=;
	b=dgdYoeeax6KUzWSrZ1GR3D86qj5vR0Lw0dGwKS2u35cislwtjx01K9RETpeuVUnX8f
	9joFowbeNnnagMAvjxhH5BZ4M3+1zcb+w7aRDnwtTl6KNTd3G/vhVgNzqSg2bLICgKGM
	xyxQEb4EWet9mHi+NFKLQROZhK35GSNGgKmBg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MvWXc6qOPbN0x9aEg+yHzGv+eYTgdbM9vfe8iwcl/ztTxzfO+RwO19EycnmGc2/dWe
	xjBBaertJxl+KkpgqNVdak6iONyKSTKP2wFTdz4rp+JMxgtZx8+1yJuBJy77S9xBOkwA
	2y0sK0zXAVl9Ng8YUGBV7aesY7Drd8zFB5Rw0=
MIME-Version: 1.0
Received: by 10.231.40.12 with SMTP id i12mr1742739ibe.183.1296912914216; Sat,
	05 Feb 2011 05:35:14 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Sat, 5 Feb 2011 05:35:14 -0800 (PST)
In-Reply-To: <AANLkTimO7SQU7k=3ACn4K4wSOwRWkvoV-Tnvn2FFVW63@mail.gmail.com>
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
	<20110204090348.GR4580@excalibur.local>
	<AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
	<4D4C1464.4030609@mentor.com>
	<AANLkTi=o+QW-K2VG7WBFFTrshxhD1TDMbqx=EbTxDj5h@mail.gmail.com>
	<AANLkTimO7SQU7k=3ACn4K4wSOwRWkvoV-Tnvn2FFVW63@mail.gmail.com>
Date: Sat, 5 Feb 2011 14:35:14 +0100
Message-ID: <AANLkTikXULU=UyfomMr_GVx5o1GieZrRxDZET3QF30px@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Sat, 05 Feb 2011 13:36:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/4 Otavio Salvador <otavio@ossystems.com.br>:
> On Fri, Feb 4, 2011 at 15:26, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> The recipes at hand are:
> ...
>> cups: there is someone bitching about that this is 1.2, but he
>> apparently prefers bitching upon resolving the issue. Probably the
>> best solution is to drop the DP = -1 from the 1.4.4 recipe
> ...
>
> I can work on cups next week (I am on VAC right now).

Actually the cups thing is the one I would feel fairly comfortable with.
The question here is mainly when/how to drop the DP = -1.
A pinning of 1.4.4 is already in my local.conf for quite a while.

Frans


