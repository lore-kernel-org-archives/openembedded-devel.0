Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 8440671B99
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 10:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577443198; x=1608979198;
	h=to:cc:from:subject:message-id:date:mime-version:
	content-transfer-encoding;
	bh=R0NiJn2JJx4IUURgzrE3SV3ABH4Sm0lZg5AAbImaqOQ=;
	b=Nqt9kXzJoT/4bDkJXlW0Q+KZIFYjqMzHW36UrlQzWhNPW+Lan6X+e1eL
	CGMdKA4D4pRmFpJnWox6h3GdJqDh6ubHvbay8JR5lRGspNKR7yu8ncL19
	etbxIxsHq01Dy/7yCqto2+20SaR+/DYaxBbwd+majrdAEQr3illBo3d1G
	lvGTz938JWwcxIldY/fxYniIx9t4kKq58o4gvS+9C6iu+flSD8St45m+b
	qbr2fEyXMs66DnuyyAQnmnj8pmQNxoJ2AFmpAjbXJPGrDvv/Wy01LFc3U
	w8F9V3DAGsbghsKuEI8tDaEPavNLrYiKD0iLhGrc1uFNRNj5sz9KjIiV+ A==;
IronPort-SDR: EsPzeSEyf9BASrsf0CSzMxQE4HXneaWfy4t1s88l5trh93Wuu757uzJpkKVuZW6xELIOR2Z2mB
	Vy7/DkrWVCLeOoTcPLcOJWdfw+LHCq6qqJR6OK2/+mDB2WdoaH8RyRXl7F66ycDCVc9AcrvNuI
	SDz2aKWu7b1cho72L2AfJW7CXWPiCWCCHjh+9lbTgTLPzKBKmHRS2e1BXYWWW+smlY5h3TxK+B
	RDZaVAyUCjn/wQcdppQZGApyGGKA//o0bYxe8zl/5AfrtGjAVxEGJxSnDVsbdxegTQb3jkMukr
	Nzo=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; 
   d="scan'208";a="2472732"
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <1863e458-85e5-e29b-80b7-223f6862de31@skidata.com>
Date: Fri, 27 Dec 2019 11:39:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: backported changes to thud
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
X-List-Received-Date: Fri, 27 Dec 2019 10:39:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just backported the following
patches from master to thud of the meta-java repository at 
git://git.yoctoproject.org/meta-java.


Fang Jia (1):
       Revert "base-files: Define JAVA_HOME by default"

Richard Leitner (2):
       README: mention new TESTIMAGE_AUTO variable
       openjdk-8: disable stringop-overflow compiler errors


If you have any questions, please let me know.
regards;Richard.L

