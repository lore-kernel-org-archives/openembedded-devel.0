Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PObZv-0007I6-AO
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 20:46:00 +0100
Received: by gyd12 with SMTP id 12so5094521gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Dec 2010 11:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=eKDz8/y52ihIdiEO78DaRD92P3l+bXvLPHZ4KGtY2M0=;
	b=vTVwRC03sYAF2azuJxjeGpA3+0yV0ysOXTNlU5vXdLXh1s0evx0ptmCae3qySkhc+R
	msr/esWH/Ck9MACMxO1UjKrRWl2tdNZjTrS9LZsCtKXgeF/hk33UaqOsm4guupNJjrHW
	b8iY8fXKRfvMdYvDfy8Wj4hRCwAPADmNmdEuw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=L6Z+opklus3ytPMbnIM3KH6I4K+B/G/LTtqsSB1SfghRDSTxTZaexZ6URgWGlXSRCf
	3Hym+cp6AcgNdv783fyCDjS6NA94iOV9z6nATLwIMSZVRHoQvkorfFVVTbZQHvhKGxlS
	rO2MJj7dDsu8nGCyUQqERVyO9v3Xh655xdsbg=
Received: by 10.90.31.16 with SMTP id e16mr3801733age.21.1291405474762; Fri,
	03 Dec 2010 11:44:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Fri, 3 Dec 2010 11:44:14 -0800 (PST)
In-Reply-To: <AANLkTim=weStfsykRNc7_bAZG6KExZt9sS_O15WH9F5=@mail.gmail.com>
References: <AANLkTim=weStfsykRNc7_bAZG6KExZt9sS_O15WH9F5=@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Dec 2010 11:44:14 -0800
Message-ID: <AANLkTikSuqFKS=1j-KWm3XY75J=qhe+towHjdfanW1JG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release 2010-12: tar error
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
X-List-Received-Date: Fri, 03 Dec 2010 19:46:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 3, 2010 at 7:36 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Not sure if this is reproducible or a race but when building console-image
> for minimal for calamari I got:
>
> ERROR: Function staging_packager failed
> NOTE: Task failed: ('function staging_packager failed',
> '/home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026')
> ERROR: Task 601
> (/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/linux/linux_2.6.30.bb,
> do_package_stage) failed with 256
> NOTE: oestats: task failed, see
> http://tinderbox.openembedded.net/packages/1176040/
> ERROR: Logfile of failure stored in:
> /home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026
> Log data follows:
> | tar: .: file changed as we read it
>
> NOTE: package linux-2.6.30-r6: task do_package_stage: Failed
>
> Didn't have time to dig into this. Sry.

yes this happens time to time. Its some sort of race condition. I get
it sometimes in different packages but never went in deep to fix it.

>
> Frans
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


