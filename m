Return-Path: <mohammad.rafi.shaik@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C385EF371C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 08:39:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9534.1773045581552045015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 01:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=PbyneKkb;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=ET6zdISy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62983Xhj3015890
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Mar 2026 08:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cWl9CT/wrCJrKSDKmnUbBw+GZXbYSxFfQnw0Ow9Xuw=; b=PbyneKkbb3xiR0TA
	IWGsn/ZbXqr2IS4Q7S/4MNk7zg1PKVhGFNvRp0RJ3LsGNegNuMOjfoYQk5Sl0X/d
	g2Fl1pJZmLc0mHcbVvYkB+1Zk2l7BckMef7yMH+OijSeNYDxfUK5KEb/s8sxwdjE
	UXYsoK2GvV8oDcMl9O6d/cx2Gpit379+OBuUAJ4jwQdeCid5UU4baTfLvxWykQkG
	6rAjoarVNoVF0D5Tu/0S+gyYyAexrdIJS+0G0WjQ1WqsG7Gk0UiuDvgSAOGqvlxF
	sIEBQ+jsmjwft48hhCFp50HMwSpmhVrmIW3rAk5hMjR71TMshix7Xp0dC/47B8BT
	d4WieA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxvkmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 08:39:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae48a21d12so57316825ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 01:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773045579; x=1773650379; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cWl9CT/wrCJrKSDKmnUbBw+GZXbYSxFfQnw0Ow9Xuw=;
        b=ET6zdISy56lv1AZtANgR4kJpfOAfetOZ69RfxfJdp3J1ITg1eHoq6N+uTKMQpS7w0D
         lbH3+n9UMuSaZ6EAhjcl0tnXWHHm5DicNKiFalkpOOfJKKm8kTiCdgdAJpvo/CmR8SAj
         J6Cq/vZry75HkfyIDNW/tK3zD+XLnvYDhJme/oFVwzrmxGQlrGC0mbg+3jbgyAv5tb3F
         v5Yq1cINh9dpNUEff0tOgoOfpTgzfP6ZZ/OAUvQ1lf2ML7YZVvDsoD4nKwjepvpc4phy
         3adgLyWBdTLEQ2zJzs3ymnAqCCaUCIq3F6AuZlmxwSaeo4q7fFo4v/kMFLrxvaqwGhUF
         V8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773045579; x=1773650379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cWl9CT/wrCJrKSDKmnUbBw+GZXbYSxFfQnw0Ow9Xuw=;
        b=aRmo3yaRVV+zv6/1BWxB1LrE/7xpE0QljzXpH+RLulxMNY7wa8HcpyVi54ZAwMFM1a
         wM86OI61/FWj+dsyWjqbUh9iBXGwllPU7TORdfkaLBaCxatFJLKJ9N1KBgU2VtIxidvp
         Tb5nrNCueeGZNjqMqqKFIR5oTLqTQwXnzvmHNiz3WCMFwAqPjTN3d37987CYi2yhDEJH
         TAf9KIxk46pcu8BYBmL1TPXrIatW3U4o/VvEsp1dLsAJ2cQK6DpJrB4jGvyw59gUH5kx
         FQbgBG9/Jj7ec8eQkCdfTHYJufJy/sfweOGI/QhumUtGnRLMWA8zuhlNQf+hgZGRkV0u
         lgLQ==
X-Gm-Message-State: AOJu0Yw78Zw6fOfsn74pKFZsUI1lfhDTa9z1vqJ5zUaq66blDtbstme5
	/LSECAzEfZE83B+luyrY9hs/iDg0oSNLWbtqP4WH3VlTU6E+sABiD0NSPRZaY/yxdrDRjY4d5TP
	bxtPdDWqYNnx6H6w3p3uJ3qUr3WKPBvNiT8ubCqC0DVUSlbU8YFnDsOGOOi8SherS2yYDAXQKaN
	4bgolFhmcH1e4cmmx1
X-Gm-Gg: ATEYQzwHH6samK/N8mAvAcrL8QtW6HRENTvnBonZM6CtdgT0cFkQA5/alJwlNhiL48E
	39yVd4cPXmACcLBWm9X00UZwqbWhP1aa6X739PypNCgnW8sQYHIjPvM9Cx3/evH1QJh7WU/QOFb
	1tIu+0U/miS0HqvFdURsvCQ3a2EcQ+5ygcAVcgGLNSsVSLBns142l38s/N9MYnzCff7+n58ehMT
	bEHaOUoHVlAsA8b2B0fT+0ng1IjkoSGZ+WI+4f8gwDM6Rb251HUxi8ZoyWbqu9Bk/8lXi1L4OHl
	HG0mWegh3aTLpyly7R+aLu1OTuyfFbuFbiPExi3hbRDMVyrqFB26eAL6xHF2d4Ftd8plpRDrO2v
	fsptC4M5LsfQ6K6U/ZFpboHr1HoSdxdZsPlPtB5OX4lrG/U8S8vWI++zItREn
X-Received: by 2002:a17:903:19e4:b0:2ae:4732:285a with SMTP id d9443c01a7336-2ae82366babmr120874365ad.3.1773045579100;
        Mon, 09 Mar 2026 01:39:39 -0700 (PDT)
X-Received: by 2002:a17:903:19e4:b0:2ae:4732:285a with SMTP id d9443c01a7336-2ae82366babmr120873985ad.3.1773045578545;
        Mon, 09 Mar 2026 01:39:38 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ca8fsm146028455ad.30.2026.03.09.01.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 01:39:38 -0700 (PDT)
Message-ID: <6923153d-83e9-4361-b563-7e60d66c021c@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 14:09:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia][PATCH] module-protocol-native: Fix socket
 activation
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org,
        Sairamreddy Bojja <sbojja@qti.qualcomm.com>
References: <20260309063956.1548385-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <CA+s=J=z9-XrUaha_K5V=i563yb=FNCzKfKC4dxJrct1DU=_PYQ@mail.gmail.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <CA+s=J=z9-XrUaha_K5V=i563yb=FNCzKfKC4dxJrct1DU=_PYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA3OSBTYWx0ZWRfX6k1m2O7YwSRM
 CA9A5o1iawQRwjI5iP9HxCF2PPAr3UT3HVM2X5liSwL/ODVQ7i+BSEUKJlCU/WRP1xsC/EWmEpA
 IWnYYHimn9Xdx8dkZMIXhtIhhT0pp9av62R3YtBe1XkGP6KGuNgC/mkfIntr2oYshIMbshA+Dfj
 9ms1uDE8t1qxiHS4fbULkcPY65HD3njjnE1KDTno8KCtmS5C+uK58MkO0cqzhb+xhwpOEFgsh0r
 oIiDzTzZCWhWPk3qzzfcv3bN99gAod0Jq3YixhUrBZGgnn5PFNQ2HUGCS6uHwmAaTe4HwWNJ5DT
 /bBqomB3JuDQep43W66IibFQd6gnmocUAgZ1ieA6bwYWVLRoK9/CsV79aCcet5TEoGJmO0Hs8b2
 A6ztdS7XP15UD73ZWDpJk1WyhhajRctrllXo0MnfZSYlOTcybKAVBPWNW9UL9TmBUIRIcutCY+a
 225eAuEwKJ+lgxn+SqA==
X-Proofpoint-ORIG-GUID: 934hK5iWv0kIHrLRTyCtkzrfv5pkXUvD
X-Proofpoint-GUID: 934hK5iWv0kIHrLRTyCtkzrfv5pkXUvD
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae874c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=3-RhneuVAAAA:8
 a=9lSJqbp8cUlIM0biuLQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090079
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 62983Xhj3015890
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 08:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124958



On 3/9/2026 1:41 PM, Anuj Mittal wrote:
> Hi,
>=20
> On Mon, Mar 9, 2026 at 2:56=E2=80=AFPM Mohammad Rafi Shaik via
> lists.openembedded.org
> <mohammad.rafi.shaik=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> From: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
>>
>> Fix path comparison in is_socket_unix() and don't unset LISTEN_FDS sin=
ce
>> the function that uses it is called more than once and it was not unse=
t
>> when sd_listen_fds() was used.
>=20
> Please explain the change being proposed for meta-multimedia.
>=20

This backport is required to ensure correct PipeWire operation with=20
systemd socket activation in Yocto images using meta-multimedia. No=20
Yocto-specific behavior is introduced.

> Change commit message to start with recipe-name:
>=20

ACK,

will update the commit message as suggested.

Best Regards,
Rafi

>>
>> Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/f4e174=
870eb8cbe60c922d3bf181f3eb2347523c
>> Signed-off-by: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.c=
om>
>> ---
>>   ...rotocol-native-Fix-socket-activation.patch | 86 +++++++++++++++++=
++
>>   .../pipewire/pipewire_1.6.0.bb                |  1 +
>>   2 files changed, 87 insertions(+)
>>   create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipew=
ire/0001-module-protocol-native-Fix-socket-activation.patch
>>
>> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001=
-module-protocol-native-Fix-socket-activation.patch b/meta-multimedia/rec=
ipes-multimedia/pipewire/pipewire/0001-module-protocol-native-Fix-socket-=
activation.patch
>> new file mode 100644
>> index 0000000000..c345067932
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-module=
-protocol-native-Fix-socket-activation.patch
>> @@ -0,0 +1,86 @@
>> +From f4e174870eb8cbe60c922d3bf181f3eb2347523c Mon Sep 17 00:00:00 200=
1
>> +From: Jonas Holmberg <jonashg@axis.com>
>> +Date: Mon, 2 Mar 2026 10:28:26 +0100
>> +Subject: [PATCH] module-protocol-native: Fix socket activation
>> +
>> +Fix path comparison in is_socket_unix() and don't unset LISTEN_FDS si=
nce
>> +the function that uses it is called more than once and it was not uns=
et
>> +when sd_listen_fds() was used.
>> +
>> +Fixes #5140
>> +Upstream-Status: Backport
>> +[https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/f4e174870e=
b8cbe60c922d3bf181f3eb2347523c]
>> +---
>> + src/modules/module-protocol-native.c       |  2 +-
>> + src/modules/module-protocol-pulse/server.c |  2 +-
>> + src/modules/network-utils.h                | 14 +++++---------
>> + 3 files changed, 7 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/src/modules/module-protocol-native.c b/src/modules/modul=
e-protocol-native.c
>> +index 2be92a847..98a43829b 100644
>> +--- a/src/modules/module-protocol-native.c
>> ++++ b/src/modules/module-protocol-native.c
>> +@@ -907,7 +907,7 @@ static int add_socket(struct pw_protocol *protoco=
l, struct server *s, struct soc
>> +       bool activated =3D false;
>> +
>> +       {
>> +-              int i, n =3D listen_fd();
>> ++              int i, n =3D listen_fds();
>> +               for (i =3D 0; i < n; ++i) {
>> +                       if (is_socket_unix(LISTEN_FDS_START + i, SOCK_=
STREAM,
>> +                                               s->addr.sun_path) > 0)=
 {
>> +diff --git a/src/modules/module-protocol-pulse/server.c b/src/modules=
/module-protocol-pulse/server.c
>> +index aeab710b0..637757dfd 100644
>> +--- a/src/modules/module-protocol-pulse/server.c
>> ++++ b/src/modules/module-protocol-pulse/server.c
>> +@@ -576,7 +576,7 @@ static bool is_stale_socket(int fd, const struct =
sockaddr_un *addr_un)
>> +
>> + static int check_socket_activation(const char *path)
>> + {
>> +-      const int n =3D listen_fd();
>> ++      const int n =3D listen_fds();
>> +
>> +       for (int i =3D 0; i < n; i++) {
>> +               const int fd =3D LISTEN_FDS_START + i;
>> +diff --git a/src/modules/network-utils.h b/src/modules/network-utils.=
h
>> +index a89b7d3bd..6ff80dd7a 100644
>> +--- a/src/modules/network-utils.h
>> ++++ b/src/modules/network-utils.h
>> +@@ -143,7 +143,7 @@ static inline bool pw_net_addr_is_any(struct sock=
addr_storage *addr)
>> +
>> + /* Returns the number of file descriptors passed for socket activati=
on.
>> +  * Returns 0 if none, -1 on error. */
>> +-static inline int listen_fd(void)
>> ++static inline int listen_fds(void)
>> + {
>> +       uint32_t n;
>> +       int i, flags;
>> +@@ -161,8 +161,6 @@ static inline int listen_fd(void)
>> +                       return -1;
>> +       }
>> +
>> +-      unsetenv("LISTEN_FDS");
>> +-
>> +       return (int)n;
>> + }
>> +
>> +@@ -192,12 +190,10 @@ static inline int is_socket_unix(int fd, int ty=
pe, const char *path)
>> +               if (addr.sun_family !=3D AF_UNIX)
>> +                       return 0;
>> +               size_t length =3D strlen(path);
>> +-              if (length > 0) {
>> +-                      if (len < offsetof(struct sockaddr_un, sun_pat=
h) + length)
>> +-                              return 0;
>> +-                      if (memcmp(addr.sun_path, path, length) !=3D 0=
)
>> +-                              return 0;
>> +-              }
>> ++              if (len < offsetof(struct sockaddr_un, sun_path) + len=
gth + 1)
>> ++                      return 0;
>> ++              if (memcmp(addr.sun_path, path, length + 1) !=3D 0)
>> ++                      return 0;
>> +       }
>> +
>> +       return 1;
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.=
0.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
>> index dea1a169d0..742720ef60 100644
>> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
>> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
>> @@ -15,6 +15,7 @@ DEPENDS =3D "dbus ncurses"
>>   SRCREV =3D "700cea78dbe7564131d51b21a7795e2567ee048a"
>>   BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
>>   SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;bran=
ch=3D${BRANCH};protocol=3Dhttps;tag=3D${PV}"
>> +SRC_URI +=3D "file://0001-module-protocol-native-Fix-socket-activatio=
n.patch"
>>
>>
>>   inherit meson pkgconfig systemd gettext useradd
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#124955): https://lists.openembedded.org/g/openembe=
dded-devel/message/124955
>> Mute This Topic: https://lists.openembedded.org/mt/118217162/3616702
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [anuj.mittal@oss.qualcomm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


