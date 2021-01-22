Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web08.10177.1611327854272921690
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 07:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=jfLyD1Ma;
 spf=none, err=permanent DNS error (domain: linux.vnet.ibm.com, ip: 148.163.158.5, mailfrom: klaus@linux.vnet.ibm.com)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10MF2r5i119578;
	Fri, 22 Jan 2021 10:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2+2MNhm6EVQKjc1Pb2HMHQYoCXoduDu+5XslqfhnkwY=;
 b=jfLyD1MaeOlgOxpvEKDqFXBpj4KK9VUAKQcM5pAadhTs4B68diOS4AZEQrsHU2ZXPosk
 LMijMb+snjFeVEbEnIhbGLO+HBtEjxqUEbJUolJ4Z3h8Byim9MGO7oYoT3vzfl8zFM+X
 YwSHS7+dd3cvhOFjsZyydXGcW6v3iMhufLQsnC53Icn3VmGEfZq3P5nq7dmQnj0yBVx1
 OIsbvub5auM3/nhPLBAV58Ni3/KtqlpZFGRpvisKp0YxnZHQaSL0I/1DHHMHSWO9H2sD
 5sM0Ju2tSumXWMYA87g0paYuckWwQYKy566pUHKaHJAbsKqB5mENTN8qXuwZKyPB1lgw 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 367ync2wgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jan 2021 10:04:10 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10MF30hc120216;
	Fri, 22 Jan 2021 10:04:09 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com with ESMTP id 367ync2wg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jan 2021 10:04:09 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10MF2u1o030698;
	Fri, 22 Jan 2021 15:04:09 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma04dal.us.ibm.com with ESMTP id 367k0snvg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jan 2021 15:04:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10MF48rT36897190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Jan 2021 15:04:08 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50A88112066;
	Fri, 22 Jan 2021 15:04:08 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E5BC112063;
	Fri, 22 Jan 2021 15:04:07 +0000 (GMT)
Received: from [9.85.152.90] (unknown [9.85.152.90])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri, 22 Jan 2021 15:04:07 +0000 (GMT)
Subject: Re: [oe] [meta-python][PATCH v2 2/2] meta-python: Add jstyleson
To: Andrew Jeffery <andrew@aj.id.au>,
        openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Newsgroups: gmane.comp.handhelds.openembedded
References: <20210122054538.3675758-1-andrew@aj.id.au>
 <20210122054538.3675758-2-andrew@aj.id.au>
From: "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>
Message-ID: <c21c1fab-4193-5355-004d-9c6961e4919d@linux.vnet.ibm.com>
Date: Fri, 22 Jan 2021 12:04:04 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210122054538.3675758-2-andrew@aj.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-22_11:2021-01-22,2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220085
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/22/2021 2:45 AM, Andrew Jeffery wrote:
> jstyleson is a library to parse JSON with js-style comments.
> 
> The license isn't shipped in the pypi package, so it was extracted from
> the github repo at [1].
> 
> [1] https://github.com/linjackson78/jstyleson/blob/8c47cc9e665b3b1744cccfaa7a650de5f3c575dd/LICENSE

Tested as python3-jstyleson-native as part of an OpenBMC build..


> Change-Id: I1e22ef42e823d172fd52f40e84bd5194c131310a
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

- Klaus

