Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PNoBr-0003yA-OU
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 16:01:52 +0100
Received: by iwn8 with SMTP id 8so5920025iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 07:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=//uRGwpLSJMlqEKQaJz4Sc0ZrCVAyx3Fg9xOEXaaCIY=;
	b=djNdWobgqDbPq11NEny3G0Offox0yDMTaAtCbfIoOVbH5wnD0ZN9gwIgFLUCgIN5Fu
	t8AbpG8yx2OS3WR13P/rsUo52AHjmniH0Fa1DS3urHM391YC6+7ZFkVF9Oic0nj3qhaA
	SsSS+R156qGaASNgzNL89HDJupb37QWPZIdX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kKlYQC1xmNpaN4tADNAU8vmrUXdW46LaLptKixgUSnaaJG8AQ2eMgIwdqVs31wLMnW
	HHG6dLvvXzf0i9gOtfuqQQGOyoaMGn4dUHz32RBe5d3FBrWDziNAeT7k9wRs7cluwn1t
	/MZ7AeHmhXb2QQDll7Zjah5A0ZU/+aUA5EEes=
MIME-Version: 1.0
Received: by 10.231.191.4 with SMTP id dk4mr9120893ibb.82.1291215630458; Wed,
	01 Dec 2010 07:00:30 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 1 Dec 2010 07:00:30 -0800 (PST)
In-Reply-To: <4CF65AB7.9070603@mentor.com>
References: <1291211567-2520-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTikkpAXLe9ZAvp=CPC1gVjngeGfQHqV2-sCtjwPG@mail.gmail.com>
	<4CF65AB7.9070603@mentor.com>
Date: Wed, 1 Dec 2010 16:00:30 +0100
Message-ID: <AANLkTi=Svdm8ZFt7pDcpwmDafQfZqsofMwDPk7S3hF6a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] module-init-tools: fix multiple runtime providers
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
X-List-Received-Date: Wed, 01 Dec 2010 15:01:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/1 Tom Rini <tom_rini@mentor.com>:
> On 12/01/2010 07:11 AM, Frans Meulenbroeks wrote:
>>

>> still not really sure why we have module-init-tools-cross though.
>> A quick search did not give me a user (but maybe the search was too quic=
k)
>> And still unsure why a cross recipe should produce a =A0package.
>> And maybe it should be module-init-tools-native ?
>
> It's used for running depmod on images during creation, iirc.

Do these produce packages (apart from packaged staging).
I would expect it to install its stuff in cross or sysroots or so and be do=
ne.

Frans


