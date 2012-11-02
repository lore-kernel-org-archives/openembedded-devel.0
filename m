Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rangers.av@gmail.com>) id 1TU8H6-0005Do-3F
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 04:50:28 +0100
Received: by mail-wg0-f43.google.com with SMTP id dq11so1945375wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2012 20:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=nM7txkQ2hM9FHoi3tsHLMinm18ksImiyq0Tbt7NofLY=;
	b=NLhOBWTmR5XC8N80/rSKnkLr4/zpQ7R70o8SksggGMldAaxFWa/FkoS82ISrB13CIT
	PyEHIhBUYQS4jxivrnlMLa7X2FrX9yJ5HDbiSFdQTTj+i3ulyxDmE5QDH7Q/FKmWBzWB
	u+RB8yJ52PaEmu8FrytUK88tFRSiWRUP0fo9v8adG6daqJwyTIvndtyGIPtkeXhhtS7+
	v7uOKjXjTTKXsBVHezVSbN7XDYS2SKzum6mWB59j8EFWfBoq2rB18BctSskZYPjhbTO0
	MRAaAuMy9Vy1kcLBAlFEvIj8i8SsYrAwdE0jYJlHMJ4ZhfrO8ic7KAqh4PENa2LpomPI
	ViCw==
MIME-Version: 1.0
Received: by 10.180.8.134 with SMTP id r6mr777803wia.18.1351827409098; Thu, 01
	Nov 2012 20:36:49 -0700 (PDT)
Received: by 10.194.85.78 with HTTP; Thu, 1 Nov 2012 20:36:49 -0700 (PDT)
In-Reply-To: <CAMQ5J2abu7O9cDJ3Fmzwuakww=WK+rkf1qjh3fGZXvtWu-yHMg@mail.gmail.com>
References: <CAMQ5J2abu7O9cDJ3Fmzwuakww=WK+rkf1qjh3fGZXvtWu-yHMg@mail.gmail.com>
Date: Fri, 2 Nov 2012 09:06:49 +0530
Message-ID: <CAMQ5J2bi94mfd4Hrf9nFcTdn8+wy4rLRA99WmoLT9ZvP9NTmfA@mail.gmail.com>
From: RaNgErS <rangers.av@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Solved] Bluetooth library and corresponding errors.
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
X-List-Received-Date: Fri, 02 Nov 2012 03:50:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Added


LIBBTH_CC=`pkg-config --bluez`


Thats all. :-)

Thanks
RaNgErS



---------- Forwarded message ----------
From: RaNgErS <rangers.av@gmail.com>
Date: Tue, 30 Oct 2012 09:38:34 +0530
Subject: [oe] Bluetooth library and corresponding errors.
To: openembedded-devel@lists.openembedded.org

Hi,

I am trying to make a recipie with usb & bluetooth support. I added

LIBUSB_CC=`pkg-config --cflags libusb-1.0`

for usb. But for bluetooth dont know what to add. so I am getting these
errors :

undefined reference to `hci_get_route'
undefined reference to `hci_open_dev'
undefined reference to `hci_inquiry'
undefined reference to `ba2str'
undefined reference to `str2ba'
undefined reference to `hci_read_remote_name'


all from my sample code which build with the same recipie. what is the
equivalent bluetooth library?

Thanks
RaNgErS



-- 
     RaNgErS
THIS IS STRANGE


