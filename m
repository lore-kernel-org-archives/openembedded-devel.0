Return-Path: <stefan@agner.ch>
X-Greylist: delayed 552 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Feb 2020 22:26:23 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id BC1FA60974
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2020 22:26:23 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 45D5E5C3FFC;
	Mon,  3 Feb 2020 23:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1580768232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=X4U9HrXFK6KCcFolrPf/uyzhnRMDn9mVJ4aeb30KgK0=;
	b=i4dSwkDOv3B2gD6KKnQ+aEuXhusql6r8U+yg0gCkiJp46voEDefARj3ymtyNLhlGNNyadF
	3K3lelt32QGzVhKoXPzfU7pmw/c3GZfcwkVvsVc4QF12hXhNiq+cdzn4bHDJTqCUdwDv6p
	fhSvkV+0xOSIroJS5mQhK5sbq0oXgsQ=
MIME-Version: 1.0
Date: Mon, 03 Feb 2020 23:17:12 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <CAO5Uq5SQeNGN8FmQjPfv_CWpbrT_rMQCjETvvN7ZukkzPd=BLg@mail.gmail.com>
References: <CAO5Uq5TV_6f7PXF6Q_TE0ii-W9xG9xgrO8p8OP_vb48HW=DugQ@mail.gmail.com>
	<CALbNGRSAYNsQkWMhNAfxVqnq4bYx2=mcqMxQpxvPampLFyKazA@mail.gmail.com>
	<CAO5Uq5TPW+hePvbEmxgN6cFHx5zcNqM-k9m_zSOOReBrYqU=pA@mail.gmail.com>
	<92e2dcc5-6107-e05f-87f4-161b8132266e@gmail.com>
	<CAO5Uq5SQeNGN8FmQjPfv_CWpbrT_rMQCjETvvN7ZukkzPd=BLg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <daa2daafef264dc256af9d315d21a635@agner.ch>
X-Sender: stefan@agner.ch
Cc: liu.ming50@gmail.com,
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
X-List-Received-Date: Mon, 03 Feb 2020 22:26:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

On 2020-01-27 16:14, Alex Kiernan wrote:
> On Fri, Jan 24, 2020 at 12:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On 1/23/20 4:13 PM, Alex Kiernan wrote:
>> > On Thu, Jan 23, 2020 at 10:09 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
>> >>
>> >> On Thu, Jan 23, 2020 at 10:43 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>> >>>
>> >>> On the offchance someone's tripped over this already/has pointers:
>> >>>
>> >>> Around the time python2 dropped out, I'm now seeing boot failures with:
>> >>>
>> >>> [  612.151548] systemd-journald[543]: Assertion
>> >>> 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
>> >>> src/basic/time-util.c:55, function now(). Aborting.
>> >>>
>> >>> I suspect it's unrelated to py2, but that's delayed me getting to the problem.
>> >>>
>> >>> The board I'm targetting is AM335x based, but without an RTC (which I
>> >>> suspect may be relevant).
>> >>>
>> >>> Anyone seen anything similar?
>> >>>
>> >>> --
>> >>> Alex Kiernan
>> >> Hi Alex,
>> >>
>> >> Have not seen that one yet. Will look for it once I can build images
>> >> in current environment (python2/Qt5.14 broke loads for me). What I
>> >> have seen were problems with timedatectl <-> ntp. Changing from local
>> >> time to ntp-sync did not work: Time remained un-synced on recent
>> >> images. Machine was Raspi so no RTC either.
>> >>
>> >> Don't know if this is related to your finding...
>> >>
>> >
>> > Looks like it's related to the glibc bump - reverting that changeset
>> > gets it booting again. I struggle to figure out which of the myriad
>> > wrappers are actually being used from inspecting the glibc source, but
>> > if it's the one I think it is, there's clearly
>> > clock_gettime/clock_gettime64 changes there which I doubt my kernel
>> > has (we're currently using the TI 4.19.y kernel).
>>
>> Is it possible for you to try 5.x for tests ?
> 
> That's where I went first, though I need to bring up the newer TI 5.4
> branch first (which has its own problems as there's some patch which
> was in the 4.9.y hsmmc driver which isn't in the latest which causes
> random timeouts on some of our board samples).
> 

I am seeing this on master branch too on a Toradex Apalis iMX6 (i.MX
6Dual to be specfic) running a mainline kernel 5.4.2.

We do have a RTC and according to dmesg the time has been read from it
successfully and correctly. We do have a second (the SoC internal) which
actually might be not correctly set, I haven't checked.

It seems systemd-journald which is tripping, but later also
systemd-udevd:
[    5.749612] systemd-journald[510]: Assertion
'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
src/basic/time-util.c:55, function now(). Aborting.
[    6.433771] systemd-journald[534]: Assertion
'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
src/basic/time-util.c:55, function now(). Aborting.
[    6.934304] systemd-journald[536]: Assertion
'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
src/basic/time-util.c:55, function now(). Aborting.
[    7.379449] systemd-journald[538]: Assertion
'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
src/basic/time-util.c:55, function now(). Aborting.
[    7.763130] systemd-journald[539]: Assertion
'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
src/basic/time-util.c:55, function now(). Aborting.
...
[    8.402258] systemd-udevd[542]: Assertion
'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
src/basic/time-util.c:55, function now(). Aborting.

We do have +SECCOMP, and also here commenting out
"SystemCallFilter=@system-service" seems to help.

strace seems to point to clock_gettime64:

connect(17, {sa_family=AF_UNIX, sun_path="/run/systemd/notify"}, 22) = 0
epoll_ctl(7, EPOLL_CTL_ADD, 17, {EPOLLOUT, {u32=18865912,
u64=18865912}}) = 0
getuid32()                              = 0
getgid32()                              = 0
openat(AT_FDCWD, "/proc/meminfo", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 18
fstat64(18, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
read(18, "MemTotal:        1023560 kB\nMemF"..., 1024) = 1024
ioctl(18, TCGETS, 0xbeef46f4)           = -1 ENOTTY (Inappropriate ioctl
for device)
ioctl(18, TCGETS, 0xbeef46f4)           = -1 ENOTTY (Inappropriate ioctl
for device)
close(18)                               = 0
ugetrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) =
0
clock_gettime64(CLOCK_MONOTONIC, 0xbeef47b0) = -1 EPERM (Operation not
permitted)
ioctl(2, TCGETS, 0xbeef472c)            = -1 ENOTTY (Inappropriate ioctl
for device)
writev(6, [{iov_base="<42>", iov_len=4}, {iov_base="systemd-journald",
iov_len=16}, {iov_base="[1007]: ", iov_len=8}, {iov_base="Assertion
'clock_gettime(map_clo"..., iov_len=121}, {iov_base="\n", iov_len=1}],
5) = 150
rt_sigprocmask(SIG_UNBLOCK, [ABRT], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, ~[RTMIN RT_1], [INT USR1 USR2 TERM RT_3], 8) =
0

--
Stefan

