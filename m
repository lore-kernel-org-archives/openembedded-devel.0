Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pi2Au-0002wx-79
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 11:00:28 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 25E94C017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:40:26 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvcUAL96P01T4zjzPGdsb2JhbAAMiE+NfI4qAQEBATW8ZoVPBIwp
X-IronPort-AV: E=Sophos;i="4.60,379,1291590000"; d="scan'208";a="167519462"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.243])
	by ipb2.telenor.se with ESMTP; 26 Jan 2011 10:40:26 +0100
Message-ID: <4D3FEC09.5070306@atmel.com>
Date: Wed, 26 Jan 2011 10:40:25 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Problem with calibration of AT91SAM9M10EKES
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
X-List-Received-Date: Wed, 26 Jan 2011 10:00:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
I have some calibration problem with my private branch
(ulf/linux-2.6.30-2011-01-??) when building the at91sam9m10ekes board.

I am running /usr/bin/run-calibrate.sh,
but regardless of how I click, during calibration,
a tap afterwards always results in detection 3 mm above the tap.

There is a "pointercal" file generated.
It appears to me that this is ignored...
I can tap 1 cm above or below during calibration,
and still the detected tap is 3 mm above the actual tap.

I tried this on two boards, with the same problem!


I looked at 89xTs_Calibrate
There is no /etc/init.d/devmand  - What does this file do?

Anything else to think about?
I enclose  /etc/X11/xorg.conf and /etc/ts.conf.

----------------------------------------------------
xorg.conf:

Section "ServerLayout"
     Identifier "default"
     InputDevice "atmel-tsadcc" "CorePointer"
EndSection

Section "InputDevice"
     Identifier "atmel-tsadcc"
     Driver "evdev"
     Option "Device" "/dev/input/touchscreen0"
EndSection

Section "InputDevice"
     Driver        "mouse"
     Identifier    "Mouse[1]"
     Option        "Buttons"    "10"
     Option        "Device"    "/dev/input/mice"
EndSection

Section    "InputDevice"
     Driver        "kbd"
     Identifier    "Keyboard[0]"
     Option        "Protocol" "Standard"
EndSection


----------------------------------------------------
ts.conf:
# Uncomment if you wish to use the linux input layer event interface
module_raw input

# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
# module_raw collie

# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
# module_raw corgi

# Uncomment if you're using a device with a UCB1200/1300/1400 TS interface
# module_raw ucb1x00

# Uncomment if you're using an HP iPaq h3600 or similar
# module_raw h3600

# Uncomment if you're using a Hitachi Webpad
# module_raw mk712

# Uncomment if you're using an IBM Arctic II
# module_raw arctic2

module pthres pmin=1
module variance delta=30
module dejitter delta=100
module linear

-- 
Best Regards
Ulf Samuelsson



