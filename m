Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1PiDLn-0001vs-6T
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 22:56:27 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id C68BAEA5D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 22:24:36 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvwQAL8fQE1T4zjzPGdsb2JhbAAMoACEdwEBAQE1vT6FTwSLFIEV
X-IronPort-AV: E=Sophos;i="4.60,382,1291590000"; 
	d="scan'208,217";a="167758261"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.243])
	by ipb2.telenor.se with ESMTP; 26 Jan 2011 22:24:36 +0100
Message-ID: <4D409113.9030603@atmel.com>
Date: Wed, 26 Jan 2011 22:24:35 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D3FEC09.5070306@atmel.com>	<201101261401.02414.marcin@juszkiewicz.com.pl>	<4D405B8C.805@atmel.com>
	<20110126200620.GH3616@jama>
In-Reply-To: <20110126200620.GH3616@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problem with calibration of AT91SAM9M10EKES
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
X-List-Received-Date: Wed, 26 Jan 2011 21:56:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-01-26 21:06, Martin Jansa skrev:
> On Wed, Jan 26, 2011 at 06:36:12PM +0100, Ulf Samuelsson wrote:
>> 2011-01-26 14:01, Marcin Juszkiewicz skrev:
>>> Dnia s'roda, 26 stycznia 2011 o 10:40:25 Ulf Samuelsson napisa?(a):
>>>> I have some calibration problem with my private branch
>>>> (ulf/linux-2.6.30-2011-01-??) when building the at91sam9m10ekes board.
>>>>
>>>> I am running /usr/bin/run-calibrate.sh,
>>>> but regardless of how I click, during calibration,
>>>> a tap afterwards always results in detection 3 mm above the tap.
>>>>
>>>> There is a "pointercal" file generated.
>>>> It appears to me that this is ignored...
>>>> I can tap 1 cm above or below during calibration,
>>>> and still the detected tap is 3 mm above the actual tap.
>>>> Anything else to think about?
>>>> I enclose  /etc/X11/xorg.conf and /etc/ts.conf.
>>> You are using full X11 with evdev driver so tslib is not used at all. You have
>>> to use xinput-calibrator.
>>>
>>> Regards,
>> Any clue to get xinput-calibrate to run at first boot?
> provide
> recipes/xinput-calibrator/pointercal-xinput
> data for your device and use
> recipes/xserver-common/files/89xTs_Calibrate.xinput_calibrator.patch
> like SHR does
OK, then is the question how:
As I noted:
SRC_URI_append_angstrom = " file://xtscal-fix.patch "
RDEPENDS_${PN}_append_angstrom = " tslib-calibrate "
RDEPENDS_${PN}_append_shr = " xinput-calibrator "?

so Angstrom (which I am using) is using "tslib-calibrate"
Is there any drawback in changing this to " xinput-calibrator "

Adding a SRC_URI_append_at91 seems a kludge.

> intentionaly it prefers provideded data, because users too often messed
> initial calibration on first boot and then didn't know how to reset it
> and rerun xinpu-calibration successfully...
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson


