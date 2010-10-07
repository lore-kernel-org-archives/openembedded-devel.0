Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P3zhM-0001uv-Nm
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 01:16:29 +0200
Received: by iwn37 with SMTP id 37so443275iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 16:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=/wDumjaMyUDEP9XJbIKsVBYck0udyqe6C8oTOjJJ/s4=;
	b=psMyw1GqaZtfqFF6ZyPjuXbljEEH4xq68FNQBVH5oLylTuS/omqCTK+Pp3Qgz5aKQS
	dL9Okh4NgMZ8fV5YvZpRRfAEfYIqEnFfgxMcmwGsMXMcXDe5GVcuixPZJeZJGFHhLh8b
	l0EE9KJQ/sw3ffue113GM7rILsBZ1+CmZ4+Bo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bmQPhSCwMUN107ovMJRpx/ko6gCfR2WVTkyRGf8V33c22QoqTlBzbhOaW9igQ99z45
	wGykjS0KPw2HduoNB6RLM79kam4kCoaNxM3XooBIcLTdRebp8fYE4x4Q1U8hdtqJDeHK
	JLePlMaE4junuOgjVT+OrYT9PhkqL7nRn/To4=
MIME-Version: 1.0
Received: by 10.231.157.195 with SMTP id c3mr1616716ibx.155.1286493366052;
	Thu, 07 Oct 2010 16:16:06 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Thu, 7 Oct 2010 16:16:06 -0700 (PDT)
In-Reply-To: <AANLkTinM3tq_0J-Jg5VsT3tLYiCd4w=U9-PtDwJCX8kE@mail.gmail.com>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
	<i8jufe$299$1@dough.gmane.org>
	<AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>
	<AANLkTinM3tq_0J-Jg5VsT3tLYiCd4w=U9-PtDwJCX8kE@mail.gmail.com>
Date: Fri, 8 Oct 2010 09:46:06 +1030
Message-ID: <AANLkTi=UtHT3nveqmqxsd79MU53ymPpgjv2DTU5Jp5Gv@mail.gmail.com>
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
Subject: Re: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Thu, 07 Oct 2010 23:16:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 October 2010 09:26, Graham Gower <graham.gower@gmail.com> wrote:
> I've done a bitbake -k world with this patch set. Below is a list of
> tasks that were found to fail with the patch, but succeeded in my last
> world build without the patch (about a week ago).

To clarify, this was done with:
LIBTOOL_HAS_SYSROOT = "yes"
LIBTOOL_VER = "2.4"

Also, there may be some false negatives here due to recipes having
things missing in their DEPENDS and the build order being semi random.

-Graham


