Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HJc1H-0007WB-2y
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Feb 2007 21:55:27 +0100
Received: by nf-out-0910.google.com with SMTP id l24so2745046nfc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2007 12:55:25 -0800 (PST)
Received: by 10.49.20.15 with SMTP id x15mr6586997nfi.1172004925747;
	Tue, 20 Feb 2007 12:55:25 -0800 (PST)
Received: from CUBE ( [77.122.177.58])
	by mx.google.com with ESMTP id g1sm31895716nfe.2007.02.20.12.55.24;
	Tue, 20 Feb 2007 12:55:25 -0800 (PST)
Date: Tue, 20 Feb 2007 22:55:28 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1908706584.20070220225528@gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
In-Reply-To: <45D9CFF7.8060502@kernelconcepts.de>
References: <E1HFb2e-0007GK-Jp@linuxtogo.org>
	<45D9CFF7.8060502@kernelconcepts.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev xserver-common 1.13: Re-add calibrate-only-if-ts.patch after merge.
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
X-List-Received-Date: Tue, 20 Feb 2007 20:55:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Florian,

Monday, February 19, 2007, 6:27:35 PM, you wrote:

> Hi,

> pfalcon commit schrieb:
>> xserver-common 1.13: Re-add calibrate-only-if-ts.patch after merge.

> that's a very good idea but I am sure the patch will break calibration on quite
> some devices because the device might have a different name. Maybe use
> detect-stylus for this purpose.

  There was RFC to standardize name of touchscreen device in OE, and
at the beginning of year corresponding changes were made (not by me
;-) ). For all 2.6 devices (which has standardized touchscreen support),
there's a udevd rule which creates symlink from /dev/input/touchscreen0 to
real device. Maintainers of 2.4 devices (which are mostly replaced with 2.6
versions in OE.dev by now) are expected to provide such link by other
means - either create link specific to some device, or use tool like
detect-stylus.

  Such change does good job of clarifying touchscreen detection in system
(you might remember my tries few months ago to implement it cleanly in
Familiar).

  I understand that such a change would be too liberal for GPE mainline
at this time, but OE.dev provides nice staging ground for that, so
let's see how it goes.

> Greetings

> Florian




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



