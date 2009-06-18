Received: from [209.85.216.194] (helo=mail-px0-f194.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MHAyt-0005zF-3u
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 08:20:20 +0200
Received: by pxi32 with SMTP id 32so461860pxi.0
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 23:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:message-id
	:content-type:content-transfer-encoding;
	bh=03d57ppIdfKMfOn+JnSWKDS5TCtSnGGIaWBT9h7Q2mA=;
	b=YIJKwxrL2i5y9Rrvg0jmzY7DW7QSopzWbGwAnmEs7nTW/KpQwyBa79y5Qdej+LnKyE
	RPijtSEp/wmVOAguA31B5PR3nLD+W7w52XoIMI+M3WZZhXToAD0t7Euzsui+9N4W8//l
	Ncy+2Ye4MEftlp/Jv11xxtUBmzxgbVSn1CC7o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:message-id:content-type:content-transfer-encoding;
	b=diGelN6vzL/oK8bIH3lY7RCEF0Mr14i1HM7g6LqbDbM4djj2hTwZ9GhXTWXw5ay4ev
	kAyEODnAduUV0GHCQnM4HrdHnUS5YAEU2gcyh+Gq0rBm4nNafoginPbLyg/1EcHsW8ha
	2E0cLSVVgluELKYytmZtvvv23wwKYWIwqhmdI=
Received: by 10.114.46.6 with SMTP id t6mr1568646wat.25.1245305382567;
	Wed, 17 Jun 2009 23:09:42 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-3-71.dsl.pltn13.sbcglobal.net
	[71.146.3.71])
	by mx.google.com with ESMTPS id m17sm272182waf.38.2009.06.17.23.09.41
	(version=SSLv3 cipher=RC4-MD5); Wed, 17 Jun 2009 23:09:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 23:09:40 -0700
User-Agent: KMail/1.11.90 (Linux/2.6.28-13-generic; KDE/4.2.90; x86_64; ; )
References: <4A365C10.8020307@mta.it>
	<c384c5ea0906150803v223fc517se185b7fbe8a4859e@mail.gmail.com>
	<4A3666E5.4040304@mta.it>
In-Reply-To: <4A3666E5.4040304@mta.it>
MIME-Version: 1.0
Message-Id: <200906172309.40571.raj.khem@gmail.com>
Cc: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Subject: Re: nof/libgcc_s.so installed instead of libgcc_s.so on powerpc
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
X-List-Received-Date: Thu, 18 Jun 2009 06:20:27 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 June 2009 08:21:09 am Matteo Fortini wrote:
> I'm building on i686 a cross compiler for the mpc5121.
> 
> The machine description I'm using is:
> 
> TARGET_ARCH = "powerpc"
> TARGET_FPU = "hard"

Seems like we are missing right multilib option. Can you post
your complete gcc build log and configure options.

Thx

-Khem


