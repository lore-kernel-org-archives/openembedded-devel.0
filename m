Return-Path: <cavallini.koan@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 191306A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 11:47:21 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id n3so7986212wiv.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 03:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=KCYc5fjowCCMdPums49NrWp9l2Q9+VNBo64mBjscOy4=;
	b=jTJukD9wb8Gt+S/jZWwizZifctxSi5NtZyk9fTyDGVT3uj0D8C1ETxXFKdstioqErB
	JKK38ILDepv79pv6EM/MZn5/0yuT5/oNgXAVQKkN61MwV61IqwlvvRLrSlNr+T7EHzHl
	5w+rGkHbIgum3q2ELCxUGoTyz45Ze3LQ+9yUKdiz4s8okqrFJ3UeTLnBkoggDmaFgi7Q
	A4PTeJDpbALmMrwfbaj3+XXCmLT1Gh7NxKRt7XCFiP+8vldZ367jagnsrEZPil+NZpHA
	geXJRjPdge79VXIv6cGygkZHvVrrdu3KLYA7nO2AFxMm3zoEmdFCPhJAXmZpbIguTgfm
	JqjQ==
MIME-Version: 1.0
X-Received: by 10.195.13.14 with SMTP id eu14mr3022366wjd.31.1415879241759;
	Thu, 13 Nov 2014 03:47:21 -0800 (PST)
Received: by 10.194.184.72 with HTTP; Thu, 13 Nov 2014 03:47:21 -0800 (PST)
In-Reply-To: <CAFQ+Digyv4Ks8iQOdcPGOKJsRYW1woW0RsC0YXwzNi6YL+=fVg@mail.gmail.com>
References: <CAFQ+Digyv4Ks8iQOdcPGOKJsRYW1woW0RsC0YXwzNi6YL+=fVg@mail.gmail.com>
Date: Thu, 13 Nov 2014 12:47:21 +0100
Message-ID: <CAFQ+DigkXjS0GLxi6Mk+C9VYUYsjx44QaiP4zrUR8xQ1oUM5CQ@mail.gmail.com>
From: Marco Cavallini <cavallini.koan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][daisy][BUG]
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
X-List-Received-Date: Thu, 13 Nov 2014 11:47:22 -0000
Content-Type: text/plain; charset=UTF-8

Sorry there's a typo
I mean 'DAISY'

2014-11-13 12:45 GMT+01:00 Marco Cavallini <cavallini.koan@gmail.com>:
> Hello,
> I am using meta-qt5 dora.
> Everything looks ok except the multimedia extensions.
> I found a note about a bug in Qt5.2.1
>
> Bug info:
> console logs for any application trying to use audio features in qt5-multimedia:
> defaultServiceProvider::requestService(): no service found for -
> "org.qt-project.qt.mediaplayer"
> Player error: The QMediaPlayer object does not have a valid service
>
> Link:
> https://bugs.archlinux.org/task/40068
>
> Description:
> It appears that libgstmediaplayer.so was accidently left out of the
> release for 5.2.1-3.
> his breaks any QT5 application that uses audio files.
> See https://bbs.archlinux.org/viewtopic.php?pid=1408020#p1408020
>
> Anybody knows what is the required patch?
>
> TIA
> --
> Marco Cavallini

