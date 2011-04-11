Received: from moutng.kundenserver.de ([212.227.126.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1Q9HdH-0008W5-61
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 15:58:23 +0200
Received: from [192.168.1.34] (p57B40E69.dip0.t-ipconnect.de [87.180.14.105])
	by mrelayeu.kundenserver.de (node=mrbap3) with ESMTP (Nemesis)
	id 0MWBdh-1QOX850HDF-00XJDR; Mon, 11 Apr 2011 15:50:56 +0200
Message-ID: <4DA30736.7010405@koblersystems.de>
Date: Mon, 11 Apr 2011 15:50:46 +0200
From: Jan Kobler <eng1@koblersystems.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20110120 Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1302291183-17622-1-git-send-email-eng1@koblersystems.de>
	<4D9F654C.10206@mentor.com> <4D9F69CC.3060608@koblersystems.de>
	<4D9F8006.3080402@mentor.com>
In-Reply-To: <4D9F8006.3080402@mentor.com>
X-Provags-ID: V02:K0:7nBUeO3oh5t/wjKLMO9ImxrAzICgennc9k8VtaQ7EiB
	7SsY8SUMxaNJMqrhd4NK7RINm6k/PJIDSnE1cSRJPMCmDanjjA
	FqPBY7G2UWbS3XY9s6F8yyyPt6EcFCVz521X8Wd/m+FMok4mHG
	55NRQG3HIdYnLh+NVBvLE0XNvKKGhD3MgbcRV1oUNutzci3FXQ
	XvjPLSuZIhV9+Xr3HPfWg==
Subject: Re: [mpc5125-twr 1/2] New machine mpc5125-twr, Freescale TWR-MPC5125-KIT
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
X-List-Received-Date: Mon, 11 Apr 2011 13:58:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

on 08.04.2011 23:37 Tom Rini said the following:
> On 04/08/2011 01:02 PM, Jan Kobler wrote:
>> 2. I have tried to provide the same for Openembedded as Freescale is
>> currently shipping on their web page
>> http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=TWR-MPC5125-KIT&fpsp=1&tab=Design_Tools_Tab.
>> I have not tried to port it to a more recent kernel.
>>
>> Is there already a more recent kernel, which contains mpc5125-twr support?
> 
> It's possible that yes, this hardware is supported in 2.6.37.
> 


The support in 2.6.37 seems to be for the CPU Freescale MPC5121 and the
board ADS512101. The support files for MPC5125 and TWR-MPC5125 are
missing. The names TWR-MPC5125 or "mpc5125-twr are nowhere mentioned.

E.g linux-2.6.29/arch/powerpc/boot/dts/mpc5125-twr.dts is missing in
linux-2.6.37

linux-2.6.37/arch/powerpc/boot/dts/mpc5121ads.dts is different to
linux-2.6.29/arch/powerpc/boot/dts/mpc5125-twr.dts

The CPUs MPC5125 and MPC5121 are similar, but are not the same.
Currently I don't know the exact differences and cannot decide which
code for MPC5121 runs also on MPC5125.

Best regards

Jan





