Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvFs7-00048y-FC
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 22:43:29 +0200
Received: by gya6 with SMTP id 6so2387055gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 13:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=cIsnlLbn4CRv9rl2PcxFDXJzEiZh4Ze3BVHKJ91O/00=;
	b=aQ6MRBMQVfZtQtVdcGwgbioJpRwhvRrQYACofcTWwP2Pu1EY13Avm9xGWtEpE4kzaa
	7UFv5KKk1cfCqH1+JfBzQRDo0+cJ6CXJXvW6PlX9JtJ0MAtbi0PfrCCvehYpnVM4HTxR
	6NLAymqaFGuO6DMGOeC5sR1byyd3nb3i68qTs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=W4S2JjC+ptVmM3rKbVda2D0JMPuxF9i1QRazt0mzIy9TAtBHa80jDRld9FVidZjMoz
	iakj9ToBGi0tPuPCT3sIejbZa3F2asehhoSwe0H+yr0uQgzxaYDISJir8037M7zxUrhV
	onJITFQzaIfrrFeAL+dFlKusSzM20xotTGgTg=
Received: by 10.150.147.7 with SMTP id u7mr159230ybd.162.1284410559277; Mon,
	13 Sep 2010 13:42:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Mon, 13 Sep 2010 13:42:18 -0700 (PDT)
In-Reply-To: <AANLkTi=r1NxVPeRVSSP24YXJSRDxUBwvLQo4PH6_iRxj@mail.gmail.com>
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
	<AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>
	<AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>
	<AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>
	<AANLkTim9n1JsDc+bmYN5g20kBtobi5Ti-60Joq1U_rQZ@mail.gmail.com>
	<AANLkTi=r1NxVPeRVSSP24YXJSRDxUBwvLQo4PH6_iRxj@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Sep 2010 13:42:18 -0700
Message-ID: <AANLkTimkhhnmDTWH3=Vx5hVN=Hpy5WXpnUX-E5QfRobb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Mon, 13 Sep 2010 20:43:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 13, 2010 at 1:20 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> As I don't really see progress on this, I am planning to take action
> in a few days.
> Since Khem expressed a preference to keep the files accessible, I'm
> planning not to remove the unneeded patches, but instead move the to
> the obsolete dir.
> (alternate could be to move them to a dir called unused in the recipe dir).
> Removal will be tested by verifying that bitbake -c patch remains
> working on all dirs where unused files are removed.
>

sometimes same names patches exist in different dirs and if you remove
one then it will start picking the other one
silently so make sure such cases are not there. In general I am wary
of mass changes which could creep in some bugs like that
Ideally I would suggest that you look at each and every change before its final.

> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
-Khem


