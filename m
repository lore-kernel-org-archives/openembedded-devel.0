Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RSXyw-0001k6-Ps
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 18:48:39 +0100
Received: by wwp14 with SMTP id 14so8687915wwp.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 09:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=gK2+1COcuAdpunYfoEMo7EejJGB0v9wB/d9HwHxLtzA=;
	b=mqhV0ddqllP5Zw4B0sdYG8bwIywpLcRcWnBIUperBFYG63uBFw6P+EUFCVkzKuQFsm
	0hTPnZWvzdX55zMcdZ+ayNXVN6LC/RJfYm3WO4YRmO9UoTn6jeL1IMPUyL/XJmFaVGQj
	9CSnwye5yoPF+lBg9X0ottU7aPr8BM60tcFa0=
MIME-Version: 1.0
Received: by 10.216.221.160 with SMTP id r32mr2269131wep.54.1321897328939;
	Mon, 21 Nov 2011 09:42:08 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.37.6 with HTTP; Mon, 21 Nov 2011 09:42:08 -0800 (PST)
In-Reply-To: <2451003.Qx4lekPWFq@helios>
References: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
	<6297782.2EN2Ceo0kI@helios> <jae01t$scs$1@dough.gmane.org>
	<2451003.Qx4lekPWFq@helios>
Date: Mon, 21 Nov 2011 11:42:08 -0600
X-Google-Sender-Auth: RfW872sGtdiOcL0FfXlXrKsXsjE
Message-ID: <CAPOJ94PYDr0MF8C4s4no6d6hrW_sd8_GRioPrnsmxdQf0QyVJA@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: dm3730
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
X-List-Received-Date: Mon, 21 Nov 2011 17:48:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 21, 2011 at 11:06 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 21 November 2011 17:59:41 Koen Kooi wrote:
>> Op 21-11-11 17:47, Paul Eggleton schreef:
>> > On Monday 21 November 2011 17:10:30 Koen Kooi wrote:
>> >> Worse, if you follow the offical yocto instructions you'll get only
>> >> broken and/or incomplete beagleboard support.
>> >
>> > Rather than vague assertions perhaps you would care to elaborate on
>> > what's broken and/or incomplete about our beagleboard support?
>>
>> I hope the irony of yocto people asking other people what their own layers
>> actually support isn't lost on the people involved.
>
> There's no irony at all. I personally am not an expert on the beagleboard.
> Given that you *are* however, perhaps you might have simply said - as you
> point out, in the context of this discussion - that the Yocto project doesn't
> include DSP support for the beagleboard?

oe-core+meta-ti will not support dsp for new developers either, at
least not until ti-cgt6x is updated to correspond to the
ti_cgt_c6000_6.1.17_setup_linux_x86.bin currently available from TI,
or somebody makes the old binary available.

Peter


