Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1ORhKe-00085Z-Ch
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 09:58:45 +0200
Received: by gwb19 with SMTP id 19so2326090gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ov13d/qdHWmWvWKuhzjsvzHzVi0nhrebb52JlbDlUVI=;
	b=C84M/0bNQnJ0qwZQFu6lt7bLlt9WxFageWNKqULExyOucQQHwjUpE04fgsvUUsearh
	SZk+viGWUX6wWAIbeKMv7oLPuAkxx0n3VZVCcYcqnfZGuG8Gr5ZWnjNm0BFqasUB8exI
	9Gb0EMR/iycL3DdhFSq100F+GH+o1QSlNZDDw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=YK1pNLmEEQOTEYAyzhq9JnePifKp6+5aARdEbV0noXpgI9Y1FcL7za3PeItORGDO1V
	PuRWjH0cDcH5GZ4UoeQCUqgkDUtRBaXBiYGPNKttmdGjGsEeP808aoBn48n84nrY2L9i
	UKVeLW87qdozfUU9kQzGiFrVvz8Lj5Sdq6D3c=
MIME-Version: 1.0
Received: by 10.100.29.19 with SMTP id c19mr7754341anc.191.1277366046631; Thu, 
	24 Jun 2010 00:54:06 -0700 (PDT)
Received: by 10.100.243.32 with HTTP; Thu, 24 Jun 2010 00:54:06 -0700 (PDT)
Date: Thu, 24 Jun 2010 09:54:06 +0200
Message-ID: <AANLkTilEWkJxX-05BU-UBnOIP9jgP3vtf8K7jA5-A9Q6@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: makedevs vs. device_table-minimal.txt
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jun 2010 07:58:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

after commit 66aa4ed9410ba1d652e40571f48a985337e56a26
(device_table-minimal.txt: fix input device nodes path. Input event
device nodes are usually under /dev/input.) in /dev of my rootfs I
don't have any event device node.

Any obvious reason why makedevs would fail to create /dev/input/eventX ?

Regards

Andrea


