Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 790146E630
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 04:41:01 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id v123so36462972qkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 21:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=Av5N9adR2WBjPypx/74vnl49BmJVU7+mXSvE9EzISnQ=;
	b=Jj90Ki+ubh4iOmt1EpkX/Jt0up5g5+6M+oALxSCnC3MlskatWsH8g19V06wEdcDxa8
	wToXdUkX6WamHOiwozeEWlxTUJZog6DAKkPBpGj712wS8rFji5tYpn7R6MJRlZgpCvrG
	7bhsdrZODxdcYlc6QJoQyeRt+dYC21hjHqPRYZx15k/wDd99AxRdgRO8WXY3SoYTAW17
	b9PXOdbCQ2pE/d2atYpXrWO0iGQ/WaN+LymGB7mkdwAZ1U4EUDM57k6I8yr1CRkDyPzH
	ufofOk/qh9tGo5QOpVgQiCEhPc4srVVr7F+RGsZu4+r/chu64ZTKtgv6hYbA0U0r40VD
	Xozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Av5N9adR2WBjPypx/74vnl49BmJVU7+mXSvE9EzISnQ=;
	b=J0pbnzD8GYPPjWpmZrz5AjXnOLoUkcT1xo1P5KRBK0gWsNpg+TQgAxBkIhXkIkxaZ+
	0NCwYnvdOmjH0SutPM7eKs7zUV4RxD4tFSF2FH3i0cWkfpq4Hy23Sf2auqbQtHX1F0i6
	nd1QUyO8frdb6TmpO8B2EfK5tMj8kkVo0MvHsgHLb1oMWzWwOJeYuuuL7f0bPSlb6hgV
	iJ4zlp5CsdeqiFpmDrUPsnchkk37ZfbZUBn+u/bCl3BZ9gluK/rdwJyUrObUwg7mZAUN
	MZpP3+SfdJX/tBkiYxP0MNUH8FinQvnoknLJW+L/thGTeLBFUq4u503ORG/I8ws0bTb5
	Gn3A==
X-Gm-Message-State: AEkoouvcELCHjpZLRErVj9rgMFxjNaU9b0llNgqJ8H3GA0a8EvjjOZjGlH0gK7L/Q2jo985jghPa2Rc9MD8BjA==
X-Received: by 10.55.33.193 with SMTP id f62mr4056771qki.270.1471581661880;
	Thu, 18 Aug 2016 21:41:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.198 with HTTP; Thu, 18 Aug 2016 21:40:41 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 19 Aug 2016 16:40:41 +1200
Message-ID: <CADySD0G=my4X5aMsTbkruhsK3apvQrwaJMftjsAPgiQkBux-0w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: How to keep splash screen until application starts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Aug 2016 04:41:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I have created a custom splash screen using psplash for am335x evm based
device having touchscreen.

Splash screen is displayed during boot process but when login prompt comes,
my screen goes blank.

My question is how can I make splash screen visible until my application
starts ?

I have modified my /etc/inittab to disable getty on virtual terminal
(touchscreen), getty is only enabled for serial console.

Thanks
Ankur

