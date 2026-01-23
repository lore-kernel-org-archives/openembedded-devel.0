Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8F2D778A0
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 18:02:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1591.1769191378614061417
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 10:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=iWl1gjz5;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=iU/GYJU0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NCinoY322639
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 18:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vS0oVh5RIQM/63OIMEyef6cEL3z4OA+UkI8/gZbhpI0=; b=iWl1gjz5xRf48lrt
	RMBivOgXAq2/73riUchNflMukFzsj4VleoHC9Gl+sgiVNJjEOKXEUIYOmjI5WIXg
	nNBh9z4ADAXe5UH9hv5fWNHUaPCg83WAU5HQFPMExmNizqzA7lP/JpluQZkb2XSV
	kpy2q01oUwrytGa5dvE2UwkZ/zE33OrqJc8e2hVSK/HsrKtBBuYwWL69O4UxzM2+
	kjljTlyozA6VmyVkst64AY28VHsz0nzX/fCcArBaVU6VUgOWz3MaDfC+REtlj/hM
	Ggg/kRTInSr/qdC38Sv9gj2iaYU9Co7KDvICNIszyGrm4IkO2Wse6yaHwsJNha3A
	bC2YlA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv3mqab7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 18:02:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-948378f5fe2so1761771241.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 10:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769191377; x=1769796177; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vS0oVh5RIQM/63OIMEyef6cEL3z4OA+UkI8/gZbhpI0=;
        b=iU/GYJU0mhd90t56UNsknDKzbRjUfxYCDgqN8YFem8AadBjhKcHJEGwEfrFiR5ZhEU
         54E6o+PPmnqpOY54WWOxH+M2b344S7/Wx103zIMMwnYzcZ+vsJn5mY6/pRhfrywOI8Jf
         NSKINzCEfDUkTC3C4XIQHJN5rTCV3wfG97zVwqMD10faxdGw5OU033SGVf3GzJ4FOtod
         if3VEPq1IU29KfwZN4AHoO2EhEYlUOwVwCDrJ465N5ZznBJLI3x22EB39siAOQ9gNswg
         tSUEOZjx+sBuTFirZaxV6LONiOqVWVeaeMO5SUzIrHl+tdxFFLyP0ycDiISyWR241TVa
         MjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769191377; x=1769796177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vS0oVh5RIQM/63OIMEyef6cEL3z4OA+UkI8/gZbhpI0=;
        b=bl+PtWwP63GmUvsY7QI4Mruzs7fKjec/ol9CPYVNbP9mIJ0I6Wdxdxm8TLJs39I9Cv
         Jz1jyNGNCr7r4BwoyaOaYeQcL/Qa1DN5C1JsU67/2Km22Z9wwxQUeU72SwhG29ZCIuFB
         OdbPrQRBjv75gG54FjFv/SHlEsEaEh89B2xSTVxqbhIFnHzZRmxwgkorCSRqkrhHsWWJ
         NVxcebyuNr9IRmxY282q69+d6jG1WXEyjfuPx27BEBtMcMDhmbTGKSkO80GY1zx0+Q4/
         jSdjNdJeDDFOgjAMoGlWy1F4uoncXZ3agrVHnF6hB9r430xPdiovXvYH8GyPC+ZReHLo
         7QBQ==
X-Gm-Message-State: AOJu0YyVRTNi8Gopeq174vpARXv351A5WpOmibJ5uR7Bux9wSfvJhX+9
	s2Ho1mqrgxqLE1gfT1ugRoMxe8kE/cdUBYtYz/w8iPc4fA/tj6dwJFBbDJXKm2XUk9SaIspWFyK
	uScQ9/joYMenmMI84WsnlWR0IUMYj0nUCIoXg0Z9jOzfQK6ghYHzRFod1sqOAaUweTjXierVa73
	jOvAHSSFoN
X-Gm-Gg: AZuq6aJ06vX9W26/cUmrQxy6S7rJdq+CK/ESrqs94m8EUJchmJLIshvS+VVmIviQoPG
	4BjXWZP37kA9/jM52XfZ+oZ8ZgrmlcfaXbLJo1jegekEePTyvGi4HTxVg8tTU/ASKdGbkrdhcnN
	yDXuCxMQYlFvPYqdPysgwkY9ocywbNlAqnD5KJUEOSDWc9c2wgsWbhXLdALRuOO0s/b7MDaFk7y
	BHaDbU7TK07PpFPfSjkUMuEoIi4OR4ist8APD5PT6Th1lsTW3GX5vNypATdVbKp3ThHddef8bh/
	ZTZq9p+HZ7cQ2qcRMsSyFjTvhZukyAQEuNYnxX+Sjhz1axGfLtgow6o+w+CLROahmL59m0r22xf
	/8J/NvSK0+LkKtoBRGlskGgdmC148x9oSnW+U/1sBnco4TQnhCtyDY6UYes+2oEmN7n6oSdi+Lu
	Ki+GgR4x+G8dditfGYhf0GgDE=
X-Received: by 2002:a05:6102:3ed4:b0:5ef:2cb6:4287 with SMTP id ada2fe7eead31-5f54bceb4cdmr1470296137.35.1769191372172;
        Fri, 23 Jan 2026 10:02:52 -0800 (PST)
X-Received: by 2002:a05:6102:3ed4:b0:5ef:2cb6:4287 with SMTP id ada2fe7eead31-5f54bceb4cdmr1470007137.35.1769191367930;
        Fri, 23 Jan 2026 10:02:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de49261c2sm815232e87.83.2026.01.23.10.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:02:47 -0800 (PST)
Date: Fri, 23 Jan 2026 20:02:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
        Shoudi Li <shoudil@qti.qualcomm.com>
Subject: Re: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle
 multiple UDC controllers
Message-ID: <p2aebtpkaylz74khxbov5xpc2yn2vlzp4djxl7o44cuvkfxe3o@bl7veavnhwr6>
References: <20260123094119.2665-1-shoudil@qti.qualcomm.com>
 <qawdkmgqz6wn7henpqymeijenllasbytf2w25s5jvzxxpoadt7@v2cvxnaiokul>
 <CANPvuR=fvHbHrCFpOBdE7OHPPQRu4yiX6mphj8sNx-1U6JKxiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CANPvuR=fvHbHrCFpOBdE7OHPPQRu4yiX6mphj8sNx-1U6JKxiQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: IcsGZXi9ZTqBlihbIe3RDKPEBro5HCOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzNyBTYWx0ZWRfX3M25CViWVuKx
 FPc6DNxIfZKat2uSaF328nALXjwMCrDpi/A6XvxNJ1AWuyeptqQsVG3TxjjubhwgZ/87LvIcm5t
 dvqVRTYLk297UUM7EZoicWfufsN6jSrpzZSRZegNilGQHBaGQMndrhyW7kF+ePsJE27f7E7tTtF
 GCVIIdFP5QF5wJUZP1vWTACXwOb8dRRNgeW8QjodWqr/9ti89sSD3FBq8QrDAm2NU80lvTZuebA
 Mc6kc5JvuJAQiNXWlXT7+YTRsj+z5ZGQQ2KGkaWkusi+PcbyS63M5XJj1V3TqjuZUwrE4NNTski
 W9gP2jkuvy2RGh3CfvTRgJArs15/FYHcv45qrM1QqMSakpZYkg5oa8qTGf3X7o+U0LBma5qhfsT
 mmKDIkZIBrC8+eAHoFQ0UqOWLkELmCCGIRHx9juhC8MkwqdmJtDabKmuh0tUXwnqZ2G+HrqXqNe
 WkDMOyI3QN3y+drzEww==
X-Authority-Analysis: v=2.4 cv=SMpPlevH c=1 sm=1 tr=0 ts=6973b7d1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PugDAoMvbICUB-JnDSwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: IcsGZXi9ZTqBlihbIe3RDKPEBro5HCOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230137
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 60NCinoY322639
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 18:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123801

On Fri, Jan 23, 2026 at 05:44:06PM +0000, Jose Quaresma wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> escreveu (sexta,
> 23/01/2026 =E0(s) 17:34):
>=20
> > On Fri, Jan 23, 2026 at 09:41:19AM +0000, Shoudi Li wrote:
> > > For the boards with multiple UDC ports, adb funtion will be impacte=
d due
> > > to below error.
> > >
> > > ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> > > ls: write error: Device or resource busy
> > >
> > > Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> > > ---
> > >  .../android-tools-conf-configfs/android-gadget-start        | 6 ++=
++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > Same issues, forged From and missing SoB.
> >
>=20
> Yep in this one I forgot the --from on git send-email but I didn't noti=
ce
> that the author was also wrong.

Hmm, isn't it written in your ~/.gitconfig? Also please use
Qualcomm emails when sending pathches.

And, of course, please don't send HTML emails, they might be filtered
out.

--=20
With best wishes
Dmitry

