Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OKWQD-0005vM-M9
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 14:54:59 +0200
Received: by wwb34 with SMTP id 34so899797wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WZCXFStKM3zOTmHX98uNl0eUY3MLSUn/hDPDO3ylTlw=;
	b=oyoY+Nmz6wqWhGNN/kpR8EkYSrB2nhRhpzFKgL6q2yb1FGZiIayhsGgVglxuUwNyf5
	Qo3MYE38dPU+M3OdNUECXhuQOC1wLpuQEBYwFBbs6ZFXXMvN+pgr2D2WiUePWSHXzjcz
	5tAhW5dPTKrYf/p1YGmdtVeJiVdo9hmn/6bDo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=unE5oUjVNIQVX+INMbVWrI+6NeFr5aijbkFXupQndx+HTBl4/W9yG17b6ZUKpXaOYr
	lyUbiOa9g7GMO8wRvtni1cOWxDkh25LZdwPbCX6n0lctIWDW9ROq4zOcTsGyAIADF63D
	pBCupDBCAryKmu2PY1o3s5VEnNkgn8zcjdjRg=
MIME-Version: 1.0
Received: by 10.227.142.21 with SMTP id o21mr10541991wbu.187.1275655832725; 
	Fri, 04 Jun 2010 05:50:32 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Fri, 4 Jun 2010 05:50:32 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1006040532220.5274@asterix.crazy-teaparty.dyndns.org>
References: <1271752342-17886-1-git-send-email-vjensen@gmx.de>
	<20100420161553.GA12219@denix.org>
	<alpine.LNX.2.00.1006040532220.5274@asterix.crazy-teaparty.dyndns.org>
Date: Fri, 4 Jun 2010 08:50:32 -0400
Message-ID: <AANLkTikC9w3lRbPPKsJTm3X5fKo0jU778xfQ7vOT7Npn@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: base_do_compile() accepts GNUmakefile as Makefile
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
X-List-Received-Date: Fri, 04 Jun 2010 12:54:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 3, 2010 at 11:39 PM, Vitus Jensen <vjensen@gmx.de> wrote:
> On Tue, 20 Apr 2010, Denys Dmytriyenko wrote:
>
>> On Tue, Apr 20, 2010 at 10:32:22AM +0200, Vitus Jensen wrote:
>>>
>>> GNU make will look for GNUmakefile, makefile and Makefile. =A0GNUmakefi=
le
>>> isn't recommended but used by some programs, e.g. canutils.
>>>
>>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>>
>> Acked-by: Denys Dmytriyenko <denis@denix.org>
>
> Could someone please apply that patch? =A0Now that it's acked by two
> developers.

Applied, thanks!

Cliff


