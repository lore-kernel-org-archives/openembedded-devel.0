Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B650EC282D1
	for <webhook@archiver.kernel.org>; Sun,  9 Mar 2025 07:57:48 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.11773.1741507063804186880
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 23:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout07.t-online.de (Postfix) with SMTP id E6A4529F
	for <openembedded-devel@lists.openembedded.org>; Sun,  9 Mar 2025 08:57:41 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.73]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1trBXU-2PgNZh0; Sun, 9 Mar 2025 08:57:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] pipewire: update 1.2.7 -> 1.4.0
Date: Sun,  9 Mar 2025 08:58:09 +0100
Message-ID: <20250309075810.552098-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741507056-B37FD970-0AE26D30/0/0 CLEAN NORMAL
X-TOI-MSGID: d6c85393-e146-44ab-bcfd-99e5d4a3ef76
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Mar 2025 07:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115814

- remove backport patch
- install libspa.so to libpipewire package

PipeWire 1.4.0 (2025-03-06)

This is the 1.4 release that is API and ABI compatible with previous
1.2.x and 1.0.x releases.

This release contains some of the bigger changes that happened since
the 1.2 release last year, including:

  * client-rt.conf was removed, all clients now use client.conf and
    are given RT priority in the data threads.
  * UMP (aka MIDI2) support was added and is now the default format
    to carry MIDI1 and MIDI2 around in PipeWire. There are helper
    functions to convert between legacy MIDI and UMP.
  * The resampler can now precompute (at compile time) some common
    conversion filters. Delay reporting in the resampler was fixed and
    improved.
  * Bluetooth support for BAP broadcast links and support for hearing aid=
s
    using ASHA was added. A new G722 codec was also added.
    Delay reporting and configuration in Bluetooth was improved.
  * The ALSA plugin now supports DSD playback when explicitly allowed
    with the alsa.formats property.
  * A PipeWire JACK control API was added.
  * A system service was added for pipewire-pulse.
  * Many documentation and translation updates.
  * Many of the SPA macros are converted to inline functions.  All SPA
    inline functions are now also compiled into a libspa.so library to
    make it easier to access them from bindings.
  * The module-filter-chain graph code was moved to a separate
    filter-graph SPA plugin so that it becomes usable in more places.
    EBUR128, param_eq and dcblock plugins were added to filter-graph.
    The filter graph can now also use fftw for doing convolutions.
    The audioconvert plugin was optimized and support was added to
    audioconvert to insert extra filter-graphs in the processing pipeline=
.
  * New helper functions were added to parse JSON format descriptions.
  * The profiler now also includes the clock of the followers.
  * RISCV CPU support and assembler optimisations were added.
  * The clock used for logging timestamps can be configured now.
  * The JSON parser was split into core functions and helper.
  * Support for UCM split PCMs was added. Instead of alsa-lib splitting
    up PCMs, PipeWire can mark the PCMs with the correct metadata so that
    the session manager can use native PipeWire features to do this.
  * Support for webrtc2 was added to echo-cancel.
  * IEC958 codecs are now detected from the HDMI ELD data.
  * Conversion between floating point and 32 bits now preserve 25 bits of
    precision instead of 24 bits.
  * A new Telephony D-BUS API compatible with ofono was added.
  * The invoke queues are now more efficient and can be called from multi=
ple
    threads concurrently.
  * Clock information in v4l2 was improved.
  * An ffmpeg based videoconvert plugin was added that can be used with t=
he
    videoadapter.
  * The GStreamer elements have improved buffer pool handling and rate
    matching.
  * The combine-stream module can now also mix streams.
  * link-factory now checks that the port and node belong together.
  * The netjack-manager module has support for autoconnecting streams.
  * The native-protocol has support for abstract sockets.
  * The pulse server has support for blocking playback and capture in
    pulse.rules.
  * The corked state of stream is now reported correctly in pulse-server.
  * Fix backwards jumps in pulse-server.
  * Latency configuration support was added in loopback and raop-sink.
  * The ROC module has more configuration options.
  * The SAP module now only send updated SDP when something changed.
  * RTP source now has a standby mode where it idles when there is no
    data received.
  * Support for PTP clocking was added the RTP streams.
  * The VBAN receiver can now dynamically create streams when they are
    detected.
  * Error reporting when making links was improved.
  * Support for returning (canceling) a dequeued buffer in pw-stream.
  * Support for emiting events in pw-stream was added.
  * pw-cat now support stdin and stdout.

Highlights (since the previous 1.3.83 release)
  - Small fixes and improvements.

PipeWire
  - Fix some missing includes in metadata.h
  - Pass the current error in errno when a stream is in error (#4574)

modules
  - Evaluate node rules before loading adapter follower to ensure
    properties are set correctly. (#4562)

SPA
  - Avoid a use after free when building PODs. (#4445)
  - Take headroom into account when calculating resync.

Bluetooth
  - Fix +CLCC parsing.

GStreamer
  - Notify about default device changes in deviceprovider.
  - Copy frames between pools and avoid splitting video buffers.

JACK
  - Add an option to disable the MIDI2 port flags. (#4584)

Older versions:

PipeWire 1.3.83 (2025-02-20)

This is the third and hopefully last 1.4 release candidate that
is (almost) API and (entirely) ABI compatible with previous 1.2.x
and 1.0.x releases.

We note that in the 1.3.x series, the API is slighty not backwards
compatible because some methods previously used to accept void* as
a parameter while they now require the correct type. We think this
is however a good kind of API breakage and expect projects to patch
their code to get things compiled with newer version (which will also
compile for older versions). Note also that this is not an ABI break.

  - Handle JACK transport updates in a better way.
  - Fix a SAP regression when starting.
  - Fix regression in rate scaling.
  - Improve bluetooth source rate handling.
  - More small bugfixes and improvements.

  - Handle JACK transport updates in a better way. (#4543)

  - Check that the link factory port and nodes match. Deprecate the
    port.id when making links.
  - Improve profiler output by scaling the quantum with the node
    rate so that we don't end up with confusing information. (#4555)
  - Fix sending of the SAP SDP. Handle some SDP parsing errors.
  - Add some more options to the ROC source module. (#4516)

  - Fix firewire quirks in udev rules. (#4528)
  - Fix a bug in the rate scaling in some cases that would make things
    run with the wrong samplerate.
  - Improve introspection of control types.

  - Use the G722 codec from Android instead of FFmpeg for ASHA.
  - Use the A2DP source rate as the graph rate. (#4555)
  - Specify the bluetooth source latency property in the rate of the
    stream to avoid conversions and rounding errors.

This is the second 1.4 release candidate that is API and ABI
compatible with previous 1.2.x and 1.0.x releases.

  - Various pw-stream improvements: timing information fixes,
    avoid locking buffers in some cases and an improved drain
    event.
  - A new Telephony D-BUS API compatible with ofono.
  - Documentation fixes and updates.
  - More small fixes and improvements.

  - Improve timing information when rate is unknown.
  - Avoid locked buffers in pw_stream in some cases.
  - Improve pw_stream drain event emission.
  - Improve manager socket handling. Applications can avoid hardcoding
    the sockets so that they will respect the config settings.

  - Fix header size calculation when using ipv6. (#4524)

  - Optimize byteswapped s16 conversions.
  - Improve event handling for internal events.
  - Optimize negiotiation when in convert mode, prefer the format
    of the follower in adapter.
  - Fix EnumPortConfig for videoadapter without converter.
  - Fix libcamera property buffer size.

  - Add systemwide systemd files.

  - Add a UMP example.
  - Use the new JackPortMIDI2 flag to mark UMP ports to JACK.

  - Support BAP hardware volume.
  - Add a Telephony DBUS API.

  - Disable buffer pools for audio by default.

  - Improve the module documentation.

This is the first 1.4 release candidate that is API and ABI
compatible with previous 1.2.x and 1.0.x releases.

In addition to all the changes backported to 1.2.x, this release
also contains some new features:

  - UMP support was added with MIDI 1.0 and MIDI 2.0 support in the ALSA
    sequencer plugin. By default PipeWire will now use MIDI 2.0 in UMP
    messages to transport MIDI in the graph, with conversions to/from leg=
acy
    MIDI where required. This requires UMP support in the kernel.
  - client-rt.conf is no longer supported. Custom changes made to this
    config should be moved to client.conf. Clients that try to load the
    client-rt.conf will emit a warning and be directed to client.conf
    automatically for backwards compatibility.
  - The module-filter-chain code was moved to a new filter-graph plugin. =
This
    made it possible to add filter-graph support directly in audioconvert=
. It
    is now possible to run up to 8 run-time swappable filter-graphs insid=
e
    streams and nodes. This should make it easier to add effects to strea=
ms
    and device nodes.
  - Bluetooth support for BAP broadcast links and support for hearing aid=
s
    using ASHA was added.
  - Many more bugfixes and improvements.

  - Nodes are now only scheduled when ready to signal the driver.
  - Add slovenian translation. (#4156)
  - Link errors are handled better.
  - The videoadapter is now enabled by default but no videoconverter
    is loaded yet by default.
  - Streams now have support for ProcessLatency.
  - Streams now have a method to emit events.
  - The RequestProcess event and command can now pass around extra
    properties.
  - Local timestamps are now used for logging.
  - client-rt.conf is no longer supported. Custom changes made to this
    config should be moved to client.conf. Clients that try to load the
    client-rt.conf will emit a warning and be directed to cliert.conf
    automatically to preserve backwards compatibility.
  - pw_stream now has an API to return unused buffers.

  - module-combine-stream can now mix streams.
  - Links in error are now destroyed by link-factory.
  - The netjack2 driver can now also create streams that autoconnect when
    specified. (#4125)
  - Many updates and bugfixes to the RTP modules.
  - The netjack2 driver can now bind to a custom IP and port pair. (#4144=
)
  - The loopback module and module-raop have support for ProcessLatency, =
which
    can be used to query and update the latency.
  - The profiler module can now reduce the sampling rate.
  - The filter-chain was optimized some more.
  - The filter-chain gained some more plugins: param_eq, ebur128, dcblock=
.
  - Support for fftw based convolver was added.
  - Some module arguments can now be overridden.
  - The VBAN receiver now creates new streams per stream name. (#4400)
  - The RTP SAP module is now smarter with generating new SAP messages.
  - The RTP source can now be paused when no data is received. (#4456)

  - pw-cat can now stream most formats from stdin/stdout.
  - pw-profiler has a JSON dump option to dump the raw profiler data.
  - pw-cli now supports unload-module. (#4276)

  - The resampler can precompute some common coeficients now at compile
    time.
  - UMP support was added with MIDI 1.0 and MIDI 2.0 support in the ALSA
    sequencer plugin. By default PipeWire will now use MIDI 2.0 in UMP
    messages to transport MIDI in the graph, with conversions to/from leg=
acy
    MIDI where required.
  - Control types can now be negotiated.
  - Support for writing ALSA bind controls was added.
  - The ALSA sequencer now has better names for the ports.
  - The F32 to S32 conversion now uses 25 bits for an extra bit of
    precision.
  - libcamera controls can now be set in all cases.
  - The videoadapter has been improved and a dummy and ffmpeg based
    videoconverter plugin was added.
  - Negotiation was improved in audioadapter. First a passthrough format
    is tried.
  - Some JSON helper functions were added and some duplicate code removed
    or simplified.
  - Add support for RISC V CPU detection and add many optimizations in
    the audio converters.
  - Add an option to disable ALSA mixer path select. (#4311)
  - Fix a potential bug with the cleanup of the loop queues.
  - ALSA nodes now dynamically adjust the DLL bandwidth based on average
    measured variance.
  - The loop invoke queue was made more efficient and make it possible to
    invoke from multiple threads.
  - The filter-chain code was moved to a new filter-graph plugin.
  - Most function macros are now static inlined and can also be built int=
o a
    libspa.so file. This should improve language bindings.
  - V4l2 clock information was improved.
  - Supported IEC958 codecs are now autodetected via ELD info.
  - Audioconvert was optimized some more.
  - Audioconvert can now include filter-graphs in its processing.
  - webrtc-audio-processing-2 is now supported in AEC.
  - The resampler now reports the delay and subsample delay. Also the
    delay is reported in the samplerate of the input.
  - The ALSA sequencer now handle kernels without UMP support. (#4507)

  - Add quirk to block clients from making record and playback streams.
  - The corked state is now set on stream to always report this state
    correctly to other clients.
  - Readiness notification was added to the pulse server with the
    PIPEWIRE_PULSE_NOTIFICATION_FD environment variable. (#4347)
  - The pulse.cmd config now supports conditions.
  - A bug in clearing the ringbuffer was fixed. (#4464)

  - Support for the default devices was added to the deviceprovider. (#42=
68)
  - The graph clock is now used as the source for the GStreamer clock.
  - The sink now does some rate control.

  - The ALSA plugin now supports DSD when explicitly enabled.

  - JACK now supports 2 new extension formats for OSC and UMP.
  - JACK clients can receive UMP MIDI1 or MIDI2 messages when using
    the new UMP port format extension.
  - JACK now reports the PipeWire version in the minor/micro/proto.
  - Implement more jackserver functions.

  - Support BAP broadcast links.
  - Support for ASHA was added.
  - Delay reporting in A2DP sources was improved.

  - 2 new examples of pw-stream using spa_ringbuffer were added.

  - Many updates to the man pages.
  - More documentation about thread safety of functions in stream
    and filters. (#4521)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...4277b317b4836beccaa3248ab9055526811c.patch | 46 -------------------
 .../{pipewire_1.2.7.bb =3D> pipewire_1.4.0.bb}  |  6 +--
 2 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/files/0ca=
64277b317b4836beccaa3248ab9055526811c.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.2.7.bb =3D=
> pipewire_1.4.0.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/files/0ca64277b3=
17b4836beccaa3248ab9055526811c.patch b/meta-multimedia/recipes-multimedia=
/pipewire/files/0ca64277b317b4836beccaa3248ab9055526811c.patch
deleted file mode 100644
index 9b05e9e4c3..0000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/files/0ca64277b317b4836=
beccaa3248ab9055526811c.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0ca64277b317b4836beccaa3248ab9055526811c Mon Sep 17 00:00:00 2001
-From: Wim Taymans <wtaymans@redhat.com>
-Date: Mon, 30 Sep 2024 10:06:30 +0200
-Subject: [PATCH] spa: initialize all fields explicitly
-
-Patch by Petar Popovic
-
-Fixes #4325
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/pipew=
ire/-/commit/0ca64277b317b4836beccaa3248ab9055526811c]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- spa/include/spa/pod/builder.h | 2 +-
- spa/include/spa/pod/parser.h  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/spa/include/spa/pod/builder.h b/spa/include/spa/pod/builder=
.h
-index 0564d94ea2..6d3e9d54af 100644
---- a/spa/include/spa/pod/builder.h
-+++ b/spa/include/spa/pod/builder.h
-@@ -49,7 +49,7 @@ struct spa_pod_builder {
- 	struct spa_callbacks callbacks;
- };
-=20
--#define SPA_POD_BUILDER_INIT(buffer,size)  ((struct spa_pod_builder){ (=
buffer), (size), 0, {0}, {0} })
-+#define SPA_POD_BUILDER_INIT(buffer,size)  ((struct spa_pod_builder){ (=
buffer), (size), 0, {0,0,NULL},{NULL,NULL}})
-=20
- static inline void
- spa_pod_builder_get_state(struct spa_pod_builder *builder, struct spa_p=
od_builder_state *state)
-diff --git a/spa/include/spa/pod/parser.h b/spa/include/spa/pod/parser.h
-index 083f911713..4c1e72acce 100644
---- a/spa/include/spa/pod/parser.h
-+++ b/spa/include/spa/pod/parser.h
-@@ -33,7 +33,7 @@ struct spa_pod_parser {
- 	struct spa_pod_parser_state state;
- };
-=20
--#define SPA_POD_PARSER_INIT(buffer,size)  ((struct spa_pod_parser){ (bu=
ffer), (size), 0, {0} })
-+#define SPA_POD_PARSER_INIT(buffer,size)  ((struct spa_pod_parser){ (bu=
ffer), (size), 0, {0,0,NULL}})
-=20
- static inline void spa_pod_parser_init(struct spa_pod_parser *parser,
- 				       const void *data, uint32_t size)
---=20
-GitLab
-
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.7.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.7.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
index 8c486b9c5e..d897ddb25d 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.7.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
@@ -12,9 +12,8 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "cc7439187f61dd73b81ca69f5dbccbb52ce970b2"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.2;protocol=3Dhttps"
-SRC_URI +=3D "file://0ca64277b317b4836beccaa3248ab9055526811c.patch"
+SRCREV =3D "df1c36aec2aaf9e2eb1596b6b55e72c15fb2088a"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -283,6 +282,7 @@ CONFFILES:libpipewire +=3D "${datadir}/pipewire/clien=
t.conf"
 FILES:libpipewire =3D " \
     ${datadir}/pipewire/client.conf \
     ${libdir}/libpipewire-*.so.* \
+    ${libdir}/${SPA_SUBDIR}/libspa.so \
 "
 # Add the bare minimum modules and plugins required to be able
 # to use libpipewire. Without these, it is essentially unusable.
--=20
2.48.1


