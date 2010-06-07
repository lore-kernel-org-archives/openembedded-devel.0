Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1OLdF7-0005HA-OG
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 16:23:58 +0200
Received: by gwb20 with SMTP id 20so1266781gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=izIQ3DtVu68CKIWJ5RCQCFH5JdHDb5R0+j/YXRU3InQ=;
	b=jTYxZ1LBxz0b/og7Zb4UdZYAKT+45F8pNchij9tJh4KgdS/p8j2LeHMh6dPtGe7DZq
	9FJ476e+QhOWJKs/Ut2f2u4MlMEwWOt/3FFU9mNp639GQrSvL9ACZ40VF/C2BxY7JK4M
	jxXlPjlOpR9CZnXMdsFUdfvTXS6NPo1ucZgQM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=GEnyWjabwIxUCd+/jgP7zcJrP3jU40Q0g+jz6zRR01vwxt6YIaaRIyAx3JtNFbHMvX
	XmVPZECfVgqCUqXoAfvvb4KhfjHJYA7gaF5wVncDByu3hfxTdXZabbDRI3Av3KpuWHFr
	jDLjjb0BGKYXSlVieDl3utY41+8bjCOCUrKus=
MIME-Version: 1.0
Received: by 10.150.174.9 with SMTP id w9mr13979975ybe.0.1275920377128; Mon, 
	07 Jun 2010 07:19:37 -0700 (PDT)
Received: by 10.150.177.7 with HTTP; Mon, 7 Jun 2010 07:19:36 -0700 (PDT)
In-Reply-To: <20100607141124.GB4570@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-8-git-send-email-raj.khem@gmail.com>
	<AANLkTilJ62g8nmoiOrRbKBMDhUs7RtjMNgxwW3ntzink@mail.gmail.com>
	<AANLkTilsZ7Qvc77yWK0hCi9W3yhkxo0f6f7olvxILH7X@mail.gmail.com>
	<20100607141124.GB4570@gmail.com>
Date: Mon, 7 Jun 2010 16:19:36 +0200
Message-ID: <AANLkTimqgq8R1SX5GVRZCNRiD_PHEGvSznh6b3WqEVuC@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 07/16] grep-2.6.3: Add recipe.
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
X-List-Received-Date: Mon, 07 Jun 2010 14:23:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

Updated to latest org.openembedded.dev and tried building the latest
grep-native.
I added the inherit to gettext but there seems to be something wrong.
The new grep bb file needs xz-native.
It is specified in the dependencies but for some reason bitbake
doesn't take the dependency into account and grep-native fails with a
missing xz.
First running 'bitbake xz-native' by hand and then running 'bitbake
grep-native' succeeds.
This indicates that xz-native is indeed the correct dependency but for
some reason it is not taken into account.

Regards, Jan

On Mon, Jun 7, 2010 at 4:11 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (07/06/10 09:35), Jan Paesmans wrote:
>> Hi,
>> I was having problems with building grep both native and for target on
>> our build system.
>> Seems that there is a dependency missing on gettext. Adding gettext to
>> the inherit directive solves the build failure.
>
> thanks for report. I will test a fix today.
> -Khem
>


