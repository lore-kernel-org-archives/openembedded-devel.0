Return-Path: <prvs=01629de410=mike.looijmans@topicproducts.com>
X-Greylist: delayed 5220 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Dec 2016 11:21:26 UTC
Received: from mx26-01.smtp.antispamcloud.com (mx26-01.smtp.antispamcloud.com
	[148.251.71.1])
	by mail.openembedded.org (Postfix) with ESMTP id 335DA772CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 11:21:26 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx26.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cJH7q-0006q8-4W for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2016 10:54:27 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 20 Dec 2016 10:54:25 +0100
To: <openembedded-devel@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <15daa04b-92db-cc3f-f0f9-14ac92764641@topic.nl>
Date: Tue, 20 Dec 2016 10:54:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrH30SrPk8tfaSF+RZrpk8YKU12d2pmLLkAmzasehlwbl/aIcThYggqwk0fw
	rocOZc8+DKA2NNvQHVv9U39IvZ21x85OM4GWP9JQ/hHPc9c4dspy46MY4AXC06EFbOC1uAqsezUv
	r8ZdfHp9IY+ISmZYIrv3F28sfojuZI3S+Bdc3hgDAO6Wxjgeje/Q4ZW83RHrjuU3A3io6xJmD59i
	FVkb1lD23a/ycTR6eGRVCSDNgUl4yqLUstazOFLceEbe5fqs6OwHFKjc65DtZENSFvGnQ+CW+UYD
	fWNcm6W9yD2WUwLOpN2OM4Xa3O5lTE7F6lJKuhvn4rEavP9bL8mZck1R7l9uV9ZupfreGYe03ZZO
	eOKQ13p36RF/RfTGYNqrxWxehOgMaMvh5vK4PS5ksw+HmdySlZou9qHIGOZDEEo7O5nGh/AcrRHu
	AEr3RcauwfEcYOLCr1ZlHUTPufZxGzhOhtLdG8aCgUsX8Ujfe6oce0XUNc+M5+7Fw3thpBwakssk
	l+/U7XvoRKwZup9IBj1f9jihx+Za/cV70jOJzN2r4A==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.21)
X-Classification: unsure/combined
X-Recommended-Action: accept
Subject: morty branch XFCE no longer builds, missing libwnck3
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
X-List-Received-Date: Tue, 20 Dec 2016 11:21:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFWith current "morty" branches of OE-core and meta-openembedded, a =
build of an=20
xfce desktop image fails:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'libwnck3' (but=20
/.../meta-oe/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plug=
in_0.0.2.bb=20
DEPENDS on or otherwise requires it). Close matches:
   libwnck
NOTE: Runtime target 'xfce4-hotcorner-plugin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xfce4-hotcorner-plugin',=20
'libwnck3']
NOTE: Runtime target 'packagegroup-xfce-extended' is unbuildable, removing.=
..
Missing or unbuildable dependency chain was: ['packagegroup-xfce-extended',=
=20
'xfce4-hotcorner-plugin', 'libwnck3']
NOTE: Runtime target 'desktop-image' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['desktop-image',=20
'packagegroup-xfce-extended', 'xfce4-hotcorner-plugin', 'libwnck3']




Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






