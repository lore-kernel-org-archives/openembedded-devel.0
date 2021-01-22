Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
 by mx.groups.io with SMTP id smtpd.web08.10114.1611327545355455669
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 06:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=HNRtWrXy;
 spf=none, err=permanent DNS error (domain: linux.vnet.ibm.com, ip: 148.163.156.1, mailfrom: klaus@linux.vnet.ibm.com)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10MEpVn2145173;
	Fri, 22 Jan 2021 09:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KIQ9Nq12R9s6pBzi3FhNL5HmC+WpYUDoSQqP469xwD8=;
 b=HNRtWrXymQjvcsMOfmcy76JpWBA1BmhDbjN00U8KrFAwQohO6/lq70ykM7WiTk1tP2/K
 H5Y9evrONNIg86F/zu8cgYc6s0eB/DJlNuVLlB16bOeD07UXMi55/vwkTACdTKwsp9ou
 SVPczMm7RigHon9Pjmv1ZcigbBQJkXqV4BgavWqGCSwlrX/qLgZwc+swfvSjPOfjKb/8
 iJWS65xQ9v871bt0TNo4Kbsgd0tpe0FHweRydles1zhK5pWwvyk4s3saKRfKfqtQ3Vks
 jE0jSWoszzsANiWdMl9WtZKCPi9/x+erWgeC0Wb6NvNakMT/DJ3zUxU9BfpVM/XK8QZ0 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3680ub059j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jan 2021 09:59:00 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10MEqNQt151405;
	Fri, 22 Jan 2021 09:59:00 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3680ub058y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jan 2021 09:59:00 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10MEqehJ027930;
	Fri, 22 Jan 2021 14:58:59 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma05wdc.us.ibm.com with ESMTP id 367k0mmp2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jan 2021 14:58:59 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10MEwwxm23462374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Jan 2021 14:58:58 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA417112061;
	Fri, 22 Jan 2021 14:58:58 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13919112065;
	Fri, 22 Jan 2021 14:58:58 +0000 (GMT)
Received: from [9.85.152.90] (unknown [9.85.152.90])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri, 22 Jan 2021 14:58:57 +0000 (GMT)
Subject: Re: [oe] [meta-python][PATCH v2 1/2] meta-python: Add hexdump package
To: Andrew Jeffery <andrew@aj.id.au>,
        openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Newsgroups: gmane.comp.handhelds.openembedded
References: <20210122054538.3675758-1-andrew@aj.id.au>
From: "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>
Message-ID: <a0671668-c96b-ad98-9f09-2686c00122be@linux.vnet.ibm.com>
Date: Fri, 22 Jan 2021 11:58:52 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210122054538.3675758-1-andrew@aj.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-22_09:2021-01-21,2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101220078
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/22/2021 2:45 AM, Andrew Jeffery wrote:
> The hexdump package appears to be abandoned, but it's used as the
> dependency of another project I'm packaging.

Tested this as python3-hexdump-native on an openbmc build, everything looks good

> 
> Change-Id: Id90d770fb48fa502f3abeb541b7febef42799b21
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>


  -Klaus
