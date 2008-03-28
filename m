Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1JfJuG-0001sS-SV
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Mar 2008 20:06:30 +0100
Received: (qmail invoked by alias); 28 Mar 2008 19:06:26 -0000
Received: from BAA0881.baa.pppool.de (EHLO [192.168.178.31]) [77.128.8.129]
	by mail.gmx.net (mp034) with SMTP; 28 Mar 2008 20:06:26 +0100
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1/sVVE7uVLs0REHP9bqVANjwC9/QT6QaaeFsaaLc9
	4mKhOrY4F/x/A7
Message-ID: <47ED41B3.9050403@gmx.de>
Date: Fri, 28 Mar 2008 20:06:27 +0100
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080109)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47ED3CE1.7020000@bolloretelecom.eu>
In-Reply-To: <47ED3CE1.7020000@bolloretelecom.eu>
X-Y-GMX-Trusted: 0
Subject: Re: uImage generation: kernel.bbclass vs linux.inc
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
X-List-Received-Date: Fri, 28 Mar 2008 19:06:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Jeremy Lainé wrote:
>
> To make things a bit more interesting, KERNEL_IMAGE_BASE_NAME is set
> differently in kernel.bbclass and linux.inc:
>
> kernel.bbclass :
> KERNEL_IMAGE_BASE_NAME =
> ${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
>
> linux.inc:
> KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}"
>   
This one is easy:
KERNEL_IMAGE_BASE_NAME and KERNEL_IMAGE_SYMLINK_NAME should be '?=' so 
that kernel recipes can overide it.


