Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rangers.av@gmail.com>) id 1TT3L8-0001Gv-E3
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 05:22:10 +0100
Received: by mail-lb0-f175.google.com with SMTP id y2so3516514lbk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2012 21:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=hEajiqEVFoyetLykBJqEE5Dz3Xha02nehtWhrDXiJ7g=;
	b=DfwjB6YI6d/3ntPLijJ+aMqbclDYKWo0y2xUbHbB0dtQHL9nCE1wqiNFNseLnselMb
	sd2VqQqNGQU9OEojBdT9UPO3ssbrt8Q1XnfRNGmyihOH1K5vwCPjV9R9dE6p2rjg+YXm
	1x7d32F8Y224764HFm3MoC19VnK6lHoJEaccpoCi780JhoP43Dy0MkuM3AxXfs7DtSqc
	dreSYUINoTjknnhUxMgOMd/QWiE9ELzelzUceFmZtRrbK0/R4B/tLoKaJcGAoF6k2YWa
	zDIICV3HZYrrtqapnesCgi2SqiswjTa87kCBKfMgjHAG86AzZwLAKzijj8yo7mSpc+H6
	2QyQ==
MIME-Version: 1.0
Received: by 10.112.102.10 with SMTP id fk10mr12805268lbb.40.1351570115385;
	Mon, 29 Oct 2012 21:08:35 -0700 (PDT)
Received: by 10.112.28.8 with HTTP; Mon, 29 Oct 2012 21:08:34 -0700 (PDT)
Date: Tue, 30 Oct 2012 09:38:34 +0530
Message-ID: <CAMQ5J2abu7O9cDJ3Fmzwuakww=WK+rkf1qjh3fGZXvtWu-yHMg@mail.gmail.com>
From: RaNgErS <rangers.av@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Bluetooth library and corresponding errors.
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
X-List-Received-Date: Tue, 30 Oct 2012 04:22:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

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

