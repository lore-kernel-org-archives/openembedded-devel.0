Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OzD4C-0007u4-SM
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 20:32:17 +0200
Received: by wyb35 with SMTP id 35so229244wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 11:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=e3C2UGYXCjPWHr29n8ZLpOEngBZXjtfpn9RLNxSHIfA=;
	b=ipIRRSTzoCGhiu3chMlS9cy+OQ8VyCYwGV64Em/Zypeuhr9YdhUXTM3ww7ThnSUvwM
	KOfYiVxUftvu9I3gJYeS1AESE805BG0ImfnYNMwSc3Tjf9dFu6LafpTvYmZkPQixO79p
	tEs5xT49F74fHi+F9ozDh0m0TuyynOUKWA7fI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=etSa5Y5e6fVhcKKcAI+n1CqQhx1Gn+dngVzUh9+JoqV8WzjwQVyMNlrReO+9PM7QZ3
	FNaCyuo39bwiIGwIG8tbjvwKerIdwovrFh4y36JZWHMPekiRNmXAtZodrMAmfc0cM4r4
	YVGgPI0wvslQRex/26h4CP4IzTyi/rEMA6ULY=
Received: by 10.216.165.77 with SMTP id d55mr3104869wel.23.1285353129661; Fri,
	24 Sep 2010 11:32:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.169 with HTTP; Fri, 24 Sep 2010 11:31:48 -0700 (PDT)
In-Reply-To: <1285352939-23376-1-git-send-email-raj.khem@gmail.com>
References: <1285352939-23376-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 24 Sep 2010 11:31:48 -0700
X-Google-Sender-Auth: ql0087htQGQPXTIanK63eyVWWiQ
Message-ID: <AANLkTi=ke6+dPpxZ7zfo3QH+v6jKg68d78J4DBLofhtR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] staging.bbclass: Use sysroot_stage_dir instead of autotools_stage_dir
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
X-List-Received-Date: Fri, 24 Sep 2010 18:32:17 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 24, 2010 at 11:28 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Some packages like package-stagemanager-native dont use autoools
> and autotools_stage_dir can not be found for such recipes.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

