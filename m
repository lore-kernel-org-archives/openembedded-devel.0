Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17165.1792895782843417868
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2026 19:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kwjAYzpC;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VPyTpq/U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17Vc91588116
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 02:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z2C8G5FlbFLfsLC77RHHrWu0T/tZ6nTHo2p
	Wh7fQbvA=; b=kwjAYzpCXS6iqR8i1FVLUBt5QzZp3oMg6pAmkQXdn+SHphCPZc9
	55r9qbfuaOabHYXb9SAB+shZ/V4ED3ad/96fl7XpxlRj+UxlRLDnTEbkcb3YMvkS
	FSkfhs5YhEFgW/Ntjj4DtfdJeX3fbVaUmzWzRZSYPLKS3awbqgtAeYeRRtpl8pZu
	3CB3ojSkQ8YQWAVs4gqWRR4D6HJ/n5NHZevB1lAhQ/vXEbawXCSszKX7NAKWIeUO
	IU294rpnRfVtYxVh9IJWD7dFht5yBNdfm3jrDlSUx/1KiyqILujZf7P1SYeRjioJ
	S6xqsiJZfQlqyBMraW+cILJBtfJfpsEPz8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuka3nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 02:36:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso3045059a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 19:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792895781; x=1793500581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2C8G5FlbFLfsLC77RHHrWu0T/tZ6nTHo2pWh7fQbvA=;
        b=VPyTpq/Udno9ij7BYh6Sd6Zq2JTDC1nE0stxyyQZiEueOqOdJDvwHh+aMnPpE6RL95
         WPN6ZwCp66sUxdiomblQCfCVQjAoxx48Iz8lnLszAzdYLFsgCEAJnjaSpTx4eCUYmYnp
         QyHi4tbJsvTQX3tueHdwVEuBU93j8RVdWUJCDqMbeA3iElSG5ImIitikFjN5gs9o0XYc
         qRXkdg9i8dZK0CGl60lyNj8kfvaqfefHehmZB8pcL91DjJsrz8BsHx3WMwZmYN/6T5XJ
         0+y+hSEX+ghpLjbeHhTE1ijt1ux6T3ru52WRrBP0dhgPWMAwh5qobDBAp5iBi90oCRAx
         qDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792895781; x=1793500581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z2C8G5FlbFLfsLC77RHHrWu0T/tZ6nTHo2pWh7fQbvA=;
        b=V9dTpXyk2SQ58XfHcODF66p8iME1j3NeWmjSpDMdzAi8OuTiVjcgQllMm8JDpdfMXg
         cUvcA67zinzbNMxlhB0fDHTWsDFYyu7JL17PCKrpQAp+2nrbt/QWnUQukxnk2CP6tbLS
         QMj0SsRP5vLGbJ3OD2aBmZOvF8pO5GasXUV0wXICGX8faxZEjFOpx5vhAvlkM7/brKE9
         hdT9m/3ARg6DX9u1UD1vJ7kD3ozyPRYW8FZPOThMLGjrsp7FBoVk+U9ZxvKRuQUV6AeY
         y8Z5DW/Bb3BZY8WbOWC/dFy6zcqBPhlMEC/4ZEzm8iaEQuwj5wyBwsHysRnwdgQba2C8
         OrBQ==
X-Gm-Message-State: AFq9FYKk3+QgTvg9I1SInWRZaF0SSiJiWvSBlaAY70F5OLZYIorsAbjN
	jUVbi/GZn3P80tjY7iQVlHP+eabFUe6urSEQ0ttL5tfY4GEVwyfliH27wKwvtvRSlUfZk7tVnsF
	MDZ76J9ke3y1k+PbKagQsjszyq6uPpq/jNyiOjli8Q/Jr8GARDvQyNc714rBaAF417AIK+niwU/
	azmxAnUgDYYzUnkJCVvwk=
X-Gm-Gg: AYBFou1Pyb2noSVwXDUY3J9JO6CiyBgpX9CWBXzPi9Jz92UKm9INL68hpthZQsrBvoB
	kEsFCdMqe65IEwmtBhZ+QHIkx9kw+ga08zzxMIKyQP7SYLUpjpdzVif8hnZd2SGIpcZKqDsouFy
	anL+aC2uPao20azsnvZ2nbP2temSqafhv7owZRhBRdinr/wOc2NCu+61ep9LvqFgEAJz+uboluh
	v14UK1Mc1qXncX8YqckTvq+cV2hKmPZlxWAjkt4HyIne7yIKWmoLkx6yhW7n76veWcb/3eabc6F
	9j63jPaiqwkjdljYQ4BBCPhGBnZGg55qp3OLbr2ybqD1LXZ1zrsB26fxq91Y/fLH6k75jkpNob8
	c6YaljfCs7ZH0KSflGWKyVxoGA7OQsEoAItuTENCePxe2WSpM9TGZ9jTJGVhKfjKZs+9vGGPch3
	qPRaeWAQNIzytrq+VBhdt+0jXG2IyWvMWdBuAGjA==
X-Received: by 2002:a17:90b:582d:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3ade9b2ef33mr2817186a91.9.1792895781217;
        Sat, 24 Oct 2026 19:36:21 -0700 (PDT)
X-Received: by 2002:a17:90b:582d:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3ade9b2ef33mr2817172a91.9.1792895780613;
        Sat, 24 Oct 2026 19:36:20 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a7468sm6852205ad.53.2026.10.24.19.36.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:36:20 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ostree: upgrade 2026.4 -> 2026.5
Date: Sun, 25 Oct 2026 02:36:13 +0000
Message-ID: <20261025023613.3249118-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6add6b26 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=89zn5W2gAAAA:20
 a=EUspDBNiAAAA:8 a=UUWv0BQYdpNnk7Is6gcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: As4iH0aaN98CX5KzJe99qxPHsMD0yyHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMCBTYWx0ZWRfX2aLV8RAIumfH
 TlKLNK6MIVFz0X2RB86026qUwtJvCbS6UvynMizOtRJKyGHqSP2DowIBdjiukWV5dETuLlr4a6p
 caEtFhoTtSB8mCZQO1aX26/iZtDJjXhz6or5Yjzsy0jFboc+gpMSJ3rnj6MiMZ/4e31YB03d1Gm
 +8LhUUwWse0vlschtWnjyjCwc1oQHHeETjiszvP6s3WIvk08JaUff1VfJ9f8SjeVn8z3sEW42Mt
 jPAltkovkezeBM5X3M3lAaZrkaRNisxsg7XFqH4/UXZ3Ox7guyrQVeK6gJuYTzJ8/8pgpuQwg+m
 wE+ABNOJHclBhzQQ42qurxOyw+NkGtGftxAm8J4SPcnmjxEGVupzgxhi6P/rZ80va0zRNkv1XSn
 G+EAetFMRbTBzzb5pcwwln8E/vEr6QrYH8g+RVok3XUng48EkLUghfyOhgVzqVV11Ev7W4P0icH
 V/VvBxAvpRNScOtjHIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMCBTYWx0ZWRfX1Y+W9t4hm3vO
 T3L0MugUMqTpR2T1N5RsoyEIskaePKCCrh+bg5bKUCOVXUyjqD72YuG6LwLaFqQUPmXbbxrxl7w
 6C4dieG5Ul+g7kfDGfxatRvaWxwB/No=
X-Proofpoint-GUID: As4iH0aaN98CX5KzJe99qxPHsMD0yyHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 02:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131404
Content-Type: text/plain; charset="utf-8"

This release is mostly hardening against untrusted repository content.
It fixes two checkout issues: a crafted whiteout name that strips to
".." and makes a --whiteouts checkout delete the destination's parent
(GHSA-cp2j-qv7x-wcw4), and union checkouts following a symlink planted
at a directory name and writing outside the destination
(GHSA-7pq7-3pmj-9wp6). Composefs and commit signature checks with the
OpenSSL ed25519/SPKI backends now accept only EVP_DigestVerify() == 1,
where error returns used to count as a valid signature. Static delta,
content header, commit and curl header parsing gain bounds checks.

Behaviour changes: the default min-free-space is now min(3%, 1GB), and
the systemd generator leaves boot.mount to systemd-fstab-generator when
/etc/fstab has a /boot entry.

https://github.com/ostreedev/ostree/releases/tag/v2026.5

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 .../ostree/{ostree_2026.4.bb => ostree_2026.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2026.4.bb => ostree_2026.5.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2026.4.bb b/meta-oe/recipes-extended/ostree/ostree_2026.5.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2026.4.bb
rename to meta-oe/recipes-extended/ostree/ostree_2026.5.bb
index 05a514c262..adce310189 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2026.4.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2026.5.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "b26c9016eb03bb4ee52cc00c642d56e00fc79ae7faac6bf4aa317d7451339ef7"
+SRC_URI[sha256sum] = "1829428ed2d982dc684211ff18525b57ea627056a68fa5b04f674f0ca6c9c19b"
 
 S = "${UNPACKDIR}/libostree-${PV}"
 
-- 
2.43.0

