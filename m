Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SPq24-0001w6-5m
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 09:00:56 +0200
Received: by eaae1 with SMTP id e1so338341eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 23:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=0jlQTKpPBTs3WdJJi1ss3hrIgUscUrIoa/hTGkObdlc=;
	b=wR1/13t33A38djgX+R/xyGk3miLW6szoDSNJiWn/0b9rmDcNCQ03mN58OqdOUbcO8K
	p46hx89HMgOBZezWsR1XU6WRGt13k+LvgAqvRBbhbSl19nXY0B6qpqEImbGe56DL2PeC
	cyAsqRW2JIY+h66bhrCsnjvbpCQ6JCfcECoOMG0dSSAXwOgd5Gm6+TkOTUE4VIZoNrno
	9y2U29M1WijtNjoPNRsCx+6oO5clifPKvsEf3vnOQgb0pVu/TzyY2B7BzyxxeNsnogPo
	K6/2geiqC/CzaHvurWWBWznH/fpzAWdXxDqPFtYF4w7HAyfOMJWLVKpVlEDScS41FdD+
	tqdQ==
Received: by 10.213.123.1 with SMTP id n1mr167636ebr.130.1336027871226;
	Wed, 02 May 2012 23:51:11 -0700 (PDT)
Received: from [10.54.74.16] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id d18sm20557101eeb.7.2012.05.02.23.51.09
	(version=SSLv3 cipher=OTHER); Wed, 02 May 2012 23:51:09 -0700 (PDT)
Message-ID: <4FA22A58.3040100@gmail.com>
Date: Thu, 03 May 2012 08:48:56 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120326 Thunderbird/10.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
	<4F9F8630.3070901@gmail.com>
	<CAMKF1spxTuL1b6yMN=N68tq=MLfJGT9jmgd6VzHmY+TwZvNLsA@mail.gmail.com>
	<4FA0FFD5.6080201@gmail.com> <4FA1A1C8.3030705@gmail.com>
In-Reply-To: <4FA1A1C8.3030705@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Thu, 03 May 2012 07:00:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/12 23:06, Khem Raj wrote:
> On 05/02/2012 02:35 AM, Martin Ertsås wrote:
> > The patches posted seems to be working fine. I at least didn't have
> > any problems with them.
>
>
> thanks for trying them out. GCC patch is final but eglibc patch I
> still got to improve that its not final version yet.

No problem. Is there also plans for renaming the toolchains created to
arm-none-linux-gnueabihf when using hardfloats? Tried doing that, but
gcc failed first. Then, after patching up gcc like a madman as well as
adding linux-gnueabihf to the package_qa_get_machine_dict dictionary in
insane.bbclass, several other projects failed. Among them were openssl
and shadow as far as I remember. Probably others as well, but that's
where I gave up.

Cool, so this will be put upstream with gcc 4.7 and eglibc 2.15? Btw, I
was trying your patches with 4.6, not 4.7, as we have not attempted to
migrate right now. Will do that soon though, but not right now.

- Martin

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


