Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SliMa-0003bx-36
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Jul 2012 17:16:32 +0200
Received: from [192.168.0.41] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 71C9D600CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2012 15:59:23 +0100 (BST)
Message-ID: <4FF1B901.6000306@communistcode.co.uk>
Date: Mon, 02 Jul 2012 16:06:41 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FF1B410.30801@communistcode.co.uk>
In-Reply-To: <4FF1B410.30801@communistcode.co.uk>
Subject: Re: [meta-oe] net-snmp config help
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
X-List-Received-Date: Mon, 02 Jul 2012 15:16:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/12 15:45, Jack Mitchell wrote:
> Ok, so I managed to get net-snmp compiling however I now have an issue 
> where the configure stage is picking up libpci and using that to 
> configure net-snmp to look for pci devices on startup which my 
> beaglebone doesn't have
>
>    root@beaglebone:~# snmpd
>    pcilib: Cannot open /proc/bus/pci
>    pcilib: Cannot find any working access method.
>    root@beaglebone:~#
>
> Off I went and found a solution[1] which states that I should force 
> the PCI_* defines to off *after* the configuration stage. So I go into 
> my work directory and alter includes/net-snmp/net-snmp-config.h:
>
>    /* define if you have pci_lookup_name() */
>    #undef HAVE_PCI_LOOKUP_NAME
>
>    /* Define to 1 if you have the <pci/pci.h> header file. */
>    #undef HAVE_PCI_PCI_H
>
> Then compile with:
>
>     bitbake net-snmp -c compile -f
>
> Then
>
>     bitbake core-image-minimal
>
> Which does net-snmp do_install and then builds the rootfs. However 
> this makes no difference and it still fails with the same error 
> message on start. Is my work flow for this wrong, or is it 
> re-configuring, I'm at a bit of a loss of what to do now?
>
> I suppose the correct procedure would be to find out why pcilibs is 
> being detected and configured, then fix that. Could anyone point me in 
> the right direction?
>
> Regards,
> Jack.
>
> [1] 
> http://stackoverflow.com/questions/9470494/snmpd-cannot-open-proc-bus-pci
>

It seems that udev is forcing PCI down every ones throats, is this 
necessary, can it be built without? There seems to be a lot of extra 
configuration in there to make it happen...

Onward ho!

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



