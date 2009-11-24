Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1ND4EQ-0005hL-9k
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 23:51:37 +0100
Received: by fxm8 with SMTP id 8so7444986fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 14:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=sceuY90s5vSjxoIEjnDuUH0dbCw66stp9Fje+9gRXhs=;
	b=PHZ+Uh2HoNuFc7tWKwtHgojXQlNGPTbZRxHKUNb9itneD3DnCccJuOAntzPPL1m7K/
	TtrNz4cP4BP7PhHSNhHIs/+5a+vUpmYDtYnz95CR/3s9CD32kxO1mzZg2Kvwgp89y9B1
	+b9fYCPccl6wWi1T5ticHIurhaWTwigJlHp78=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bpKIwBNbYslCDz2VqhpcbpKs1XuoIzq9HZadzV52pz4c/5Nigc2mmk0zgSE6Cb+DUD
	q0s4AJtg3XORxmkzFf/zTuMeg5Wj0OOqbeh5pSriwNDAgsA30pu6I7GR8GH72MLM8aja
	ALcrEsv2FBQcuXQTqP2SnFMO4heuDPptk3dFk=
MIME-Version: 1.0
Received: by 10.239.141.143 with SMTP id c15mr639847hba.47.1259103005238; Tue, 
	24 Nov 2009 14:50:05 -0800 (PST)
In-Reply-To: <1259067237-25725-1-git-send-email-Sebastian@SSpaeth.de>
References: <4B0BD1AC.1010806@SSpaeth.de>
	<1259067237-25725-1-git-send-email-Sebastian@SSpaeth.de>
Date: Tue, 24 Nov 2009 23:50:05 +0100
Message-ID: <c384c5ea0911241450s2189ea17t4f05680d2c0c37d7@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] navit: Do not set /proc/sys/vm/overcommit in an app launcher, especially not without ever changing it back.
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
X-List-Received-Date: Tue, 24 Nov 2009 22:51:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

On Tue, Nov 24, 2009 at 1:53 PM, Sebastian Spaeth <Sebastian@sspaeth.de> wrote:
> * This reverts parts of 742fb4ae71e6a7e655385086ba9edebbf00b6ebd
> * If someone wants to do use this, it should be done on a more finegrained distro basis
>
+1 for the reverting patch.

Agreed with the remark this belongs in distro policy.

>
> -# On devices with low memory (< 512Mb?) Navit will segfault on start.
> -# This can be worked around by doing
> -# "echo 1 > /proc/sys/vm/overcommit_memory"
>

Regards,
-- 
Leon


