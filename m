Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10904.1794197285404494248
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 20:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=acIkKGiM;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=f7QPMVjO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93K2hT120635
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 04:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/N/q5ds5VKg2cw9gS5O2KEZqvyKm3tKpMJMX3++sT4=; b=acIkKGiMhzDk0ByA
	Ey0ZV7GXBaZOHXDMRjfRjJVOnLJacGnIR6MFpnGa2kfNbf/TvqorjcUrXk5mf/kb
	Xw3ZrvzQeVB5U8st0cYv95HIjbqTob3+Xd2GgbrBtGyfjM35Mh4ybndbg56nKxGS
	aVM7myqqJrhyMUW7ybo6SFFfPPRBlTsWinBlJ+DvZ05nvpzV5RHjvKudNgjrJCJv
	Pd5RGsm1JwdDf8E7ISfWoyXswxo234cgPxdPmcOL1X8WWsWzgK706bp88L/qldvW
	0fn758TXaPON9z5RARaOWmMwgqMkM0tJzq/ziH8f+cT3iLri4f8x6iCzJBx/TTqL
	wKI7Yw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxscqsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 04:08:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea864ee9cso14849556d6.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 20:08:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794197283; cv=none;
        d=google.com; s=arc-20260327;
        b=Ibm+KQiDK7vfW9LKRfntjYaHLXJfkd0ACRJBkosJ6Ne+hhIqoIjjKSocGAwmLgtX/k
         5Nu+Au1J+QINCepO2HxRpuNCVkfejgHRnNDb5Djge7WNGSNH3G3vrKxK3i38Yck8Q18y
         GQCQ7wyA6X5sCIBpbtteCJ1XdpKz2BDG2uqJuv3HQu8+Xn45ePAM/+Dpd9WyIFkgu49S
         TRHLcyUHvvvu64J/XJMDDVafwk9QWg1WuLp4DrA/nfkYrwRWUwM0IJUU7JVXIW6kgJVu
         Sp/5RWaPJxbkO/5TOltEXoRYGciRv9/JblC6xkcB5e73L0G6HuGGmLbyCTemT2D+fEfd
         valQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H/N/q5ds5VKg2cw9gS5O2KEZqvyKm3tKpMJMX3++sT4=;
        fh=goYRMc/Vcv/pTZW9xkxclfFkiTvRXxhhCHQr7SX9moA=;
        b=IkiEnl8BHTx4Ve9jPgZyrcwR3uFM4NqlTQMd9GQphM8bhp8ZymZ6bowitNnTcuXg5l
         1pKhdOJO0lV3i4lOBq0Gj1ruAPt9WN29tvpsmVa7HeD1AABUjKxPPp+tQgyC8j/us0Q+
         IWf4SrqT4jwj/m9msD0EOleMeIaDhXglhRF3qua4D2ljZRzXc8aaJ2ZaeYTaTTBQYERF
         6PCupBQKQeHoiCwkJhZ/720e3FhS26Ootdw5SnPmb0cKXatLXkbJ8eoQnK81BTiyOUog
         8liUSevnJdKn+738vVInswItTS9yMjR1bXxSkPEavUxECAAa4ph9dYJQoLpn7lRGz8hP
         S/Hw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794197283; x=1794802083; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H/N/q5ds5VKg2cw9gS5O2KEZqvyKm3tKpMJMX3++sT4=;
        b=f7QPMVjOA6/gzfIR59fu2XTBGcJCH8zzDvl5YxucsFdJMPPrZuvVuQAbV0nb+fmiL9
         VffKmGpZLcoSjIyrZK1FNp90gFyp6DvMzVRxjFIdwouE8PVhKTE+SL8S3JvDeSFqapFA
         EkJPECkYruzJ8DWQveZ/1vtp2jFPbSJgdEhtuOo9LzkcLrdxHTL+v2Ugl65sAUz70jHN
         6gU/GzBF+oL1WLdJwDKy8skNoqljYNYfz6tXJrsSZENBRqjQilXgDZtUagN4PeAKtJpL
         zjQZl/kcJ1/2YJzoTGNvjSiwOa1qaBnZeJmAz60j3uWgBMh5Nz76F8xunqOdQWXwpgEe
         efNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197283; x=1794802083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/N/q5ds5VKg2cw9gS5O2KEZqvyKm3tKpMJMX3++sT4=;
        b=wGvEjfEnS32yz3DA9/GsgH6jX76S/uE5Rsj05xTieaawlDHFhDVR7pxjHL7GKTkbv8
         g4iSZCwmdtS1zpEtLOhtFTARpFGJ+7GSJf1zuNhJHqeWqG/q1Bq3sP023DWufARBggnv
         MYzrX3ASjm5xp7hTwvUOvMh4k8180MqrWPFoX/sYF8deaIL1X7R4h7N8l2whEZWZIA8r
         /iMAvL8oM87GXNyARJG6OOSo8TPO8Cs+BBdybVEt8d36hCeKJrvlW5yUIzXk4qLCszHt
         DgcywVDWrEHKvzmswF+Lc+DGeFdUjcPNtWtHhwKur7eDmCEubHsfuJat3EVJxHb2aZjN
         G29g==
X-Gm-Message-State: APuU4Z+PUgXxULL7aIPSNj3uSjKpNtIWGm9XSFAA3sP2pUycYxIC1aI4
	xrmtpe7N26Qv28g0OHCCHG1bKqmUb5+pIeO8+iYiKEDoYeir8uP9HcUtyUqgOnKt+ZLDytR/YHx
	8llFCtnLkjvTQd4j3OmPw0LqZ53OIQiBXM818/omlhfhrugYrb7UG7ayPrd2WYJ813hyL0/ME0H
	JTu5zvpgoPElX3NngDRkrHzImUui1Yqd8yKWsFRWuvlraii/R3Q0szruvBOgE=
X-Gm-Gg: AYBFou2euI3Bh3QC13pMABBLnp8vBY8eLmzuatzzwyRX7AkqZCn+ydWzGyk0MBYqf5U
	BauigQJ4YWhzG2QUP5zm1UKqwrziz5bPpgwWm1xE9tM+hoFv7vW9Tn3Cc0LOuVgDk/SelkoPf9w
	2Xn4Asoftg1YWtaSG3NWfYwwmpgRV0BGxbXCsAD/D8Z1uIpMJ364oZQhj29w==
X-Received: by 2002:a05:6214:2481:b0:91e:8ee1:9307 with SMTP id 6a1803df08f44-91ed21fd502mr41257436d6.1.1794197283234;
        Sun, 08 Nov 2026 20:08:03 -0800 (PST)
X-Received: by 2002:a05:6214:2481:b0:91e:8ee1:9307 with SMTP id
 6a1803df08f44-91ed21fd502mr41257106d6.1.1794197282591; Sun, 08 Nov 2026
 20:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20261106195125.102739-1-saisireesha.t@windriver.com>
In-Reply-To: <20261106195125.102739-1-saisireesha.t@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:07:51 +0800
X-Gm-Features: AclHuK8_Ro-tcrCzw75MT5j9qG4V-TBnMc7rzVJI_hGk2xw2z4UEQzkGhJ92uQk
Message-ID: <CA+s=J=x5P-qpB7vt-jvjkV01UbHciuOtCBWJ35ALfyPqF6kwmA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][wrynose][PATCH] libsoup-2.4: fix CVE-2026-0719
To: SaiSireesha.T@windriver.com
Cc: openembedded-devel@lists.openembedded.org, Randy.MacLeod@windriver.com,
        sumanth.gavini@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: tQFQdmQQT0iBPbfQ0RfXZxMiXomUDYtc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAxNiBTYWx0ZWRfX2Wdo22z/farV
 MK5z+KWRnQck7Pg8cRWu/cnTJCBdkXofVlmEy5Gcpb5SoR5+5z95YS83w5pZCk7+J2OhTkx7vzK
 RlQkysIHEBXGBfKBYLdf85VkFZEv2O4=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af14724 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=EUspDBNiAAAA:8 a=Zpj00ixxzWIaPbRVetkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAxNiBTYWx0ZWRfX380gO3qmVT7f
 FbKkOy40aAwGQf8D8sGwDohH7IETV5QWidVPq8N16jmYfeQRgtoqKO2mPs/wQ4hygAinVJdvkMn
 O9VQwRpRmNyEXIfi8NCvR4sBZGQO0gUYz0Lxs4uHkDZ5aI2wg6ASjNmvI617jWnhT4kIvynszVf
 nYGb+SgMWONbozBkMXtHgsq0J5d18Aa6u8HQqnhJkyT1pOHpq4qdcflK1U9pYUnM9F+8JwbpyRX
 bYeq+naIMJFYwEdyNSHRRxRrnOv2M3JboCVvO/LynoQPJdfPzupp42DJeEgcUMvnBzlDtrnpcFs
 saWODm1pT5vhqb34PTYfiNMMvnTCYkKNiMiVc+7/mQjGWxOBACzMcs3RFLkEalgEDUqnm2f/V1v
 CGUGo/YbJU8NgNURigeAKF+5CDFXRY4+QuYoZWhN8h0h0AlYocVK3wW/ATg4s41DLUtH6vhC6OB
 KWR4AKshh48wEYHFY+w==
X-Proofpoint-GUID: tQFQdmQQT0iBPbfQ0RfXZxMiXomUDYtc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 04:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132037

On Sat, Nov 7, 2026 at 3:52=E2=80=AFAM T, Sai Sireesha via openembedded-dev=
el
<SaiSireesha.T=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Stack-based buffer overflow in the NTLM authentication module when
> handling excessively long passwords.
>
> Backport from [1].
> [1] https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf9=
21b4125b513

This is very different from the upstream fix. Please share more about
the fix and how it was verified.

>
> Signed-off-by: SaiSireesha T <saisireesha.t@windriver.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2026-0719.patch   | 57 +++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-=
0719.patch
>
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-0719.pa=
tch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-0719.patch
> new file mode 100644
> index 0000000000..48f45c176b
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-0719.patch
> @@ -0,0 +1,57 @@
> +From 77a41e98300bdfeb5eb66742f6e790aa1e906de9 Mon Sep 17 00:00:00 2001
> +From: SaiSireesha T <saisireesha.t@windriver.com>
> +Date: Fri, 6 Nov 2026 16:23:05 +0000
> +Subject: [PATCH] soup-auth-ntlm: Reject excessively long passwords
> +
> +CVE: CVE-2026-0719
> +
> +Upstream-Status: Backport [https://github.com/GNOME/libsoup/commit/19726=
35264f1d9ab1823c8b6becf921b4125b513]
> +
> +Signed-off-by: SaiSireesha T <saisireesha.t@windriver.com>
> +---
> + libsoup/soup-auth-ntlm.c | 12 +++++++++---
> + 1 file changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/libsoup/soup-auth-ntlm.c b/libsoup/soup-auth-ntlm.c
> +index 2d078461..214ffcf7 100644
> +--- a/libsoup/soup-auth-ntlm.c
> ++++ b/libsoup/soup-auth-ntlm.c
> +@@ -594,7 +594,7 @@ soup_auth_ntlm_class_init (SoupAuthNTLMClass *auth_n=
tlm_class)
> + }
> +
> + static void md4sum                (const unsigned char *in,
> +-                                 int                  nbytes,
> ++                                 size_t               nbytes,
> +                                  unsigned char        digest[16]);
> +
> + typedef guint32 DES_KS[16][2]; /* Single-key DES key schedule */
> +@@ -640,6 +640,11 @@ soup_ntlm_nt_hash (const char *password, guchar has=
h[21])
> + {
> +       unsigned char *buf, *p;
> +
> ++      if (strlen (password) >=3D 256) {
> ++              memset (hash, 0, 21);
> ++              return;
> ++      }
> ++
> +       p =3D buf =3D g_malloc (strlen (password) * 2);
> +
> +       while (*password) {
> +@@ -1079,11 +1084,12 @@ calc_response (const guchar *key, const guchar *=
plaintext, guchar *results)
> + #define ROT(val, n) ( ((val) << (n)) | ((val) >> (32 - (n))) )
> +
> + static void
> +-md4sum (const unsigned char *in, int nbytes, unsigned char digest[16])
> ++md4sum (const unsigned char *in, size_t nbytes, unsigned char digest[16=
])
> + {
> +       unsigned char *M;
> +       guint32 A, B, C, D, AA, BB, CC, DD, X[16];
> +-      int pbytes, nbits =3D nbytes * 8, i, j;
> ++      size_t pbytes, nbits =3D nbytes * 8;
> ++      int i, j;
> +
> +       /* There is *always* padding of at least one bit. */
> +       pbytes =3D ((119 - (nbytes % 64)) % 64) + 1;
> +--
> +2.54.0
> +
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta=
-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index e588e60cd5..13261d8418 100644
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -50,6 +50,7 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsou=
p-${PV}.tar.xz \
>             file://CVE-2026-2369.patch \
>             file://CVE-2026-1760.patch \
>             file://CVE-2026-1467.patch \
> +           file://CVE-2026-0719.patch \
>  "
>  SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03415=
3df1413fa1d92f13"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131973): https://lists.openembedded.org/g/openembedde=
d-devel/message/131973
> Mute This Topic: https://lists.openembedded.org/mt/122133702/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
