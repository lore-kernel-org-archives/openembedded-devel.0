Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NZIlY-0007wN-Tw
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 07:49:44 +0100
Received: by ywh8 with SMTP id 8so919289ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 22:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=iKh0petRgSGX6l5RgEnOXFOCFfeFuqNcZyy3JKYuXis=;
	b=fWkFOEfKpZEwxhZUmHH2dhLmtmD5V0aY7kaHutUzEH9aupjkjCsA1f712+7P7i1ZIu
	apwMRnjYOxOZOxgFboy35fE5Se5CXF3FOBhJr45KubDvN7qQ5LyVyqbl7lKEL0kS1khr
	977UnUr6a4a09CcxOBw54134YBSlam0SJE44Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=BIIxAvGJiIbWt4SABJ4QcQHF1EF3Ak1PA02zYqWcEaEik+ZKSC3XIEKLUzjzjwBA0T
	EscyGdhG6zZTeP8ygu79qC02VVgPTrxkKZble0KiRVpTMRv1ZS5bMn2MdapxMW9AlVBS
	x/Ihd6bcGEXzbnEOPtzke6w64MQV2HdBSVYBA=
Received: by 10.101.44.18 with SMTP id w18mr7185130anj.235.1264402040374;
	Sun, 24 Jan 2010 22:47:20 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 5sm1636286ywd.27.2010.01.24.22.47.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 Jan 2010 22:47:19 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u6zcpxd7mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001231532y27421c4fk33b7b2d961bc16cc@mail.gmail.com>
	<op.u60mc6flmn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001242243y65a3033bg23f1e3f4584e2838@mail.gmail.com>
Date: Mon, 25 Jan 2010 14:47:09 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u62s4vj5mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a91001242243y65a3033bg23f1e3f4584e2838@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: undefined reference to `_restfpr_14_x' in gcc-4.4.2/libgcc/../gcc/unwind.inc:307 when building ppc603e
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
X-List-Received-Date: Mon, 25 Jan 2010 06:49:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Mon, 25 Jan 2010 14:43:18 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> And check whats passed in CFLAGS to eglibc build. My guess is that  =

> somewhere
> floating point notions during configure and compiler options passed
> during compile dont match.
> For experiment can you try to remove -mhard-float from TARGET_CC_ARCH =
in
> conf/machine/include/tune-ppc603e.inc

Thanks for your information, I will try it ASAP. Hope it works

-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


