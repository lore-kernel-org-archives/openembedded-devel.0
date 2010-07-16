Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OZebb-0007za-N3
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 08:41:13 +0200
Received: by iwn34 with SMTP id 34so1892996iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 23:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=+zpDSYrnr7BlV561bmeKDD9A/QwbxNHAfRcdlvecpXI=;
	b=gnlQstVQ89wCRGRz2StFoZDAQgVZaudwTEaBHzy2+OzMDuu4uNAyTfMnW02mfMk1Y/
	aC0dfIt3puNM24xwxNvqMBty7xg/SbiSRJz40Ofkg8/ErDcHbiujD9hguLeRQuUFGjwJ
	B9QyQkiexzS2rvIyrrAzpUWF/4Hv0JegwzQPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gdFV/NmeO0XXI7HkHjPT7Qfh2jGEc4rrpT8r0w2NqI5GgM9wUZBN7fag3m0HjK+dKd
	6+EP0ApPwcychTvuAo5w2D5O7nUiuHcFub2lJOI9XVfFaCGqYFKMM1w83fWJAzij26+d
	/jlw8PcqqLlSR5sP37hu0VbQAJ8MwXL98i4Xc=
MIME-Version: 1.0
Received: by 10.231.149.80 with SMTP id s16mr472180ibv.81.1279262463451; Thu, 
	15 Jul 2010 23:41:03 -0700 (PDT)
Received: by 10.231.157.196 with HTTP; Thu, 15 Jul 2010 23:41:03 -0700 (PDT)
In-Reply-To: <1279226782-6124-3-git-send-email-fransmeulenbroeks@gmail.com>
References: <1279226782-6124-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1279226782-6124-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1279226782-6124-3-git-send-email-fransmeulenbroeks@gmail.com>
Date: Fri, 16 Jul 2010 16:11:03 +0930
Message-ID: <AANLkTilHWrF3ceHTvbQOJWr9LEkCuvz5-2UZQbaby5Wt@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] glibc: remove old/obsolete versions
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
X-List-Received-Date: Fri, 16 Jul 2010 06:41:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 16 July 2010 06:16, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> as mentioned before on the OE ML.
> removing some old versions which are not pinned by any distro
> and are fairly old:
> glibc-initial_2.3.2+cvs20040726.bb
> glibc-initial_2.3.6.bb
> glibc-initial_2.4.bb
> glibc-initial_2.7.bb
> glibc_2.3.2+cvs20040726.bb
> glibc_2.3.3+cvs20041128.bb
> glibc_2.3.3+cvs20050221.bb
> glibc_2.3.3+cvs20050420.bb
> glibc_2.3.6.bb
> glibc_2.4.bb
> glibc_2.7.bb
>

Yes! OE needs more of this cruft removal.

Acked-by: Graham Gower <graham.gower@gmail.com>


