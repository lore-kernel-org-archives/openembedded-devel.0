Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E75FB5EA6
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 03:00:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68219.1773716444548194181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 20:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gsDueyhC;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bt79Gzj2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GNTqfe041519
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 03:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNwLp65a3P5nhptbjg55Eb42cqcxDoPPGwWA0M16COg=; b=gsDueyhCW7fbTyUs
	Owg72UaoRH539YHTqFA1IhrUFdXpfJ/ZeECHh9e3HGZAu6AGuphRDuk1mEl+BxYP
	CCZy6/JWUPCPITAjURvgUe0OIfo/D96Y7JbxH0yiX4FtPEDI0G1gYmfbpPrHOmj3
	G95yztiIKKWyZxNeVShj6ec4M+ebs/VYBBEGb75m4OMsE+vydk9fblBZIfrz4SCG
	aWqa05SyOs9tN9zpRWMUHe2CGVCBWYO3biQbd2TQJU0hPktObuHlZTQw3RnyEkY9
	i/vwfZoPGnrt98rO29MsjfAhF/o6fPHElS3oZoWMRNZ77ydpYKgTjHEXrYCmnNhT
	lfUR4A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt83q7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 03:00:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c4885814dso435776156d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 20:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773716443; cv=none;
        d=google.com; s=arc-20240605;
        b=WMXAlJ9WM06Vc5Bo5gW4p81T8UVndW/YSoGKTmJ0KGMVhX5POretbeboAkdMprivTA
         trhdOZPG1VV6wJf7mVhdske2BACbvRJ37FuT1gjghV+eHsk01tSfmqs6hGac3QRwe/B2
         mky+GXkBBLTnnoYtgJIrHDBmp+2MPmFAlV4prq1rHJUnLUybBTFuOlAIhOAXHZlCCZ7z
         luwt+k0FWN/igL4hu8/SLl0Xo5N1oAj0HPn1GrR3Ui0jPnhUjqWUwppzjeMy46ItB8j0
         FQsIPVA4n8ZtKoLvypITwm1QEavbMeLFrrdRcqj1tVpXCRiL6ooN4f4f4ZbkmJuUR0ug
         +SMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNwLp65a3P5nhptbjg55Eb42cqcxDoPPGwWA0M16COg=;
        fh=YPBmag5ovM25R1T03y9PwaYZxxARUjwq4DqB88hSZ5Y=;
        b=C+bizFhRexhEPl+N72gyCyhydeLe52jAJjAP26XYYH8n9IBSl3HYlM1e6pnHJ+OsC3
         d+n24MMZWHgvyjvPphz9g/E583+fwrj5DjNCuvSNkXjculNVFfIecI7iYMezCMReuk9O
         5SCLuKY2gq4RFj4fiIuNzRrB5qRDEu5JstJVUphj2seTITaYHU/hazTRMnOoUH1/cqOq
         BsTb2xNmkB3ZS7hd1RAfIMI946hBBzrZvIqg1LPBNAaQ5umW19Gsz2P+qgaawoyCd5/j
         LezEcEquIRwj26VJwtnS2tlmsbEanEQlaikXRLXM8cXuzlB5H40bpIxNhmZziT/6XCce
         hVnA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773716443; x=1774321243; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNwLp65a3P5nhptbjg55Eb42cqcxDoPPGwWA0M16COg=;
        b=bt79Gzj2JomvH6GrbdCibiuB6M27/nqRv0cMPHGQ6OJfmmKbbvAE28Ghj5UZiwUZVn
         eDLX7mKI3pwxDN3TV8KuUg37JGT6OgmUdt0q+e1UY38dr6WSwdqkcUsLdOXZpqv3OZRs
         /aACqIzoTjslSPFCuMwzAOfrZF5gv22ijqc/ASQt+iNcCg1fTyWmqp87fWDwiEfh3Vwx
         q7IsNQroRv1sAT0xeAuuo1psTtLG69OH/OiBb5buwSERq6hsg5pn5xm48Kv5LBrGN+AH
         j2/PX7j9TdNx70oEPpNUlKeyc+GwBhug3XdTDLw5a/0O4i1oA7OVaSi2ObMo4MEGoRZp
         tEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773716443; x=1774321243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNwLp65a3P5nhptbjg55Eb42cqcxDoPPGwWA0M16COg=;
        b=h12k+YY5aGRU39GBqTsQbFapgkIbS6JItLmUblti5PTIW2VKierTvvGqv5AeEWq1j3
         rl810uXXTuZAixZt29o5veiauMdcfRt7KQ6HzRvQATyCXjtAu05XqlCm4RFKq1EooxtI
         KYd6/JQ8rTBNpIYbg3/6Nexgti+q9Re/8Z1gC4B+PTJvz+oKCG12ouD9OWkU8mfvKYIz
         Yg/Ju82nEEBlBn/KcTXVb7Bx41JBPsJd/FfFkN6uV/O5dDz5OgB6AcYQv9h7MUooYROL
         mC9vFFwmWu1H3Yu7s6oVUK4T85u+aV8Ue+rhThhsiaqcJY8mIxZWwMGDzTmr4LQereOV
         42jw==
X-Gm-Message-State: AOJu0Yx8zz0ZrFa7zFBNTlQTTh83Ez8JFYtuNWDAJCE78JdJKvbqeFbm
	+Kfg5ubnHGrrFT2n5zg7h+jemU+V04v33KjTAyGKHMHDdTNe9XFINJjHCTVr87Dq0/JALIWs1uj
	4+evi0LYBhl+6zqG+mfUXEQUICRh1180kpsJUWzKhhPxQayCLQXZ9UAdHthiOUj6O4HJ+BUDaSo
	ymjY9C80k3+ut8/69py69KyiYZexhX7KLvUnuO+hftCJzhDqZwP/u94bI8so0=
X-Gm-Gg: ATEYQzzqccHgHpqk8KVoKfZelH8TeP8jxdlwCOy5zzH70Ng7cPJ2ZJNafpctMWqxrD6
	9vWEmdQQ9oJxH9HmFL3ks1NfiyYYn6BVsbHidZNo3Ewf3ZqUptAjPs2Nrd8/Uh/B7o6Z3srHc9F
	f9FraW+V5oUVuaRIcURM+yt28eYgx5sPvbEV3Nntrgg6kW402sl61rgbSsaaB3FZmxxW8GWZA9T
	rD6
X-Received: by 2002:a05:6214:411e:b0:899:f993:f2a3 with SMTP id 6a1803df08f44-89a81dc7175mr224817336d6.23.1773716442498;
        Mon, 16 Mar 2026 20:00:42 -0700 (PDT)
X-Received: by 2002:a05:6214:411e:b0:899:f993:f2a3 with SMTP id
 6a1803df08f44-89a81dc7175mr224815326d6.23.1773716439586; Mon, 16 Mar 2026
 20:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260305140340.81357-1-andrea.ricchi@amarulasolutions.com>
In-Reply-To: <20260305140340.81357-1-andrea.ricchi@amarulasolutions.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 11:00:28 +0800
X-Gm-Features: AaiRm53Pr-_zGsKjNYk3QZjzuGSM1RbPpa1H9nAGczL15p6Nv2a1fRIvJt9gobw
Message-ID: <CA+s=J=y8DqYm75Qh3q_H7fM0KUTL2uVctiYMkCe5nH2hqriKyw@mail.gmail.com>
Subject: Re: [oe] [meta-oe,scarthgap v1 1/1] meta-oe: libcppconnman: add recipe
To: andrea.ricchi@amarulasolutions.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 8qlh7_kiXhqxW_LJuUBzv7JpWlVLTBSG
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b8c3db cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Q4-j1AaZAAAA:8 a=iP-xVBlJAAAA:8 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=uOiaWVV-ZWPwgRHYOboA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-ORIG-GUID: 8qlh7_kiXhqxW_LJuUBzv7JpWlVLTBSG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAyMyBTYWx0ZWRfX16dHSTE3EgVC
 uy5M6VjK/EM65FIqPoa45mtMcXj31CZkw8yrngdfegA+q+4dA7BhUlVzJS8LN8x8fGwS+rl8WI4
 Ahqgnii7KsM8F2dsuP/UFu2m8IHcQxzkrzsyQ0zqKOxTUz47F6tuUwiYYxVVVyGnvQM9S/XmCWW
 NdFqaUr9FmBPdYJXMcGHR6qR+KOteesbQ2EVDrBBzTe0mlpK8NUbqBKE4kHupzDJNuKTPzMSEv1
 mMBuR9VtDZKwhK3Fj2YfbD0Lu5i3XgbXyoA/fWjpcSwKVHTOfLOpFd6V0MOq9UR3LP9Rc+Ktgsh
 J9UyHDrqEznf2w7y0Ke4lW9dvT7xAqVe1Z4wdN/tx0wN5WgnMnbZqHSx7CENUVkIiOjeLlrtHnU
 X6DQ+oDvrr4FiE5LIx1K3zPK6v/d9+sxhskNtFabcXDqcJc3WBetHrRlxodKt9fBN2zMrL8PZ45
 CjEnzP1q8417Q7ug/fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 03:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125300

Hi,

On Thu, Mar 5, 2026 at 10:03=E2=80=AFPM Andrea Ricchi via
lists.openembedded.org
<andrea.ricchi=3Damarulasolutions.com@lists.openembedded.org> wrote:
>
> libcppconnman is a C++ library to control ConnMan via D-Bus. It exposes
> simple aync methods to perform all the controls that ConnMan allow via
> D-Bus.

You've tagged this patch for scarthgap but new recipes/features are
not taken for LTS branches. Did you mean to send it for master branch?

>
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> ---
>  .../libcppconnman/libcppconnman_git.bb          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libcppconnman/libcppconn=
man_git.bb
>
> diff --git a/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git=
.bb b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
> new file mode 100644
> index 0000000000..daa32a8d48
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Amarula libcppconnman library"
> +LICENSE =3D "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da87a7059d580c45495c1218f53e36=
10d"
> +
> +SECTION =3D "libs"
> +
> +SRC_URI =3D "git://github.com/amarula/libcppconnman.git;protocol=3Dhttps=
;branch=3Dmain"
> +SRCREV =3D "d89262c2cd7336da8ba9eb06228d422847fe4b20"
> +
> +inherit cmake pkgconfig
> +
> +DEPENDS +=3D "glib-2.0"
> +
> +EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DBUILD_CONNMAN=3DON"
> +
> +# LICENSE file
> +FILES:${PN} +=3D "${datadir}/Amarula"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124874): https://lists.openembedded.org/g/openembedde=
d-devel/message/124874
> Mute This Topic: https://lists.openembedded.org/mt/118151892/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

