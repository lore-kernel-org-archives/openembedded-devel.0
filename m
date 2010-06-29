Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OTOTv-0006tl-LZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 02:15:20 +0200
Received: by iwn34 with SMTP id 34so461598iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 17:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=X6HCn53aDgmd2t96QzRDPsfARZjOJF3cGUaLDMuYLaI=;
	b=sRKoQb7Fz9usMu2sUStNQfAOb0gSqXx7koFmEGl3Mf4RnZBqtWfCDPTDPzOBWidITj
	3HCsaV3gFZ8L7Oxx/PphnBfVNxj97A/V6ADMUGAyZaNf6GRCEsSyV1WkdQKZZO0ye5OI
	HplBrCMLbIDWXd8G27y+VV0jiz6QGZIxUPbcg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=P7ftxeRKC9X2OCxxjiq5Kmq6fPtWeQHgLpvfm67M1Fpahlpe96tMpPYNTNQ9Og7GL7
	kR9Y+sHHk7rahWa0jiJlMViFv9YJeewwIhL+ksdlsK27mxgYiW6NW4bd9jHL4wm2jCML
	O+1mBH5vUk+4CkXLY2lw+vS0Zhl9PpQiFKW04=
Received: by 10.231.125.223 with SMTP id z31mr5696725ibr.78.1277770238865; 
	Mon, 28 Jun 2010 17:10:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Mon, 28 Jun 2010 17:09:47 -0700 (PDT)
In-Reply-To: <933C8D2B-2A4E-46EE-A342-ED5EB3636F38@keylevel.com>
References: <933C8D2B-2A4E-46EE-A342-ED5EB3636F38@keylevel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jun 2010 17:09:47 -0700
Message-ID: <AANLkTilmoW3cU9hcM1PbN8-yDTM36uzkNB5CwU8obJf1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'swapper' process using 100% cpu when system idle
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
X-List-Received-Date: Tue, 29 Jun 2010 00:15:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 28, 2010 at 3:35 PM, Chris Tapp <dokuwiki@keylevel.com> wrote:
> I'm using a console-image for angstrom-2008.1 / x86.
>
> It all builds well and runs. However, both on my target hardware (Geode
> LX800) and under Qemu the 'swapper' process is running at 100% cpu when the
> system is doing nothing e.g. after booting).
>
> 'top' shows that the cpu is never idle.
>
> Is this 'as expected', or should I be adding something to the build to
> enable the cpu to idle?
>

try using different kernel version

> Chris
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


