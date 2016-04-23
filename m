Return-Path: <ryanelkholy@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id E11C960745
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2016 01:07:46 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id m9so27172905ige.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 18:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc;
	bh=6VnzMzpSQFfArYAPCtWgEGhZ+5p6aV326pn1gNSmbpU=;
	b=GsS/KsPJUFGro6rxUgJ/zp224C0vXEQvqPt4Q/PskOnDi0X7u0127F9RG+uSGIfGTc
	QPydmDK685ZarrALNzI/P0x8f5NgsCt5OXztCG+tpIfPTxvgRJQ9kAMazrzLvNX+A3zr
	f+RxLg3advNa4MoIjClsmyghos/5CzD81KwiFBLtoglmAKFbo5Kuv/jx4YXK59an79ig
	0nARIW5aroacqyMx3/rmO0JSFW3Hs1mUJf80NrKaGHT7/99/JdunZg3I9xTls4XVIEK3
	E7+LVq9dwBkOVQ5ZO4YncC11KwuhTno9356nEefJ8hWA+p2voHOzcbHOKKW/fDt4i8Mg
	M8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
	bh=6VnzMzpSQFfArYAPCtWgEGhZ+5p6aV326pn1gNSmbpU=;
	b=OPawAEQkDvB8QVamnqcTJvWetNVdWpkOmd0XvEFMm9rYVpzln1eX233lEQ3J8PG582
	uxBPpmgkXKYNQXOm6I2zMbV+cZwAMFpzt3vpE5S+v0kSdKGLGM40nU+rXnwPO3Y7SK8y
	iiQSqDqkuUDKudg+p6lO1bZgQcwXsdC28SIyl1Y9gg3auezpQpARd19WLiXq9IQuqIvn
	tif+6pYBL/avkWMSH0/rkBabia2lCJUUzvzZF1bcK2h4W5a9Zl1yYlUv5riED73UF0WG
	rPTiv4l24ECoxsvoWNkjAXwmTrQsrj1cXadXee7hw8wOaocklXIAhxrUNyB3Pyx3G4yw
	0VXw==
X-Gm-Message-State: AOPr4FVDy7t/UmsYgBtgeK4z021KJclkhx9CMd4HQUoM9eTdbDdZ7ktafmxubBWlvXkDiUCFAzw264s00W6WNQ==
MIME-Version: 1.0
X-Received: by 10.50.29.51 with SMTP id g19mr210385igh.42.1461373666994; Fri,
	22 Apr 2016 18:07:46 -0700 (PDT)
Received: by 10.64.78.105 with HTTP; Fri, 22 Apr 2016 18:07:46 -0700 (PDT)
Date: Fri, 22 Apr 2016 21:07:46 -0400
Message-ID: <CAMZfsd6f7-s4pVyiNPs2sVmi+EC6yMyjCJeYTPobm0f6ffE2_w@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Project <yocto@yoctoproject.org>
Subject: [meta-qt5] EGL Error : Could not create the egl surface: error = 0x300b
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
X-List-Received-Date: Sat, 23 Apr 2016 01:07:47 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I am am trying to make a build that includes meta-qt5 without x11 or
wayland on the Minnowboard Turbot (x86-64). I was successful in building my
image but the problem occurred when testing my basic qt app on the image.
When trying to run the app I get the following error:

EGL Error : Could not create the egl surface: error = 0x300

I have been trying to find a solution for this for weeks with no luck. I am
able tu run my application when including x11, but I am trying to avoid it.
Does anyone know any solution for this? Any insight will be helpful because
I have been stumped for weeks. If nobody knows of a solution is it possible
to dig deeper into this error and see what is causing it? If so, how?

Thanks

