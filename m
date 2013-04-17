Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1USRUZ-0004vv-Q4
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 14:29:41 +0200
Message-ID: <516E9198.1090607@communistcode.co.uk>
Date: Wed, 17 Apr 2013 13:12:08 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1366200081-12326-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1366200081-12326-1-git-send-email-ml@communistcode.co.uk>
Subject: Re: [meta-oe][PATCHv3 1/3] net-snmp: fix failure when starting on system without pci bus
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
X-List-Received-Date: Wed, 17 Apr 2013 12:29:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/04/13 13:01, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> The snmpd daemon cannot start on platforms without a pci bus:
>
> snmpd[15460]: pcilib: Cannot open /proc/bus/pci
> snmpd[15460]: pcilib: Cannot find any working access method.
>
> snmpd should not depend on a PCI bus and should simply move on.
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>   .../recipes-extended/net-snmp/files/ifmib.patch    | 66 ++++++++++++++++++++++
>   .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |  1 +
>   2 files changed, 67 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/net-snmp/files/ifmib.patch

I've pushed to my github here to try solve the patches failing.

git://github.com/CommunistCode/meta-oe.git


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



