Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PLKXa-0006hz-9k
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 19:58:02 +0100
Received: by wwb31 with SMTP id 31so53619wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 10:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=4QyLKVEsZ+Cfdpwq5DD4RvD2vl+7A+WC/CK7LprnpLQ=;
	b=JA+r1d/RSm87l11adpc2/GofjLNSGi2+49/03dfh4pGph7GB3to0GaTAMx2XXW4Cu9
	N8PlASl8DStrqBCSdQE40w3g9h/JRBMSFEyfmeOr5V97oDHgzVhEGA4qfXZuum01S+C8
	pt4vtEBxZIg7LybYeRpJk0FJnLiN5uaL1aL+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=gDqC3d+BEBTUIMOLptyX/gIcUNZX4HLiEdprq+hncY7PKzubpy0go0rXrO0t3JArdq
	4PeUYUIBCzCHbbuhqvud4sbZR5IktM0CmsIAKNtTwgbpWetzhRdGRrBotWixFcr+oCh2
	nWKCz+UanlSJoueVMeXw6Y5Lgs1Msqeqhhwrg=
MIME-Version: 1.0
Received: by 10.216.141.209 with SMTP id g59mr8715425wej.10.1290625007255;
	Wed, 24 Nov 2010 10:56:47 -0800 (PST)
Sender: zach.frey@gmail.com
Received: by 10.217.3.211 with HTTP; Wed, 24 Nov 2010 10:56:47 -0800 (PST)
In-Reply-To: <4CED5C10.2060402@mentor.com>
References: <AANLkTik7jiaQGPgnzi+AbygYSKsSTEY7jVPbk6CyRNAr@mail.gmail.com>
	<4CED53C2.7070109@mentor.com>
	<AANLkTikzCOZqUGuuuG=a97PV9cxXLXEcTkqWu3Jqxwby@mail.gmail.com>
	<4CED5C10.2060402@mentor.com>
Date: Wed, 24 Nov 2010 13:56:47 -0500
X-Google-Sender-Auth: lXy2YwuEX_pywc2rIEOAKxSIJrI
Message-ID: <AANLkTimJ-78jzhDa5G9dvF5EGvjWVv616zhXfdQCxiKQ@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fails sanity check
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
X-List-Received-Date: Wed, 24 Nov 2010 18:58:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 24, 2010 at 1:40 PM, Tom Rini <tom_rini@mentor.com> wrote:

>
> This particular config.log says at the end that it exited with status 0
> (which is the desired one..).  Perhaps a different config.log?


Well, per timestamp it appears to be the right age, and I did do 'bitbake -c
clean  ; bitbake <target>' first, so I would think it ought to match.

I'm going to try the toolchain rebuild per Khem next.  If that doesn't solve
it, I ought to be able to remove the module directory under
tmp/work/armv7a-angstrom-linux-gnueabi and rebuild to ensure the log matches
the build, right?


Thanks,
Zach

