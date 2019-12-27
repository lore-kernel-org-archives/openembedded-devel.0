Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id E545E7C446
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577443481; x=1608979481;
	h=to:from:subject:message-id:date:mime-version:
	content-transfer-encoding;
	bh=SLqZjZ3+oTpw3CVkBivOAR+LbpGJgPnzvkPBdaslVhk=;
	b=TJYt3H1PiVoJNVaw691hIK+eQSh6TueMUzVAFfddpMMCL5/6Y3+pXEjz
	HjHeo1PNf3dwxi9tcmVG6mJXe/aHgy4WRsJex9WgcZ7hF/A8vu63k29KR
	YoYUzxOQXhGeCN50cWvzRt2i/Ms7oDmHLXP6kiWYC8xka0d+brbZJDkHC
	2kjJT3wjf44vufpZCxtaPckuwC1wZo6DCNdOw1DaMAIvjZUooz0DE1VpH
	e9rr5KKZgsYDE91Ta6uNKnHgluu0P93C8L4cNEONSnHzLlrwhrppwOnnR
	aKIHZt2x2/MdfsG2rsQEQ7YdGVVEH3GvLU02+j7rW4e7ewW6bQTe57jsR Q==;
IronPort-SDR: fkxG2+R0g5OyPPzR33i8KVFY43t+nxBIdM7kTTXrRu7Hg8XVlFvDlCKujtNEdkXNS8esFdV0XS
	/AHKFRO5Sov265ij+LCteaMkj1jukQRwOacsnCAdJCjTdmW8+C1pHiHgw2A06w5drpSEVrDGNJ
	tmNOUT14FEOwlCuKotry0uoxeIZcUsw0rtXgKZzQJeJ7EC1lqSraumdr5kPR/LVM6audd+eDYB
	0OWuSAffGOB+d3dsG9d+vQyfuW2w30HonGkkMLB23wTPrZ+z2sbQ3v0DeMikWX+d8+pTfNJoN2
	L18=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; 
   d="scan'208";a="2472740"
To: <openembedded-devel@lists.openembedded.org>, <michael.davis@essvote.com>, 
	<fang.jia@windriver.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <f5f15e4e-370b-2e0a-9a10-b4275ffc49e1@skidata.com>
Date: Fri, 27 Dec 2019 11:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java] backported changes to warrior
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
X-List-Received-Date: Fri, 27 Dec 2019 10:44:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just backported the following
patches from master to warrior of the meta-java repository at 
git://git.yoctoproject.org/meta-java.


Fang Jia (1):
       Revert "base-files: Define JAVA_HOME by default"

Richard Leitner (1):
       openjdk-8: disable stringop-overflow compiler errors


If you have any questions, please let me know.
regards;Richard.L

