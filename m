Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 11974 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 19 Mar 2017 07:08:34 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0080.outbound.protection.outlook.com
	[104.47.37.80])
	by mail.openembedded.org (Postfix) with ESMTP id 15EFC71A39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 07:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=07lylrpbg11z1PEmt2nzNJeSC5K/AQcFFWeUbm7O96A=;
	b=k7DTM2Tvc208YFIwOVKnTp2lWFZFldTFHDslfgSxFzShEuBumL3hpnMhlrdSqfY5CzBScKSrR92H9lZff3es2DnwZJ4kZVt2+GrlVj4RQiYzHHx8O5B+I3ETYxLKb0d61DYjfLOSXS8yukjVEEqmeFAB+ldYIWR9IDLajDozlqc=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.977.11; Sun, 19 Mar 2017 03:34:42 +0000
To: <openembedded-devel@lists.openembedded.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <07459727-026a-2456-792f-a06dbef2a988@xevo.com>
Date: Sat, 18 Mar 2017 20:29:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: DM5PR1101CA0005.namprd11.prod.outlook.com (10.174.246.15)
	To CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28)
X-MS-Office365-Filtering-Correlation-Id: 3f8c9485-f8a2-4fc8-71ea-08d46e78e1f3
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:CY1PR01MB1406;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	3:ZTWuWp7v6LgDdYOmRYK+a59oQufcpEt2VnPMeMztIs8mOxV7Tx2WmFaag6AxLQXKmHWA66o6M87JXBIIZCNMf0iJ9oh4tUU7CvnQzhqYu6pEgieuTBAez49G5KlCQgkatH+IfpIrTHeUid2C/VMkZvUcnvTGXzyTKiqLHaVm/baNsZnolANNq6kDnUYhXWU4fqf6+RzYGqnhitFM92X5ZE/mdh4bTXNZIW237XGg4auJBwYMPHGWQ+fWeO6HaaWbcxmRlRCpjnmAUiKUQOkJ+w==;
	25:/+6aJtIjW0opCftLoaaCi29KNVHhjVQCu1VDnJIAOodhahLMHYnQ+dOHRIQfY/5Cp93BX07P5fr9yX8GxEzImMSoLBMyAWxzycnn3dGMRYqrEdBrv4nB9Qzjtq8fua6od9DIuzA2FflCUiO4LRnHRy8xE+fP2fwq962WliMrxItZj7YnCNrVraLpLJPrzWL/ZPozbFJwnORmmle+F6ZoJzfMghXm3z2yKFeDSZl/oPo5NZ9rCYRIrrOdXCcG0GHyYbFDPbrc/jPTTSYzmzT34CBWJw1hrl3FO1CRXeuC6GqVls7ULeThBE9QjTjIOzuTHl2tVfwjpy8a1qZcoceCt4X9Az5YT4NB2U6RP2CQ/8x4Fq/lENBXriUJGGT9tSjICFzO1+PuLKyTBomoQEMTva4d0fV+WNy1sIeurfTAXPL/LkHd8f4/+1lxBugzktmsSr8q6vQab6TDXXG205dnvw==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	31:u6OVu5iAV9T2z8hHlCu4lyxLYO+5uqF9u0A70oqr6fdYXuSSppEY0f/D8IrY3AHmDVcpM8I2fGPxmUmPqNzbytzfWTW1YlbLsjMhJf7JMcaDWS5ob/YwNm9tqF9NfbG7e3ZnzmkD6QUBjp8A0YLlR/BEkL38RWdKGxo0fi7mwRjltPbgURaV9IRhbApQDK0bp3juw7MWg66YH3w/+tetZHSC45nXc/ZeIHkgZrBX+XnArE+XaSPuReB3uTGPyDdTmjs6Kda16UP7QLQ76oyIcjbFUfjadKtPiUZHGA6Ku8A=;
	20:g14cw92aF/CIAHB5CmnlgnnnqYZ8xeS1H2GagoyV3bw8iMY6856ecPtuR4YVOKc8szVNtbzsPB3wHjmiR/ZSNMpBBFnu9q+9SK/VS7fNZcP8xnTDYtF91ufj20xrpKQUoi2kigTkysFXDSz1OXsTsNMxH7Lcp3j5e/aKP3CyxlKTqUlDro762FW9X+veX3djVl3j0KyBNcvMEr000n2sAxujXbybFXqjocEzBtvmipOOWEIlzN2ZVGQH2VFv8wm+O1CdjXfUZ2oyzKk8SrBrfwEjstbikZP39iuKP9UsI5MBw3EBaEfOmfoZeQUa8EK2X4sJfK//0Ev9wCAD8dgc9A==
X-Microsoft-Antispam-PRVS: <CY1PR01MB1406BEC52B36CC8031114F15AB3B0@CY1PR01MB1406.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123558025)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(6072148);
	SRVR:CY1PR01MB1406; BCL:0; PCL:0; RULEID:; SRVR:CY1PR01MB1406; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	4:FFhRR9+uE7trkPGfl5TaJsth1KHl0qp8HUj9LfdvT2HCaWjIufp0sgq5H98kmCvs5I6bkA2cio3kHg5/C1QNQx7ThE6oNCp2T6WRwXx55rHnnS257BBWNksaxKHGnAgoUkz0WH4BSZPxLbvcKuoIh/ppgXZAifMhxsNesoYLL0Hgj4KD5ht3S11v7qZtO2bUydUSOqpGdY9ZpHER7TDSpVowF6ct258AL4LsZTLkzjkV5ZotLeMO0XBH/LZ119cTCmCJOKTWAMZZ/Rj2cbRoAMIdqw8maSqDzy5mdbSNXIB8djR3KVFoKKPU+leOZ1ViJ3QPHGvTbC6BtQAZ9uR7O4ZLsHv/zMDr+P3AnUNJa3Gc03ukkBgbhLGW8kRTe1iAicm/1/Fl6sgEj9sKBiP1+lPu0yN3YDLAvAkU8MmPJs5YFg8XoRuSXm4o2H/c5HOoGOrz+CXXloWEdi/JyDjPTxFrV4stlG1hJaUTlKQvfm/yCeY1YjUGa9R9Sgk/w+IHfVfxcEPR3COatToQovGOHJVBOJ5ieNaXV4fdQwMIE5dRdfUpjq2HPIq2FxmXaw0zb7G/mEAca00JYYEU/Bi2OoxIUL3QKi9aaD76Q+dLD2P14iy77xV7Mxw24HxgqzPIbn+l7+eOluY4N8bzChOWOg==
X-Forefront-PRVS: 025100C802
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39450400003)(377424004)(110136004)(2906002)(36756003)(83506001)(189998001)(5660300001)(38730400002)(230700001)(305945005)(117156001)(6916009)(6666003)(50466002)(33646002)(86362001)(4326008)(31696002)(4001350100001)(31686004)(53936002)(2351001)(81166006)(25786008)(66066001)(7736002)(6486002)(77096006)(42186005)(64126003)(54356999)(6306002)(50986999)(8676002)(3846002)(6116002)(23676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR01MB1406; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAxTUIxNDA2OzIzOkJ6dVBVam5GZHpPcDBaQkhCRHBQU3Vzbzdr?=
	=?utf-8?B?Z2htM3FEVlNZZGt6aWhzVDIrZUlXQXZwcGVlNm1QY3dxTDhLdHFtMTJNU0I0?=
	=?utf-8?B?eXQ3SjM3VDdBd01nTllKeU8rbCtVNW1XQXJabUlGTGZiV3ZkZzBKUWMzeURz?=
	=?utf-8?B?YmxhSjFjQnFRT3NOUm0vM0F2S2FKT0F6OGpuMzZ4ZXJoWlhjQmFrd2pPTzVG?=
	=?utf-8?B?MHV6ZmNVdmtWL3BMV1VNTDFoSTJJWjZBT1lnb3Y3Vkt5R0x6Z3ZUeWEwSUZa?=
	=?utf-8?B?RjhIYUlGeWlBcW1QU0hrS3dVZnd0Q0ZNNmdFNkZ1S0FJWm9rVzhjd1dkRUJx?=
	=?utf-8?B?NFdLQ080OHltNWRkNzJEdVViZ1hFK1lENnBjRHBqZWtEZ1I4TFhoVEVZVUwy?=
	=?utf-8?B?RDJ5MXZCUFI3VzJ3VjJmUDVzSUcvNGhJMWpJblFxR1M0dExWZEZkemFYUWxF?=
	=?utf-8?B?WkUyWmNmNzJmSlRnK2NwdmI1Z1hzdmhBQmFHaHRzNlEyZEpHQ1NvUFF6QWlW?=
	=?utf-8?B?ZlBQNjI4Y05WaldpdUFFVUs5WStRSHp5MXdmc2Eya2xFYndCVnphTEZoenpB?=
	=?utf-8?B?TmE4ck40NWJOSk11ZGROMTZXR0oxRkl1dkZuTTBPSEtWRm9xYm9HU0l5VVZj?=
	=?utf-8?B?NHYvaWVvdFRwVzY5SUNDd3BoeEx6YkdpWlBLWkdQMzgrSFp3ckVzdVNxdmFm?=
	=?utf-8?B?RzVyVEgvcTdzSFcwaTNOMlQ2SDd0UzVLL2NiM3ZnOHM0Qk9obDQxd0plOGo5?=
	=?utf-8?B?WE1vdjZzSnhpQlZGeTlKM0FIR3FFOGxoYnEvQVI1b2lXMlNVOG92djAzNlgy?=
	=?utf-8?B?L3M3VFhPdERnbnNiWUhkQWxmc2RkRWp1djJVcFFtQVYvRTF3VTB3Y25DUml1?=
	=?utf-8?B?OE5DVjlleFo4SmlFbUIvZlljczFUTkFlMWNNNTd0cXd5bnF1YUxVVHVrT3ZG?=
	=?utf-8?B?REJsR0tGQjN4Y3dMdWJLQ21Nek84RmtteHQ1Y2lPYXdoVEtuVkpHdjJWWGtE?=
	=?utf-8?B?ZEJqL2pNUEx4alhMUHBzTUNjTzBRdEpCL1lKMVhVaVF0L1k1emswejdmdC93?=
	=?utf-8?B?RXgvZ3IzaWxVNEpKaEkwVXdFUE8xaEZxN3pBRjBka0xvTjYwRTR0WS9pTDdU?=
	=?utf-8?B?RExhajVCU2xUeC94TkpSbEs5QXBsbmpoaVR3MWc2bmZpQzR1VC96MFBmejVo?=
	=?utf-8?B?dDlzaGR6ZVhUUitCRjNkYXhjZUtncXJKd1crNGhreFN0VUkxL2dEdi9LR2V6?=
	=?utf-8?B?QnZUemQ1NDZncHVMN3FQY1pNSHBqVXpyNzhtS080bDE2VVIrQmdYSm9LaWkz?=
	=?utf-8?B?QUROeVJYam8wbElMVVQrVTcrTWF3SGZyWEI4MU50MklJdWJ4MjJjRjREMzgr?=
	=?utf-8?Q?ZsmCat6s?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	6:ze5ktst8mUygqeTxTEE8ZCPfLXyPTRoYkjEgBSI6xl5D1DURf+x6jayjWbC5HnkjBJiKzusJKkeok+ialqw0q8MAdLMcmG+9xxAoITejV6tYv/X/ykUdIFPJUQoxL94e9xWc7MRT9+Cm9h94SNKnXyQzNuCE+e06bzmJmDpDE+capt+tIIWNHmXHKjZPp3pUBDSGAL3fV9Ah/JsvNaR3tczMoEoZsCORpUUDD2W8rUB2yt3QxzJXbuXwHHE7VUt59Li3BRie87lTR0Ac13b0R5Jq8tE27IanLkdTJo010mY0eu6zftyMSzYrP7EmS96oNLiMQ2bIUs15BtOxkzcCH2VwjJs4bohWb9ZQLSvhSWjsoXXpRl1YQP6C/55wBSn2C/b563I+DH1SoGRrn3a8cA==;
	5:29jXHFjmDSUqPrbkrDn1PcEKR7srIG88o4KYiT0FqCWyRyzI5KmzaES0gq+idR0mU2LcljQbFnwydjf0NgCbqG48auFTWdJVyGYaRvZSBrRcKT+FmpLTWAQlgKMIKTaia7LGYqjIL6jBulEkF4hQ+w==;
	24:eGQgUbZoLero7TDPzDagLk3oM/M8DgZCcQGrjRBIO8xnvCo8ANS0lRlpw3ukNIsSZ+zY5aAcxIHJn0TyRn04Kvp+snJDpTgToof+/X77lr8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	7:V/NfpmRVuZLGhNt/dAM98Rz1xau/je7iCyluBGrJ/EC5q2lYlRurjhG1tE7q6Ik0AArZ0ebJ/+fc7d07+ZEegJVsJuuabzPwV40/5CHDn9nmk28AlJ0fxiOD+aPbJsLMiAJF299E8Kil+XOAv+qvJxQrslgRdMH2XhCIF6vDRUDiLhnbtRJCXVVmCnae26bkFgLeOCOITTnz1v7eV5nimjH/fUY4L+n3D33BxMTGxo/88IfxpEufPxZjr4/pDbUj712RFBvvNm4Xc2wXfc8ffVJJtMnC2ErckbUxO+b1Mde4iTq/PtywSqFBp7ufpia/QbfzQ9rNUJW2r+0A70kpIQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2017 03:34:42.8708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR01MB1406
Subject: [meta-clang] llvm-config cross-compile improvements
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
X-List-Received-Date: Sun, 19 Mar 2017 07:08:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch series fixes a number of issues I hit when trying to use the 
meta-clang llvm-config to cross-compile a project that uses CMake, 
calling into llvm-config, to determine compile flags. With the series 
applied, the cross compile successfully builds and runs. Please let me 
know if you have any concerns or if there is something I missed, and I 
will fix it up.

The following changes since commit c9c74d269ba79abbc20919de96f1eb2b8a81edec:

   clang/compiler-rt: Fix nativesdk builds break compiler-rt dep for 
clang (2017-03-16 22:54:02 -0700)

are available in the git repository at:

   https://github.com/surround-io/meta-clang

for you to fetch changes up to 7d294bc2548ade23b7d25761d73769e712617c51:

   clang: build for only target and host (2017-03-18 18:01:50 -0700)

----------------------------------------------------------------
Martin Kelly (5):
       clang: correct spacing issue
       clang: remove commented-out code
       clang: fix the llvm-common wrapper
       clang: build libLLVM.so
       clang: build for only target and host

  recipes-devtools/clang/clang.inc 
      |  5 ++++-
 
recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe-path.patch 
| 36 ++++++++++++++++++++++++++++++++++
  recipes-devtools/clang/clang_git.bb 
      | 52 ++++++++++++++++++++++----------------------------
  recipes-devtools/clang/llvm-common/llvm-config 
      | 41 +++++++++++++++++++++++++++++++--------
  4 files changed, 96 insertions(+), 38 deletions(-)
  create mode 100644 
recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe-path.patch

