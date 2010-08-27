Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <amilla@vicomtech.org>) id 1OosRQ-0007ZH-GO
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 08:29:33 +0200
Received: by qwa26 with SMTP id 26so236988qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 23:29:03 -0700 (PDT)
Received: by 10.229.1.162 with SMTP id 34mr150904qcf.226.1282890543490; Thu,
	26 Aug 2010 23:29:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.186.11 with HTTP; Thu, 26 Aug 2010 23:28:23 -0700 (PDT)
From: Alberto Milla <amilla@vicomtech.org>
Date: Fri, 27 Aug 2010 08:28:23 +0200
Message-ID: <AANLkTinDA-hgVagfF0add1ONi8Z-=sBha7mnit-Ui7bp@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: amilla@vicomtech.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Openembedded and Gstreamer
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
X-List-Received-Date: Fri, 27 Aug 2010 06:29:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, I am working with an at91sam9g45ekes board and openembedded at its
stable branch.

I tried to do a simple hello world program with gstreamer but it did
not work. After that I started testing gstreamer with the command:

# gst-launch audiotestsrc ! audioconvert ! alsasink

I get:

Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstAudioSinkClock

And gst-launch get stucked without playing any buzzer sound and to
exit I had to do a ctrl-c and after that gstreamer stopped in:

Caught interrupt -- handling interrupt.
Interrupt: Stopping pipeline ...
Execution ended after 11443136693 ns.
Setting pipeline to PAUSED ...

After that, I have to do a reset to the board.
But if I play a OGG file:

# gst-launch filesrc location=music.ogg ! oggdemux ! vorbisdec ! alsasink

I get only a warning but no sound:

WARNING: erroneous pipeline: could not link vorbisdec0 to alsasink0

And to finish, I tried too with a mp3 file and I had the audiotestsrc problem:

# gst-launch filesrc location=music.mp3 ! mad ! alsasink

Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstAudioSinkClock

music.mp3 and music.ogg play correctly if you use mplayer


Can you help me? Has anyone managed to work with the at91sam9g45ekes
and gstreamer?


Thanks,

Alberto


