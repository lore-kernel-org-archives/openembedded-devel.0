Return-Path: <cavallini.koan@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9063A65DA3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 11:45:12 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id z12so16679381wgg.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 03:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=j8B3yNn4HBTMC+do9NOUTQ60wv8Xt7FIpeq0gJ7YPxA=;
	b=I/Meq3GQhvxotRm1BoQpXfnaqNz/tfCQMDxsNDK8/IZwfHM+Pxliz+XVxm+NDAih+j
	yLxrvF3u8RUpbfd16fJtoZx+MK0k+Pu/Q6LSMu0nUaPq3Egr62NZ3Fir0VTxdBb/jK/D
	ogiVz7X1nxmOceB38dJxAB8/WyFts5bGJa+kC9cf53Icdhum8w6vMh+oPvHmoMFpYbjt
	yUDUSxj6NrKZCngJbaS7C+Igvef3DcBGBdVj5Glnc2nXKAJLSEbAkF9JCr8S1wGlYfVy
	aX5T10FBjsHZR4ADq2uTUTMv6wo6XJbCkTklRojTShbTXGLKvUeGdEy7crqKp9N9tsx+
	/jTQ==
MIME-Version: 1.0
X-Received: by 10.194.77.142 with SMTP id s14mr3285932wjw.94.1415879113102;
	Thu, 13 Nov 2014 03:45:13 -0800 (PST)
Received: by 10.194.184.72 with HTTP; Thu, 13 Nov 2014 03:45:13 -0800 (PST)
Date: Thu, 13 Nov 2014 12:45:13 +0100
Message-ID: <CAFQ+Digyv4Ks8iQOdcPGOKJsRYW1woW0RsC0YXwzNi6YL+=fVg@mail.gmail.com>
From: Marco Cavallini <cavallini.koan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5][daisy][BUG]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Nov 2014 11:45:17 -0000
Content-Type: text/plain; charset=UTF-8

Hello,
I am using meta-qt5 dora.
Everything looks ok except the multimedia extensions.
I found a note about a bug in Qt5.2.1

Bug info:
console logs for any application trying to use audio features in qt5-multimedia:
defaultServiceProvider::requestService(): no service found for -
"org.qt-project.qt.mediaplayer"
Player error: The QMediaPlayer object does not have a valid service

Link:
https://bugs.archlinux.org/task/40068

Description:
It appears that libgstmediaplayer.so was accidently left out of the
release for 5.2.1-3.
his breaks any QT5 application that uses audio files.
See https://bbs.archlinux.org/viewtopic.php?pid=1408020#p1408020

Anybody knows what is the required patch?

TIA
--
Marco Cavallini

