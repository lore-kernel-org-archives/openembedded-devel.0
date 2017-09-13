Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2870F785B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 03:21:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8D3L2Ui013616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 20:21:02 -0700
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 12 Sep 2017 20:21:01 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20170907094920.191059-1-wenzong.fan@windriver.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <7c50c6f1-e834-f2a2-1ebd-33e411deea8b@windriver.com>
Date: Wed, 13 Sep 2017 11:21:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170907094920.191059-1-wenzong.fan@windriver.com>
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
X-List-Received-Date: Wed, 13 Sep 2017 03:21:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Please ignore this patch, the fixes has been included by:

   [oe] [meta-networking][PATCH] tcpdump: update to 4.9.2 to fix CVEs

Thanks
Wenzong

On 09/07/2017 05:49 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> Backport patches for fixing:
> - CVE-2017-11541:
>    https://nvd.nist.gov/vuln/detail/CVE-2017-11541
>    https://github.com/the-tcpdump-group/tcpdump/commit/21d702a136c5c16882e368af7c173df728242280
> 
> - CVE-2017-11542:
>    https://nvd.nist.gov/vuln/detail/CVE-2017-11542
>    https://github.com/the-tcpdump-group/tcpdump/commit/bed48062a64fca524156d7684af19f5b4a116fae
> 
> - CVE-2017-11543:
>    https://nvd.nist.gov/vuln/detail/CVE-2017-11543
>    https://github.com/the-tcpdump-group/tcpdump/commit/7039327875525278d17edee59720e29a3e76b7b3
> 
> The tests/* changes dropped to workaround patch error:
>    File tests/*.pcap: git binary diffs are not supported.
> 
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   ...541-In-safeputs-check-the-length-before-c.patch | 49 +++++++++++++
>   ...1-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch | 43 +++++++++++
>   ...543-Make-sure-the-SLIP-direction-octet-is.patch | 85 ++++++++++++++++++++++
>   .../recipes-support/tcpdump/tcpdump_4.9.1.bb       |  3 +
>   4 files changed, 180 insertions(+)
>   create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11541-In-safeputs-check-the-length-before-c.patch
>   create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch
>   create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11543-Make-sure-the-SLIP-direction-octet-is.patch
> 
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11541-In-safeputs-check-the-length-before-c.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11541-In-safeputs-check-the-length-before-c.patch
> new file mode 100644
> index 000000000..a83214b02
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11541-In-safeputs-check-the-length-before-c.patch
> @@ -0,0 +1,49 @@
> +From 21d702a136c5c16882e368af7c173df728242280 Mon Sep 17 00:00:00 2001
> +From: Guy Harris <guy@alum.mit.edu>
> +Date: Tue, 7 Feb 2017 11:40:36 -0800
> +Subject: [PATCH] CVE-2017-11541: In safeputs(), check the length before
> + checking for a NUL terminator.
> +
> +safeputs() doesn't do packet bounds checking of its own; it assumes that
> +the caller has checked the availability in the packet data of all maxlen
> +bytes of data.  This means we should check that we're within the
> +specified limit before looking at the byte.
> +
> +This fixes a buffer over-read discovered by Kamil Frankowicz.
> +
> +Add a test using the capture file supplied by the reporter(s).
> +
> +CVE: CVE-2017-11541
> +
> +Upstream-Status: Backport
> +https://github.com/the-tcpdump-group/tcpdump/commit/21d702a136c5c16882e368af7c173df728242280
> +
> +Drop the tests/* changes to workaroud patch error:
> +File tests/hoobr_safeputs.pcap: git binary diffs are not supported.
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +---
> + tests/TESTLIST            |   1 +
> + tests/hoobr_safeputs.out  |   2 ++
> + tests/hoobr_safeputs.pcap | Bin 0 -> 88 bytes
> + util-print.c              |   2 +-
> + 4 files changed, 4 insertions(+), 1 deletion(-)
> + create mode 100644 tests/hoobr_safeputs.out
> + create mode 100644 tests/hoobr_safeputs.pcap
> +
> +diff --git a/util-print.c b/util-print.c
> +index 394e7d59..ec3e8de8 100644
> +--- a/util-print.c
> ++++ b/util-print.c
> +@@ -904,7 +904,7 @@ safeputs(netdissect_options *ndo,
> + {
> + 	u_int idx = 0;
> +
> +-	while (*s && idx < maxlen) {
> ++	while (idx < maxlen && *s) {
> + 		safeputchar(ndo, *s);
> + 		idx++;
> + 		s++;
> +--
> +2.13.0
> +
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch
> new file mode 100644
> index 000000000..a177e7c0b
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch
> @@ -0,0 +1,43 @@
> +From bed48062a64fca524156d7684af19f5b4a116fae Mon Sep 17 00:00:00 2001
> +From: Guy Harris <guy@alum.mit.edu>
> +Date: Tue, 7 Feb 2017 11:10:04 -0800
> +Subject: [PATCH] CVE-2017-11542/PIMv1: Add a bounds check.
> +
> +This fixes a buffer over-read discovered by Kamil Frankowicz.
> +
> +Add a test using the capture file supplied by the reporter(s).
> +
> +CVE: CVE-2017-11542
> +
> +Upstream-Status: Backport
> +https://github.com/the-tcpdump-group/tcpdump/commit/bed48062a64fca524156d7684af19f5b4a116fae
> +
> +Drop the tests/* changes to workaroud patch error:
> +File tests/hoobr_pimv1.pcap: git binary diffs are not supported.
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +---
> + print-pim.c            |   1 +
> + tests/TESTLIST         |   1 +
> + tests/hoobr_pimv1.out  |  25 +++++++++++++++++++++++++
> + tests/hoobr_pimv1.pcap | Bin 0 -> 3321 bytes
> + 4 files changed, 27 insertions(+)
> + create mode 100644 tests/hoobr_pimv1.out
> + create mode 100644 tests/hoobr_pimv1.pcap
> +
> +diff --git a/print-pim.c b/print-pim.c
> +index 25525953..ed880ae7 100644
> +--- a/print-pim.c
> ++++ b/print-pim.c
> +@@ -306,6 +306,7 @@ pimv1_print(netdissect_options *ndo,
> + 			pimv1_join_prune_print(ndo, &bp[8], len - 8);
> + 		break;
> + 	}
> ++	ND_TCHECK(bp[4]);
> + 	if ((bp[4] >> 4) != 1)
> + 		ND_PRINT((ndo, " [v%d]", bp[4] >> 4));
> + 	return;
> +
> +--
> +2.13.0
> +
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11543-Make-sure-the-SLIP-direction-octet-is.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11543-Make-sure-the-SLIP-direction-octet-is.patch
> new file mode 100644
> index 000000000..36e3f6b0d
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-11543-Make-sure-the-SLIP-direction-octet-is.patch
> @@ -0,0 +1,85 @@
> +From 7039327875525278d17edee59720e29a3e76b7b3 Mon Sep 17 00:00:00 2001
> +From: Guy Harris <guy@alum.mit.edu>
> +Date: Fri, 17 Mar 2017 12:49:04 -0700
> +Subject: [PATCH] CVE-2017-11543/Make sure the SLIP direction octet is valid.
> +
> +Report if it's not, and don't use it as an out-of-bounds index into an
> +array.
> +
> +This fixes a buffer overflow discovered by Wilfried Kirsch.
> +
> +Add a test using the capture file supplied by the reporter(s), modified
> +so the capture file won't be rejected as an invalid capture.
> +
> +CVE: CVE-2017-11543
> +
> +Upstream-Status: Backport
> +https://github.com/the-tcpdump-group/tcpdump/commit/7039327875525278d17edee59720e29a3e76b7b3
> +
> +Drop the tests/* changes to workaroud patch error:
> +File tests/slip-bad-direction.pcap: git binary diffs are not supported.
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +---
> + print-sl.c                    |  25 +++++++++++++++++++++++--
> + tests/TESTLIST                |   3 +++
> + tests/slip-bad-direction.out  |   1 +
> + tests/slip-bad-direction.pcap | Bin 0 -> 79 bytes
> + 4 files changed, 27 insertions(+), 2 deletions(-)
> + create mode 100644 tests/slip-bad-direction.out
> + create mode 100644 tests/slip-bad-direction.pcap
> +
> +diff --git a/print-sl.c b/print-sl.c
> +index 3fd7e898..a02077b3 100644
> +--- a/print-sl.c
> ++++ b/print-sl.c
> +@@ -131,8 +131,21 @@ sliplink_print(netdissect_options *ndo,
> + 	u_int hlen;
> +
> + 	dir = p[SLX_DIR];
> +-	ND_PRINT((ndo, dir == SLIPDIR_IN ? "I " : "O "));
> ++	switch (dir) {
> +
> ++	case SLIPDIR_IN:
> ++		ND_PRINT((ndo, "I "));
> ++		break;
> ++
> ++	case SLIPDIR_OUT:
> ++		ND_PRINT((ndo, "O "));
> ++		break;
> ++
> ++	default:
> ++		ND_PRINT((ndo, "Invalid direction %d ", dir));
> ++		dir = -1;
> ++		break;
> ++	}
> + 	if (ndo->ndo_nflag) {
> + 		/* XXX just dump the header */
> + 		register int i;
> +@@ -155,13 +168,21 @@ sliplink_print(netdissect_options *ndo,
> + 		 * has restored the IP header copy to IPPROTO_TCP.
> + 		 */
> + 		lastconn = ((const struct ip *)&p[SLX_CHDR])->ip_p;
> ++		ND_PRINT((ndo, "utcp %d: ", lastconn));
> ++		if (dir == -1) {
> ++			/* Direction is bogus, don't use it */
> ++			return;
> ++		}
> + 		hlen = IP_HL(ip);
> + 		hlen += TH_OFF((const struct tcphdr *)&((const int *)ip)[hlen]);
> + 		lastlen[dir][lastconn] = length - (hlen << 2);
> +-		ND_PRINT((ndo, "utcp %d: ", lastconn));
> + 		break;
> +
> + 	default:
> ++		if (dir == -1) {
> ++			/* Direction is bogus, don't use it */
> ++			return;
> ++		}
> + 		if (p[SLX_CHDR] & TYPE_COMPRESSED_TCP) {
> + 			compressed_sl_print(ndo, &p[SLX_CHDR], ip,
> + 			    length, dir);
> +
> +--
> +2.13.0
> +
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
> index 261c78427..668d6f5e1 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
> @@ -11,6 +11,9 @@ SRC_URI = " \
>       file://tcpdump-configure-dlpi.patch \
>       file://add-ptest.patch \
>       file://run-ptest \
> +    file://0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch \
> +    file://0001-CVE-2017-11541-In-safeputs-check-the-length-before-c.patch \
> +    file://0001-CVE-2017-11543-Make-sure-the-SLIP-direction-octet-is.patch \
>   "
>   
>   SRC_URI[md5sum] = "1e0293210b0dea5ef18e88e4150394b7"
> 

