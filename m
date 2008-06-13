Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1K7C61-0001iH-SU
	for openembedded-devel@openembedded.org; Fri, 13 Jun 2008 18:25:49 +0200
Received: by fk-out-0910.google.com with SMTP id 19so2392383fkr.12
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Jun 2008 09:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=b6NQucRM9e00ulIxPDECtkUNm5EKwLyB171jU0gd9ys=;
	b=iFYEUih7gSVmMCUUwVUppbGFpJsBf3OM+CR20S4NR1T8V9QGC+L8b0onVsMHwaPtYL
	5wrNigkZH1q28mnxoPkOcGsxTc5gcGIQ7mmmcXKYgi3Y9FPvMY/EbNpVz+Ecuy9v+FVb
	tEUMHVsw6NEmWAZ05Dz4sKvUGxbojYpT1mpUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=sT46vxitGV9+3xUAB7+0lNDU+0d6Y6Q3t5CtNOF3c12cE/7DjMrcfUvVslCrb9Bado
	puFdEvPmRr0pIoOuWvtQ/yU9jV89N3ptRZbaZRdtdKP+DD5gVbv6P8HDXVekfwMeXQFm
	VOjE5RLDaXY9EkIDpDI3g4WrtWfzQUbS/utyg=
Received: by 10.82.167.9 with SMTP id p9mr178394bue.81.1213374337474;
	Fri, 13 Jun 2008 09:25:37 -0700 (PDT)
Received: by 10.82.119.12 with HTTP; Fri, 13 Jun 2008 09:25:37 -0700 (PDT)
Message-ID: <74d0deb30806130925u7ec0c1e4sfdf2144e703f2b9a@mail.gmail.com>
Date: Fri, 13 Jun 2008 18:25:37 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g2tv3m$t5l$1@ger.gmane.org>
MIME-Version: 1.0
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
	<g2tv3m$t5l$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 16:25:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jun 13, 2008 at 4:09 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> pHilipp Zabel wrote:
>>
>> On Fri, Jun 13, 2008 at 10:20 AM, Richard Purdie<rpurdie@rpsys.net>
>>  wrote:
>
>>> As always, there is a but. This change is conditional on being able to
>>> come up with a sensible commit and review policy for OE.dev. The core
>>> team does feel that the metadata quality has dropped over time in some
>>> areas and we need to have a better review process. The change to an SCM
>>> with good branch support is a vital part of this but not the only part.
>>>
>>> We've not made any decisions on what the commit/review policy should be,
>>> this is open for discussion. We're thinking it may take the form of some
>>> kind of kernel style Signed-off-by: tags and a switch to a partially
>>> pull based model rather than just push based as we use monotone so more
>>> than one developer handles any given change.
>>
>> Personally, I'd like to see every patch to OE being sent to and
>> reviewed on the mailing list.
>
> I'd like to see that every commit has at least 2 SOBs, I care less on how
> they get there. Having the review out in the open should be the end goal,
> though.

From Documentation/SubmittingPatches:
"The Signed-off-by: tag indicates that the signer was involved in the
development of the patch, or that he/she was in the patch's delivery path."

In the kernel Signed-off-by is primarily used to mark the way a patch
took into the kernel. If we do this, maybe we should use the same
nomenclature and have Acked-by for statements of approval. (And
eventually Tested-by/Reviewed-by, too?)

>> About a pull based model, wouldn't we need something like the kernels'
>> subsystem maintainers to share the load? Seeing that there already
>> seems to be a serious manpower problem, who would have the time to do
>> that?
>
> Not that RP says "*partially* pull based model rather than just push based",
> which means that bigger changes get done on a branch (e.g. libtool update,
> Xorg updates, etc) and get pulled in after a review.
>
> regards,
>
> Koen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

regards
Philipp


