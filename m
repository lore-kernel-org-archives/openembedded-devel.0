Received: from mail-ie0-f169.google.com ([209.85.223.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <erik.boto@pelagicore.com>) id 1TldZm-0005jP-OI
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 11:42:07 +0100
Received: by mail-ie0-f169.google.com with SMTP id c14so4307642ieb.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 02:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=1TtDhlcI/Bipt5hJhXsoEEvJHJTCf2dzrzrGi9KXmNA=;
	b=LxE1Bppb5HReriU3c514hf2UKNg4LUoiW0BoTlDG0cJ8X5sJJsQy6fxP2M3UEfrN8b
	14IeTEqVhtY71axGPH/uC+lxT6tl7oLs4WgQ27BKu7q9/zU/Np2rdsJKrpsgyt8c0f2C
	DPzf3U9ZJQX2+uYDVIjqrGYv9q1l5RW+RkNup/yigPqWG2iBUnCej676tnVLlh6E/kRd
	hfQyiqVnnn9BKlC8zzU4Yy6cx/f29Tbdj/u9V3WJGTqQPZ7ovvkZr/o3KHfRD3PJgjlq
	wWZNMlfMj3SB1t3L6ln9NgetBTSdKm6pKatqJLWO2GVrveD+1UAGr9Bu1lXCmja9XTnR
	KgsQ==
MIME-Version: 1.0
Received: by 10.50.169.103 with SMTP id ad7mr4939202igc.105.1355999241986;
	Thu, 20 Dec 2012 02:27:21 -0800 (PST)
Received: by 10.50.20.39 with HTTP; Thu, 20 Dec 2012 02:27:21 -0800 (PST)
Date: Thu, 20 Dec 2012 11:27:21 +0100
Message-ID: <CA+AhUGxM2KQ3tj+UFu4NVwh3O1R2XSq1o5Lj2fn+A-e9r4=Qrg@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmva7reTexJ63lgFFu7r52J4aCxFiZ4kXQiPAxzVkev9XDo4S95W4R0c06SfFxJRZYxVCn2
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: meta-qt5 - problems with pkgconfig-0.25
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
X-List-Received-Date: Thu, 20 Dec 2012 10:42:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

When I build qtbase using https://github.com/meta-qt5/meta-qt5 I get cross
compiler badness warnings, it uses some includes from my host machine
instead of from sysroot. I have seen this before when cross compiling qt5
manually, and then the fix was to upgrade my host pkgconfig from 0.22 to
0.26 (I didn't really try the versions in between, just built a more recent
version).

I did a quick hack by building pkgconfig 0.26 in yocto by simply removing
the patches and using upstream vanilla 0.26 and then qtbase builds properly
without using host includes.

But it feels kind of strange that a bug like this hasn't affected any other
packages? Has anyone else seen something like this and can shed more light
on what's happening?

Best Regards,
Erik

