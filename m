Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KfiJE-000678-Uo
	for openembedded-devel@openembedded.org; Tue, 16 Sep 2008 23:42:09 +0200
Received: by rv-out-0708.google.com with SMTP id k29so2871195rvb.0
	for <openembedded-devel@openembedded.org>;
	Tue, 16 Sep 2008 14:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=VIwR2oxh4hzBbrPMSmc7NKzdBZuSLH11lB+nD6zLluk=;
	b=kBLk+hA7KmPnRLKgrADKX6m1dmvmz+LQ1Uz8O0EMSpX4OKm5HtNVQxKv+q3zu9l7v9
	ozsbddkJ28Zmz8fb3pusE3dVCAKHvsF1gIXSShb51kVMjNdgbJIqB+yhRQ+qGq7w94vK
	7S7bFvu7N9UJ8QxzNN5rppxlsdZX1gfG4TFek=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=PUssPACYHqVdQJNBR1Vr0W4TXpP7Sm20IQlusoDH+EYlCWCTNtZ+U/7NPek9vpapoY
	b1kJ0r78WLJyhaj+Swcb4fCbuvSfdjenG/uKIibLNEyEskmsAmlOqbOSZk1wcwol+pHA
	2NUVU2xJTp/zyrWQcE1EKRGjfAYS2ShOSBFcc=
Received: by 10.140.161.11 with SMTP id j11mr6055645rve.134.1221601144561;
	Tue, 16 Sep 2008 14:39:04 -0700 (PDT)
Received: by 10.141.66.18 with HTTP; Tue, 16 Sep 2008 14:39:04 -0700 (PDT)
Message-ID: <f96d234e0809161439tc0ed410jad0ae837edd24e29@mail.gmail.com>
Date: Tue, 16 Sep 2008 17:39:04 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gap6bl$2ca$1@ger.gmane.org>
MIME-Version: 1.0
References: <f96d234e0809161327v2d71e99bx79192593ff99086a@mail.gmail.com>
	<gap6bl$2ca$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: xserver-kdrive 1.4 and USB keyboard
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
X-List-Received-Date: Tue, 16 Sep 2008 21:42:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 16, 2008 at 4:53 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Cliff Brake wrote:
>>
>> Does anyone have this combination working yet?
>>
>> On my system, ctrl-alt-f1 does not work, and caps/num lock lights do
>> not work when X is running.  Keyboard works fine at the console.
>
> I suspect that's because kdrive 1.4 lacks a default keymap. Graeme provided
> a really bare-bones one that makes X access keys (e.g. xkbd,
> matchbox-keyboard). Making USB keyboards work properly proved to be too much
> work, so I am now using full-blown Xorg on anything with a usb-keyboard.
> Having said that, the A-z keys did work on beagle, the fact that left-mouse
> button clicks produced a 'q' was the final straw (clock on window running
> powertop - boom).
> Something is very broken in kdrive, which might be due to people working on
> it only care for tablets from a certain scandinavian company.

Thanks.  Yes, you are correct.  I can get arrow keys, and enter to
work, but not cap/num lock or Ctrl-Alt-F1.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


