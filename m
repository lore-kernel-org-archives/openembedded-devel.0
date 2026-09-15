Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AB7C88E72
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 01:32:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13657.1789435936746398752
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 18:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ipE2PjEU;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=V2jArcSW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxw4d2505723
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oc+bbL5i+uI7ueErRprfHt4XaqgycQ02MFwouHwrEZ0=; b=ipE2PjEUH20pzMsU
	7f2RZK7rTZKYZ+lk4sTlqMHKiJ27XIkoe3tOq6yYVXxT6gjAgPvrMo7va29XT8/T
	enpy8RqLDjohWluvIv8sBhxBo5X+zs6rvBwK2hItz8uvXOxaTp2xn9l5ApsE0Kp3
	ZWxyiB64EmJJoM4Z1Aau4e3Y7E2bHsxrvbFPGqvLKqkCOAyfII1L2dhYpNFxCYzt
	nsAaEFNm9iDsK8R8c+WoKSRIkMG9eD1HeHcgRwk9Q7u/dNNbeEYz5K0PskaLkgr5
	y85liWrwvPSJUTWuRPYAvalu9mqVPEQcHLSOEV5qXr+dbwvRmQzhLEBVUPWClP4E
	kRPybg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevuqq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:32:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106fce784dso101548606d6.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 18:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789435934; cv=none;
        d=google.com; s=arc-20260327;
        b=C1XotVhplOINknuLcGc2bGVqss6CR9+kTcfF/NlEVu2eQLdsSduJBT5h+uejt1kmov
         6BeaVuRNCNRMERWsdkPGjsdbJmkQTYH2OcSVWTUUGlDp5ufpXXOj9XzvLB9CK89S6cNZ
         9/UNTlykJGVWQAqIz89xI06NKhtcNd9yeAZg1fRSZlXw739ZYFzPs/hF7z5oiePHHxZ3
         FGnx+V/FtZLToBZUrff5MtRyxUfUDTiw9DBIHITHnOmW4ADdQcxKnwRUWaVOieCKspKd
         WeD0KijCVr/G1h8DOC/OxMmrFD4DlExjydoyrXP5BsJp6ShBmAQJxqcTXwglEl/WjnmI
         zZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oc+bbL5i+uI7ueErRprfHt4XaqgycQ02MFwouHwrEZ0=;
        fh=3SZ0ZRd4ivd55A2zau86DJXwBNQKJsQ8exabaG61Zqg=;
        b=sVbD5eIQsbFcRM9gUHht0zbrgkkXgIMieOf7WRcpQlPnp+TxIb+AL6CQBUEQABOnUv
         yvr7iLMYhDgWO1nHwx9IjKnBBErkI5629pF+icIQuhC3btOt3mwUkpBCqJlupvZES0bD
         t6Lr5fLp4X0VeTnq/rgUoC2oz1S0u8g7fAlN/bBTv9K9BihwcpMjw2yg9SvRpV3txULC
         5TKj68jTvdNSb4WUJbx++GhsOL8gsI70oC+z+NGD+rQlLnk50rUMqqvqYBhV3nQdC4jv
         GNzn+fm1ii+C5G4TkGoYjW6o39pD+CMQG+cqyYuaOnDuH3Na9y1lu/tDcZM/VUlBDjmj
         qIQw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789435934; x=1790040734; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oc+bbL5i+uI7ueErRprfHt4XaqgycQ02MFwouHwrEZ0=;
        b=V2jArcSWWifBVnilO8bXFTjK/M5+0g11911cnWjkawcnhr0DhOWanqanj/YRYCOZGQ
         0moh1CZgM6Ya276nGplLh02150IECHaomjosgret65jV2JxOCjSp49xCG/DxpRV88jYR
         rjfIFKOCXswslMIqdOLKL8+LKdBX2Br1gfqoBnr80jSUXfbX+Wgwi2aYfrNmHfCrfteG
         wmXYoqipY9OkjP0lXgkSp8TP0JaEzh+8KF//4TleSreE619jLioBvztWVHJRe/7Avn8h
         MITYHSvbUeBFUSJqZQJWxo17QB9Rqwj7NW98ZHfSadOQbIVn2Bs9DSH4iwlYQRsyiDlC
         leUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435934; x=1790040734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oc+bbL5i+uI7ueErRprfHt4XaqgycQ02MFwouHwrEZ0=;
        b=hkKnqoo8bNytLbdbwTE+CVLnsx2coIR9mrBEzbtGY0APhOB8Bq1y0/PmpdEM0N4vQM
         ngal+9sbRfWMz8EGG5hbu49YTF2hcA7fZYXn6bD/5rbGftrASm8hNkBtGghntk1hxTlz
         xYFsZ2eMRWDO09UpFW7r1C5+PIYlEIzb/wImAhwg43M9wX+XOO3SAaylnt9fnOHX8X9m
         DnLIntjoyPEU95nhYG+AKjdm/yYsf1GAuZm6XLEiNj0I6velAkvj8r8lw3rhTeyrDLQy
         FlN8qmPib+ak1Zjg226MBDbWQIpmk5TuWY2bXoJZHN8/YBzq74lJ3jUkfeN1E4owSL8I
         U1xQ==
X-Gm-Message-State: AFuF++m6xx6pYgOs1XU/BPlrhLLZ/nHyVwtNi+bn/KNTkt6pw75epdvi
	8r28bcilaCqO9BbyjEyS5HARfFkgowP4gX8otxGbE952ZqJrpgpr9//o+pZnaL4DmSQpKCosBqc
	O0MTRO+yBLRFFF/BP5yDlgpScIIEJJkbwTxszrjgp0ZlDGDOs0pQZ3SAz22KNgOEXLjGf1XZwiL
	3jIjzMAScYnds17LrlnGx5TT5dNFBZ5u9jOieZYENlojSMNqwC/fM4JQmwmuCvBYnwGTtC/A==
X-Gm-Gg: AYBFou25RvCnCD7mxFVz44sjyQwovLU1vvymVOjIrF3aBTDMIWL6/PHcTP3YsjIw2zC
	CmIM1S2vVdZLJ+i0beBBvkSUUyp68eI3gkhnY+ItCnVVWhNvxPFIECPs4/asHxSSsyT408K/vUY
	cZAb1VEub2fvL25HLPA3f/+s+XCCVPnPmil39teU+bmaqTQMw/D9mnEsbe3Q==
X-Received: by 2002:a05:6214:1942:b0:910:345b:476f with SMTP id 6a1803df08f44-9122e67bd01mr101981476d6.36.1789435934305;
        Mon, 14 Sep 2026 18:32:14 -0700 (PDT)
X-Received: by 2002:a05:6214:1942:b0:910:345b:476f with SMTP id
 6a1803df08f44-9122e67bd01mr101980876d6.36.1789435933799; Mon, 14 Sep 2026
 18:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260907102107.4007371-1-Abhishek.Bachiphale@windriver.com> <20260907102107.4007371-3-Abhishek.Bachiphale@windriver.com>
In-Reply-To: <20260907102107.4007371-3-Abhishek.Bachiphale@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 09:32:09 +0800
X-Gm-Features: AcwNN1UYrZyVCGS92-Bi-PQffWK4GUxUeDDNQQT9GSPN4idcWxErPGriCSshZYA
Message-ID: <CA+s=J=xNzu-ePySUXPV8=d6X22wsUEtfdWcffC=MsHa0HyAOiA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][wrynose][PATCH 2/4] thrift: fix CVE-2026-48586
To: abhishek.bachiphale@windriver.com
Cc: openembedded-devel@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 6NblS7fqdC4lFKV0CDHdrQjuuy79km4n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAxOCBTYWx0ZWRfX8V8R4/SxTSoL
 Cq+GX1iNbUtkL4iCuodJraOQXFGKGegNRWvaU2mt0L9ddmPojBukUjPZAHhw5gu5qXYmPzqvYSQ
 EkR+TxQMLihZnmBTL8spxzPsBYpY5Fk=
X-Proofpoint-GUID: 6NblS7fqdC4lFKV0CDHdrQjuuy79km4n
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa8a01f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=mV9VRH-2AAAA:8 a=6gl_cCoBAAAA:8 a=2kaavj854pszr1ZKtfoA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Bor9z-CvbNo2M6AZn8_k:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAxOCBTYWx0ZWRfX5ELOfwPhdBck
 yYaD+P1i1sVj6bBerhzf14JzQparbYBaSHKKpOVN1OEnJ61x0by5ALW0oulYy2mjXD4tBsJJRFV
 O7Pu9fSbJaLL7s1AzZ4RK0+/Vs3PXkA1zmPG7pLFPbQcPG/pALsgXCPZRtw95m8FgChC1F+62Nl
 ScgaVnShE/NWZhsgus97W0cmD3FvT4evs4e7metkNmPS7pf3n/CvTdmhWn9OuxI5L8jqe/R0skS
 kJPwDPhFXKYIUlLF4yN1AbuIYeOSZZwD9inGqVvB6eGXlOhYCuZ+T+B4k7X+Xl1NC/GdNpHIDvD
 GaEXqCIakQI/KJbQjDfM1T8FesxERSWh9DXg1LmuVEpaTVmHdSjGL8cFp8mwDleFU+ijAtCnK0M
 a7p7yW8fKw4EVRZrL0tcMXsNyYjH9LGXC3NsW/xuBJ8AoIqdz6JwJXeRRA9M2umQr4IIkGokAdZ
 Nu5JmkfMUCDwdCdaiGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130028

On Mon, Sep 7, 2026 at 6:22=E2=80=AFPM Abhishek Bachiphale via
lists.openembedded.org
<abhishek.bachiphale=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Improper Handling of Highly Compressed Data (Data Amplification)
> vulnerability in Apache Thrift C++, Java, Python, Go, D, C/GLib
> bindings. This issue affects Apache Thrift: before 0.24.0.
>
> Backport patch to fix CVE-2026-48586.
>
> Reference:
> [https://nvd.nist.gov/vuln/detail/cve-2026-48586]
>
> Upstream Patch:
> [https://github.com/apache/thrift/commit/e3c8c534cacdbef039f4bb0bcf4b2744=
a982e3bf]
> [https://github.com/apache/thrift/commit/702d00f9053133aba7186f2dbb242a91=
a1ddd491]
>
> Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> ---
>  .../thrift/thrift/CVE-2026-48586-01.patch     | 109 ++++++++++++++++++
>  .../thrift/thrift/CVE-2026-48586-02.patch     |  78 +++++++++++++
>  .../thrift/thrift_0.22.0.bb                   |   2 +
>  3 files changed, 189 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-4=
8586-01.patch
>  create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-4=
8586-02.patch
>
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-01=
.patch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-01.patch
> new file mode 100644
> index 0000000000..aaa40ed843
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-01.patch
> @@ -0,0 +1,109 @@
> +From e3c8c534cacdbef039f4bb0bcf4b2744a982e3bf Mon Sep 17 00:00:00 2001
> +From: Jens Geyer <jensg@apache.org>
> +Date: Thu, 21 May 2026 14:24:28 +0200
> +Subject: [PATCH] Add decompressed byte tracking to C++ TZlibTransport Cl=
ient:
> + cpp
> +
> +TZlibTransport::read() called checkReadBytesAvailable() but never
> +called countConsumedMessageBytes(), so remainingMessageSize_ was never
> +decremented. Each read() call would pass the check regardless of how
> +many bytes had already been decompressed. Add countConsumedMessageBytes(=
)
> +after each copy from the inflate buffer so that the TConfiguration
> +maxMessageSize limit is correctly enforced across the lifetime of a
> +decompression session.
> +
> +Also adds test_message_size_limit() to ZlibTest to cover this path.
> +
> +Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
> +
> +CVE: CVE-2026-48586
> +Upstream-Status: Backport [https://github.com/apache/thrift/commit/e3c8c=
534cacdbef039f4bb0bcf4b2744a982e3bf]
> +Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> +---
> + .../src/thrift/transport/TZlibTransport.cpp   |  1 +
> + lib/cpp/test/ZlibTest.cpp                     | 37 +++++++++++++++++++
> + 2 files changed, 38 insertions(+)
> +
> +diff --git a/lib/cpp/src/thrift/transport/TZlibTransport.cpp b/lib/cpp/s=
rc/thrift/transport/TZlibTransport.cpp
> +index 1a171109837..d6161a129d9 100644
> +--- a/lib/cpp/src/thrift/transport/TZlibTransport.cpp
> ++++ b/lib/cpp/src/thrift/transport/TZlibTransport.cpp
> +@@ -149,6 +149,7 @@ uint32_t TZlibTransport::read(uint8_t* buf, uint32_t=
 len) {
> +     need -=3D give;
> +     buf +=3D give;
> +     urpos_ +=3D give;
> ++    countConsumedMessageBytes(give);
> +
> +     // If they were satisfied, we are done.
> +     if (need =3D=3D 0) {
> +diff --git a/lib/cpp/test/ZlibTest.cpp b/lib/cpp/test/ZlibTest.cpp
> +index ea9c617f625..8f8f5a8e7cf 100644
> +--- a/lib/cpp/test/ZlibTest.cpp
> ++++ b/lib/cpp/test/ZlibTest.cpp
> +@@ -45,8 +45,10 @@
> +
> + #include <thrift/transport/TBufferTransports.h>
> + #include <thrift/transport/TZlibTransport.h>
> ++#include <thrift/TConfiguration.h>
> +
> + using namespace apache::thrift::transport;
> ++using apache::thrift::TConfiguration;
> + using std::shared_ptr;
> + using std::string;
> +
> +@@ -338,6 +340,38 @@ void test_get_underlying_transport() {
> +   BOOST_CHECK_EQUAL(membuf.get(), zlib_trans->getUnderlyingTransport().=
get());
> + }
> +
> ++void test_message_size_limit() {
> ++  // Write 4 KB of compressible data, then read it back with a 1 KB lim=
it.
> ++  const uint32_t write_len =3D 4096;
> ++  boost::shared_array<uint8_t> buf =3D gen_uniform_buffer(write_len, 'a=
');
> ++
> ++  shared_ptr<TMemoryBuffer> membuf(new TMemoryBuffer());
> ++  {
> ++    shared_ptr<TZlibTransport> writer(new TZlibTransport(membuf));
> ++    writer->write(buf.get(), write_len);
> ++    writer->finish();
> ++  }
> ++
> ++  auto config =3D std::make_shared<TConfiguration>();
> ++  config->setMaxMessageSize(1024);
> ++  shared_ptr<TZlibTransport> reader(new TZlibTransport(
> ++      membuf,
> ++      TZlibTransport::DEFAULT_URBUF_SIZE,
> ++      TZlibTransport::DEFAULT_CRBUF_SIZE,
> ++      TZlibTransport::DEFAULT_UWBUF_SIZE,
> ++      TZlibTransport::DEFAULT_CWBUF_SIZE,
> ++      Z_DEFAULT_COMPRESSION,
> ++      config));
> ++
> ++  boost::shared_array<uint8_t> mirror(new uint8_t[write_len]);
> ++  try {
> ++    reader->readAll(mirror.get(), write_len);
> ++    BOOST_ERROR("readAll() should have thrown when maxMessageSize is ex=
ceeded");
> ++  } catch (TTransportException& ex) {
> ++    BOOST_CHECK_EQUAL(ex.getType(), TTransportException::END_OF_FILE);
> ++  }
> ++}
> ++
> + /*
> +  * Initialization
> +  */
> +@@ -441,6 +475,7 @@ bool init_unit_test_suite() {
> +
> +   suite->add(BOOST_TEST_CASE(test_no_write));
> +   suite->add(BOOST_TEST_CASE(test_get_underlying_transport));
> ++  suite->add(BOOST_TEST_CASE(test_message_size_limit));
> +
> +   return true;
> + }
> +@@ -467,6 +502,8 @@ boost::unit_test::test_suite* init_unit_test_suite(i=
nt argc, char* argv[]) {
> +   add_tests(suite, gen_random_buffer(buf_len), buf_len, "random");
> +
> +   suite->add(BOOST_TEST_CASE(test_no_write));
> ++  suite->add(BOOST_TEST_CASE(test_get_underlying_transport));
> ++  suite->add(BOOST_TEST_CASE(test_message_size_limit));
> +
> +   return nullptr;
> + }
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-02=
.patch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-02.patch
> new file mode 100644
> index 0000000000..5f03f64346
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-02.patch
> @@ -0,0 +1,78 @@
> +From 702d00f9053133aba7186f2dbb242a91a1ddd491 Mon Sep 17 00:00:00 2001
> +From: Jens Geyer <jensg@apache.org>
> +Date: Thu, 21 May 2026 22:29:35 +0200
> +Subject: [PATCH] Add consumed byte tracking to ThriftZlibTransport read
> + Client: c_glib
> +
> +Call countConsumedMessageBytes() after each successful read so that
> +the pre-existing checkReadBytesAvailable() limit is decremented per
> +the transport's message size configuration.
> +
> +Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
> +CVE: CVE-2026-48586
> +Upstream-Status: Backport [https://github.com/apache/thrift/commit/e3c8c=
534cacdbef039f4bb0bcf4b2744a982e3bf]

This should be:
https://github.com/apache/thrift/commit/702d00f9 ?

Thanks,

Anuj

