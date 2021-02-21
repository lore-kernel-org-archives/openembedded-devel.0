Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web10.24327.1613934827589248112
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 11:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=WY14yA5Q;
 spf=none, err=permanent DNS error (domain: linux.vnet.ibm.com, ip: 148.163.158.5, mailfrom: klaus@linux.vnet.ibm.com)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11LJDk5i066053;
	Sun, 21 Feb 2021 14:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FkIkG5G3Secocgr738dAj6I1F8CyCyBJUjK3ibuywh0=;
 b=WY14yA5QSY/0EKXI9zlSQzTGhVT7s9jEluqJ0/EcmJBV5wc2Wu40TGsMclXwf0+nv34E
 qhsYayoJAdrr2LbvATBj31xtdpcS0Qs5PLxdkdB0g/jkVYFgkQ6rJO/HeNLpM47FsnZo
 012L470R0MTa8rs/PSCu0K+iUuG8w55uHb3q4Q7s1GZdbrFd6Jfe93fw9R7mpwRwCpQb
 PNX+dii1x42ctS9yJX5NAyEGQXLj2zkmAXBU2J44a9FkoECDk0I4jLHN8XYdb05o0oX7
 MEIrOylPz8dDnOK0OIEsWFJYh+j1avsXzzZlv0GpBUSrt6Drgej3T/KAQlqljF2F8NeY rQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com with ESMTP id 36uwg3r013-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 21 Feb 2021 14:13:46 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11LJCMsF011419;
	Sun, 21 Feb 2021 19:13:45 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma04dal.us.ibm.com with ESMTP id 36tt29vdc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 21 Feb 2021 19:13:45 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 11LJDjqQ28508444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 21 Feb 2021 19:13:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18FE4AC05F;
	Sun, 21 Feb 2021 19:13:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94506AC059;
	Sun, 21 Feb 2021 19:13:44 +0000 (GMT)
Received: from [9.85.181.59] (unknown [9.85.181.59])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Sun, 21 Feb 2021 19:13:44 +0000 (GMT)
Subject: Re: [oe] [PATCH] [meta-oe] kernel-fitimage: Fix CVE-2021-27138
To: Scott Murray <scott.murray@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20210220214042.4882-1-klaus@linux.vnet.ibm.com>
 <5a8c8c64-137f-ba2-63b9-59e878f3307f@spiteful.org>
From: "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>
Message-ID: <6350f605-b8a5-f8d0-17c5-97309b843f90@linux.vnet.ibm.com>
Date: Sun, 21 Feb 2021 16:13:43 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5a8c8c64-137f-ba2-63b9-59e878f3307f@spiteful.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-21_10:2021-02-18,2021-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102210195
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

>>          CVE-2021-27138
>>
>> Adjust the kernel-fitimage.bbclass accordingly to not use unit
>> addresses. In addition to fixing a CVE, this is also required before we
>> can bump U-Boot to 2021.4.
>>
>> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> [snip]
> 
> Please send this to the oe-core list since kernel-fitimage.bbclass is in
> it, not meta-openembedded.  I would also perhaps be inclined to not

Thanks, for some reason I thought that -core was discussed here, but I have
read the README more carefully since then.

> describe this change itself as "fixing a CVE", since it is the change in
> U-Boot that actually does that IMO.
> 

Yeah I was unsure how to summarize that, since the CVE 'fix' in U-boot is
to really disallow unit addresses, and looks like it's not going to be
applied to released branches, but instead only on 2021.4 onwards. So I
opted to call out the CVE in the title, as it is, in practical terms,
addressing a CVE (if it's a workaround or a proper fix is debatable I
guess).

Thanks,

  -K

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
