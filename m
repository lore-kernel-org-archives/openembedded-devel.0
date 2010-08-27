Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <amilla@vicomtech.org>) id 1Oouyu-0000x5-5Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 11:12:17 +0200
Received: by qwa26 with SMTP id 26so335397qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 02:11:47 -0700 (PDT)
Received: by 10.229.224.149 with SMTP id io21mr294823qcb.160.1282900307092;
	Fri, 27 Aug 2010 02:11:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.186.11 with HTTP; Fri, 27 Aug 2010 02:11:07 -0700 (PDT)
In-Reply-To: <AANLkTinDA-hgVagfF0add1ONi8Z-=sBha7mnit-Ui7bp@mail.gmail.com>
References: <AANLkTinDA-hgVagfF0add1ONi8Z-=sBha7mnit-Ui7bp@mail.gmail.com>
From: Alberto Milla <amilla@vicomtech.org>
Date: Fri, 27 Aug 2010 11:11:07 +0200
Message-ID: <AANLkTimQ6vdijXjgq+ct5T2h5-WeDa4dnR2NiKrnUUBf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: amilla@vicomtech.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Openembedded and Gstreamer
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
X-List-Received-Date: Fri, 27 Aug 2010 09:12:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

I try

#gst-launch --gst-debug=*:3 audiotestsrc ! audioconvert ! alsasink

and I obtain the next output: http://pastebin.com/EVQjRVqS

where I can see 3 warning at lines 57, 58 and 59:

alsa gstalsa.c:124:gst_alsa_detect_formats:<alsasink0> skipping non-int format
alsa conf.c:3952:snd_config_expand: alsalib error: Unknown parameters
{AES0 0x02 AES1 0x82 AES2 0x00 AES3 0x02}
alsa pcm.c:2202:snd_pcm_open_noupdate: alsalib error: Unknown PCM
iec958:{AES0 0x02 AES1 0x82 AES2 0x00 AES3 0x02}

and from the line 75 I get a dump that starts with a:

0:00:02.183681854   953    0x15050 INFO   GST_EVENT
gstevent.c:1091:gst_event_new_latenUnable to handle kernel paging
request at virtual address aafaaaae

Can it be an alsa problem?

On 27 August 2010 08:28, Alberto Milla <amilla@vicomtech.org> wrote:
> Hi, I am working with an at91sam9g45ekes board and openembedded at its
> stable branch.
>
> I tried to do a simple hello world program with gstreamer but it did
> not work. After that I started testing gstreamer with the command:
>
> # gst-launch audiotestsrc ! audioconvert ! alsasink
>
> I get:
>
> Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstAudioSinkClock
>
> And gst-launch get stucked without playing any buzzer sound and to
> exit I had to do a ctrl-c and after that gstreamer stopped in:
>
> Caught interrupt -- handling interrupt.
> Interrupt: Stopping pipeline ...
> Execution ended after 11443136693 ns.
> Setting pipeline to PAUSED ...
>
> After that, I have to do a reset to the board.
> But if I play a OGG file:
>
> # gst-launch filesrc location=music.ogg ! oggdemux ! vorbisdec ! alsasink
>
> I get only a warning but no sound:
>
> WARNING: erroneous pipeline: could not link vorbisdec0 to alsasink0
>
> And to finish, I tried too with a mp3 file and I had the audiotestsrc problem:
>
> # gst-launch filesrc location=music.mp3 ! mad ! alsasink
>
> Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstAudioSinkClock
>
> music.mp3 and music.ogg play correctly if you use mplayer
>
>
> Can you help me? Has anyone managed to work with the at91sam9g45ekes
> and gstreamer?
>
>
> Thanks,
>
> Alberto
>


