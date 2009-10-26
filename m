Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N2XmU-0000Wi-0A for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 23:11:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N2XlL-0006IF-HO
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 23:10:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 23:10:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 23:10:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Oct 2009 23:08:52 +0100
Message-ID: <hc56lk$h83$2@ger.gmane.org>
References: <70c9a9110910260547q7c513336rc28555960bd4e5bd@mail.gmail.com>
	<1256592782.7623.3.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1256592782.7623.3.camel@utx.utx.cz>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Connman and rootfs over NFS
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
X-List-Received-Date: Mon, 26 Oct 2009 22:11:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26-10-09 22:33, Stanislav Brabec wrote:
> Enric Balletbò i Serra wrote:
>> Hi all,
>>
>> Running my Angstrom image and mounting the rootfs over NFS seems that
>> the connman package reconfigures the network interface (nfs: server
>> 192.168.2.6 not responding, still trying). There are any way to
>> prevent this ?
>
> I see very similar problem with Bluetooth networking (BNEP) and openvpn.
> Connman steals the device when it goes up and mis-configures it.
>
> I use a work-around - stopping or not starting the connman daemon.

You can also edit /var/lib/conmmand/<if>.conf and set policy to manual 
(the GUI can also do that for you).

regards,

Koen



