Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1NzT3T-0000JV-Ew
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 13:04:20 +0200
Received: by ewy3 with SMTP id 3so312791ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Apr 2010 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=vonSfm9oQILjPIWsBM6Yhk/O0IG+k0DyUplp0u5udUg=;
	b=skH5fz6nXgchXm/QpyDWai7rgDf59tQmp1lJzKUCk5J10PRRb/quD8C+SHvPwqB3sN
	hGWu94zFlFZ5m4PVluvPwjnxoy98s1xA8wwLEczvjh/1Uso+ga2XLeTJzYIVdBaWmhcC
	robgApg181/EyXP2fB9X1WmtMHxYHXqybBrNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=qepOAa+qbb6pueVtnVqB5Jd3L5u9E/JvSQIM4sBhxVGrGi2QdFY4KfyPuGvKxXDxjn
	cl5/1TQxa2nke/6e/wrL4v9hAWAG6dg0O/V/IDyWmc6fJaB+d8GWLOWJOfg1PsTzaTB/
	eNPbIWoiTM+0q6ymaj9ZV53mPFCyBbEcC/GkI=
Received: by 10.213.41.196 with SMTP id p4mr1786671ebe.81.1270638057498;
	Wed, 07 Apr 2010 04:00:57 -0700 (PDT)
Received: from [192.168.0.49] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id 13sm576365ewy.9.2010.04.07.04.00.55
	(version=SSLv3 cipher=RC4-MD5); Wed, 07 Apr 2010 04:00:56 -0700 (PDT)
Message-ID: <4BBC6627.1000407@gmail.com>
Date: Wed, 07 Apr 2010 13:01:59 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10pre) Gecko/20100407 Shredder/3.0.5pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: SDK for BeagleBoard development - how do I add linux-omap headers?
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
X-List-Received-Date: Wed, 07 Apr 2010 11:04:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Like the topic says I'm trying to create an SDK to let people develop 
for a BeagleBoard running Angstrom. I have followed the instructions in 
the manual on creating an SDK, and have a basic one compiled.

I included linux-libc-headers, but found out that it gives me only the 
"vanilla" kernel-headers, while I need the linux-omap-headers with all 
the needed patches. How do I get those into the SDK?

When I compiled my image I also got a 
kernel-dev_2.6.29-r51.5_beagleboard.ipk. Can I use this to add the 
needed headers into the SDK in some way?

- Tasslehoff


