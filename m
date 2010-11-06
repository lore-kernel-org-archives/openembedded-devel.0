Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PErzI-0008Sh-QR
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 00:15:59 +0100
Received: by qyk4 with SMTP id 4so102348qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 16:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=9cI9UY+yKrlT5XtRkG1U3J6l/6D+doZqgzeceX5edUo=;
	b=Y6ChUvfrxTHR7PjCrNqHDThOikEmkd/OfT9AFj2KXaMFwubeOM1qHUSU13hP1FR27d
	/G5cWIfgVgVkGZtpujKrH6broDR4Cy4/+S4sKcHwjY4xHoS2cq0aWr3Pba60IGbX4r42
	ZbfS8SN3xz5pzNsg8FS520LSpFZDtPmZXNLkw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=gpQqNlskR6ltsVm5UAh2TjhYNOrD+rIs35EpkbLiKWmsB4yOHjgkoDStPwGnaU4v6i
	iGUC/fnI10VVbbfpNhiTNYFyUn6gvp70Eq2D832Fl4GfX4FS6nz9s0tlR2X2O7ozaNjj
	aoppfodEd1xzI/zwt8dp3SIcgw+aGUY2mS1bs=
MIME-Version: 1.0
Received: by 10.229.99.84 with SMTP id t20mr3544900qcn.120.1289085291280; Sat,
	06 Nov 2010 16:14:51 -0700 (PDT)
Received: by 10.229.212.85 with HTTP; Sat, 6 Nov 2010 16:14:51 -0700 (PDT)
Date: Sun, 7 Nov 2010 00:14:51 +0100
Message-ID: <AANLkTi=hBHFcAJNWr2=Z=51J=rOZ8Cf_+KGyvQiFFdKN@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: image.bbclass adding unconditionally glibc-localedata
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
X-List-Received-Date: Sat, 06 Nov 2010 23:16:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Since commit 4271024e26551da70e710cef6d2dcbfa8740b007 my initramfs
image inflates.
No need for /usr/share/i18n/locales/*

I don't see an easy way to avoid that after inheriting image.bbclass
thus a quick hack:

...
inherit image

# brute force override to avoid i18n stuff from image.bbclass
PACKAGE_INSTALL = "${IMAGE_INSTALL}
LINGUAS_INSTALL = ""
LINGUAS_INSTALL_linux = ""
LINGUAS_INSTALL_linux-gnueabi = ""

EOF

IMHO image.bbclass should allow empty locales.
Besides, why fixing it to glibc-localedata?

Regards

Andrea


