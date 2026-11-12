Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4516.1794448075383306786
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 17:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dK6ofYtd;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hx4JUFYb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMaECi3703223
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 01:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tTu3SZxYAQTqqfVkK7Irjbw0iAjiBedIQ9Z
	ZJR65Nnk=; b=dK6ofYtdva6W1ifCYrU901IsLrKKVRqGqCDiogVNEgxuGPRS8yh
	j4A3711J7WeaxYgvHmE+qxBUUHrXBiCnQhxGDWBAQpY5Ezo2SK/A/Ef0Hm3T4xFq
	h1bzXXwbSYiDRAmbdfYcsc+tzyGrd4SyomylM8TqWhgkUIJJAslF8sJgnl0mbnAS
	T9UGwQ3X07AkBtAeUc8HuAFeGwR2LfJaReiFFWN3wQM4gK3+UoPk55IVbjR0EbK/
	NDPYHdTSacpVjI8AOhdYfKi/DVojXNMwUyXmHZylOx2QjoKTLPjzbJSWOykxuyb8
	hBLxJOdYAMaknW1kCmxKDoKR1eq/fza7cyw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdmsgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 01:47:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b60129a46eso5030163b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 17:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794448074; x=1795052874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTu3SZxYAQTqqfVkK7Irjbw0iAjiBedIQ9ZZJR65Nnk=;
        b=hx4JUFYbvpgYi9s83r65mTlh/Dc7KYn12sdlNLCdN9la3Nzcf9n98nrcjkoz+PWZyK
         c4nS79pWAnNtElpcS8w/jNSbuaK0B2Xf6KtrTbQ6hndFLf2i4EeJJuOoO8GDgh0xsoPU
         R7Cs+BMlqwathELJof+UsWywolQxDYZWoqOaBc823f32OdbMhG7cv31m97yUdnsNDQ3l
         3N07xfYNPWZnV6p2hk4Iz2Ht3eAjbVfAEAGHVP4Z1YntQxFOSw9Z+Q/BlUac3pWMGgy+
         VkA8ZY38RZ+6wLVET/yRoSGMUefhfenSGMcTjjDJMZsRoB35mdbDvWvs8/qbtHssg5vg
         NmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448074; x=1795052874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tTu3SZxYAQTqqfVkK7Irjbw0iAjiBedIQ9ZZJR65Nnk=;
        b=KbEikQNLJuFceQiuVrsT1THKvvBvt3Tpna5nzFzYJy2yHhG0HcB2mW/SMNtJJUnZh5
         Us+ITOS2h5WluGh4WqfhE03dVcSs+wvWtsG/8gAHhpExv5idUfCNvyJIc82lg1PhKc9U
         Q8eGyoXmpw94Xp70AJsDWeHNaNzjJm17Clumtk9E62vRXdk26nI1qFbTbj0YH+MVSgwM
         qb8KW2EbgI87J04eGe4Cx3tFIPnKxZIul1KgUi+P+OzX2SN/6yZ3BBcr0B1wZQCXdkg4
         fgBAp35L7jbVDINExMlDC/V933nDXA3Cdg8k7MCKspplwd6rLuFhTageNNySv14iJeir
         rmlw==
X-Gm-Message-State: APuU4Z+Cmnu8S2FieDZEJKY+vqRsRWgY8/uR9JaBosKf1UIcBWXxtF8z
	pUN2dyxQs2olKWBBLvoVjJiGrA/Zx7w83SekwNDGiwEtO7D8fm+mUhXYrn3uYx5CH3OJmdQBo9w
	CWF0wxLHm63RTWRxhykphv/Cl2qwmDJhgx3ilYJLNszX8JCjRjoXw991eUGQ9NqzNif6uJNtEqV
	IojHSMivN0IFsQopBaHgE=
X-Gm-Gg: AYBFou0x/k7gXMlM8z0KW3DV9U936Gagi3THf7FmYRb+r77lSa/OWFW3w2vdtSPH6y2
	7+vp24wjpQsa11g9HPXaQyikbt+DyajVwef3c06yzwwuVUW/yQjx4kZQnPdCQiTX3s8F0vYbOHY
	sI7nb8aSvEwY4X1EPFsIOFGkjikWQ9yr0IsPSLuMlX5U/T37ZBXAozKqg11bwX5ae7OOcWMqnyB
	W46zEDAPI34j32Aq4OXsVk2xgR0hY5Pg1idMb+gdePycM1ZYaPljPxe265A27eqKl6lbW3g8gmg
	pNjDN2fQFBg0ya3EvQaa2IhGAmtLYUCsXemQyBi1czw55/TYnmXLItiTL468Jyjy9hUL0HDQ1Ti
	h22zTm5CgI7I4tRvW1Z72MmEJ1+uIyQcoDIFu6W1nZ3pvUmjIMBqWhp7gn1QDas/H0JM1zjjDaG
	W7Zi53cdNbTQIXpq+R3SDakFFUxnFaMogQi5jLA5atl1ALZu5C2hVDtrtQKqZH/IXIU5VBFrKxj
	YgepDbx6Whwq7k=
X-Received: by 2002:a05:6a20:6a06:b0:3ef:cbb4:4dc3 with SMTP id adf61e73a8af0-3f2fa09c4a1mr4568394637.5.1794448073694;
        Wed, 11 Nov 2026 17:47:53 -0800 (PST)
X-Received: by 2002:a05:6a20:6a06:b0:3ef:cbb4:4dc3 with SMTP id adf61e73a8af0-3f2fa09c4a1mr4568367637.5.1794448073018;
        Wed, 11 Nov 2026 17:47:53 -0800 (PST)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d699b93sm1973715a12.14.2026.11.11.17.47.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:47:52 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cpupower: split cpufreq-bench into cpupower-bench
Date: Thu, 12 Nov 2026 01:47:40 +0000
Message-ID: <20261112014740.789894-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af51aca cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=C5qg9FS71YztyAyyvFoA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: VZ_vITydcdFBe49mtG3EFjrfJeT70C32
X-Proofpoint-GUID: VZ_vITydcdFBe49mtG3EFjrfJeT70C32
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwNiBTYWx0ZWRfX6fMc57oWPa8Z
 UUwj1zNagj2+VBOJ4tzzU9lUXLrNJfe6XMdEfXA7y364o1LYrbmiVFIZuBtUbt4zqpw3atIYmA5
 utXcn/FLQu3wm6UjJ/4yprVhHoOJ/B3T/7MRFFUC5oNalpcYAfqOjZeYFzr3Wc9Z6lKvo/NbdgD
 1WU2tBGzvDNUC1/QKj7MRPYgmyTv7kPXWRwC9WpejCvZ1RQHmOl9ZM7GLqbucwWjtWKG5XrSX71
 JMAFiq9j1AJGEmC3zWPto4GYYYbkm44Zmipsi6h1o369flXzYJwenXtYV4qUyGhUw3d5RQR/qWz
 bQd2KoD3P9wQYhXKBv8AAD+PuBloDDYYNWmw/2fnhYMh0S3YFCnVIyY6mV/eXVKpfwGcqffU6PV
 Npd2+8cnG3HCqQKDgkpPcZkVzV+h9vMbbmMmARMLTV+IA6oecehEYxhhpMbs45HCd7mJOe42ETF
 +kgwVEQUdhEwSHuS7qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwNiBTYWx0ZWRfX/n2PgyrqnwxJ
 P2qI7lC5BRIxoOkD85KVgGPfzYIpnBFaxhRc/ZzfGQ9KiNcVW5+Rv2Qv8SLw16SSAwC5UTatsYc
 7sC8GQy0n6QT+3MQUux3AVDjp2ZH6u8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 01:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132143
Content-Type: text/plain; charset="utf-8"

The kernel's cpupower Makefile builds cpufreq-bench by default and
installs its cpufreq-bench_plot.sh helper, a bash script, into
${bindir}. That makes the whole cpupower package RDEPEND on bash,
which pulls bash into images that only want the cpupower tool, such
as busybox based initramfs images.

Move cpufreq-bench, its plot script and its configuration file to
cpupower-bench and carry the bash dependency there. Images that use
cpufreq-bench now need to install cpupower-bench, so switch the
benchmarks packagegroup to it.

AI-Generated: Uses Claude Code
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 meta-oe/recipes-kernel/cpupower/cpupower.bb                | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ebd66425de..d01f889374 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -53,7 +53,7 @@ RDEPENDS:packagegroup-meta-oe = "\
 RDEPENDS:packagegroup-meta-oe-benchmarks = "\
     bonnie++ \
     coremark-pro \
-    cpupower \
+    cpupower-bench \
     dbench \
     dhrystone \
     fio \
diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index b453308770..e4e24e94ee 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -25,11 +25,12 @@ do_install() {
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PACKAGES =+ "${PN}-systemd"
+PACKAGES =+ "${PN}-bench ${PN}-systemd"
 
+FILES:${PN}-bench = "${sbindir}/cpufreq-bench ${bindir}/cpufreq-bench_plot.sh ${sysconfdir}/cpufreq-bench.conf"
 FILES:${PN}-systemd = "${sysconfdir}/cpupower-service.conf ${systemd_unitdir}"
 
-RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN}-bench = "bash"
 
 python do_package:prepend() {
     d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
-- 
2.43.0

