Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MdKuR-0002oo-HU
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 11:23:15 +0200
Received: by bwz17 with SMTP id 17so2665601bwz.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 02:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=BiolMbMGgmziGjZjRfBgBIx43ymamEfRkxkifdAd/LQ=;
	b=LAxxLByqDwfYfeJRjUwPknSwMOEoFS7T6hz1e6bF/Qgp4zJ5otc4TpAlU6PLRNv2/y
	t7973NQanHH68oh+weL5OnmHMD6ogBOj1v1vjtFz7ZASsfCpiw5APplzwp1dfC+xNzB4
	L9yHHbfwgrvWM4uizMPknD7acs+q9SDFY2Byw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=l5FtI/bae+B9Ck3LqHEtxQB19MK0z0nmeTeHY4DrP3JLTl/DygZZ888rAItSXAgu00
	BgNzDsDv1d52fcJuEgZYZcVFOPacP+xrSWmPZ3Y3s7/foCzxRh0TtE5BGNGeQ6QAH5Xz
	1Xp01oqMLjZAyo9CGIaC8ypIGGbfZwR9TDsOM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.179.94 with SMTP id c30mr422653hbg.159.1250586369398; Tue, 
	18 Aug 2009 02:06:09 -0700 (PDT)
In-Reply-To: <1250521375.27980.8.camel@mill.internal.reciva.com>
References: <4A8960BC.4000603@cam.ac.uk>
	<200908171606.57153.holger+oe@freyther.de>
	<1250521270.27980.6.camel@mill.internal.reciva.com>
	<1250521375.27980.8.camel@mill.internal.reciva.com>
Date: Tue, 18 Aug 2009 06:06:09 -0300
X-Google-Sender-Auth: d27755b911b4acdb
Message-ID: <be7a9f3d0908180206g1fcf4d48w79b05a8f4dd78c04@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] glibc 2.7 and 2.9 (arm): Remove unnecessary asm/page.h include
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
X-List-Received-Date: Tue, 18 Aug 2009 09:23:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Phil

On Mon, Aug 17, 2009 at 12:02 PM, Phil Blundell<pb@reciva.com> wrote:
> Oh, and, as for bumping PR: in this case I would suggest not doing it.
> The output binaries should be identical with and without that header,
> and for folks doing online upgrades it is a bit of a pain to have glibc
> rebuild unnecessarily.

I disagree and think it ought to be bumped so it gets deployed and
tested as soon as possible.

People that cares about online updates are supposed to be using stable
to reduce it.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


