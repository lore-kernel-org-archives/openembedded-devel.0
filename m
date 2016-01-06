Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id E86A37316E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 14:44:38 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id q21so219913997iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2016 06:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=AxbfisEfmmodYkMwsVpXqqrpXBScknmcXFmCK3vpw9Q=;
	b=RdZbFUtvD+UCeLmIkG0Z24qu6VqJmC4TkyIqBm15u7LogegkFOlyfPT9ysqxRs0NVv
	8PGdZpzUiCdBm5lQu2hzWfX4Hm5GuLxRnaqQ37nyjhyJpeBMaSQar1um8zP878lTmNV3
	RNeUx2NFK2M3cc+LS+MTQWVwHKN/ww+TIOWC1HjgL32gnREr+aNlRwov8h3drevRXxgo
	4QieJzLBTWc7EkaM3Dapw64qXNegcXxUBAVmXPDN1etNZDvz2iHW0+4pJy3G4JyCEx++
	FSaQ5yk8FKXxG/B/LTlB+slFmvM8rWi/2fPzKEgV8Zf4UR5HHidgkyNPMUNmd76A/kea
	I2lA==
X-Received: by 10.107.15.165 with SMTP id 37mr73778875iop.185.1452091479098;
	Wed, 06 Jan 2016 06:44:39 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	ck3sm2967264igb.5.2016.01.06.06.44.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 06:44:38 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1452028543-30812-1-git-send-email-twoerner@gmail.com>
	<1452028543-30812-2-git-send-email-twoerner@gmail.com>
	<n6j027$8ma$1@ger.gmane.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568D2853.2010702@gmail.com>
Date: Wed, 6 Jan 2016 09:44:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <n6j027$8ma$1@ger.gmane.org>
Subject: Re: [meta-browser][PATCH 2/3] chromium: update run script for early run
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jan 2016 14:44:39 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 01/06/16 07:07, Koen Kooi wrote:
> Op 05-01-16 om 22:15 schreef Trevor Woerner:
> > If the chromium run-helper script (google-chrome) is run as part of a
> > (sysvinit) init script, shell variables $USER and $HOME will not be set
> > (leading to unwanted behaviour).
>
> > Replace the use of $USER with `whoami` and replace the use of $HOME with
> > the OE bitbake variable ROOT_HOME.
>
> > In this way the chromium run-helper script will work as expected in
> both
> > instances (as part of an init script and from the cmdline).
>
> Doesn't this break running chrome as a regular non-root user?

I haven't tested that, but on inspection it doesn't. I'm not changing
the _behaviour_ of the /usr/bin/google-chrome script, I'm only changing
the tools it uses to do what it's already doing.

The /bin/sh script has an "if" clause looking to see if the person
running it is root, if so it adds an extra parameter
(--user-data-dir=...) to the invocation of the actual
/usr/bin/chromium/chrome binary.

Prior to this patch the script was using $USER and $HOME and I've simply
changed those to be `whoami` and at build time changing a placeholder
from ROOT_HOME to whatever you've defined in your OE environment to be
the root user's home.

Basically I'm building a kiosk and I want chrome to start automatically
(via a sysvinit script) on startup. When /usr/bin/google-chrome is
invoked as part of a sysvinit script I have found that neither $USER nor
$HOME are defined, so this clause (which is needed in my case) isn't
invoked.

