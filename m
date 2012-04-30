Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOxdG-000620-Qj
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 22:55:42 +0200
Received: by lagw12 with SMTP id w12so2117582lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DnMFYBmnNAHlL82DGfXcQ7NrvBCQ8cBWS7Vipd/PRU4=;
	b=iBA55Z6Cv+YWyeDyI4DE00miBho6dcHksm8f8Gn1Nr7KYH1sWOIPG8kQooaH3ZgKv4
	douUTL7GlWkKV8fjS6IxZAcN8qhTXuqQn+s5hW8lChuhJQ6e149pOM7q/dkB12ZeAFzu
	H6E71l5rsqlc/rIx+ImIYa4BZrjglUhaAJCSPhLfu2BRvXIY0VNZKEWfULqKadcgo6vC
	k9KNpW11/jmTAMllXmukd/KlEEIwFl6XlLPpwXv5hSX+osOHDPcBxvqJNwi8Z/ICxHbj
	OfGQyuPFpQ2y2uKb6ZRxkrJo+pwVU74MTYsI1OqM+KC49L/FBHKaisW5pXKR87pX1iNo
	dzcA==
Received: by 10.112.32.72 with SMTP id g8mr4565285lbi.43.1335818756095; Mon,
	30 Apr 2012 13:45:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Mon, 30 Apr 2012 13:45:24 -0700 (PDT)
In-Reply-To: <4E6C197A-8F6B-47BF-AD7C-2741978F2833@mac.com>
References: <92932941-A66D-45AF-8CDC-8F56D66C4E02@gmail.com>
	<CAMKF1soQ+eShsN+r5ZPA60vSEmEKZmKCM-WTt0mhghVUAteOUg@mail.gmail.com>
	<169F7DFB-B916-4EA8-BC37-C451F76E466A@gmail.com>
	<CAMKF1sqdoJsqdyG-gG-Tzif4kZ-wMB3jbunC5n7ru5H1CALy1Q@mail.gmail.com>
	<A7836DF4-B075-4275-8BB8-9C595AE0A9C4@gmail.com>
	<4E6C197A-8F6B-47BF-AD7C-2741978F2833@mac.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2012 13:45:24 -0700
Message-ID: <CAMKF1soBh12AN=oay4xWOvYFegJqJ369jdkMKbrxCSkQJutyYw@mail.gmail.com>
To: Elvis Dowson <elvis.dowson@mac.com>
Cc: Neil MacMunn <neil@gumstix.com>, OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: gcc-4.4.1 assembler error: offset out of range
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
X-List-Received-Date: Mon, 30 Apr 2012 20:55:43 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 30, 2012 at 1:01 PM, Elvis Dowson <elvis.dowson@mac.com> wrote:
>
> gcc-4.5.x compiled successfully, as soon as I switched to binutils-2.21.

OK so its an assembler issue, yeah using 2.21 and gcc 4.4.1 you have a
better chance of succeeding now.


