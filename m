Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MAZNg-0002dt-NP
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 02:58:32 +0200
Received: by yw-out-1718.google.com with SMTP id 9so3478472ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 17:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5y8SXUCRVf0o24cumMbHIMC7No9zSvPdakKk37X8loQ=;
	b=ZD67kpYZPrqJml0UQSJdOCMkh37oW6veB4kmQbOdASa+bxK+OD07iVsqhj1ZIrlnZo
	uxiM2eG2/55264o52wdbkEq+DGwJR4rJvkRI8BqV+b3aU/CkHvtcsZo/HCwFLWfRn7B4
	264KJW6NR2LroYr21r9jvgBPnSOAXtxh+Brws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=imkXF1I9p4P/i3ABVTZB5DI/RnHkBZgc0+sSs5kr9552oRQkTfrQ6Sigsjhc3d/NEJ
	k9UOstSKev0tt0gVMR5M0AhTllOBGDvpTUSQHCKt6i+LQDfmnBwATMI/2ub5fDTEu7th
	sMIfNTDf0K6N5wuTOZ7uvOvsfRO5/INpcueXM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.120.9 with SMTP id s9mr2987410anc.190.1243730997777; Sat, 
	30 May 2009 17:49:57 -0700 (PDT)
In-Reply-To: <1243724680.4869.91.camel@lenovo.internal.reciva.com>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<200905242049.30726.marcin@juszkiewicz.com.pl>
	<20090530191647.GL23842@smtp.west.cox.net>
	<1243724680.4869.91.camel@lenovo.internal.reciva.com>
Date: Sat, 30 May 2009 21:49:57 -0300
X-Google-Sender-Auth: 108bc84669daa4f3
Message-ID: <be7a9f3d0905301749u6a92f2ey59a96d2cde6069a2@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sun, 31 May 2009 00:58:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, May 30, 2009 at 8:04 PM, Phil Blundell <philb@gnu.org> wrote:
> My personal preference would still be just to make MACHINE_KERNEL_PR be
> an opt-in thing per DISTRO. =A0I guess angstrom wants this: are there any
> other distros that do?

My understand is that every distro that uses anything that needs ABI
compatibility with kernel needs it, or is suppose to use it. By ABI
compatibility I mean:

 - external kernel modules
 - binaries that require not stable symbols in kernel

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


