Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JKEjv-0004kD-Lk
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2008 16:20:41 +0100
Received: by py-out-1112.google.com with SMTP id y77so295127pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2008 07:20:46 -0800 (PST)
Received: by 10.35.90.1 with SMTP id s1mr736311pyl.53.1201695776173;
	Wed, 30 Jan 2008 04:22:56 -0800 (PST)
Received: from ?192.168.1.207? ( [24.107.189.117])
	by mx.google.com with ESMTPS id u6sm728874pyb.23.2008.01.30.04.22.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Jan 2008 04:22:55 -0800 (PST)
Message-ID: <47A06C1C.10205@gmail.com>
Date: Wed, 30 Jan 2008 06:22:52 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <47A05B52.6000202@gmail.com>
	<200801301223.17721.openembedded@haerwu.biz>
In-Reply-To: <200801301223.17721.openembedded@haerwu.biz>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [Angstrom-devel] [RFC] add kernel-module-loop to roofs for	collie and tosa
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2008 15:20:42 -0000
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit

On 01/30/2008 05:23 AM, Marcin Juszkiewicz wrote:
> Dnia Wednesday, 30 of January 2008, Junqian Gordon Xu napisa³:
>> altboot-console-image needs loopback file support either in the kernel
>> or as kernel module. 
> 
> It is not 'altboot-console-image' which needs it but altboot. 

You are right, but practically it's not nice to have users to go find 
kernel-module-loop before they can install roofs as a loopback image at 
SD/CF. For tosa, the typical case is to install altboot-console-image 
first then use altboot to install another image.

>> CONFIG_BLK_DEV_LOOP=m were set for both collie and tosa. Other Z deviced
>> has loopback file support built into the kernel. 
> 
> Probably not for long as kernel size increase with each version ;(

We can set it as module for all devices, sooner or later.

>> I would propose the following change [both dev and stable] to pack 
>> kernel-module-loop into the default rootfs for collie and tosa; and
>> bump PR for task-base.
> 
> As altboot needs it then it has to be added as RRECOMMENDS to altboot 
> recipe rather.

The point is to have it available with altboot at the very beginning. 
Although it's not techinically RDEPENDS, should we set it as RDEPENDS to 
altboot recipe?

Regards
Gordon


