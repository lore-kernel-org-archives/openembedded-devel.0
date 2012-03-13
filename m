Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1S7aD3-0004Oq-HU; Tue, 13 Mar 2012 23:28:49 +0100
Received: by iaag37 with SMTP id g37so1318707iaa.6
	for <multiple recipients>; Tue, 13 Mar 2012 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=aJVdWY2sHyGNDqWBHFcjUrxkhaJNCZNlAvsjz7iPa2g=;
	b=yV11yOc3N+oC/0pQOG1G0nJDjNUr1EaVKIvCVAAt2FKfMlAzmJ18SBuFsdwpy4wjXN
	hA9weLo0SakQsARUQ7kbxPd4zCgG3j6qjB2gYKStFJvM7PyjbleGi7Qu27/g+FLSztKE
	3/AuCeMfXcKVHNWVqdvuSopwM9ds6U2qyziE6rZlCmd2dEfJImrlxkPZsqZMxMTtWIuy
	3Jp3CB/S/RReYE0JrfZNmAZ5Udfk6lY9jzggZNMZEls1/1K4flITpRZ84KxK26GrOlhi
	gRXcmMmVmnWsWuUdPPyNgldkUFO1y245PGDcj3qW0Hhw5DRSbHBdI+37JikaJBwBmbvd
	cnLQ==
MIME-Version: 1.0
Received: by 10.50.89.168 with SMTP id bp8mr7713440igb.3.1331677203452; Tue,
	13 Mar 2012 15:20:03 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.50.127.38 with HTTP; Tue, 13 Mar 2012 15:20:03 -0700 (PDT)
Date: Tue, 13 Mar 2012 15:20:03 -0700
X-Google-Sender-Auth: WkS1n4q585wJn78eehhc6xNIRGo
Message-ID: <CA+YB3rapmuP1868ag1CjQ3-_=-PEFZR5VEc85asUtVhepQB06Q@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OE TSC Minutes: 15 Feb 2012
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
X-List-Received-Date: Tue, 13 Mar 2012 22:28:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

NOTE: I apologize for the lateness of these minutes; they go a lot faster
when the meeting is held online!

OpenEmbedded Technical Steering Committee
15 February, 2012
face-to-face meeting at Embedded Linux Conference

Attending:

Richard Purdie
Mark Hatle
Tom Rini
Khem Raj
Paul Eggleton
minutes: Jeff Osier-Mixon

Agenda:

There was no fixed agenda for this meeting - the notes below
describe what was discussed.

Yocto Project DevDay discussion
  The Yocto Project had its first Developer Day the day before this
  meeting. There were several presentations as well as hands-on labs
  for both new and experienced users.

BitBake interrupts
  When BitBake hangs, there is no feedback from it, can't ctrl-c
  Richard believes it is a threading problem, following up with Chris L
  UPDATE: found to be a double shutdown, patches have been merged

Moving to Python 3
  Possible, not really a problem if want to do it
  Many technical issues discussed, no action items assigned

Elections
  After next week, remind the board
  Mark is up now, then Tom, then cycle is done

zlib
  Khem, Matt McClintock submitted many patches
  Have been doing shakeout, decided not to inflict on issues
  Gary Thomas found many isses as well
  Issue - enabling basic hash, should resolve zlib issue in future
  Proposal on oe list, doing this in yocto, could do in oe-core
  AR: RP did this after meeting

TSC Retrospective meeting with board
  Agreed to meet with board for lunch for an annual retrospective

memory usage issues
  Discussion about current BitBake memory footprint growth
  Use of fetchers to fetch metadata, suggested from previous
    discussions - Jeremy Puhlman, Richard, Paul
    do as part of bb build process or as separate step
  Many other memory issues discussed
  Found some memory issue and changes merged recently to improve
    the codeparser cache.


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

