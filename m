Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GrDov-0004y8-Qo
	for openembedded-devel@openembedded.org; Mon, 04 Dec 2006 14:25:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kB4DOZNa011073
	for <openembedded-devel@openembedded.org>; Mon, 4 Dec 2006 13:24:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10112-09 for <openembedded-devel@openembedded.org>;
	Mon,  4 Dec 2006 13:24:32 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kB4DOVZK011059
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 4 Dec 2006 13:24:31 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4573F8B3.3070207@dominion.kabel.utwente.nl>
References: <c384c5ea0612031500o3ee66a23x89d72a948f418532@mail.gmail.com>
	<4573F8B3.3070207@dominion.kabel.utwente.nl>
Date: Mon, 04 Dec 2006 13:24:31 +0000
Message-Id: <1165238672.15272.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Recent OBJDUMP changes
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
X-List-Received-Date: Mon, 04 Dec 2006 13:25:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2006-12-04 at 11:30 +0100, Koen Kooi wrote:
> I have something like this:
> 
> - --- conf/bitbake.conf   a55e0d456ecb5fa95185e35580c90bcc9513ed8d
> +++ conf/bitbake.conf   e3d238d78a95629037ad0f48ce24e3a7382e540e
> @@ -454,3 +454,6 @@ COMBINED_FEATURES = "\
>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbgadget", d)} \
>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbhost", d)}"
> 
> +
> +export OBJDUMP := "${HOST_PREFIX}objdump"
> +
> 
> 
> That should fix the issues, but isn't the right way.

What issue does that fix?

Richard



