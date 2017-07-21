Return-Path: <chgans@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2DB7844D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 21:58:48 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id o8so47096363qtc.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 14:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Ms75ryFcaeQJ4i6X7ktlV0vfYOSY4SJjqIj/FE1d2r0=;
	b=qPBzo1Tz5Z9fKpA1Uid4by4hp+brYttpjQBowASAfBAQqSwWrI4UBPlt2sVXq3ghZT
	SxLmoBGYTXfDFMNzAYnY997zBHQuMzpztqpBqAwxbhrb9ykhIKRP18FR8ncBfrSyyoWr
	ZtoDfwTtcYEV3rHgrpWSnHiAPNfGTW/rlDG0YKeIVun95LiP5GZgJKO7VEvJKDkUDYiS
	UfdqeCBSawAzQ423+NqEx7yAKZVhhYksuIGkZ4q2FZc7+243IQqo2iBoFYcVHmYJg/L3
	j11n3YlVk/puaZ19AjccV0ObXB1Vhgj4vrhCk52HC/zyWlFjLbGCxrfHOsnfazz8pRVY
	rodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Ms75ryFcaeQJ4i6X7ktlV0vfYOSY4SJjqIj/FE1d2r0=;
	b=RhDIcdgThj1l8v4OdDf3By8M6ilsS/bkSeE3AVeFrcv6f5kHzrs5FvPZIBBj8wfslv
	ndCvOYatdTz1rhwfXDlIVx/9e29oA1kzOiEZRnx8bjYhE4lajyr92Sf3G8he5RqJe2D/
	EpbvxWiIWl79SXFxGZ2pedYMW54lrVJ95MfiCwmNEyctoUhNANUhEkELzpcU/bTaR3Gr
	E93F5ENuZvWDHvtx/eDOjN5WzDP37h4jc2ZYrj39jIKqsvJ8TBVFXuF07pNR5mw2nVkl
	XKm9txuyiTe3yP1+zWVGRiWOX5AaIC4w4YIIyGSTch3Z2ZhsN7r5ekeQTCasN2H2vdYb
	LLgA==
X-Gm-Message-State: AIVw112nXbLgt+PiZ+dndhjBECtZq7zP5dFvTHvO4JheK8rN2cGg48Mq
	vrsHPfdKElnfIwqwso3PUfmAkxjAxA==
X-Received: by 10.237.60.110 with SMTP id u43mr9214375qte.212.1500674329704;
	Fri, 21 Jul 2017 14:58:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.17.212 with HTTP; Fri, 21 Jul 2017 14:58:49 -0700 (PDT)
From: Christian Gagneraud <chgans@gmail.com>
Date: Sat, 22 Jul 2017 09:58:49 +1200
Message-ID: <CABxGUTh1FTWAUFbEWwAPtrvUbxdMHNLV9b-9=ZgwOEQAGyqnsQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] SDK missing python-json (QtCreator)
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
X-List-Received-Date: Fri, 21 Jul 2017 21:58:48 -0000
Content-Type: text/plain; charset="UTF-8"

Hi there,

Since v3.6, QtCreator requires python-json for use with GDB.
The Qt5 SDK doesn't ship this python package (tested with Pyro) and so
it is impossible to debug a program due to the missing python package.
(QtC 4.4 (to be released) should contain a workaround)

Can this dependency be added to Qt5 SDK?

Original QtC bug report can be found at:
https://bugreports.qt.io/browse/QTCREATORBUG-18577

Thanks,
Chris

