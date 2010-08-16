Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Okyap-0004t0-Ln
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 14:15:08 +0200
Received: by iwn38 with SMTP id 38so1585943iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 05:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=MozLILIr7hUd8Bdizh2cZPaAkXjtjjyLXaILSH2VR4E=;
	b=FcLzQzfUmF3SKON4IAsqD/qRONcU+HM7ala8u0KIKxxkIdyZsF2ZMF3kcgXN8bA/oP
	bfhSMtwxVV2bJKMGQyeb9NyS5x72WfqAk5eDvVX9Crn2I4la1NW11w66rqKjiadWVkhF
	muLL5w8TX14ucjXwdTivuL0z2xLug3m4k98PI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pwnjm48BXwydty/D3Ai98t9w96NPodHhOwtZ85OTQcu/9zL5dhQlGUbKk5jqnlML6D
	s0IlyzoFlj29OaqaLjl5WlXJDbIbxaUAev3qkziwuEzGBhP5sXXRiqNu7QAaDsHE13De
	ITiO9fw4tdDHECYOFxTT6RKYbQaZ//FbUFjhE=
MIME-Version: 1.0
Received: by 10.231.12.75 with SMTP id w11mr5928279ibw.134.1281960891515; Mon,
	16 Aug 2010 05:14:51 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 05:14:51 -0700 (PDT)
In-Reply-To: <i4b7r1$sf8$1@dough.gmane.org>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<i4auje$u5g$1@dough.gmane.org>
	<AANLkTimpAxxt7GR=1VV9ZrAWubMp63sX771+PfhLjWTu@mail.gmail.com>
	<AANLkTi=pVCajY==ZdehO_Bw33xsrYcvBnYHfN4s2Vne=@mail.gmail.com>
	<i4b3dl$vbk$1@dough.gmane.org>
	<AANLkTim8Et4FHon4o2dsTOyFe-8huxTmmFEYA5PNZirw@mail.gmail.com>
	<i4b7r1$sf8$1@dough.gmane.org>
Date: Mon, 16 Aug 2010 14:14:51 +0200
Message-ID: <AANLkTin_ABBeGBY_rQpfmvnjf+afe+5gJqb85EzYHq+L@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 12:15:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/16 Koen Kooi <k.kooi@student.utwente.nl>:
would be nice if oe would detect those cases and force a rebuild.
>
> That doesn't help if you're using packagemanagement. Now you have
> "foo_1.0-r0.ipk" in the feeds that statically linked to openssl 0.9.8
> and "foo_1.0-r0.ipk" locally that statically links to 1.0.0. So users
> still don't get the fixes that went into openssl.

Agree.
I vaguely recall an idea (I believe from RP) to have a hash or so
derived from the whole dependency tree below it.
This discussion probably ran somewhere last winter.

Frans


