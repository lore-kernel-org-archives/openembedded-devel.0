Received: from na3sys009aog110.obsmtp.com ([74.125.149.203])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PLTNH-0004Gu-3w
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 05:24:00 +0100
Received: from source ([209.85.214.182]) by na3sys009aob110.postini.com
	([74.125.148.12]) with SMTP
	ID DSNKTO3klRxIrnpWajpuFz5ACeLhm0rPEy4H@postini.com;
	Wed, 24 Nov 2010 20:22:46 PST
Received: by mail-iw0-f182.google.com with SMTP id 39so590569iwn.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 20:22:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.73.136 with SMTP id s8mr85560icj.449.1290658964903; Wed, 24
	Nov 2010 20:22:44 -0800 (PST)
Received: by 10.42.175.129 with HTTP; Wed, 24 Nov 2010 20:22:44 -0800 (PST)
In-Reply-To: <4CEC15EF.3090906@mentor.com>
References: <20101123113706.GA3533@lit.local.igalia.com>
	<4CEBD252.7000502@mentor.com>
	<20101123145713.GA3032@lit.local.igalia.com>
	<4CEBDABB.1060607@mentor.com>
	<6EB1C564-9BA3-4833-B7F3-72EA4B2F8C51@dominion.thruhere.net>
	<20101123160525.GB3032@lit.local.igalia.com>
	<ich14q$f5b$2@dough.gmane.org> <4CEC15EF.3090906@mentor.com>
Date: Wed, 24 Nov 2010 23:22:44 -0500
Message-ID: <AANLkTi=r-WTGRKTOb_0W89fUyrq67W9u-S_uPQ14dSrX@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.149.203
X-SA-Exim-Mail-From: bengardiner@nanometrics.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: external-toolchain-csl-1.0-r6 fails
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
X-List-Received-Date: Thu, 25 Nov 2010 04:24:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi All,

Sorry to jump in so late.

On Tue, Nov 23, 2010 at 2:28 PM, Tom Rini <tom_rini@mentor.com> wrote:
> So to be clear, there is, or is not, another solution for using a
> non-angstrom toolchain to build angstrom?

I ran into this once and I'm happy to say that there is a solution
[1]. It was committed [2] by Denys Dmytriyenko and Signed off by Koen
Kooi [3].

2010/11/23 V=EDctor M. J=E1quez L. <vjaquez@igalia.com>:
> I'm using the openembedded's branch org.openembedded.dev (HEAD)
>
> my local.conf
> [...]
> # enable following line to use CodeSourcery Lite
> TARGET_VENDOR :=3D "-none"
> TOOLCHAIN_TYPE :=3D "external"
> TOOLCHAIN_BRAND :=3D "csl"

I think you'll find that you are able to build using CSL if you use
TOOLCHAIN_VENDOR instead of TARGET_VENDOR in your local.conf. I tested
with CSL's 2009q1 -- YMMV.

Best Regards,
Ben Gardiner

[1] http://article.gmane.org/gmane.comp.handhelds.openembedded/38201
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df3b29a0=
3710280fda6561b37313a56dd759befac
[3] http://article.gmane.org/gmane.comp.handhelds.openembedded/38212

---
Nanometrics Inc.
http://www.nanometrics.ca


