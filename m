Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B971DC5516A
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 09:04:11 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34309.1771578241978855955
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Feb 2026 01:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout10.t-online.de (Postfix) with SMTP id 7D7D238431
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 10:03:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.174.95]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vtMQY-22AQGf0; Fri, 20 Feb 2026 10:03:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.4.10 -> 1.6.0
Date: Fri, 20 Feb 2026 10:03:51 +0100
Message-ID: <20260220090351.2637357-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1771578238-9D7DEE44-FF966FAC/0/0 CLEAN NORMAL
X-TOI-MSGID: eac86842-3893-42c9-a43f-33e976de6591
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 09:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124523

PipeWire 1.6.0 (2026-02-19)

This is is the 1.6 release that is API and ABI compatible with previous
1.4.x releases.

This release contains some of the bigger changes that happened since
the 1.4 release last year, including:

  * An LDAC decoder was added for bluetooth.
  * SpanDSP for bluetooth packet loss concealment.
  * Safe parsing and building of PODs in shared memory.
  * Added support for metadata features. This is used to signal that
    the sync_timeline metadata supports the RELEASE operation.
  * Node commands and events can contain extra user data.
  * Support for more compressed format helper functions to create
    and parse formats.
  * Support for compile time max channels. The max channels was
    increased to 128.
  * Support for audio channel layouts was added. This makes it possible
    to set "audio.layout" =3D "5.1" instead of the more verbose
    audio.position =3D [ FL, FR, FC, LFE, SL, SR ]
  * Support for Capability Params was added. This can be used to
    negotiate capabilities on a link before format and buffer
    negotiation takes place.
  * More HDR colortypes are added.
  * Loops now have locking with priority inversion. Most code was adapted
    to use the faster locks instead of epoll/eventfd to update shared sta=
te.
  * Channel position are parsed from EDID data.
  * Channel maps are now set on ALSA.
  * The resampler now supports configurable window functions such
    as blackman and kaiser windows. The phases are now also calculated
    with fixed point math, which makes it more accurate.
  * Many bluetooth updates and improvements.
  * The filter-graph has an ffmpeg and ONNX plugin. The ffmpeg plugin
    can run an audio AVFilterGraph. The ONNX plugin can run some models
    such as the silero VAD.
  * Many AVB updates. Work is ongoing to merge the Milan protocol.
  * Support for v0 clients was removed.
  * The jack-tunnel module can now autoconnect ports.
  * ROC support multitrack layouts now.
  * Many RTP updates.
  * rlimits can now be set in the config file.
  * Thread reset on fork can now be configured. JACK clients expect this
    to be disabled.
  * node.exclusive is now enforced.
  * node.reliable enables reliable transport.
  * pw-cat supports sysex and midiclip as well as some more uncompressed
    formats. Options were added to set the container and codec formats
    as well as list the supported containers, codecs, layouts and channel
    names.
  * Documentation updates.

Highlights (since the previous 1.5.85 prerelease)
  - Fix a 64 channel limit in the channel mixer.
  - Fix an fd leak in pulse-server in some error cases.
  - Some small fixes and improvements.

PipeWire
  - Fix Capability leaks.
  - Return an error in pw-stream get-time when not STREAMING.
  - Set the current time in the driver position before starting.
    Some followers might look at it.

Modules
  - Improve default channel handling in module-filter-chain.
  - Support source and sink only module-filter-chain.
  - Tweak the filter-chain spatializer example gains.
  - Handle new snapcast service type. (#5104)
  - Implement socket activation without depending on libsystemd.
  - Support ipv4 link-local addresses in RAOP and snapcast. (#4830)
  - Forward ROC-toolkit logs to pipewire.

SPA
  - Improve default channel handling in filter-graph. (#5084)
  - Clamp control values to min/max. (#5088)
  - Support mode JBL gaming headsets.
  - Handle some SOFA errors and add gain option.
  - Really handle more than 64 channels in the channelmixer. (#5118)
  - Allow removal in ALSA-udev of ignored cards.

pulse-server
  - Fix mono mixdown query.
  - Expose headset autoswitch message.
  - Handle EPROTO errors by disconnecting.
  - Handle timeouts in play-sample streams. (#5099)

GStreamer
  - Fix crop metadata.
  - Fix a race in the buffer release function.

Tools
  - Improve format support and detection in pw-cat.
  - Add some more options to pw-cat to list supported containers
    and formats. (#5117)

Older versions:

PipeWire 1.5.85 (2026-01-19)

This is the fifth and hopefully last 1.6 release candidate that
is API and ABI compatible with previous 1.4.x, 1.2.x and 1.0.x
releases.

Highlights
  - Fix errors in older clients that blindly mmap buffer data.
  - ALSA channel mapping should work in more cases.
  - Fix an overflow in the resampler with some sample rates.
  - Device ID negotiation for DMABUF was added.
  - The channelmixer can now also downmix most REAR and TOP
    channel positions.
  - Various small fixes and improvements.

PipeWire
  - Avoid doing flushing invoke in pw-stream. (#5010)
  - Fix stream time delay calculations in some cases. (#4957)
  - Avoid suspending a node when the ports are busy.

Modules
  - Mode AVB module updates.
  - Remove MAPPABLE flag from memptr data in client-node. This avoids
    errors in older clients that blindly map buffers. (#5003)
  - Don't leak the filter-chain module in module-parametric-equalizer.
    (#5045)
  - make it possible to run pulse tunnel sink and source with the same
    name. (#5079)

SPA
  - The delay filter in filter-graph now has feedback and feedforward
    options to make it possible to implement comb and allpass filters.
  - The resampler can be compiled with a custom default quality.
  - Firewire latency is scaled correctly now. (#4977)
  - The mixer will only passthrough dynamic data.
  - Fix filter-graph state in audioconvert after flush.
  - Set the channel map in ALSA nodes to tell ALSA our channel layout
    and avoid wrong channels.
  - Fix AVX2 function, make sure they don't run on AVX-only CPUs.
    (#5072)
  - Fix an overflow and crash when too many phases are used in the
    resampler. (#5073)
  - Add some more channel downmix positions, mostly REAR and TOP
    channels.

pulse-server
  - Add a message to enable mono mixdown.

Tools
  - Support filenames in raw mode in pw-cat. (#5012)
  - Enable clipping in spa-resample.

examples
  - Update device ID negotiation examples.

Docs
  - Document the resampler properties better.

PipeWire 1.5.84 (2025-11-27)

This is the fourth 1.6 release candidate that is API and ABI
compatible with previous 1.4.x, 1.2.x and 1.0.x releases.

Changes since the last pre-release:

Highlights
  - Capabilities wer added to improve negotiation over links.
  - The audio resampler now has a configurable window function to better
    tune the resampler quality. A kaiser and blackman window was added
    and the default parameters were tuned.
  - Various small fixes and improvements.

PipeWire
  - Capabilities and PeerCapabilities were added to exchange key/value
    pairs between consumer and producer right after a link is made. This
    can be used to detect how the negotiation of formats and buffers
    should be done.

Modules
  - Avoid segfaults in RTP source. (#4970)
  - The AVB module has seen some improvements.

Pulse-server
  - @NONE@ can now be used to clear the default sink/source.

SPA
  - Support longer convolver filenames and also support inline
    IRs.
  - The audio resampler window function is now selectable and
    configurable. A kaiser window and blackman window was added
    and the default qualities were tweaked to improve quality.
  - The filter-graph convolver latency is now set by default to
    something more sensible. (0 by default and N/2 for hilbert).
    (#4980)

Bluetooth
  - Better xrun and error handling for iso streams.
  - The +CNUM reply was fixed.
  - The CIEC call status was fixed. (#1744)
  - Add BAP context metadata to improve compatibility.
  - Improve compatiblity with Creative Zen Hybrid Pro by releasing
    transports simultaneously.

PipeWire 1.5.83 (2025-11-06)

This is the third 1.6 release candidate that is API and ABI
compatible with previous 1.4.x, 1.2.x and 1.0.x releases.

Changes since the last pre-release:

Highlights
  - Include the NEWS and updated version number.

PipeWire 1.5.82 (2025-11-06)

This is the second 1.6 release candidate that is API and ABI
compatible with previous 1.4.x, 1.2.x and 1.0.x releases.

Changes since the last pre-release:

Highlights
  - The max channel limit is now a compile time option.
  - The SAP and RTP module have seen some robustness improvements.
  - Add audio.layout propperty.
  - Cleanups to the code here and there.

PipeWire
  - Handle Tags more like Latency with a NULL param when no ports are lin=
ked
    and some sort of (empty) Tag when the ports are linked.

Modules
  - Improve the echo-cancel module to keep the streams more aligned
    and cause less latency.
  - Improve format parsing errors in most modules.
  - The RTP module now has extra code for better network robustness, incl=
uding
    cases when network interfaces are not yet up and running, and multica=
st
    sockets are silently kicked out of IGMP groups.
  - The direct timestamp mode in the RTP module was effectively broken an=
d is
    now fixed.
  - Add support for audio.layout.
  - Add multichannel support to ROC.

SPA
  - Rework the maximum number of channel handling. Because this is a
    potential ABI break, it is now a compile time option with new
    functions to handle more than the previous 64 channels.
  - The 64 channel limit was removed from the noise shaper.
  - spa_strbuf is used in more places instead of custom snprintf code.
  - The volume ramp code was simplified.
  - The driver node now has properties to configure the clock.
  - The adapter will try to renegotiate when the driver changes.
  - Fix relaxed array parsing with od number of elements. (#4944)
  - audio.layout was added to set the channel positions to some
    predefined layouts.
  - Added more POD choice checks to ensure the right amount of values
    are present in the choice.
  - Fix __has_attribute usage. (#4962)
  - Thread RESET_ON_FORK is now disabled for JACK application so that
    forking will preserve any real-time thread priorities, like JACK.
    (#4966)
  - Fix some compilation issues. (#4960 and #4961).

Pulse-server
  - Fix missing subscription events on device port changes.
  - Increase min.quantum to 256/48000. (#4875)

GStreamer
  - Avoid overflow in clock time calculations.
  - Fix renegotiation.

Docs
  - Swap the name and id of device.product

PipeWire 1.5.81 (2025-10-16)

This is the first 1.6 release candidate that is API and ABI
compatible with previous 1.4.x, 1.2.x and 1.0.x releases.

In addition to all the changes backported to 1.4.x, this release
also contains some new features:

Highlights
  - The link negotiation code was refactored and improved.
    Applications now have more options for selecting the default
    values and restricting the available options. The default
    negotiation code will now attempt to better match the application
    suggested values.
  - The loop now has support for locking with priority inversion. Most
    of the code was updated to use the locks instead of invoke to
    get proper concurrent updates with the loop. The Thread loop
    functionality of locks, signal and wait was moved to the SPA loop.
    This guarantees better real-time behaviour because inter-thread
    synchronization does not have to pass eventfd/epoll.
  - The control stream parser was rewritten to be safe against concurrent
    updates while parsing, which can occur when parsing shared memory.
    It also has extra checks to avoid integer overflows and undefined
    behaviour.
  - MIDI 2.0 clip support was added to the tools.
  - Bluetooth ASHA (Audio Streaming for Hearing Aid) support was added.
  - The ALSA node setup was tweaked to provide low latency with the ALSA
    Firewire driver.
  - Better support for explicit sync. It is now possible to negotiate
    extra features to know if a consumer will signal the sync objects and
    implement a fallback using a reliable transport.
  - Many bug fixes and improvements.

PipeWire
  - Avoid process calls in disconnect in pw-stream. (#3314)
  - Disable PipeWire services for root.
  - The link negotiation was refactored and improved. Drivers now
    always have a lower priority in deciding the final format.
  - Backwards compatibility with the v0 protocol was removed.
  - pw-stream and pw-filter will now refuse to queue a buffer that
    was not dequeued before.
  - Object properties will now be updated on the global as well.
  - The priority of config overrides is correct now. (#4816)
  - Async links now correctly report 1 extra quantum of latency.
  - node.exclusive and the new port.exclusive flag are now enforced
    by PipeWire itself.
  - A new timer-queue helper was added to schedule timeouts.
  - node.terminal and node.physical properties are now copied to the
    ports to make it possible to create virtual sources and sinks
    for JACK applications.
  - Port properties will now be dynamically updated when the node
    properties they depend on are updated.
  - Passive leaf nodes are now handled better. Now they will also
    run when the peer is active. (#4915)
  - Reliable transport has been added for output ports. This can be
    used in some cases if the producer wants to ensure buffers are
    consumed by a consumer. (#4885)
  - Context properties now support rlimit.<resource> properties to
    configure rlimits. (#4047)

Modules
  - Close SyncObj fds.
  - module-combine-stream has better Latency reporting.
  - The JACK tunnel can now optionally connect ports.
  - module-loopback has better Latency reporting.
  - A Dolby Surround and Dolby Pro Logic II example filter config
    was added.
  - Filter-chain can now resample to a specific rate before running the
    filters. This is useful when the filter-graph needs to run at a
    specific rate.
  - Avahi-poll now uses the timer-queue to schedule timeouts.
  - Modules are ported to timer-queue instead of using timerfd directly
    for non-realtime timers.

SPA
  - The loop now has support for locking with priority inversion. Most
    of the code was updated to use the locks instead of invoke to
    get proper concurrent updates with the loop. The Thread loop
    functionality of locks, signal and wait was moved to the SPA loop.
  - UMP to Midi 1.0 conversion was improved, some UMP events are now
    converted to multiple Midi 1.0 messages. (#4839)
  - The POD filter was refactored and improved. It is now possible to
    use the default value of the output by specifying an invalid input
    default value.
  - The POD parser was made safe for concurrent updates of the memory
    it is parsing. This is important when the POD is in shared memory
    and the parser should not access invalid memory.
  - Some hardcoded channel limits were removed and now use the global
    channel limit. More things can dynamically adapt to this global
    limit. The max number of channels was then bumped to 128.
  - The POD builder is safe to use on shared memory now and tries to
    avoid many integer overflows.
  - Most debug functions are safe to be used on shared memory.
  - User specified Commands and Events are now possible.
  - The SPA_IO_CLOCK_FLAG_DISCONT was added to spa_io_clock to signal
    a discont in the clock due to clock change.
  - AC3, DTS, EAC3, TRUEHD and MPEGH now have helper parser functions.
  - H265 was added as a video format. (#4674)
  - SPA_PARAM_PeerFormats was added to let a port know about its peer
    formats in order to better filter possible conversions.
  - More color matrices, transfer functions and color primaries.
  - The echo-canceler is enabled now.
  - Pro-Audio mode now uses 3 periods by default. This lowers the
    latency on some drivers (Firewire). The latency of Firewire is
    also reported correctly now.
  - The ALSA DLL bandwidth is configurable now.
  - The resampler now uses fixed point for the phases and is a little
    faster when updating adaptive rates.
  - The convolver is a little faster by swapping buffers instead of
    copying samples.
  - Latency and ProcessLatency support was added to filter-graph.
    (#4678)
  - Audio channel position support was added to filter-graph.
  - A new ffmpeg avfilter plugin was added to filter-graph.
  - A new ONNX filter was added to filter-graph.
  - A debug, pipe, zeroramp and noisegate filter was added to the
    filter-graph. (#4745)
  - The filter-graph lv2 plugin now supports options and state.
  - videoconvert was greatly improved.
  - The v4l2 plugin can negotiate DMABUF with modifiers.
  - Colorimetry information was added to v4l2 and libcamera.
  - Audioconvert can handle empty buffers more efficiently.
  - Improve the POD compare functions for Rectangle.
  - There is now a SPA_POD_PROP_FLAG_DROP flag to drop the property when
    the property is missing from one side.
  - A new FEATURE choice was added that is basically a flags choice with
    a FLAG_DROP property.
  - Metadata features were added. This is a way to negotiate new features
    for the metadata. (#4885)
  - DSD playback with pw-cat has been improved.
  - Compatibility and xrun prevention for the SOF driver has been
    improved. (#4489)
  - The filter-graph max plugin can now have 8 input channels.
  - Buffer Negotiation between the mixer port and the node ports is much
    improved. (#4918)
  - An offline AEC benchmark was added.
  - Channel positions are now read from HDMI ELD when possible.
  - Audioconvert and filter-graph now also support properties of Long
    and String types.

ACP
  - It's possible to disable the pro-audio profile.
  - Support for Logitech Z407 PC Speakers was improved.
  - Support for Razer BlackShark v3.
  - Fix volume rounding down causing mute. (#4890)

Tools
  - pw-cat can now play and record MIDI 2.0 Clips, which is the
    official format for storing MIDI 2.0 UMP data. pw-midi2play
    and pw-midi2record were added as aliases.
  - pw-cat can now upload sysex files. The pw-sysex alias was
    added for this.
  - The pw-link tool now has a -t option to list port latencies.
    It also has better monitor support.
  - pw-top can now clear the ERR column with the c key.
  - pw-cli now keeps the types of the variables it stores and avoid
    using wrongly typed variables that can crash things. It can now
    also list the available variables.
  - pw-dump can now output raw JSON and SPA JSON.
  - pw-dump has configurable indentation level.
  - pw-mididump can be forced to output MIDI 1.0 messages.
  - pw-profiler now uses doubles for extra precision.
  - pw-top now marks the async nodes with =3D.

Bluetooth
  - Telephony improvements.
  - ASHA support was added.
  - Packet loss concealment was added.
  - Improved synchronisation between LE Audio streams in the same group.
  - Improved LE Audio device compatibility.
  - LC3-24kHz voice codec was added (used by Airpods)
  - LDAC decoding support added (requires separate decoder library)

Pulse-server
  - The SUSPEND event is now correctly generated. fail-on-suspend is
    now implemented.
  - PA_STREAM_DONT_INHIBIT_AUTO_SUSPEND is now implemented. (#4255)
    (#4726)
  - RTP streams now have stream.properties for extra configuration.
  - Timed out streams are now destroyed instead of lingering. (#4901)
  - A new help and pipewire-pulse:list-modules core message was added.

JACK
  - Port rename callbacks are now emitted correctly.
  - Use safe POD parsing for the control sequences.

V4l2
  - The wrapper now avoids a race while initializing PipeWire. (#4859)

GStreamer
  - Colorimetry support was added.
  - Cursor metadata is now exposed as ROI metadata.
  - Many more updates.

Docs
  - Document the client-node flow a bit more.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.4.10.bb =3D> pipewire_1.6.0.bb}     | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.10.bb =3D=
> pipewire_1.6.0.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
index a0b3848dd0..dec0e7bbd9 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "ced36a5315135044a22c4b373be44368d312f9c8"
+SRCREV =3D "700cea78dbe7564131d51b21a7795e2567ee048a"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
=20
@@ -127,7 +127,7 @@ PACKAGECONFIG[raop] =3D "-Draop=3Denabled,-Draop=3Ddi=
sabled,openssl"
 PACKAGECONFIG[readline] =3D "-Dreadline=3Denabled,-Dreadline=3Ddisabled,=
readline"
 PACKAGECONFIG[sdl2] =3D "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,virtual/libs=
dl2"
 PACKAGECONFIG[sndfile] =3D "-Dsndfile=3Denabled,-Dsndfile=3Ddisabled,lib=
sndfile1"
-PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
+PACKAGECONFIG[systemd] =3D "-Dlibsystemd=3Denabled,-Dlibsystemd=3Ddisabl=
ed,systemd"
 PACKAGECONFIG[systemd-system-service] =3D "-Dsystemd-system-service=3Den=
abled,-Dsystemd-system-service=3Ddisabled,systemd"
 # "systemd-user-service" packageconfig will only install service
 # files to rootfs but not enable them as systemd.bbclass
@@ -312,6 +312,8 @@ FILES:${PN}-tools =3D " \
     ${bindir}/pw-link \
     ${bindir}/pw-loopback \
     ${bindir}/pw-metadata \
+    ${bindir}/pw-midi2play \
+    ${bindir}/pw-midi2record \
     ${bindir}/pw-mididump \
     ${bindir}/pw-midiplay \
     ${bindir}/pw-midirecord \
@@ -320,6 +322,7 @@ FILES:${PN}-tools =3D " \
     ${bindir}/pw-profiler \
     ${bindir}/pw-record \
     ${bindir}/pw-reserve \
+    ${bindir}/pw-sysex \
     ${bindir}/pw-top \
 "
=20
--=20
2.52.0


