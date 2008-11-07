Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KyXtz-0006YV-JC
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Nov 2008 21:25:55 +0100
Received: by rv-out-0708.google.com with SMTP id f25so1591183rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2008 12:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=mSJucY+ppHvFusWNgjyZ1hJ5XHsEmyNA451Cw3IVd4Q=;
	b=kJplVU4dedBADR66F3ee6BjJKxjJDHG51qNAAhDDqYPoz7nHDc8BNDrk0RR/qbQkDz
	YDYPDvaARDEGPTlnfRCruFqZ8evlaeRIoAkgAxnl3OUEBHI32jhVC23XU46i3gAcxn3H
	nQjgwXseBLF9TMMzCX8DaS1DT7YDX1RMlke4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=C7ElirvUCxFqlNtbOQ4tGYTfeWyVmG1qZDtvOq1922zqHF7H7CLAd+H/d4bIjf5dWe
	g1dYXk2pD1TDSUP/cuLUnf+/T8Nzyu/8Fg7RdcngCN93YlFumtYO2+bKYYdpFHZxO+tY
	iJZfKiMRNTcsHlttofi90EjbrZ/StHxfnoMC8=
Received: by 10.141.115.16 with SMTP id s16mr1995990rvm.209.1226089457472;
	Fri, 07 Nov 2008 12:24:17 -0800 (PST)
Received: by 10.141.193.4 with HTTP; Fri, 7 Nov 2008 12:24:17 -0800 (PST)
Message-ID: <f96d234e0811071224wf7725d5gfae5238691cf5a42@mail.gmail.com>
Date: Fri, 7 Nov 2008 15:24:17 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0811071157j71bc59bbjf71e865c32e40a81@mail.gmail.com>
MIME-Version: 1.0
References: <20081023230928.GA21151@denix.org>
	<f96d234e0810240638u1026aec9y6b258bba5708315f@mail.gmail.com>
	<1224861430.6356.20.camel@dax.rpnet.com>
	<f96d234e0811071157j71bc59bbjf71e865c32e40a81@mail.gmail.com>
Subject: Re: RFC: Add http_proxy and ftp_proxy to BitBake white list
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
X-List-Received-Date: Fri, 07 Nov 2008 20:25:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Nov 7, 2008 at 2:57 PM, Cliff Brake <cliff.brake@gmail.com> wrote:

One additional note,

If http_proxy is in BB_ENV_EXTRAWHITE, the value of http_proxy from
the env does _not_ get passed to wget.  If I set BB_PRESERVE_ENV, it
does.  This is a bit puzzling as looking at the code in utils.py --
with both methods, the environment includes http_proxy after
clean_environment() is called, and this is the only place
BB_ENV_EXTRAWHITE is used -- very interesting.  And in both cases
"bitbake -e" lists it in the environment.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


