Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OZUdW-0006Al-As
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 22:02:29 +0200
Received: by iwn34 with SMTP id 34so1368750iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 13:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=udonfMjlK4qRhWt0S2Ny9f4B3bJIdHD/XAiJrnNl2wg=;
	b=ZshjTZVwUa4qp2nDcX6K8Qm9tJiIOx5EppZaZxRFEatDmUqdWnHFJg3NPD9XWyZojV
	wzIvrf3Rv/5QydEyyvxmmB/lyYM+TmowDLU5m8G8fSdeagBJFH6nB19jWcuCHflPiEXW
	rZ2vs3JolBWA0mkLoqHasTHJsBnngFiRtU86g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=P++DKSCtRMq3lL2qJBAymsh9FuuSIOh06UvkbOpeJZwifFxG675/veNNKjIgRVAOwq
	G72lfaW4Yq9nqUbRwiT2MS/90YCVUdvcSVkgKiiP3U2sxkJPtMG18Q7lDl1TD30NGv0f
	DEvfmqAIQoSO95173t4XdCPJoqek6Ti/R6HdI=
Received: by 10.231.170.3 with SMTP id b3mr20897017ibz.122.1279224141205; Thu, 
	15 Jul 2010 13:02:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.35.8 with HTTP; Thu, 15 Jul 2010 13:02:01 -0700 (PDT)
In-Reply-To: <20100715194805.GA8103@rhein.zuhause.netz>
References: <1279133054.4939.16.camel@mattotaupa>
	<20100714194822.GB9771@rhein.zuhause.netz> 
	<1279216348.3741.24.camel@mattotaupa>
	<20100715194805.GA8103@rhein.zuhause.netz>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jul 2010 13:02:01 -0700
Message-ID: <AANLkTimQo47xqCaKDLeRV0kclSF7KAloIDgp8Wfd6HUz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: uclibc-git: oe_runmake failed: error: '__a1' undeclared (first use in this function) (was: angstrom 2008.1, uclibc: libc.so not 	found, i. e. not in staging directory)
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
X-List-Received-Date: Thu, 15 Jul 2010 20:02:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 15, 2010 at 12:48 PM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> Hi,
>
> seems that this revision fixes ppc and brakes arm. Not good, I will revert the commit.
>

No need to revert the commit. Just pick the latest tip of uclibc once
more. I have fixed it.

> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


