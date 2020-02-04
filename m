Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 09F7F611B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 09:00:28 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 577865C36EB;
	Tue,  4 Feb 2020 10:00:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1580806829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=0kbXGfHdP0QAI9zzGXahNldLyTC+DwGoFinqyN/ptaQ=;
	b=MfgqnDD7kJvLjnjP5bGgCITlVcvgOFlZ/rlYt0HqvikQ6I2i+4f7Ff/4eLShHoccDowDry
	722i5jGCu56kKgm82+jeseRufla0llUcGzO/2k9g6YjGUfUKLvTKw/JaJTqB4ows4pAZIp
	nSip048B0GIj63g1w34q9q4stay0Q1U=
MIME-Version: 1.0
Date: Tue, 04 Feb 2020 10:00:28 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <CAO5Uq5T81etwQkVog0ibiGjmCS6zTHhLVeHRwa-2S+4TP5NWTw@mail.gmail.com>
References: <CAO5Uq5TV_6f7PXF6Q_TE0ii-W9xG9xgrO8p8OP_vb48HW=DugQ@mail.gmail.com>
	<CALbNGRSAYNsQkWMhNAfxVqnq4bYx2=mcqMxQpxvPampLFyKazA@mail.gmail.com>
	<CAO5Uq5TPW+hePvbEmxgN6cFHx5zcNqM-k9m_zSOOReBrYqU=pA@mail.gmail.com>
	<92e2dcc5-6107-e05f-87f4-161b8132266e@gmail.com>
	<CAO5Uq5SQeNGN8FmQjPfv_CWpbrT_rMQCjETvvN7ZukkzPd=BLg@mail.gmail.com>
	<daa2daafef264dc256af9d315d21a635@agner.ch>
	<CAO5Uq5T81etwQkVog0ibiGjmCS6zTHhLVeHRwa-2S+4TP5NWTw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <8a912a9368356b5d22e6e740f02ccdaf@agner.ch>
X-Sender: stefan@agner.ch
Cc: Ming Liu <liu.ming50@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: systemd failing in master with Assertion clock_gettime(map_clock_id(clock_id), &ts) failed
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
X-List-Received-Date: Tue, 04 Feb 2020 09:00:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2020-02-03 23:37, Alex Kiernan wrote:
> On Mon, Feb 3, 2020 at 10:17 PM Stefan Agner <stefan@agner.ch> wrote:
>>
>> Hi All,
>>
>> On 2020-01-27 16:14, Alex Kiernan wrote:
>> > On Fri, Jan 24, 2020 at 12:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On 1/23/20 4:13 PM, Alex Kiernan wrote:
>> >> > On Thu, Jan 23, 2020 at 10:09 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
>> >> >>
>> >> >> On Thu, Jan 23, 2020 at 10:43 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>> >> >>>
>> >> >>> On the offchance someone's tripped over this already/has pointers:
>> >> >>>
>> >> >>> Around the time python2 dropped out, I'm now seeing boot failures with:
>> >> >>>
>> >> >>> [  612.151548] systemd-journald[543]: Assertion
>> >> >>> 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
>> >> >>> src/basic/time-util.c:55, function now(). Aborting.
>> >> >>>
>> >> >>> I suspect it's unrelated to py2, but that's delayed me getting to the problem.
>> >> >>>
>> >> >>> The board I'm targetting is AM335x based, but without an RTC (which I
>> >> >>> suspect may be relevant).
>> >> >>>
>> >> >>> Anyone seen anything similar?
>> >> >>>
>> >> >>> --
>> >> >>> Alex Kiernan
>> >> >> Hi Alex,
>> >> >>
>> >> >> Have not seen that one yet. Will look for it once I can build images
>> >> >> in current environment (python2/Qt5.14 broke loads for me). What I
>> >> >> have seen were problems with timedatectl <-> ntp. Changing from local
>> >> >> time to ntp-sync did not work: Time remained un-synced on recent
>> >> >> images. Machine was Raspi so no RTC either.
>> >> >>
>> >> >> Don't know if this is related to your finding...
>> >> >>
>> >> >
>> >> > Looks like it's related to the glibc bump - reverting that changeset
>> >> > gets it booting again. I struggle to figure out which of the myriad
>> >> > wrappers are actually being used from inspecting the glibc source, but
>> >> > if it's the one I think it is, there's clearly
>> >> > clock_gettime/clock_gettime64 changes there which I doubt my kernel
>> >> > has (we're currently using the TI 4.19.y kernel).
>> >>
>> >> Is it possible for you to try 5.x for tests ?
>> >
>> > That's where I went first, though I need to bring up the newer TI 5.4
>> > branch first (which has its own problems as there's some patch which
>> > was in the 4.9.y hsmmc driver which isn't in the latest which causes
>> > random timeouts on some of our board samples).
>> >
>>
>> I am seeing this on master branch too on a Toradex Apalis iMX6 (i.MX
>> 6Dual to be specfic) running a mainline kernel 5.4.2.
>>
>> We do have a RTC and according to dmesg the time has been read from it
>> successfully and correctly. We do have a second (the SoC internal) which
>> actually might be not correctly set, I haven't checked.
>>
>> It seems systemd-journald which is tripping, but later also
>> systemd-udevd:
>> [    5.749612] systemd-journald[510]: Assertion
>> 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
>> src/basic/time-util.c:55, function now(). Aborting.
>> [    6.433771] systemd-journald[534]: Assertion
>> 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
>> src/basic/time-util.c:55, function now(). Aborting.
>> [    6.934304] systemd-journald[536]: Assertion
>> 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
>> src/basic/time-util.c:55, function now(). Aborting.
>> [    7.379449] systemd-journald[538]: Assertion
>> 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
>> src/basic/time-util.c:55, function now(). Aborting.
>> [    7.763130] systemd-journald[539]: Assertion
>> 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
>> src/basic/time-util.c:55, function now(). Aborting.
>> ...
>> [    8.402258] systemd-udevd[542]: Assertion
>> 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
>> src/basic/time-util.c:55, function now(). Aborting.
>>
>> We do have +SECCOMP, and also here commenting out
>> "SystemCallFilter=@system-service" seems to help.
>>
>> strace seems to point to clock_gettime64:
>>
> 
> That fits with systemd-243.4 fixing it - there's a commit in there
> which adds clock_gettime64 to @system-service.

Confirmed, the bump to 243.4 fixes it for me too.

--
Stefan

