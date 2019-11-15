Return-Path: <prvs=215580024=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 622A47C6F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1573811459; x=1605347459;
	h=to:cc:from:subject:message-id:date:mime-version:
	content-transfer-encoding;
	bh=4CC+AeBjfzW2SW5dvIbi3uJ3ZOFwIHWBBuyAijxJM9Q=;
	b=JsVgfAb7j1nqOiW4H0eT1dQ+oPA28SJe+SpU2qMhgdJUssFIFIKFIAnI
	PvcCpDPvIMJ9iZ5YoCSqP/UUlFFK082/FAo0a+TFTwbjmuOj2OJ24u92M
	liW0hfnT+i+pthcvn793cez1Ff9mlF8IYCYmdRDMzJiqBYl/AInnCyvvu
	MzhL4lVtpDQ9cOrwYeWRLXJjr/cRYk/o8wb3AXjgdpR+cLzY+ASx0SYGk
	D722FIAeQVQIA6fFYVulsJrapyCPRHT2e7NONB8e0sDu/gwUEf/hxV5Au
	R/PMHwyaoEQpTsRgJT/DtxuUlCyBiigGhLtADTMKCS9EY6cTWaxbeIlWz g==;
IronPort-SDR: 3zq3y4UfmL2bL0QAPPlrvUzU2NjnFcLVZY+k+LWy6vu3QxROhiFdQ4OLxlRzmQMF9BcvTeoqTc
	191yb3dzeaQ4IBwmK0a+0wErEBKcqnXdTWfbs6fPzMUYTRzApZqLcDIkVFzswmiQf09Acu0tl3
	M5/NrGvja4sYrpIPpCrkoZFuj3+9dspGi1bSQYf1jG4pw1cqunmQTs+9ktj81ztI9Z8XdWvPye
	J75AMMzDuspiocv0tJhPDYez0yz4Jcvhz2Mltp5ds5XjuyeZps43msC7psZ40dsKHpZs8Zdvo0
	huU=
X-IronPort-AV: E=Sophos;i="5.68,307,1569276000"; d="scan'208";a="20915072"
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <cb700209-e8fa-ea77-0127-0f1669a2c452@skidata.com>
Date: Fri, 15 Nov 2019 10:50:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java] merged changes to master
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
X-List-Received-Date: Fri, 15 Nov 2019 09:50:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just merged the following
patches from master-next to the master branch of the meta-java
repository at git://git.yoctoproject.org/meta-java.

If any of them should be backported to any stable branches please get in
contact with us by replying to this email. Thanks.


Alistair Francis (1):
       layer.conf: Mark as compatible with zeus

Chris Laplante (2):
       classpath: add patch to fix BigDecimal.compareTo()
       classpath: add patch to fix BigDecimal.stripTrailingZeros()'s 
handling of 0.

Fang Jia (1):
       Revert "base-files: Define JAVA_HOME by default"

Nicola Lunghi (1):
       openjdk-8: Enable HotSpot builds on 5.x Linux kernels

Ricardo Ribalda Delgado (23):
       icedtea7: Add missing DEPENDS
       openjdk7: Make kerberos optional through PACKAGECONFIG
       openjdk8: Make kerberos optional through PACKAGECONFIG
       classpath: Fix build with targets aarch64
       jamvm: Do not build for aarch64 targets
       cacao: Do not build for aarch64 targets
       javasqlite: Create cc tool to make libtool happy
       jdon: Fix location of S
       rxtx: Fix path of javac
       jamvm: Fix binary name for javac
       cup: Do not use all as PACKAGE_ARCH
       dbus-java: Do not use all as PACKAGE_ARCH
       rhino: Do not use all as PACKAGE_ARCH
       ca-certificates: Cannot be an allarch package
       xalan-j: Do not use all as PACKAGE_ARCH
       xom: Do not use all as PACKAGE_ARCH
       jaxen: Do not build an all PACKAGE_ARCH
       jlex: Do not build as an all PACKAGE_ARCH
       bsf: Do not build as all PACKAGE_ARCH
       poi: Do not build as all PACKAGE_ARCH
       xom: Allow re-running do_compile
       jdom: Do not use all as PACKAGE_ARCH
       dom4j: Do not use all as PACKAGE_ARCH

Richard Leitner (7):
       README: mention new TESTIMAGE_AUTO variable
       oeqa: runtime: java: Drop OETestID
       cacao: update to latest staging tip 2d6f6c14daf9
       README: rewrite build host dependencies
       icedtea7-native: disable new compiler warnings
       openjdk-8: disable stringop-overflow compiler errors
       layer.conf: remove compatibility with thud and warrior


If you have any questions, please let me know.
regards;Richard.L

