Received: from [209.85.210.180] (helo=mail-yx0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MntwQ-0007LE-BO
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Sep 2009 14:49:01 +0200
Received: by yxe10 with SMTP id 10so6197761yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2009 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=dFPmU6QHTklylXZ0+O29KYjSAFX6DI0QprNjFK68HFU=;
	b=Uhm0/2mI59+x+4PRmlDAaw1v3CqCTn8Jrgc3eTKOi91rZ+n448B7aZ2dP0pma/AaLt
	H9KJlCVF3HJ3zry9dAvWbAb+nJ57lKqwdsHPiUCqk4pKP1k/sAQ7QNleVB/LkqoDJNoG
	yrE1BgdF2LPrd5hUT/CVUhL1iiWv8fF5vojN4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VzEg74Iy4RuxJcpCyIMXVXMcxy2hEbmk7H1DklvyizwAOEDIUMQqLuftE+EVJcid1V
	2amnYPtnHjIC51KPAmQdkQb68NZa1p3xYTNXKhmEkBB95C6L3OiPxlkbG7NX9g//ne1J
	MJwDl0bAtdh9GizaoCDKM7MdGXbY8sCvAAYl8=
MIME-Version: 1.0
Received: by 10.150.132.11 with SMTP id f11mr14328803ybd.296.1253105305601; 
	Wed, 16 Sep 2009 05:48:25 -0700 (PDT)
In-Reply-To: <4AB0BBA2.8030607@iki.fi>
References: <4AB0BBA2.8030607@iki.fi>
Date: Wed, 16 Sep 2009 08:48:25 -0400
Message-ID: <f96d234e0909160548r3ec9a8c8r2c27c29910203401@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] armv5te mentioned twice on eabi-capable list
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
X-List-Received-Date: Wed, 16 Sep 2009 12:49:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 16, 2009 at 6:19 AM, Aleksandr Koltsoff <czr@iki.fi> wrote:
> (My first patch generated with git, please be gentle :-).
>
> armv5te is mentioned twice in the arm_eabi_supporting_arches list of
> sane-toolchain.inc. Remove the latter occurance.

Looks good.  I'll let Khem or some who is more familiar with toolchains apply.

One suggestion, we have a commit policy
(http://wiki.openembedded.net/index.php/Commit_Policy), so if you
follow that on future patches, we can directly git-am your patches and
push them with no extra work.

So the commit message for this might be:

sane-toolchain.inc: remove extra armv5te in eabi-capable list

This allows people to very quickly get an idea what this patch applies
to, and makes for nice formatting in the weekly change logs.

Thanks,
Cliff


