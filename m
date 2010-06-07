Received: from mail-pz0-f183.google.com ([209.85.222.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLd7B-0002uR-8N
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 16:15:46 +0200
Received: by pzk13 with SMTP id 13so3800536pzk.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=duDASoqBX+Uh31MVxiI7KtlVLhhZGmLu1ZArtc2ndV4=;
	b=WQz6krXRb27k8qiYg8ZJlFJpcmwM4FfHqjBCUqmS6+Z1XCTaZVLkFXaBGk8+rqLHiE
	04dHmbuQYho64XfqlY79fi161HQIiKpNRfhF0H7r32X2whIS/gopAFI7exCtOzUw2qkF
	gHs9HvuHKPG8LmVfcfk9B2OCTk3KsE4hKBDsc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=enNfS49WE7fVoBzxhs0MWXkf3+90ag+2/azl5wubG7rnS4yuTPsMGXBlXIWjCNNkJ8
	f9I8ri3mGihRTYhvSQUiicojVHvDrWXwtpDc2pWGHta1j7KSs4M9f2PTR1KJBwtP5JBU
	e/Y8bk+A1Z4/Q9eJmNMgn7x1ez0JxcdDCD7E0=
Received: by 10.142.117.27 with SMTP id p27mr10816690wfc.252.1275919884372;
	Mon, 07 Jun 2010 07:11:24 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 20sm3077511pzk.15.2010.06.07.07.11.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Jun 2010 07:11:20 -0700 (PDT)
Date: Mon, 7 Jun 2010 07:11:24 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Jan Paesmans <jan.paesmans@gmail.com>
Message-ID: <20100607141124.GB4570@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-8-git-send-email-raj.khem@gmail.com>
	<AANLkTilJ62g8nmoiOrRbKBMDhUs7RtjMNgxwW3ntzink@mail.gmail.com>
	<AANLkTilsZ7Qvc77yWK0hCi9W3yhkxo0f6f7olvxILH7X@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilsZ7Qvc77yWK0hCi9W3yhkxo0f6f7olvxILH7X@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.222.183
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Mon, 07 Jun 2010 14:15:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/06/10 09:35), Jan Paesmans wrote:
> Hi,
> I was having problems with building grep both native and for target on
> our build system.
> Seems that there is a dependency missing on gettext. Adding gettext to
> the inherit directive solves the build failure.

thanks for report. I will test a fix today.
-Khem


