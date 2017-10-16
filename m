Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A4194605C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 14:59:21 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2017 07:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,387,1503385200"; d="scan'208";a="323805390"
Received: from jaertebj-mobl.ger.corp.intel.com (HELO
	rkubodac-desk.ger.corp.intel.com) ([10.252.14.1])
	by fmsmga004.fm.intel.com with ESMTP; 16 Oct 2017 07:59:21 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Jacobo Aragunde =?utf-8?Q?P=C3=A9rez?= <jaragunde@igalia.com>
In-Reply-To: <878tgbxio5.fsf@rkubodac-desk.ger.corp.intel.com> (Raphael Kubo
	da Costa's message of "Mon, 16 Oct 2017 16:37:46 +0200")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<5612aa4c-d986-89f7-7667-14898b5f7bfc@igalia.com>
	<878tgbxio5.fsf@rkubodac-desk.ger.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Mon, 16 Oct 2017 16:59:15 +0200
Message-ID: <874lqzxhoc.fsf@rkubodac-desk.ger.corp.intel.com>
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
X-List-Received-Date: Mon, 16 Oct 2017 14:59:21 -0000
X-Groupsio-MsgNum: 69208
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:
> Can you check if the attached patch also solves the WebRTC build issue
> for you? I've tried it here with Yocto's morty branch and GCC 5.4.0.
>
> If so, I'll send it upstream, as the original approach
> (https://webrtc-review.googlesource.com/c/src/+/8641) was not accepted
> by the WebRTC maintainers.

Sorry, I'm attaching patch v2, the original version had an extra,
unwanted chunk.


--=-=-=
Content-Type: text/x-patch
Content-Disposition: attachment; filename=webrtc-gcc5-build-fix.patch
Content-Description: Proposed patch

--- a/third_party/webrtc/modules/audio_processing/aec3/aec_state.cc	2017-10-16 16:31:47.636478663 +0200
+++ b/third_party/webrtc/modules/audio_processing/aec3/aec_state.cc	2017-10-16 16:31:45.329471819 +0200
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
