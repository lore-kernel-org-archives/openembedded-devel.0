Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P8iBs-0002nM-Oq
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 01:35:29 +0200
Received: by wwi17 with SMTP id 17so1591070wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=zXbF4XBS7tPV4pNOY+deBuN45O3RX1bMul+DwJNmZVo=;
	b=NCA8shyl07WgpwWeDrgAc//pqsnfyfX+HTQGRUAJH8N9BcbUu7OqZdeW4RnVQWUe/1
	0d5A8dgIXRcjJEp2FmsZXlc+aOcM8YT1fcxTe6Oo3fLUdSr2fwUsR7vBITUxBEiQs4/Q
	A5MrvK7bmwpEsXP+N6r4XYkzU2HWp8zi9e4nM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=CKq43TGU/OWE/zvfixG2uu0vK8YilXVmxVUTi4/fwe3kcM3u7Flx+zb79ubmoq/XPN
	CovbaUkbyUAb3DXmkt9fjETKKwtLBrpJLKCv9i4EkAFnvlRAHFXfX0NOQxdaLwAQl0dP
	GqZVp8BU8DY49CfZa2+xyS7bZAoUiBvBd9qJg=
Received: by 10.216.54.147 with SMTP id i19mr6615848wec.59.1287617692574; Wed,
	20 Oct 2010 16:34:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Wed, 20 Oct 2010 16:34:32 -0700 (PDT)
In-Reply-To: <20101020232906.GY11514@denix.org>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3131@dlee06.ent.ti.com>
	<AANLkTimWmTWAkCPAabOagq2S5gtfMztov8xiBcK7q_Vh@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3140@dlee06.ent.ti.com>
	<20101019192458.GB6202@denix.org> <20101020232906.GY11514@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 20 Oct 2010 16:34:32 -0700
X-Google-Sender-Auth: SVpvCrpXwxljGGwM7wyVJFCV5Bo
Message-ID: <AANLkTikb49yz4h3O==qzv8S+WhP6uqT79zqpqEtRMpwK@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org, martin.jansa@gmail.com
Subject: Re: [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to OVERRIDES when it's empty
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
X-List-Received-Date: Wed, 20 Oct 2010 23:35:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 20, 2010 at 4:29 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> I see that Martin's patch was marked as "Superseded" and archived - is
> there a
> new patch coming? Or are there any side-effects of this patch? I would
> definitely like to push this patch ASAP to address our immediate problem.
>

The original problem with empty overrides was the FILESPATH issue, which was
fixed by the commit that sanitized FILESPATH, hence the superseded.  Clearly
there's another issue with them, so this patch is necessary.  Feel free to
apply it with modification and push it, we can always drop it when we bump
the minimum bitbake version to 1.10.x.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

