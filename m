Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J3puv-0008W1-3u
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2007 10:36:13 +0100
Received: by fg-out-1718.google.com with SMTP id 22so142438fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2007 01:31:31 -0800 (PST)
Received: by 10.86.81.8 with SMTP id e8mr5126034fgb.32.1197797491173;
	Sun, 16 Dec 2007 01:31:31 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 31sm15423561fkt.2007.12.16.01.31.29
	(version=SSLv3 cipher=OTHER); Sun, 16 Dec 2007 01:31:30 -0800 (PST)
Date: Sun, 16 Dec 2007 11:36:50 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1518712155.20071216113650@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <4764AEE7.5040908@whitby.id.au>
References: <164348748.20071215043923@gmail.com>
	<c384c5ea0712150526i2a8147c5ud43b5e79c52a7feb@mail.gmail.com>
	<1515905492.20071215173513@gmail.com>
	<4764AEE7.5040908@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] ANGSTROM_MODE -> SYSTYPE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Dec 2007 09:36:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Sunday, December 16, 2007, 6:51:51 AM, you wrote:

> Paul Sokolovsky wrote:
>>   Well, SYSTYPE has another aim and idea in its introduction. I hinted
>> about that in original mail, now let me make it explicit: the proposal
>> is about introduction of the standard OE variable name for distro
>> parameter tweaking. Its meaning however completely depends on the
>> distro. Some distro needs switch libc's. Some needs to switch WMs.
>> Others need to switch many other things, possibly, in combinations.
>> Very good. OE recommends a standard general syntax for that - a
>> SYSTYPE. Exact format of what goes into SYSTYPE and its semantics is
>> up to distro (and users will know about all that by reading distro's
>> docs). (Now that we talk about validation, it puts additional
>> syntactic constraints on SYSTYPE value, that's why I'm personally not
>> keen to start with [rigid] validation from the beginning).

> How is this different to the USE flags proposals that have come and gone
> in the past?

  At least in naming. Because whenever word "USE" appears in
discussion, someone comes to explain hardnesses of QAing a system,
packages of which are being built using different compile-time
settings.

  At the same time, OE already uses generalized USE conception a lot:
DISTRO_FEATURES, MACHINE_FEATURES - are all those generalized USE
flags, just working not on the package configuration level (like some
other systems allow, and we don't want), but on distro configuration
level. But DISTRO_FEATURES & MACHINE_FEATURES are "blackbox"
parameters, intended for developers. You can't drop "wifi" from
Angstrom's DISTRO_FEATURES and still call/think that it is Angstrom.
On the other hand, SYSTYPE is intended as a whitebox parameter,
together with the other 2 - DISTRO & MACHINE providing the well-known
and complete set of knobs allowing *user* to build a legitimate distro
image adjusted to user's need, and within the bounds allowed by a
distro.

> -- Rod



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



