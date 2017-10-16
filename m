Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EBDFA6FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 14:37:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2017 07:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,371,1503385200"; 
   d="scan'208";a="721718"
Received: from jaertebj-mobl.ger.corp.intel.com (HELO
	rkubodac-desk.ger.corp.intel.com) ([10.252.14.1])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2017 07:37:47 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Jacobo Aragunde =?utf-8?Q?P=C3=A9rez?= <jaragunde@igalia.com>
In-Reply-To: <5612aa4c-d986-89f7-7667-14898b5f7bfc@igalia.com> ("Jacobo
	Aragunde \=\?utf-8\?Q\?P\=C3\=A9rez\=22's\?\= message of "Thu,
	12 Oct 2017 20:18:58 +0200")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<5612aa4c-d986-89f7-7667-14898b5f7bfc@igalia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Mon, 16 Oct 2017 16:37:46 +0200
Message-ID: <878tgbxio5.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Mon, 16 Oct 2017 14:37:49 -0000
X-Groupsio-MsgNum: 69207
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

+oe-devel again

Jacobo Aragunde P=C3=A9rez <jaragunde@igalia.com> writes:
> On 05/10/17 17:26, Jacobo Aragunde P=C3=A9rez wrote:
>> Hi everyone,
>>
>> I have several potential patches for Rafael's layer after having tried
>> several builds for different hardware. I'm sending individual mails to
>> discuss each of them.
>>
>
> The second patch is a fix that I needed with a GCC 5.4.0 toolchain. The
> fix looks harmless enough so I sent it upstream (to the webrtc project),
> but I don't know if it will be merged.
>
> I have another couple patches to fix problems that only happen when
> compiling with linaro-5.3, one of them is a backport for the compiler
> itself. I don't think they belong in this layer so I'm finally not
> sending them. Anyway, ask me if you are interested!
>
> All in all, I have created images with Rafael's layer for Raspberry Pi 3
> and R-Car gen 3 with different toolchains: GCC 5.4.0 and 6.3.0 for the
> former, and linaro-5.3 for the latter. Let me know if you want me to do
> any other tests.

Hey Jacobo,

Thanks for all the testing so far!

Can you check if the attached patch also solves the WebRTC build issue
for you? I've tried it here with Yocto's morty branch and GCC 5.4.0.

If so, I'll send it upstream, as the original approach
(https://webrtc-review.googlesource.com/c/src/+/8641) was not accepted
by the WebRTC maintainers.


--=-=-=
Content-Type: text/x-patch
Content-Disposition: attachment; filename=webrtc-gcc5-build-fix.patch
Content-Description: Proposed patch

--- a/third_party/webrtc/modules/audio_processing/aec3/aec_state.cc	2017-10-16 16:31:47.636478663 +0200
+++ b/third_party/webrtc/modules/audio_processing/aec3/aec_state.cc	2017-10-16 16:31:45.329471819 +0200
@@ -157,7 +157,7 @@
   // TODO(peah): Add the delay in this computation to ensure that the render and
   // capture signals are properly aligned.
   RTC_DCHECK_LT(0, x.size());
-  const float max_sample = fabs(*std::max_element(
+  const float max_sample = fabsf(*std::max_element(
       x.begin(), x.end(), [](float a, float b) { return a * a < b * b; }));
   const bool saturated_echo =
       previous_max_sample_ * 100 > 1600 && SaturatedCapture();
@@ -271,9 +271,9 @@
   auto result_x = std::minmax_element(x.begin(), x.end());
   auto result_s = std::minmax_element(s.begin(), s.end());
   const float x_abs =
-      std::max(std::abs(*result_x.first), std::abs(*result_x.second));
+      std::max(fabsf(*result_x.first), fabsf(*result_x.second));
   const float s_abs =
-      std::max(std::abs(*result_s.first), std::abs(*result_s.second));
+      std::max(fabsf(*result_s.first), fabsf(*result_s.second));
 
   if (x_abs < 5.f) {
     ++low_farend_counter_;
@@ -294,7 +294,7 @@
 void AecState::EchoAudibility::UpdateWithOutput(rtc::ArrayView<const float> e) {
   const float e_max = *std::max_element(e.begin(), e.end());
   const float e_min = *std::min_element(e.begin(), e.end());
-  const float e_abs = std::max(std::abs(e_max), std::abs(e_min));
+  const float e_abs = std::max(fabsf(e_max), fabsf(e_min));
 
   if (max_nearend_ < e_abs) {
     max_nearend_ = e_abs;

--=-=-=--
