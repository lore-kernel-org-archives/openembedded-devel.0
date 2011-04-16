Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QB3zy-00037v-Dg
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 13:49:10 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id BF9BFEB455
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 13:29:14 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AlMzAGR8qU1T4zkqPGdsb2JhbAAMiQuPOY1KAQEBATfDRIVxBI4Dhjc
X-IronPort-AV: E=Sophos;i="4.64,223,1301868000"; d="scan'208";a="182082827"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.57.42])
	by ipb1.telenor.se with ESMTP; 16 Apr 2011 13:29:14 +0200
Message-ID: <4DA97D88.9020509@atmel.com>
Date: Sat, 16 Apr 2011 13:29:12 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
Subject: undefined reference to `__gnu_thumb1_case_uqi'
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
X-List-Received-Date: Sat, 16 Apr 2011 11:49:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The following code, (part of a bootloader - at91bootstrap-3.0)

"void sub(unsigned char Mode)
{
    switch (Mode) {
    ...
    /* 4 case statements */
"

generates an error when compiling in thumb mode, using the latest OE.

"undefined reference to `__gnu_thumb1_case_uqi'"

I think this subroutine will optimize a switch statment
with only a few choices.


Googling for this seems to indicate that __gnu_thumb1_case_uqi is part
of libgcc, but hidden.

Switches used: -DCONFIG_THUMB -mthumb -mthumb-interwork

Any clues on fixing this?
Meanwhile I will rewrite the bootloader using if statements

Best Regards
Ulf Samuelsson



