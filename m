Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Kfzt2-0001p5-GY
	for openembedded-devel@openembedded.org; Wed, 17 Sep 2008 18:28:16 +0200
Received: by rv-out-0708.google.com with SMTP id k29so3259954rvb.0
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Sep 2008 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=cPp5pBIIq/TGTzou4l0xuHXiMU6ON1tpS+4QKppaFuc=;
	b=JO0BF+UiuaCtbP+AkO7eK0gPnCQiIivoHh6WbL5CFTs7tQ3Z5alfdHQfMDj58t6ag0
	ByVhcUg68wWJcvfJNWgc1EEn+Hlq6AsgS2CgrzMon2Zi854gwe3X3FoFAuwUsQNV6/mp
	2kK8M3/gmtYtwF0DPT4h/i8l1JnuMnMYF1uiY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=INvso919cTWpCcrPXabiHqU1CUhYNNHISRoULEDC9vqc4pCK5mVJ1IbiFRpwSiqNT1
	2segVhh56jyDDF/bnKrEBwoyEzh4BDlhnp31ukGrdx8rg5iLuJ6rwzalpGoBqmzMFvsd
	6IvDsHlQTTgw+hKJ5fe9Jk56/sCLiK/na/ROU=
Received: by 10.141.27.16 with SMTP id e16mr6657781rvj.136.1221668708712;
	Wed, 17 Sep 2008 09:25:08 -0700 (PDT)
Received: by 10.141.66.18 with HTTP; Wed, 17 Sep 2008 09:25:08 -0700 (PDT)
Message-ID: <f96d234e0809170925o139a0156h17f84a484bd3438b@mail.gmail.com>
Date: Wed, 17 Sep 2008 12:25:08 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gaql1h$b9$1@ger.gmane.org>
MIME-Version: 1.0
References: <f96d234e0809161327v2d71e99bx79192593ff99086a@mail.gmail.com>
	<gap6bl$2ca$1@ger.gmane.org>
	<f96d234e0809161439tc0ed410jad0ae837edd24e29@mail.gmail.com>
	<gaql1h$b9$1@ger.gmane.org>
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
X-List-Received-Date: Wed, 17 Sep 2008 16:28:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 17, 2008 at 6:09 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> Thanks.  Yes, you are correct.  I can get arrow keys, and enter to
>> work, but not cap/num lock or Ctrl-Alt-F1.
>
> In that case fixing the keymap would be the way to go. You'll need to poke
> the resident X exports on how to do that properly, though :)

xmodmap lists some diff between 1.3 and 1.4:

1.3:
shift       Shift_L (0x32),  Shift_R (0x3e),  Menu (0x78)
lock        Caps_Lock (0x42)
control     Control_L (0x25),  Control_R (0x69)
mod1        Alt_L (0x40)
mod2        Num_Lock (0x4d)
mod3
mod4        Mode_switch (0x6c)
mod5


1.4:
shift
lock
control
mod1
mod2
mod3
mod4
mod5

Stuffing the 1.3 xmodmap settings into Xfbdev 1.4 does not seem to
make any difference, so more digging ...

Cliff


