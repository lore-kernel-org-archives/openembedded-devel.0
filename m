Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KfhBW-0007lJ-MK
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Sep 2008 22:30:06 +0200
Received: by wf-out-1314.google.com with SMTP id 29so2923219wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2008 13:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=7m9OWcyf+JwoAgH8bktHHNDEFFm2yVE32Kacgb1mlWk=;
	b=GVk9sXJbQFqhcOqqDscaNtUo+B8gDZoJWr6frNydAWT6BPzutYlPv25Mk6fbyrNmEr
	IeneCHCUC0m6Jk1rvgZq7JmL1pCRf7lxDMYWHeFp3A8g8Bl7037llNrxjmNzjSfCoxRc
	esQT7sLVu0RsB2OGRw7iQLcWJI5boLFcioNXg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=yHaCIKXsa2rFHq9jt/jnrSaI1bV10SfWB9Qr9a6fT7bvMWYV3yB3LUCANP+1XM3Xmn
	M/3+STxlQDXAC570y1AcegN+gSYW0QeEKcstaOdrBi+lMW7xesYkjC9ibTMEwgUrTn2l
	NYe/OhEI2Z/xtiqivNwPqR7UQZmQYIgC/NNW4=
Received: by 10.140.136.6 with SMTP id j6mr5991719rvd.231.1221596822223;
	Tue, 16 Sep 2008 13:27:02 -0700 (PDT)
Received: by 10.141.66.18 with HTTP; Tue, 16 Sep 2008 13:27:02 -0700 (PDT)
Message-ID: <f96d234e0809161327v2d71e99bx79192593ff99086a@mail.gmail.com>
Date: Tue, 16 Sep 2008 16:27:02 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: xserver-kdrive 1.4 and USB keyboard
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
X-List-Received-Date: Tue, 16 Sep 2008 20:30:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Does anyone have this combination working yet?

On my system, ctrl-alt-f1 does not work, and caps/num lock lights do
not work when X is running.  Keyboard works fine at the console.

It works fine with xserver-kdrive-fbdev 1.3

with 1.4, it seem there are some options added:

-keybd driver [,,options]      Specify the keyboard driver and its options
-kb                    disable the X Keyboard Extension
+kb                    enable the X Keyboard Extension

In the source code, I found the following:

 ./hw/kdrive/ephyr/Xephyr :1 -fp /usr/share/fonts/X11/misc/ -mouse
ephyr -keybd ephyr,,xkblayout=br,xkbmodel=abnt2

/*
 * You can call your kdriver server with something like:
 * $ ./hw/kdrive/yourserver/X :1 -mouse evdev,,device=/dev/input/event4 -keybd
 * evdev,,device=/dev/input/event1,xkbmodel=abnt2,xkblayout=br
 */

there are a few patch files that might be related:
./xserver-kdrive-1.4.0.90/no_xkb.patch
./xserver-kdrive/optional-xkb.patch

I'm slogging through the source code, but would appreciate any ideas
from anyone who understands this or has it working.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


