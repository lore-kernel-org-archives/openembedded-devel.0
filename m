Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id C6C98785AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 09:17:11 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id q29so18020597uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z1+D6ntpLErkmX/XoDQ1zAUCoBl0cCSTYnJK5hppr4E=;
	b=rhPwPt41LZY3eje62k6Ud1VgyrvSzdO3VdJrXaiNyz3Wt7B4uEqv5m+ii8UxMfNwmG
	O/sTZ9ztbw8qdluag6OcROlMsTjy3ngZUImVoTyvNlqguiAQgvtC5nu/Rpdvtr9UV4AU
	/hJRNPT/sxoQpYhM3F83ekjzol9R2VWTJIn3U8BqzH76WngnDtgKuDAHM5HOtImIQQgn
	K3uXl91gKeD4UlgPsIyqaGlypS8mtM/fr0RPrauFSrbsg92wLA2ugksPSTlJo+YPKpH9
	GnxrhoagwcDjNpsCtrb6jcO5iSssFROhhdxfqNKYvAyDYULCM2sLhAl9vp3iLLREaRbC
	3eIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z1+D6ntpLErkmX/XoDQ1zAUCoBl0cCSTYnJK5hppr4E=;
	b=cysY7O9jvzfMRjBpysOc35fhtqIBgcggE+B+8dxIT5Vd4C6ckansyFU0dSPkm9KJjy
	+1MuD0vYuVv+o1ceCOsdK94EqSFJ8FBVcKNM7B0XVxI4RVLsnN69r3zJBv9aTS2fk9XR
	CDHo6ovemnQdUHuv8AFD2a8bIDyu6xrGV5heSldlT6NSWgl/h0UlPSy2ohD1CI0F1Fha
	xIZkPT5J13G0DBS39GdRyBi3ZOq3hUh8zczh7IlQPNU5rrUzM3Tlac09BC2V9xsju1Ok
	4wnXJBIeqLrZfxZvyAls7PfC4ZWsy0UxBNJbeBriitZIDo2idHhALCN3PJGDgRocFA/D
	Zn0A==
X-Gm-Message-State: AHPjjUhPHSCEFeLuKNVbympDcc59RzTie0XXN4MR050Dv4Z8Fso8jzvq
	Fsui+ERMIfaT+QXBMNmvekLQZ0oleWJFp+cTDfE=
X-Google-Smtp-Source: AOwi7QCdOBPuTSYSRzt9s7Rk3uDAeBQaJ47yPk/TIDhIhL6N6OIL9JPg89Cm1ojPd1Q9W8hAdnBANklm42Lr0xBM+x0=
X-Received: by 10.176.2.5 with SMTP id 5mr14780739uas.160.1505294232708; Wed,
	13 Sep 2017 02:17:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 02:17:12 -0700 (PDT)
In-Reply-To: <7c50c6f1-e834-f2a2-1ebd-33e411deea8b@windriver.com>
References: <20170907094920.191059-1-wenzong.fan@windriver.com>
	<7c50c6f1-e834-f2a2-1ebd-33e411deea8b@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 11:17:12 +0200
Message-ID: <CA+chaQd8BSz_wHGiG+xf47GQ5f7mNNeCoNRCE8RjL15mwZpzbg@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tcpdump: fix CVE-2017-11541, 11542, 11543
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
X-List-Received-Date: Wed, 13 Sep 2017 09:17:12 -0000
Content-Type: text/plain; charset="UTF-8"

Please update the state on patchwork (https://patchwork.
openembedded.org/project/oe/patches/) when sending updates like this.

You can update it on the site or use some magic keywords in the e-mail
reply to update it automatically (but I've failed to find link to
documentation how this magic should look like).

On Wed, Sep 13, 2017 at 5:21 AM, wenzong fan <wenzong.fan@windriver.com>
wrote:

> Please ignore this patch, the fixes has been included by:
>
>   [oe] [meta-networking][PATCH] tcpdump: update to 4.9.2 to fix CVEs
>
> Thanks
> Wenzong
>
>
> On 09/07/2017 05:49 PM, wenzong.fan@windriver.com wrote:
>
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Backport patches for fixing:
>> - CVE-2017-11541:
>>    https://nvd.nist.gov/vuln/detail/CVE-2017-11541
>>    https://github.com/the-tcpdump-group/tcpdump/commit/21d702a
>> 136c5c16882e368af7c173df728242280
>>
>> - CVE-2017-11542:
>>    https://nvd.nist.gov/vuln/detail/CVE-2017-11542
>>    https://github.com/the-tcpdump-group/tcpdump/commit/bed4806
>> 2a64fca524156d7684af19f5b4a116fae
>>
>> - CVE-2017-11543:
>>    https://nvd.nist.gov/vuln/detail/CVE-2017-11543
>>    https://github.com/the-tcpdump-group/tcpdump/commit/7039327
>> 875525278d17edee59720e29a3e76b7b3
>>
>> The tests/* changes dropped to workaround patch error:
>>    File tests/*.pcap: git binary diffs are not supported.
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   ...541-In-safeputs-check-the-length-before-c.patch | 49 +++++++++++++
>>   ...1-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch | 43 +++++++++++
>>   ...543-Make-sure-the-SLIP-direction-octet-is.patch | 85
>> ++++++++++++++++++++++
>>   .../recipes-support/tcpdump/tcpdump_4.9.1.bb       |  3 +
>>   4 files changed, 180 insertions(+)
>>   create mode 100644 meta-networking/recipes-suppor
>> t/tcpdump/tcpdump/0001-CVE-2017-11541-In-safeputs-check-
>> the-length-before-c.patch
>>   create mode 100644 meta-networking/recipes-suppor
>> t/tcpdump/tcpdump/0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch
>>   create mode 100644 meta-networking/recipes-suppor
>> t/tcpdump/tcpdump/0001-CVE-2017-11543-Make-sure-the-SLIP-
>> direction-octet-is.patch
>>
>> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
>> 2017-11541-In-safeputs-check-the-length-before-c.patch
>> b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
>> 2017-11541-In-safeputs-check-the-length-before-c.patch
>> new file mode 100644
>> index 000000000..a83214b02
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
>> 2017-11541-In-safeputs-check-the-length-before-c.patch
>> @@ -0,0 +1,49 @@
>> +From 21d702a136c5c16882e368af7c173df728242280 Mon Sep 17 00:00:00 2001
>> +From: Guy Harris <guy@alum.mit.edu>
>> +Date: Tue, 7 Feb 2017 11:40:36 -0800
>> +Subject: [PATCH] CVE-2017-11541: In safeputs(), check the length before
>> + checking for a NUL terminator.
>> +
>> +safeputs() doesn't do packet bounds checking of its own; it assumes that
>> +the caller has checked the availability in the packet data of all maxlen
>> +bytes of data.  This means we should check that we're within the
>> +specified limit before looking at the byte.
>> +
>> +This fixes a buffer over-read discovered by Kamil Frankowicz.
>> +
>> +Add a test using the capture file supplied by the reporter(s).
>> +
>> +CVE: CVE-2017-11541
>> +
>> +Upstream-Status: Backport
>> +https://github.com/the-tcpdump-group/tcpdump/commit/21d702a
>> 136c5c16882e368af7c173df728242280
>> +
>> +Drop the tests/* changes to workaroud patch error:
>> +File tests/hoobr_safeputs.pcap: git binary diffs are not supported.
>> +
>> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> +---
>> + tests/TESTLIST            |   1 +
>> + tests/hoobr_safeputs.out  |   2 ++
>> + tests/hoobr_safeputs.pcap | Bin 0 -> 88 bytes
>> + util-print.c              |   2 +-
>> + 4 files changed, 4 insertions(+), 1 deletion(-)
>> + create mode 100644 tests/hoobr_safeputs.out
>> + create mode 100644 tests/hoobr_safeputs.pcap
>> +
>> +diff --git a/util-print.c b/util-print.c
>> +index 394e7d59..ec3e8de8 100644
>> +--- a/util-print.c
>> ++++ b/util-print.c
>> +@@ -904,7 +904,7 @@ safeputs(netdissect_options *ndo,
>> + {
>> +       u_int idx = 0;
>> +
>> +-      while (*s && idx < maxlen) {
>> ++      while (idx < maxlen && *s) {
>> +               safeputchar(ndo, *s);
>> +               idx++;
>> +               s++;
>> +--
>> +2.13.0
>> +
>> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
>> 2017-11542-PIMv1-Add-a-bounds-check.patch b/meta-networking/recipes-supp
>> ort/tcpdump/tcpdump/0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch
>> new file mode 100644
>> index 000000000..a177e7c0b
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
>> 2017-11542-PIMv1-Add-a-bounds-check.patch
>> @@ -0,0 +1,43 @@
>> +From bed48062a64fca524156d7684af19f5b4a116fae Mon Sep 17 00:00:00 2001
>> +From: Guy Harris <guy@alum.mit.edu>
>> +Date: Tue, 7 Feb 2017 11:10:04 -0800
>> +Subject: [PATCH] CVE-2017-11542/PIMv1: Add a bounds check.
>> +
>> +This fixes a buffer over-read discovered by Kamil Frankowicz.
>> +
>> +Add a test using the capture file supplied by the reporter(s).
>> +
>> +CVE: CVE-2017-11542
>> +
>> +Upstream-Status: Backport
>> +https://github.com/the-tcpdump-group/tcpdump/commit/bed4806
>> 2a64fca524156d7684af19f5b4a116fae
>> +
>> +Drop the tests/* changes to workaroud patch error:
>> +File tests/hoobr_pimv1.pcap: git binary diffs are not supported.
>> +
>> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> +---
>> + print-pim.c            |   1 +
>> + tests/TESTLIST         |   1 +
>> + tests/hoobr_pimv1.out  |  25 +++++++++++++++++++++++++
>> + tests/hoobr_pimv1.pcap | Bin 0 -> 3321 bytes
>> + 4 files changed, 27 insertions(+)
>> + create mode 100644 tests/hoobr_pimv1.out
>> + create mode 100644 tests/hoobr_pimv1.pcap
>> +
>> +diff --git a/print-pim.c b/print-pim.c
>> +index 25525953..ed880ae7 100644
>> +--- a/print-pim.c
>> ++++ b/print-pim.c
>> +@@ -306,6 +306,7 @@ pimv1_print(netdissect_options *ndo,
>> +                       pimv1_join_prune_print(ndo, &bp[8], len - 8);
>> +               break;
>> +       }
>> ++      ND_TCHECK(bp[4]);
>> +       if ((bp[4] >> 4) != 1)
>> +               ND_PRINT((ndo, " [v%d]", bp[4] >> 4));
>> +       return;
>> +
>> +--
>> +2.13.0
>> +
>> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
>> 2017-11543-Make-sure-the-SLIP-direction-octet-is.patch
>> b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
>> 2017-11543-Make-sure-the-SLIP-direction-octet-is.patch
>> new file mode 100644
>> index 000000000..36e3f6b0d
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
>> 2017-11543-Make-sure-the-SLIP-direction-octet-is.patch
>> @@ -0,0 +1,85 @@
>> +From 7039327875525278d17edee59720e29a3e76b7b3 Mon Sep 17 00:00:00 2001
>> +From: Guy Harris <guy@alum.mit.edu>
>> +Date: Fri, 17 Mar 2017 12:49:04 -0700
>> +Subject: [PATCH] CVE-2017-11543/Make sure the SLIP direction octet is
>> valid.
>> +
>> +Report if it's not, and don't use it as an out-of-bounds index into an
>> +array.
>> +
>> +This fixes a buffer overflow discovered by Wilfried Kirsch.
>> +
>> +Add a test using the capture file supplied by the reporter(s), modified
>> +so the capture file won't be rejected as an invalid capture.
>> +
>> +CVE: CVE-2017-11543
>> +
>> +Upstream-Status: Backport
>> +https://github.com/the-tcpdump-group/tcpdump/commit/7039327
>> 875525278d17edee59720e29a3e76b7b3
>> +
>> +Drop the tests/* changes to workaroud patch error:
>> +File tests/slip-bad-direction.pcap: git binary diffs are not supported.
>> +
>> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> +---
>> + print-sl.c                    |  25 +++++++++++++++++++++++--
>> + tests/TESTLIST                |   3 +++
>> + tests/slip-bad-direction.out  |   1 +
>> + tests/slip-bad-direction.pcap | Bin 0 -> 79 bytes
>> + 4 files changed, 27 insertions(+), 2 deletions(-)
>> + create mode 100644 tests/slip-bad-direction.out
>> + create mode 100644 tests/slip-bad-direction.pcap
>> +
>> +diff --git a/print-sl.c b/print-sl.c
>> +index 3fd7e898..a02077b3 100644
>> +--- a/print-sl.c
>> ++++ b/print-sl.c
>> +@@ -131,8 +131,21 @@ sliplink_print(netdissect_options *ndo,
>> +       u_int hlen;
>> +
>> +       dir = p[SLX_DIR];
>> +-      ND_PRINT((ndo, dir == SLIPDIR_IN ? "I " : "O "));
>> ++      switch (dir) {
>> +
>> ++      case SLIPDIR_IN:
>> ++              ND_PRINT((ndo, "I "));
>> ++              break;
>> ++
>> ++      case SLIPDIR_OUT:
>> ++              ND_PRINT((ndo, "O "));
>> ++              break;
>> ++
>> ++      default:
>> ++              ND_PRINT((ndo, "Invalid direction %d ", dir));
>> ++              dir = -1;
>> ++              break;
>> ++      }
>> +       if (ndo->ndo_nflag) {
>> +               /* XXX just dump the header */
>> +               register int i;
>> +@@ -155,13 +168,21 @@ sliplink_print(netdissect_options *ndo,
>> +                * has restored the IP header copy to IPPROTO_TCP.
>> +                */
>> +               lastconn = ((const struct ip *)&p[SLX_CHDR])->ip_p;
>> ++              ND_PRINT((ndo, "utcp %d: ", lastconn));
>> ++              if (dir == -1) {
>> ++                      /* Direction is bogus, don't use it */
>> ++                      return;
>> ++              }
>> +               hlen = IP_HL(ip);
>> +               hlen += TH_OFF((const struct tcphdr *)&((const int
>> *)ip)[hlen]);
>> +               lastlen[dir][lastconn] = length - (hlen << 2);
>> +-              ND_PRINT((ndo, "utcp %d: ", lastconn));
>> +               break;
>> +
>> +       default:
>> ++              if (dir == -1) {
>> ++                      /* Direction is bogus, don't use it */
>> ++                      return;
>> ++              }
>> +               if (p[SLX_CHDR] & TYPE_COMPRESSED_TCP) {
>> +                       compressed_sl_print(ndo, &p[SLX_CHDR], ip,
>> +                           length, dir);
>> +
>> +--
>> +2.13.0
>> +
>> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
>> b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
>> index 261c78427..668d6f5e1 100644
>> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
>> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
>> @@ -11,6 +11,9 @@ SRC_URI = " \
>>       file://tcpdump-configure-dlpi.patch \
>>       file://add-ptest.patch \
>>       file://run-ptest \
>> +    file://0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch \
>> +    file://0001-CVE-2017-11541-In-safeputs-check-the-length-before-c.patch
>> \
>> +    file://0001-CVE-2017-11543-Make-sure-the-SLIP-direction-octet-is.patch
>> \
>>   "
>>     SRC_URI[md5sum] = "1e0293210b0dea5ef18e88e4150394b7"
>>
>> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

